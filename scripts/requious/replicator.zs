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
import mods.ctutils.utils.Math.abs;
import mods.requious.AssemblyRecipe;
import mods.requious.Color;
import mods.requious.ComponentFace;
import mods.requious.GaugeDirection;
import mods.requious.MachineContainer;
import mods.requious.MachineVisual;
import mods.requious.RecipeContainer;
import mods.requious.SlotVisual;
import scripts.category.uu.getCost;
import scripts.lib.D.D.D_zs;

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

/* 
 █████╗ ███████╗███████╗███████╗███╗   ███╗██████╗ ██╗  ██╗   ██╗
██╔══██╗██╔════╝██╔════╝██╔════╝████╗ ████║██╔══██╗██║  ╚██╗ ██╔╝
███████║███████╗███████╗█████╗  ██╔████╔██║██████╔╝██║   ╚████╔╝ 
██╔══██║╚════██║╚════██║██╔══╝  ██║╚██╔╝██║██╔══██╗██║    ╚██╔╝  
██║  ██║███████║███████║███████╗██║ ╚═╝ ██║██████╔╝███████╗██║   
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝   
 */
var
x = <assembly:replicator>;

x.setDecorationSlot(1,0, SlotVisual.create(7,5).addPart(replTexture,1,0));

static displX as int = 4;
static displY as int = 2;
x.setItemSlot(displX, displY, ComponentFace.none(), 1)
  .setBackground(SlotVisual.create(1,1).addPart(replTexture, 4, 2))
  .setAccess(false,false)
  .setHandAccess(false,false)
  .noDrop()
  .setGroup("display");

static catlX as int = 4;
static catlY as int = 0;
x.setItemSlot(catlX,catlY, ComponentFace.all(), 64)
  .setAccess(true,false)
  .setHandAccess(true,true)
  .setFilter(<*>.only(function(item) { return getCost(item) > 0; }))
  .setGroup("input");

static upgrX as int = 7;
static upgrY as int = 2;
x.setItemSlot(upgrX,upgrY, ComponentFace.none(), 64)
  .setAccess(false,false)
  .setHandAccess(true,true)
  .setFilter(<ic2:upgrade>)
  .setBackground(SlotVisual.create(1,1).addPart(replTexture, 7, 2))
  .setGroup("upgrade");

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
x.setEnergySlot(powX, powY, ComponentFace.all(), 2000000000)
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

/*
██╗      ██████╗  ██████╗ ██╗ ██████╗
██║     ██╔═══██╗██╔════╝ ██║██╔════╝
██║     ██║   ██║██║  ███╗██║██║     
██║     ██║   ██║██║   ██║██║██║     
███████╗╚██████╔╝╚██████╔╝██║╚██████╗
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝
*/

// ========================================================
// Variables
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
  m.setInteger('tick', 0);
}

// ========================================================
// Consumptions
// ========================================================
function calcConsumption(upgrAmount as int, tick as double) as int {
  val s = pow(1.3d, upgrAmount);
  val resid = s - (s as int) as double;
  if (resid == 0) return s as int;
  val bonus = (tick % (1.0d / resid) + 0.5d) as int == 0 ? 1 : 0;
  return s as int + bonus;
}

function calcPowerConsumption(upgrAmount as int) as int {
  val powerUsage = pow(1.6d, upgrAmount);
  return (powerUsage * ENERGY_USAGE as double) as int;
}

// ========================================================
// States
// ========================================================
function getUpgrAmount(m as MachineContainer) as double {
  val upgr = m.getItem(upgrX, upgrY);
  return (
    isNull(upgr)
    || upgr.definition.id != 'ic2:upgrade'
    || upgr.damage != 0
  ) ? 0.0d : upgr.amount as double;
}

static facings as IFacing[] = [
  IFacing.north(),
  IFacing.east(),
  IFacing.south(),
  IFacing.west(),
  IFacing.down(),
  IFacing.up(),
] as IFacing[];

function getBlockWithStorage(world as IWorld, pos as IBlockPos) as D_zs {
  val block = world.getBlock(pos);
  if (isNull(block)) return null; // No block at all
  val d = D(block.data);
  val nbtPaths = [
    'InvSlots.SaveSlot.Contents[0]',
    'InvSlots.disk.Contents[0]',
    'Items[0]',
  ] as string[];
  for path in nbtPaths {
    if(d.getString(path~'.id', '') != 'ic2:crystal_memory') continue;
    return d.move(path);
  }
  return null;
}

function findPatternStorage(m as MachineContainer) as D_zs {
  // Check previously stored face side
  var face = m.getInteger('face_index');
  if (face > 0) {
    val b = getBlockWithStorage(m.world, m.pos.getOffset(facings[face - 1], 1));
    if (!isNull(b)) return b;
  }

  for i, f in facings {
    val b = getBlockWithStorage(m.world, m.pos.getOffset(f, 1));
    if (isNull(b)) continue;
    m.setInteger('face_index', i + 1);
    return b;
  }
  m.setInteger('face_index', -1);
  return null;
}

function getReplicateItem(m as MachineContainer, d as D_zs) as IItemStack {
  d.move('tag.Pattern');
  if(!d.check(['id','Damage'])) {
    pushErr(m, '§3Write data\n§3 to memory');
    return null;
  }

  val item = itemUtils.getItem(
    d.getString('id', ''),
    d.getString('Damage', '')
  );

  if(isNull(item)) {
    pushErr(m, '§8Unreplicable\n§8 item');
    return null;
  }

  return item;
}

function consumeEnergy(m as MachineContainer, amount as int) as void {
  val energy = m.getEnergy(powX, powY);
  m.setEnergy(powX, powY, energy - amount);
  m.setInteger('active', 10);
}

// Machine completed it task and could start new one
function succes(m as MachineContainer, powr as int) as void {
  consumeEnergy(m, powr);
  m.setInteger('goal', 0);
  pushErr(m, null);
}

function consumeMatter(m as MachineContainer, amount as int) as bool {
  val fluid = m.getFluid(mattX, mattY);
  if (isNull(fluid) || fluid.amount <= 0) return false;
  m.setFluid(mattX, mattY, fluid.amount > amount
      ? fluid * (fluid.amount - amount)
      : null
  );
  return true;
}

// Try to add target item to output
// If succes, set goal to 0
// If failed, goal would be set to -1
function pushOutput(m as MachineContainer, powr as int) as void {
  val out = m.getItem(outX, outY);
  val item = m.getItem(displX, displY);

  // Slot is empty
  if (isNull(out)) {
    m.setItem(outX, outY, item);
    return succes(m, powr);
  }

  // Slot partially occupied with same item
  if (isNull(item)) return logger.logError("Replicator malfunction: must output item that lost.");
  if (
    item.definition.id == out.definition.id
    && item.damage == out.damage
    && out.amount < out.maxStackSize
  ) {
    m.setItem(outX, outY, out * (out.amount + item.amount));
    return succes(m, powr);
  }

  // Unable to output
  m.setInteger('goal', -1);
  pushErr(m, '§fNo output\n§f space');
}

function spentBuffer(m as MachineContainer, powr as int, buffer as int, goal as int) as bool {
  if (buffer < goal) return false;
  m.setInteger('buffer', buffer - goal);
  pushOutput(m, powr);
  return true;
}

// Consume fluid and add it to buffer
// Goal always bigger than 0 here
function work(m as MachineContainer, tick as int, upgrAmount as int, powr as int) as void {
  var buffer = m.getInteger('buffer');
  val goal = m.getInteger('goal');

  // Buffer still left from previous run, just output item
  if (spentBuffer(m, powr, buffer, goal)) return;

  // Consume to increase buffer
  val toConsume = calcConsumption(upgrAmount, tick);
  if(!consumeMatter(m, toConsume))
    return pushErr(m, '§dNeed UU\n§d matter');
  buffer += 100 * toConsume;

  // Instantly drop result if cost below 1mb
  if (spentBuffer(m, powr, buffer, goal)) return;

  // Just add to buffer, skip
  m.setInteger('buffer', buffer);
  consumeEnergy(m, powr);
  pushErr(m, null);
}

/* 
████████╗██╗ ██████╗██╗  ██╗
╚══██╔══╝██║██╔════╝██║ ██╔╝
   ██║   ██║██║     █████╔╝ 
   ██║   ██║██║     ██╔═██╗ 
   ██║   ██║╚██████╗██║  ██╗
   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝
*/
function tick(m as MachineContainer) as void {
  defineVars(m);
  val tick = m.getInteger('tick');
  m.setInteger('tick', tick + 1);

  // ⚡ Check energy
  val upgrAmount = getUpgrAmount(m);
  val energy = m.getEnergy(powX, powY);
  val powr = calcPowerConsumption(upgrAmount);
  if (energy < powr) return pushErr(m, '§cNeed\n§c energy');

  // 📦 Output is stuck
  val goal = m.getInteger('goal');
  if (goal < 0) return pushOutput(m, powr);

  // ⚙️ Check if we already working
  if (goal > 0) return work(m, tick, upgrAmount, powr);

  // ❔ Find what item we should replicate
  val ps = findPatternStorage(m);
  if (isNull(ps)) {
    m.setItem(displX, displY, null);
    return pushErr(m, '§bPlace adjst.\n§b Storage');
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
  work(m, tick, upgrAmount, powr);
}

x.addRecipe(AssemblyRecipe.create(function(c) {})
.requireWorldCondition("tick", function(m) {
  if(m.world.remote) return false;
  tick(m);
  return true;
// Note: this number should be negative to
// be able speed up machine with Time In Bottle
}, -2000000));
