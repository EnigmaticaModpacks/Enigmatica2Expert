import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.world.IVector3d.create as V;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.sqrt;
import mods.requious.AssemblyRecipe;
import mods.requious.Color;
import mods.requious.ComponentFace;
import mods.requious.MachineContainer;
import mods.requious.MachineVisual;
import mods.requious.RecipeContainer;
import mods.requious.SlotVisual;
import mods.zentoolforge.Toolforge;

// Examples of Requious Fracto: https://github.com/DaedalusGame/The-Testbed

# -----------------------------------------------------------------------
# ██╗   ██╗ █████╗ ██████╗ ██╗ █████╗ ██████╗ ██╗     ███████╗███████╗
# ██║   ██║██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝
# ██║   ██║███████║██████╔╝██║███████║██████╔╝██║     █████╗  ███████╗
# ╚██╗ ██╔╝██╔══██║██╔══██╗██║██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║
#  ╚████╔╝ ██║  ██║██║  ██║██║██║  ██║██████╔╝███████╗███████╗███████║
#   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝
# -----------------------------------------------------------------------

val disassemblable =
    <conarm:helmet:*>
  | <conarm:boots:*>
  | <conarm:chestplate:*>
  | <conarm:leggings:*>
  | <exnihilocreatio:crook_tconstruct:*>
  | <plustic:laser_gun:*>
  | <plustic:katana:*>
  | <tcomplement:chisel:*>
  | <tcomplement:sledge_hammer:*>
  | <tconevo:tool_sceptre:*>
  | <tconstruct:arrow:*>
  | <tconstruct:battlesign:*>
  | <tconstruct:bolt:*>
  | <tconstruct:broadsword:*>
  | <tconstruct:cleaver:*>
  | <tconstruct:crossbow:*>
  | <tconstruct:excavator:*>
  | <tconstruct:frypan:*>
  | <tconstruct:hammer:*>
  | <tconstruct:hatchet:*>
  | <tconstruct:kama:*>
  | <tconstruct:longbow:*>
  | <tconstruct:longsword:*>
  | <tconstruct:lumberaxe:*>
  | <tconstruct:mattock:*>
  | <tconstruct:pickaxe:*>
  | <tconstruct:rapier:*>
  | <tconstruct:scythe:*>
  | <tconstruct:shortbow:*>
  | <tconstruct:shovel:*>
  | <tconstruct:shuriken:*>
;


static validToolsList as string[] = [
  "tconstruct:hammer",
  "tconstruct:battlesign",
  "tconstruct:excavator",
  "tconstruct:frypan",
  "tconstruct:hatchet",
  "tconstruct:kama",
  "tconstruct:lumberaxe",
  "tconstruct:mattock",
  "tconstruct:pickaxe",
  "tconstruct:shovel",
  "tcomplement:chisel",
  "tcomplement:sledge_hammer",
  "tconevo:tool_sceptre",
  "exnihilocreatio:crook_tconstruct",
] as string[];


var validTools as IIngredient = itemUtils.getItem(validToolsList[0]).anyDamage();
for i, toolId in validToolsList {
  if(i==0) continue;
  validTools = validTools | itemUtils.getItem(toolId).anyDamage();
}


static partsCosts as int[string] = {
  "conarm:armor_plate"           : 3,
  "conarm:armor_trim"            : 1,
  "conarm:boots_core"            : 4,
  "conarm:chest_core"            : 6,
  "conarm:helmet_core"           : 4,
  "conarm:leggings_core"         : 5,
  "conarm:polishing_kit"         : 2,
  "plustic:battery_cell"         : 3,
  "plustic:laser_medium"         : 3,
  "plustic:pipe_piece"           : 4,
  "tcomplement:chisel_head"      : 1,
  "tcomplement:sledge_head"      : 2,
  "tconevo:part_arcane_focus"    : 9,
  "tconstruct:arrow_head"        : 2,
  "tconstruct:arrow_shaft"       : 2,
  "tconstruct:axe_head"          : 2,
  "tconstruct:binding"           : 1,
  "tconstruct:bow_limb"          : 3,
  "tconstruct:bow_string"        : 1,
  "tconstruct:broad_axe_head"    : 8,
  "tconstruct:cross_guard"       : 1,
  "tconstruct:excavator_head"    : 8,
  "tconstruct:fletching"         : 2,
  "tconstruct:hammer_head"       : 8,
  "tconstruct:hand_guard"        : 1,
  "tconstruct:kama_head"         : 2,
  "tconstruct:knife_blade"       : 1,
  "tconstruct:large_plate"       : 8,
  "tconstruct:large_sword_blade" : 8,
  "tconstruct:pan_head"          : 3,
  "tconstruct:pick_head"         : 2,
  "tconstruct:scythe_head"       : 8,
  "tconstruct:sharpening_kit"    : 2,
  "tconstruct:shovel_head"       : 2,
  "tconstruct:sign_head"         : 3,
  "tconstruct:sword_blade"       : 2,
  "tconstruct:tool_rod"          : 1,
  "tconstruct:tough_binding"     : 3,
  "tconstruct:tough_tool_rod"    : 3,
  "tconstruct:wide_guard"        : 1,
} as int[string];


# -----------------------------------------------------------------------
#  █████╗ ███████╗███████╗███████╗███╗   ███╗██████╗ ██╗  ██╗   ██╗
# ██╔══██╗██╔════╝██╔════╝██╔════╝████╗ ████║██╔══██╗██║  ╚██╗ ██╔╝
# ███████║███████╗███████╗█████╗  ██╔████╔██║██████╔╝██║   ╚████╔╝ 
# ██╔══██║╚════██║╚════██║██╔══╝  ██║╚██╔╝██║██╔══██╗██║    ╚██╔╝  
# ██║  ██║███████║███████║███████╗██║ ╚═╝ ██║██████╔╝███████╗██║   
# ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝   
# -----------------------------------------------------------------------

val ghostBg = SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_slots.png",0,1);

static gh as int[string][] = [
  {x:3, y:2},
  {x:4, y:2},
] as int[string][];

var o = <assembly:tinkers_disassembler>;
o.setItemSlot  (1,1,ComponentFace.up() , 1).setGroup("input").setAccess(true,false).setHandAccess(true,true);
o.setItemSlot  (3,1,ComponentFace.all(), 1).setGroup("tool0").setAccess(true,false).setHandAccess(true,true);
o.setItemSlot  (4,1,ComponentFace.all(), 1).setGroup("tool1").setAccess(true,false).setHandAccess(true,true);
o.setItemSlot  (gh[0].x,gh[0].y,ComponentFace.all(), 1).setGroup("ghost0").setAccess(false,false).setHandAccess(false,false).noDrop().setBackground(ghostBg);
o.setItemSlot  (gh[1].x,gh[1].y,ComponentFace.all(), 1).setGroup("ghost1").setAccess(false,false).setHandAccess(false,false).noDrop().setBackground(ghostBg);
o.setDurationSlot(2,1).setGroup("duration0").setVisual(SlotVisual.arrowRight());
o.setDurationSlot(5,1).setGroup("duration1").setVisual(SlotVisual.arrowRight());
for i in 0 .. 4 { o.setItemSlot(6+(i%2),i/2+1,ComponentFace.all(),64).setGroup("output"~i).setAccess(false,true).setHandAccess(false,true); }
// o.setTextSlot(3,0).setVisual(SlotVisual.create(1,1)).setRenderText("%s", ['v_ghost0']).alignCenter();
// o.setTextSlot(4,0).setVisual(SlotVisual.create(1,1)).setRenderText("%s", ['v_ghost1']).alignCenter();

o.setJEIItemSlot  (1,1,"input");
o.setJEIItemSlot  (3,1,"tool0");
o.setJEIItemSlot  (4,1,"tool1");
o.setJEIItemSlot  (gh[0].x,gh[0].y,"ghost0", ghostBg);
o.setJEIItemSlot  (gh[1].x,gh[1].y,"ghost1", ghostBg);
o.setJEIDurationSlot(2,1,"duration0",SlotVisual.arrowRight());
o.setJEIDurationSlot(5,1,"duration1",SlotVisual.arrowRight());
for i in 0 .. 4 { o.setJEIItemSlot(6+(i%2),i/2+1,"output"~i); }

o.addVisual(MachineVisual.smoke("active".asVariable(), V(0,0.25,0.25), V(0,0.75,0.75), V(-0.1,0,0), Color.normal([51,102,153]),30,true));
o.addVisual(MachineVisual.smoke("active".asVariable(), V(1,0.25,0.25), V(1,0.75,0.75), V(0.1,0,0),  Color.normal([51,102,153]),30,true));
// o.addVisual(MachineVisual.smoke("active".asVariable(), V(0.25,0.25,0), V(0.75,0.75,0), V(0,0,-0.1), Color.normal([51,102,153]),30,true));
// o.addVisual(MachineVisual.smoke("active".asVariable(), V(0.25,0.25,1), V(0.75,0.75,1), V(0,0,0.1),  Color.normal([51,102,153]),30,true));

# Craft
craft.make(<requious:tinkers_disassembler>, ["pretty",
  "▩ ▩ ▩",
  "▩ x ▩",
  "I   I"], {
  "x": <ore:workbench>,
  "▩": <ore:blockFakeIron>,
  "I": <preston:compressed_block>.withTag({stack: {id: "actuallyadditions:block_misc", Count: 1 as byte, Damage: 2 as short}, level: 1}),
});

# -----------------------------------------------------------------------
# ███╗   ███╗ █████╗ ████████╗██╗  ██╗
# ████╗ ████║██╔══██╗╚══██╔══╝██║  ██║
# ██╔████╔██║███████║   ██║   ███████║
# ██║╚██╔╝██║██╔══██║   ██║   ██╔══██║
# ██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║
# ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
# -----------------------------------------------------------------------
function getWeightedStack(item as IItemStack, amount as double) as WeightedItemStack {
  val whole = amount as int;
  val resid = amount - whole as double;
  return whole >= 1 ? (item * whole).weight(1) : item.weight(resid);
}

function getWeightedShard(matName as string, amount as double) as WeightedItemStack {
  return getWeightedStack(<tconstruct:shard>.withTag({Material: matName}), amount);
}

function getShards(
  input as IItemStack,
  tool_lvl as int,
  amount as int,
  sortOrder as double,
  quantity as double
) as WeightedItemStack[] {

  // Check if input have tags
  val mats_data = D(input.tag).get("TinkerData.Materials");
  if(isNull(mats_data)) return null;
  val mats = mats_data.asList();

  // Calculate material amount for each parts
  val deconstructed = Toolforge.deconstructTool(input);
  var listCost = [] as double[];
  for dec in deconstructed {
    if(isNull(dec.tag.Material)) continue;
    val partCost = partsCosts[dec.definition.id];
    val cost = !isNull(partCost) ? partCost as double : 1.0d;
    listCost += cost * quantity * 2.0d;
  }

  // Return if only one mat avaliable
  val listLen = mats.length;
  if(listLen<=0) return null;
  if(listLen==1) {
    val matName = mats[0].asString();
    val forgeMat = Toolforge.getMaterialFromID(matName);
    if(isNull(forgeMat)) return null;
    if(tool_lvl <= forgeMat.harvestLevelHead) return null;

    return [getWeightedShard(matName, listCost[0])];
  }

  // Gather harvest levels of mats
  var listNames = [] as string[];
  var listLevel = [] as int[];
  for i in 0 to listLen {
    val matName = mats[i].asString();
    val forgeMat = Toolforge.getMaterialFromID(matName);
    if(isNull(forgeMat)) continue;
    listNames += matName;
    listLevel += forgeMat.harvestLevelHead;
  }
  if(listNames.length <= 0) return null;

  // Sort level indexes
  var sorted = utils.sortInt(listLevel);

  // Pick first applicable level
  var amountLeft = amount;
  var result = [] as WeightedItemStack[];
  for _i in 0 to sorted.length {
    if(amountLeft <= 0) continue;
    amountLeft -= 1;

    val index = sorted[(sortOrder < 0) ? sorted.length - _i - 1 : _i];
    val lvl = listLevel[index];

    if(tool_lvl > lvl)
      result += getWeightedShard(listNames[index], listCost[index]);
  }

  return result.length==0 ? null : result;
}

// -----------------------------------------------------------------------
// Assembly Functions
// -----------------------------------------------------------------------


function getToolsStats(tool as IItemStack) as double[string] {
  val toolDTagStats = D(tool.tag.Stats);
  return {
    HarvestLevel: toolDTagStats.getInt("HarvestLevel", 0),
    Attack:       toolDTagStats.getFloat("Attack", 0.0f),
    MiningSpeed:  toolDTagStats.getFloat("MiningSpeed", 0.0f),
  } as double[string];
}

function damageItemInSlot(machine as MachineContainer, x as int, y as int, damage as int) {
  val item = machine.getItem(x,y);
  machine.setItem(x,y, item.withDamage(item.damage + damage));
}

# ⚒️ Damage tools
function addWorldOutput(c as RecipeContainer) {
  c.addWorldOutput(function(machine) {
    damageItemInSlot(machine, 3,1, 10);
    damageItemInSlot(machine, 4,1, 10);

    # 👻 Remove ghosts
    machine.setItem(gh[0].x, gh[0].y, null);
    machine.setItem(gh[1].x, gh[1].y, null);

    return true;
  });
}

function getRecipe(input_item as IIngredient, tool0 as IIngredient, tool1 as IIngredient, isJEI as bool) as AssemblyRecipe {
  return AssemblyRecipe.create(function(c) {

    ################################################################

    # 🔰 Input
    val input = c.jei ? input_item.items[0] : c.getItem("input");
    
    # Exit if tools is futile
    if(!c.jei) {
      for i in 0 .. 2 {
        val tool = c.machine.getItem(3+i,1);
        if(getGhostID(input, i) != tool.definition.id) {
          c.addItemOutput("output0", <tconstruct:shard>.withTag({Material: "stone"}));
          addWorldOutput(c);
          return;
        }
      }
    }

    ################################################################

    # 🔨 Tools
    val toolsStats = [
      getToolsStats(c.jei ? tool0.items[0] : c.machine.getItem(3,1)),
      getToolsStats(c.jei ? tool1.items[0] : c.machine.getItem(4,1)),
    ] as double[string][];

    if(c.jei) {
      # 👻 Set ghosts
      c.addItemOutput("ghost0", getGhostItem(input, 0));
      c.addItemOutput("ghost1", getGhostItem(input, 1));
    }

    # 4️⃣ Amount of Shard Stacks
    val total_power = ((toolsStats[0].Attack      + toolsStats[1].Attack     ) / 2.0d)
                    + ((toolsStats[0].MiningSpeed + toolsStats[1].MiningSpeed) / 2.0d);

    val tool_lvl  =  ((toolsStats[0].HarvestLevel + toolsStats[1].HarvestLevel) / 2.0d) as int;
    var amount    =  max(1.0d, sqrt(total_power / 3.0d)) as int;
    val sortOrder = -1.0d; # 1: from hardest, -1: from weakest
    val quantity  =  1.0d - input.damage as double / input.maxDamage as double;

    ################################################################

    var shards = getShards(input, tool_lvl, amount, sortOrder, quantity);

    # 👞 Output shards
    if(isNull(shards) || shards.length == 0) shards = [<tconstruct:shard>.weight(1)] as WeightedItemStack[];

    # 🢂 Output
    for i,shard in shards {
			if(c.jei) {
				c.addItemOutput("output"~i, shard.stack.withLore(["§d§l" ~ shard.percent as int ~ "%"]));
			} else if(quantity >= 1.0d || c.random.nextDouble() < shard.chance) {
				c.addItemOutput("output"~i, shard.stack);
      }
		}

    addWorldOutput(c);

  })
  .requireItem("input", input_item.marked("input"))
  .requireItem("tool0", tool0.marked("tool0"), 1, 0)
  .requireItem("tool1", tool1.marked("tool1"), 1, 0)
  .requireWorldCondition("world",function(machine) {
    for i in 0 .. 2 {
      val tool = machine.getItem(3+i,1);
      if(tool.damage + 10 > tool.maxDamage) return false;
    }
    return true;
  }, 10)
  .setActive(80)
  .requireDuration("duration0", 40)
  .requireDuration("duration1", 40);
}

function getGhostID(item as IItemStack, ads as string) as string {
  val str = item.definition.id ~ item.tag.asString() ~ ads;
  val result = validToolsList[abs(str.hashCode() % validToolsList.length)];
  return result;
}
function getGhostItem(item as IItemStack, ads as string) as IItemStack {
  val result = itemUtils.getItem(getGhostID(item,ads));
  return result;
}

# -----------------------------------------------------------------------
# ██████╗ ███████╗ ██████╗██╗██████╗ ███████╗███████╗
# ██╔══██╗██╔════╝██╔════╝██║██╔══██╗██╔════╝██╔════╝
# ██████╔╝█████╗  ██║     ██║██████╔╝█████╗  ███████╗
# ██╔══██╗██╔══╝  ██║     ██║██╔═══╝ ██╔══╝  ╚════██║
# ██║  ██║███████╗╚██████╗██║██║     ███████╗███████║
# ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝╚═╝     ╚══════╝╚══════╝
# -----------------------------------------------------------------------
# Ghost helper recipe
o.addRecipe(AssemblyRecipe.create(function(c) {
    val input = c.machine.getItem(1, 1);
    c.machine.setItem(gh[0].x, gh[0].y, getGhostItem(input, 0));
    c.machine.setItem(gh[1].x, gh[1].y, getGhostItem(input, 1));
  })
  .requireItem("input", disassemblable.marked("input"), 1, 0)
  .requireWorldCondition("world",function(machine) {
    return true;
  }, 10)
  .setSubProcess('ghost')
);

o.addRecipe(getRecipe(disassemblable, validTools, validTools, false));

# Ghost clearing
o.addRecipe(AssemblyRecipe.create(function(c) {
    c.machine.setItem(gh[0].x, gh[0].y, null);
    c.machine.setItem(gh[1].x, gh[1].y, null);
  })
  .requireWorldCondition("world",function(machine) {
    return isNull(machine.getItem(1, 1)) 
      && !isNull(machine.getItem(gh[0].x, gh[0].y))
      && !isNull(machine.getItem(gh[1].x, gh[1].y));
  }, 10)
  .setSubProcess('ghost')
);

# -----------------------------------------------------------------------
#      ██╗███████╗██╗
#      ██║██╔════╝██║
#      ██║█████╗  ██║
# ██   ██║██╔══╝  ██║
# ╚█████╔╝███████╗██║
#  ╚════╝ ╚══════╝╚═╝
# -----------------------------------------------------------------------
val tool_examples = {
  <tconstruct:lumberaxe>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.51 as float, FreeModifiers: 3, Durability: 1104, HarvestLevel: 4, Attack: 8.360001 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.51 as float, FreeModifiers: 4, Durability: 1104, HarvestLevel: 4, Attack: 8.360001 as float}, Special: {Categories: ["aoe", "harvest", "tool"]}, TinkerData: {Materials: ["wood", "manyullyn", "iron", "paper"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "ecological", color: -7444965 as long, level: 1}, {identifier: "insatiable", color: -6202120 as long, level: 1}, {identifier: "magnetic", color: -3487030 as long, level: 2, magnetic2: 1 as byte}, {identifier: "writable", color: -1 as long, level: 1, writable1: 1 as byte}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["ecological", "insatiable", "magnetic2", "writable1", "toolleveling"]}):
  [[
    <tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {Materials: ["pigiron", "pigiron"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
    <tconstruct:excavator>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {Materials: ["pigiron", "pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
  ],[
    <tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.6 as float, MiningSpeed: 6.2 as float, FreeModifiers: 0, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 3, Materials: ["pigiron", "pigiron"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 150, color: 9502720, level: 3, max: 150, extraInfo: "149 / 150"}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
    <tconstruct:excavator>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 22.626122 as float, FreeModifiers: 0, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {UsedModifiers: 3, Materials: ["pigiron", "pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 150, color: 9502720, level: 3, max: 150, extraInfo: "149 / 150"}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
  ],[
    <tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 2.0 as float, MiningSpeed: 6.7 as float, FreeModifiers: 0, Durability: 956, HarvestLevel: 3, Attack: 12.564729 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 9, Materials: ["pigiron", "pigiron"], Modifiers: ["toolleveling", "sharpness", "creative", "haste", "diamond"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "sharpness", current: 216, color: 16774902, level: 3, max: 216, extraInfo: "215 / 216"}, {identifier: "creative", color: 0, level: 6}, {identifier: "haste", current: 250, color: 9502720, level: 5, max: 250, extraInfo: "249 / 250"}, {identifier: "diamond", color: 9237730}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
    <tconstruct:excavator>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 29.733969 as float, FreeModifiers: 0, Durability: 1655, HarvestLevel: 4, Attack: 12.564729 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {UsedModifiers: 9, Materials: ["pigiron", "pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling", "sharpness", "creative", "haste", "fortifymanyullyn", "diamond"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "sharpness", current: 216, color: 16774902, level: 3, max: 216, extraInfo: "215 / 216"}, {identifier: "creative", color: 0, level: 6}, {identifier: "haste", current: 250, color: 9502720, level: 5, max: 250, extraInfo: "249 / 250"}, {identifier: "fortifymanyullyn", color: -6202120}, {identifier: "diamond", color: 9237730}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
  ]],

  <tconstruct:lumberaxe:1000>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.51 as float, FreeModifiers: 3, Durability: 1104, HarvestLevel: 4, Attack: 8.360001 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.51 as float, FreeModifiers: 4, Durability: 1104, HarvestLevel: 4, Attack: 8.360001 as float}, Special: {Categories: ["aoe", "harvest", "tool"]}, TinkerData: {Materials: ["wood", "manyullyn", "iron", "paper"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "ecological", color: -7444965 as long, level: 1}, {identifier: "insatiable", color: -6202120 as long, level: 1}, {identifier: "magnetic", color: -3487030 as long, level: 2, magnetic2: 1 as byte}, {identifier: "writable", color: -1 as long, level: 1, writable1: 1 as byte}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["ecological", "insatiable", "magnetic2", "writable1", "toolleveling"]}):
  [[
    <tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {Materials: ["pigiron", "pigiron"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
    <tconstruct:excavator>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {Materials: ["pigiron", "pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
  ],[
    <tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.6 as float, MiningSpeed: 6.2 as float, FreeModifiers: 0, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 3, Materials: ["pigiron", "pigiron"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 150, color: 9502720, level: 3, max: 150, extraInfo: "149 / 150"}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
    <tconstruct:excavator>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 22.626122 as float, FreeModifiers: 0, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {UsedModifiers: 3, Materials: ["pigiron", "pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 150, color: 9502720, level: 3, max: 150, extraInfo: "149 / 150"}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
  ],[
    <tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 456, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 2.0 as float, MiningSpeed: 6.7 as float, FreeModifiers: 0, Durability: 956, HarvestLevel: 3, Attack: 12.564729 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 9, Materials: ["pigiron", "pigiron"], Modifiers: ["toolleveling", "sharpness", "creative", "haste", "diamond"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "sharpness", current: 216, color: 16774902, level: 3, max: 216, extraInfo: "215 / 216"}, {identifier: "creative", color: 0, level: 6}, {identifier: "haste", current: 250, color: 9502720, level: 5, max: 250, extraInfo: "249 / 250"}, {identifier: "diamond", color: 9237730}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
    <tconstruct:excavator>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 1155, HarvestLevel: 2, Attack: 4.5 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 29.733969 as float, FreeModifiers: 0, Durability: 1655, HarvestLevel: 4, Attack: 12.564729 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {UsedModifiers: 9, Materials: ["pigiron", "pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling", "sharpness", "creative", "haste", "fortifymanyullyn", "diamond"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "sharpness", current: 216, color: 16774902, level: 3, max: 216, extraInfo: "215 / 216"}, {identifier: "creative", color: 0, level: 6}, {identifier: "haste", current: 250, color: 9502720, level: 5, max: 250, extraInfo: "249 / 250"}, {identifier: "fortifymanyullyn", color: -6202120}, {identifier: "diamond", color: 9237730}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
  ]]
} as IItemStack[][][IItemStack];

for input, exampleList in tool_examples {
  for toolPair in exampleList {
    o.addJEIRecipe(getRecipe(input, toolPair[0], toolPair[1], true));
  }
}