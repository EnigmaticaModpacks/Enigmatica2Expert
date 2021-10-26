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
import modtweaker.tconstruct.ITICMaterial;



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

function getHeadStat(mat as ITICMaterial) as int {
  if (mat.hasHeadStats()) return mat.harvestLevelHead;
  return 1;
}


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
  val tool = itemUtils.getItem(toolId);
  if(isNull(tool)) continue;
  validTools = validTools | tool.anyDamage();
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

static OUTPUT_SLOTS as int = 1;

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
for i in 0 .. OUTPUT_SLOTS { o.setItemSlot(6+(i%2),i/2+1,ComponentFace.all(),64).setGroup("output").setAccess(false,true).setHandAccess(false,true); }
// o.setTextSlot(3,0).setVisual(SlotVisual.create(1,1)).setRenderText("%s", ['v_ghost0']).alignCenter();
// o.setTextSlot(4,0).setVisual(SlotVisual.create(1,1)).setRenderText("%s", ['v_ghost1']).alignCenter();

o.setJEIItemSlot  (1,1,"input");
o.setJEIItemSlot  (3,1,"tool0");
o.setJEIItemSlot  (4,1,"tool1");
o.setJEIItemSlot  (gh[0].x,gh[0].y,"ghost0", ghostBg);
o.setJEIItemSlot  (gh[1].x,gh[1].y,"ghost1", ghostBg);
o.setJEIDurationSlot(2,1,"duration0",SlotVisual.arrowRight());
o.setJEIDurationSlot(5,1,"duration1",SlotVisual.arrowRight());
for i in 0 .. OUTPUT_SLOTS { o.setJEIItemSlot(6+(i%2),i/2+1,"output"); }

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
  "I": <actuallyadditions:block_misc:2>,
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
  if(isNull(mats_data)) utils.log(["⚠️ mats_data is null"]);
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
  if(listLen<=0) utils.log(["⚠️ listLen<=0"]);
  if(listLen<=0) return null;
  if(listLen==1) {
    val matName = mats[0].asString();
    val forgeMat = Toolforge.getMaterialFromID(matName);
    if(isNull(forgeMat)) utils.log(["⚠️ isNull(forgeMat)"]);
    if(isNull(forgeMat)) return null;
    if(tool_lvl <= getHeadStat(forgeMat)) utils.log(["⚠️ tool_lvl <= forgeMat.harvestLevelHead"]);
    if(tool_lvl <= getHeadStat(forgeMat)) return null;

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
    listLevel += getHeadStat(forgeMat);
  }
  if(listNames.length <= 0) utils.log(["⚠️ listNames.length <= 0"]);
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

    if(tool_lvl >= lvl)
      result += getWeightedShard(listNames[index], listCost[index]);
  }

  if(result.length==0) utils.log(["⚠️ result.length==0"]);
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

# ⚒️ Damage tools
function damageTools(c as RecipeContainer) {
  // utils.log([' ⚒️ damage tools']);
  for i in 0 .. 2 {
    val item = c.machine.getItem(3+i,1);
    c.machine.setItem(3+i,1, item.withDamage(min(item.maxDamage, item.damage + 10)));
}
}

function addWorldOutput(c as RecipeContainer) {
  c.addWorldOutput(function(machine) {
    # 👻 Remove ghosts
    // utils.log([' ⚒️-👻']);
    machine.setItem(gh[0].x, gh[0].y, null);
    machine.setItem(gh[1].x, gh[1].y, null);

    // utils.log([' ⚒️ ✔']);
    return true;
  });
}

function getRecipe(input_item as IIngredient, tool0 as IIngredient, tool1 as IIngredient, isJEI as bool) as AssemblyRecipe {
  return AssemblyRecipe.create(function(c) {
    // utils.log(['']);
    // utils.log([' enter AssemblyRecipe.create()']);

    ################################################################

    # 🔰 Input
    val input = c.jei ? input_item.items[0] : c.getItem("input");
    
    # Exit if tools is futile
    if(!c.jei) {
      for i in 0 .. 2 {
        val tool = c.machine.getItem(3+i,1);
        if(getGhostID(input, i) != tool.definition.id) {
          // utils.log([' futile!']);
          c.addItemOutput("output", <tconstruct:shard>.withTag({Material: "stone"}));
          addWorldOutput(c);
          // damageTools(c);
          return;
        }
      }
    }

    ################################################################

    # 🔨 Tools
    // utils.log([' get tool stats...']);
    val toolsStats = [
      getToolsStats(c.jei ? tool0.items[0] : c.machine.getItem(3,1)),
      getToolsStats(c.jei ? tool1.items[0] : c.machine.getItem(4,1)),
    ] as double[string][];

    if(c.jei) {
      // utils.log([' 👻 Setting ghosts..']);
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

    // utils.log([' get shards...']);
    var shards = getShards(input, tool_lvl, amount, sortOrder, quantity);

    # 👞 Output shards
    if(isNull(shards) || shards.length == 0)
      shards = [<tconstruct:shard>.withTag({Material: "stone"}).weight(1)] as WeightedItemStack[];

    # 🢂 Output
    for i,_ in shards {
      if(i >= OUTPUT_SLOTS) continue;
      val shard = shards[shards.length - i - 1];
			if(c.jei) {
				c.addItemOutput("output", shard.stack.withLore(["§d§l" ~ shard.percent as int ~ "%"]));
			} else if(quantity >= 1.0d || c.random.nextDouble() < shard.chance) {
        // utils.log(['  🢂 output', shard.stack.commandString]);
				c.addItemOutput("output", shard.stack);
      }
      // utils.log(['🢂 output added', shard.stack.commandString ~ " % " ~ shard.percent as int]);
		}

    addWorldOutput(c);
    if(!c.jei) damageTools(c);

    // utils.log(['✔️ done']);
  })
  .requireItem("input", input_item.marked("input"))
  .requireItem("tool0", tool0.marked("tool0"), 1, 0)
  .requireItem("tool1", tool1.marked("tool1"), 1, 0)
  .requireWorldCondition("world",function(machine) {
    // utils.log([' requireWorldCondition()...']);
    for i in 0 .. 2 {
      val tool = machine.getItem(3+i,1);
      if(tool.damage + 10 > tool.maxDamage) return false;
    }
    // utils.log([' done!']);
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
function constructTool(base as IItemStack, mat1 as string, mat2 as string, mat3 as string, mat4 as string) as IItemStack {
  return Toolforge.buildTool(base.definition, [
    Toolforge.getMaterialFromID(mat1),
    Toolforge.getMaterialFromID(mat2),
    Toolforge.getMaterialFromID(mat3),
    Toolforge.getMaterialFromID(mat4),
  ]);
}

val example_tool = constructTool(<tconstruct:lumberaxe>, "wood", "manyullyn", "iron", "paper");

val toolExamples = [
  example_tool,
  example_tool.withDamage(example_tool.maxDamage * 0.75),
] as IItemStack[];

val materialExamples = [
  ["paper","paper","stone","flint"],
  ["knightslime","manyullyn","pigiron","endstone"],
  ["chaotic_metal","draconic_metal","wyvern_metal","draconium"],
] as string[][];

val modifiersExamples = [
  [],
  ["diamond", "sharpness", "haste", "emerald"],
] as string[][];

for tool in toolExamples {
  for modifiers in modifiersExamples {
    for mats in materialExamples {
      var a = constructTool(getGhostItem(tool, 0), mats[0], mats[1], mats[2], mats[3]);
      var b = constructTool(getGhostItem(tool, 1), mats[0], mats[1], mats[2], mats[3]);
      for modif in modifiers {
        a = scripts.equipment.utils_tcon.addModifier(a, modif);
        b = scripts.equipment.utils_tcon.addModifier(b, modif);
      }
      // utils.log(["♻ Adding JEI recipe:", tool.commandString]);
      // utils.log(["♻ A:", a.commandString]);
      // utils.log(["♻ B:", b.commandString]);
      o.addJEIRecipe(getRecipe(tool, a, b, true));
  }
}
}
