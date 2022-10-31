import crafttweaker.block.IBlock;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IFurnaceRecipe;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IVector3d;
import crafttweaker.world.IVector3d.create as V;
import crafttweaker.world.IWorld;
import mods.requious.AssemblyRecipe;
import mods.requious.Color;
import mods.requious.ComponentFace;
import mods.requious.GaugeDirection;
import mods.requious.MachineContainer;
import mods.requious.MachineVisual;
import mods.requious.RecipeContainer;
import mods.requious.SlotVisual;
import scripts.category.uu.getCost;

static TICK_STEP as int = 1;
static ENERGY_USAGE as int = 20000;
static replTexture as string = 'enigmatica:textures/gui/replicator.png';

# [Replicator] from [Energium Ingot][+3]
recipes.addShapeless('old to new replicator', <requious:replicator>, [<ic2:te:63>]);
craft.make(<requious:replicator>, ["pretty",
  "C ▬ C",
  "C ▬ C",
  "M M M"], {
  "C": <ic2:containment_plating>, # Containment Reactor Plating
  "▬": <ore:ingotEnergium>,       # Energium Ingot
  "M": <ic2:te:75>,   # MFSU
});

// ========================================================
// Assembly
// ========================================================
var
x = <assembly:replicator>;

x.setDecorationSlot(1,0, SlotVisual.create(7,5).addPart(replTexture,1,0));

static displX as int = 4;
static displY as int = 2;
x.setItemSlot(displX, displY, ComponentFace.none(), 1)
  .setBackground(SlotVisual.create(1,1).addPart(replTexture, 4, 2))
  .setAccess(false,false)
  .setHandAccess(false,false)
  .setGroup("display");

static catlX as int = 4;
static catlY as int = 0;
x.setItemSlot(catlX,catlY, ComponentFace.all(), 64)
  .setAccess(true,false)
  .setHandAccess(true,true)
  .setFilter(<*>.only(function(item) { return getCost(item) > 0; }))
  .setGroup("input");

static outX as int = 4;
static outY as int = 4;
x.setItemSlot(outX,outY, ComponentFace.all(), 64)
  .setAccess(false,true)
  .setHandAccess(false,true)
  .setGroup("output");

static mattX as int = 0;
static mattY as int = 0;
x.setFluidSlot(mattX, mattY, ComponentFace.all(), 16000)
  .setAccess(true /* input */, true /* output */)
  .setFilter(function(liquid/*  as ILiquidStack */) { return liquid.name == 'ic2uu_matter'; })
  .setBackground(SlotVisual.create(1,5).addPart(replTexture, /* x */  0,/* y */ 0))
  .setForeground(SlotVisual.create(1,5).addPart(replTexture, /* x */ 10,/* y */ 0))
  .setGroup("input");

static powX as int = 8;
static powY as int = 0;
x.setEnergySlot(powX, powY, ComponentFace.all(), 100000000)
  .setAccess(true,false)
  .setUnit('rf')
  .setBackground(SlotVisual.create(1,5))
  .setForeground(SlotVisual.createGauge(
    replTexture, // texture
    /*x1*/ 8, /*y1*/ 0, /*x2*/ 9, /*y2*/ 0,
    GaugeDirection.up(), // direction
    false, // inverse
    1, // width
    5, // height
    [255,255,255] // rgb
  ))
  .setGroup("input");

x.setTextSlot(1,1).setVisual(SlotVisual.create(3,1)).setRenderText("§7%s  \n§8%s  ", ['goal','buffer']).alignRight();
x.setTextSlot(5,3).setVisual(SlotVisual.create(3,1)).setRenderText(" %s",['error']);

x.addVisual(MachineVisual.displayFluid(
      /*active*/ 1.0,
  /*fluidStack*/ <fluid:ic2uu_matter>,
    /*capacity*/ 1,
      /*facing*/ IFacing.up(),
       /*start*/ V( 2.1/16.0, 2.0/16.0,  2.1/16.0),
         /*end*/ V(13.8/16.0, 5.9/16.0, 13.8/16.0),
      /*global*/ false
));

x.addVisual(MachineVisual.smoke(
      /*active*/ 'active'.asVariable(),
       /*begin*/ V(0.5, 0.40, 0.5),
         /*end*/ V(0.5, 0.45, 0.5),
    /*velocity*/ V(0, 0, 0),
       /*color*/ Color.normal([105, 0, 105]),
    /*lifetime*/ 20,
  /*fullBright*/ true,
      /*global*/ false
));

// ========================================================
// Logic
// ========================================================
function pushErr(m as MachineContainer, reason as string) as void {
  if (isNull(reason)) return m.setString('error', '');
  m.setString('error', reason);
}

function defineVars(m as MachineContainer) as void {
  // Skip init if already initialized
  if (m.getInteger('face_index') != 0) return;
  
  m.setInteger('face_index', -1); // Index of face where pattern storage is
  m.setString('error', ''); // Error line
  m.setInteger('goal', 0); // how much UU need. -1 if just trying to push output
  m.setInteger('buffer', 0); // stored UU in internal
}

// <ic2:te:62> // type: pattern_storage
static facings as IFacing[] = [
  IFacing.north(),
  IFacing.east(),
  IFacing.south(),
  IFacing.west(),
  IFacing.down(),
  IFacing.up(),
] as IFacing[];

function getPSBlock(world as IWorld, pos as IBlockPos) as IBlock {
  val block = world.getBlock(pos);
  if (
      isNull(block)
    || block.definition.id != 'ic2:te'
    || !D(block.data).check('InvSlots.SaveSlot.Contents')
  ) return null;
  return block;
}

function findPatternStorage(m as MachineContainer) as IBlock {
  // Check previously stored face side
  var face = m.getInteger('face_index');
  if (face > 0) {
    val b = getPSBlock(m.world, m.pos.getOffset(facings[face - 1], 1));
    if (!isNull(b)) return b;
  }

  for i, f in facings {
    val b = getPSBlock(m.world, m.pos.getOffset(f, 1));
    if (isNull(b)) continue;
    m.setInteger('face_index', i + 1);
    return b;
  }
  m.setInteger('face_index', -1);
  return null;
}

function getReplicateItem(m as MachineContainer, block as IBlock) as IItemStack {
  val data = D(block.data).move('InvSlots.SaveSlot.Contents[0]');
  if (data.getString('id', '') != 'ic2:crystal_memory') {
    pushErr(m, '§eNeed cryst.\n§e memory');
    return null;
  }

  data.move('tag.Pattern');
  if(!data.check(['id','Damage'])) {
    pushErr(m, '§3Write data\n§3 to memory');
    return null;
  }

  val item = itemUtils.getItem(
    data.getString('id', ''),
    data.getString('Damage', '')
  );

  if(isNull(item)) {
    pushErr(m, '§8Unreplicable\n§8 item');
    return null;
  }

  return item;
}

function consumeEnergy(m as MachineContainer) as void {
  val energy = m.getEnergy(powX, powY);
  m.setEnergy(powX, powY, energy - ENERGY_USAGE);
  m.setDouble('active', 10);
}

// Machine completed it task and could start new one
function succes(m as MachineContainer) as void {
  consumeEnergy(m);
  m.setInteger('goal', 0);
  pushErr(m, null);
}

// Try to add target item to output
// If succes, set goal to 0
// If failed, goal would be set to -1
function pushOutput(m as MachineContainer) as void {
  val out = m.getItem(outX, outY);
  val item = m.getItem(displX, displY);

  // Slot is empty
  if (isNull(out)) {
    m.setItem(outX, outY, item);
    return succes(m);
  }

  // Slot partially occupied with same item
  if (isNull(item)) return logger.logError("Replicator malfunction: must output item that lost.");
  if (
    item.definition.id == out.definition.id
    && item.damage == out.damage
    && out.amount < out.maxStackSize
  ) {
    m.setItem(outX, outY, out * (out.amount + item.amount));
    return succes(m);
  }

  // Unable to output
  m.setInteger('goal', -1);
  pushErr(m, '§fNo output\n§f space');
}

function consumeMatter(m as MachineContainer) as bool {
  val fluid = m.getFluid(mattX, mattY);
  if (isNull(fluid) || fluid.amount <= 0) return false;
  m.setFluid(mattX, mattY, fluid.amount > 1 ? fluid * (fluid.amount - 1) : null);
  return true;
}

// Consume fluid and add it to buffer
// Goal always bigger than 0 here
function work(m as MachineContainer) as void {
  var buffer = m.getInteger('buffer');
  val goal = m.getInteger('goal');

  // Buffer still left from previous run, just output item
  if (buffer >= goal) {
    m.setInteger('buffer', buffer - goal);
    return pushOutput(m);
  }

  // Consume to increase buffer
  if(!consumeMatter(m)) return pushErr(m, '§dNeed UU\n§d matter');
  buffer += 100;

  // Instantly drop result if cost below 1mb
  if (buffer >= goal) {
    m.setInteger('buffer', buffer - goal);
    return pushOutput(m);
  }

  // Just add to buffer, skip
  m.setInteger('buffer', buffer);
  consumeEnergy(m);
  pushErr(m, null);
}

// ========================================================
// Entry
// ========================================================
function tick(m as MachineContainer) as void {
  defineVars(m);

  // 📦 Output is stuck
  val goal = m.getInteger('goal');
  if (goal < 0) return pushOutput(m);

  // ⚡ Check energy
  val energy = m.getEnergy(powX, powY);
  if (energy < ENERGY_USAGE) return pushErr(m, '§cNeed\n§c energy');

  // ⚙️ Check if we already working
  if (goal > 0) return work(m);

  // ❔ Find what item we should replicate
  val ps = findPatternStorage(m);
  if (isNull(ps)) {
    m.setItem(displX, displY, null);
    return pushErr(m, '§bPlace Ptrn.\n§b Storage');
  }
  val item = getReplicateItem(m, ps);
  if(isNull(item)) return m.setItem(displX, displY, null);
  m.setItem(displX, displY, item); // Set item is display slot

  // 🥼 Check if we can consume catalyst
  val catl = m.getItem(catlX, catlY);
  if(isNull(catl)) return pushErr(m, '§6Need\n§6 catalyst');
  val catlCost = getCost(catl);
  if (catlCost <= 0) return pushErr(m, '§7Unusable\n§7 catalyst');

  val itemCost = getCost(item);
  if (itemCost >= catlCost) return pushErr(m, '§5Catalyst\n§5 too simple');

  // ✔️ Consume catalyst and start operation
  m.setItem(catlX, catlY, catl.amount > 1 ? catl * (catl.amount - 1) : null);
  m.setInteger('goal', catlCost);
  work(m);
}

x.addRecipe(AssemblyRecipe.create(function(c) {})
.requireWorldCondition("tick", function(m) {
  if(m.world.remote) return false;
  tick(m);
  return true;
}, 0));
