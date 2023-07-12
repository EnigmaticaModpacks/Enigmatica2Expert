import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.world.IVector3d.create as V;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.sqrt;
import mods.zentoolforge.Toolforge;
import modtweaker.tconstruct.ITICMaterial;

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

// Tools that would be used to recycle
// Must be length of 5
static validToolsList as string[] = [
  // "tconstruct:hammer",
  // "tconstruct:battlesign",
  // "tconstruct:excavator",
  // "tconstruct:frypan",
  "tconstruct:hatchet",
  // "tconstruct:kama",
  // "tconstruct:lumberaxe",
  // "tconstruct:mattock",
  "tconstruct:pickaxe",
  "tconstruct:shovel",
  "tcomplement:chisel",
  "tcomplement:sledge_hammer",
  // "tconevo:tool_sceptre",
  // "exnihilocreatio:crook_tconstruct",
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
# ███╗   ███╗ █████╗ ████████╗██╗  ██╗
# ████╗ ████║██╔══██╗╚══██╔══╝██║  ██║
# ██╔████╔██║███████║   ██║   ███████║
# ██║╚██╔╝██║██╔══██║   ██║   ██╔══██║
# ██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║
# ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
# -----------------------------------------------------------------------
function shard(mat as string, amount as int = 1) as IItemStack {
  return amount > 1
    ? <tconstruct:shard>.withTag({Material: mat}) * amount
    : <tconstruct:shard>.withTag({Material: mat});
}

function getShard(
  input as IItemStack,
  tool_lvl as int,
  poverValue as double, // TODO: power should somehow increase output
  durabValue as double
) as IItemStack {

  // Check if input have tags
  val mats_data = D(input.tag).get("TinkerData.Materials");
  if(isNull(mats_data)) return shard('paper');
  val mats = mats_data.asList();

  // Calculate material amount for each parts
  val deconstructed = Toolforge.deconstructTool(input);
  var listCost = [1.0, 1.0, 1.0, 1.0] as double[];
  for i, dec in deconstructed {
    if(isNull(dec.tag.Material)) continue;
    val partCost = partsCosts[dec.definition.id];
    val cost = !isNull(partCost) ? partCost as double : 1.0;
    listCost[i] = max(1.0, cost * durabValue * 2.0 + 0.5);
  }

  // Return if no mats available
  val listLen = mats.length;
  if(listLen<=0) return shard('bone');

  // Gather harvest levels of mats
  var listNames = [] as string[];
  var listLevel = [] as int[];
  for i in 0 to listLen {
    val matName = mats[i].asString();
    val forgeMat = Toolforge.getMaterialFromID(matName);
    listNames += matName;
    listLevel += !isNull(forgeMat)
      ? (forgeMat.hasHeadStats() ? forgeMat.harvestLevelHead : 1) : 1;
  }

  // Sort level indexes
  var sorted = utils.sortInt(listLevel);

  // Pick first applicable level
  for i in 0 to sorted.length {
    val index = sorted[i];
    val lvl = listLevel[index];

    if(tool_lvl >= lvl)
      return <tconstruct:shard>.withTag({Material: listNames[index]}) * listCost[index];
  }

  // Gear too strong for tools
  return shard('stone');
}

// -----------------------------------------------------------------------
// Functions
// -----------------------------------------------------------------------
function getToolsStats(tool as IItemStack) as double[string] {
  val toolDTagStats = D(tool.tag.Stats);
  return {
    HarvestLevel: toolDTagStats.getInt("HarvestLevel", 0),
    Attack:       toolDTagStats.getFloat("Attack", 0.0f),
    MiningSpeed:  toolDTagStats.getFloat("MiningSpeed", 0.0f),
  } as double[string];
}

function getPerfectOrder(input as IItemStack) as int[] {
  val indexes = [0,1,2,3,4] as int[];
  val result = [0,1,2,3,4] as int[];
  val hashSrt = input.definition.id ~ input.tag.asString();
  for i in 0 to 5 {
    val j = i == 4 ? 0 : abs((hashSrt~i).hashCode() % (indexes.length - i));
    result[i] = indexes[j];
    indexes[j] = indexes[4 - i];
  }
  return result;
}

function disassemble(ins as IItemStack[string]) as IItemStack {
  # Exit if tools repeats
  for i in 0 to 4 {
    for j in (i+1) to 5 {
      if (ins["t"~i].definition.id == ins["t"~j].definition.id) return null;
    }
  }

  // Check if tool order match random one
  val indexes = getPerfectOrder(ins.t);
  var matchPositions = 0;
  // utils.log("~~ Perfect tool order: " ~indexes[0]~indexes[1]~indexes[2]~indexes[3]~indexes[4]);
  for i, j in indexes {
    if(ins["t"~i].definition.id == validToolsList[j]) matchPositions += 1;
  }
  if (matchPositions < 5) {
    val resultDmg = ins.t.damage + (5 - matchPositions);
    if (resultDmg >= ins.t.maxDamage) return <tconstruct:shard>.withTag({Material: "wood"});
    return ins.t.withDamage(resultDmg);
  }

  # 🔨 Tools
  var average_power = 0;
  var average_level = 0;
  for i in 0 to 5 {
    val stats = getToolsStats(ins["t"~i]);
    average_power += stats.Attack + stats.MiningSpeed;
    average_level += stats.HarvestLevel;
  }
  average_power /= 5;
  average_level /= 5;

  # 4️⃣ Amount of Shard Stacks
  val poverValue = max(1.0, sqrt(average_power / 3.0)) as int;
  val durabValue = 1.0 - ins.t.damage as double / ins.t.maxDamage as double;

  var shard = getShard(ins.t, average_level, poverValue, durabValue);

  # 👞 Output shard
  return shard;
}

function getGhostID(item as IItemStack, ads as string) as string {
  val str = item.definition.id ~ item.tag.asString() ~ ads;
  val result = validToolsList[abs(str.hashCode() % validToolsList.length)];
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
recipes.addShaped(
  "tcon_Disassembling",
  <tconstruct:shard>, [
    [validTools.marked('t0').transformDamage(10), validTools.marked('t1').transformDamage(10), validTools.marked('t2').transformDamage(10)],
    [validTools.marked('t3').transformDamage(10), disassemblable.marked('t'), validTools.marked('t4').transformDamage(10)]
  ],
  function(out, ins, cInfo) {
    return disassemble(ins);
  }, null
);

val example_tool = scripts.equipment.utils_tcon.constructTool(
  <tconstruct:lumberaxe>, "wood", "manyullyn", "iron", "paper"
);

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

var k = 0;
for example in toolExamples {
  for modifiers in modifiersExamples {
    for mats in materialExamples {
      val tools = [null,null,null,null,null] as IItemStack[];
      for i, valid in validToolsList {
        tools[i] = scripts.equipment.utils_tcon.constructTool(
          itemUtils.getItem(valid), mats[0], mats[1], mats[2], mats[3], modifiers
        );
      }
      val a = getPerfectOrder(example);
      recipes.addShaped(
        "disassemble_example_"~k,
        disassemble({
          t:  example,
          t0: tools[a[0]],
          t1: tools[a[1]],
          t2: tools[a[2]],
          t3: tools[a[3]],
          t4: tools[a[4]],
        }), [
          [tools[0], tools[1], tools[2]],
          [tools[3], example, tools[4]]
        ]
      );
      k += 1;
    }
  }
}
