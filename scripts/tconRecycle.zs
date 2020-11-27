import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;
import mods.artisanworktables.builder.RecipeBuilder;
import scripts.craft.grid.Grid;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.ceil;
import mods.zentoolforge.Toolforge;

val disassemblable =
    <conarm:helmet>
  | <conarm:boots>
  | <conarm:chestplate>
  | <conarm:leggings>
  | <exnihilocreatio:crook_tconstruct>
  | <plustic:katana>
  | <tcomplement:chisel>
  | <tcomplement:sledge_hammer>
  | <tconevo:tool_sceptre>
  | <tconstruct:arrow>
  | <tconstruct:battlesign>
  | <tconstruct:bolt>
  | <tconstruct:broadsword>
  | <tconstruct:cleaver>
  | <tconstruct:crossbow>
  | <tconstruct:excavator>
  | <tconstruct:frypan>
  | <tconstruct:hammer>
  | <tconstruct:hatchet>
  | <tconstruct:kama>
  | <tconstruct:longbow>
  | <tconstruct:longsword>
  | <tconstruct:lumberaxe>
  | <tconstruct:mattock>
  | <tconstruct:pickaxe>
  | <tconstruct:rapier>
  | <tconstruct:scythe>
  | <tconstruct:shortbow>
  | <tconstruct:shovel>
  | <tconstruct:shuriken>
;

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

static getShard as function(IItemStack[string], double)IItemStack = 
function (ins as IItemStack[string], quantity as double) as IItemStack {
  utils.log("Enter TConRecyclee Recipe Function");
  if(isNull(ins.marked) || isNull(ins.catal)) return null;

  utils.log("Check if input have tags");
  // Check if input have tags
  val tag = ins.marked.tag;
  var mats = D(tag, "TinkerData.Materials");
  if(isNull(mats)) return null;
  
  utils.log("Find catalyst level");
  // Find catalyst level
  val catal_tag = ins.catal.tag;
  val catal_mat = D(catal_tag, "Material");
  if(isNull(catal_mat)) return null;
  val forge_catal_mat = Toolforge.getMaterialFromID(catal_mat.asString());
  if(isNull(forge_catal_mat)) return null;
  val catal_lvl = forge_catal_mat.harvestLevelHead;

  utils.log("Calculate material amount for each parts");
  // Calculate material amount for each parts
  val deconstructed = Toolforge.deconstructTool(ins.marked);
  var listCost = [] as int[];
  for dec in deconstructed {
    if(!isNull(D(dec.tag, "Material"))) {
      val partCost = partsCosts[dec.definition.id];
      val cost = !isNull(partCost) ? partCost as int : 1;
      listCost = listCost + max(1, ceil(cost as double * quantity * 2.0d) as int);
      utils.log("  listCost: ", listCost[listCost.length - 1]);
    }
  }

  utils.log("Return if only one mat avaliable");
  // Return if only one mat avaliable
  val listLen = mats.asList().length;
  utils.log("listLen = ", listLen);
  if(listLen<=0) return null;
  if(listLen==1) {
    val matName = mats.asList()[0].asString();
    val forgeMat = Toolforge.getMaterialFromID(matName);
    if(isNull(forgeMat)) return null;
    if(catal_lvl <= forgeMat.harvestLevelHead) return null;

    return <tconstruct:shard>.withTag({Material: matName}) * listCost[0];
  }

  utils.log("Gather harvest levels of mats");
  // Gather harvest levels of mats
  var listNames = [] as string[];
  var listLevel = [] as int[];
  var sorted = [] as int[];
  for i in 0 to listLen {
    val matName = mats.asList()[i].asString();
    val forgeMat = Toolforge.getMaterialFromID(matName);
    if(isNull(forgeMat)) continue;
    listNames = listNames + matName;
    listLevel = listLevel + forgeMat.harvestLevelHead;
  }
  if(listNames.length <= 0) return null;

  utils.log("Sort level indexes");
  // Sort level indexes
  for i in 0 to listLevel.length {
    var g_v = 0;
    var g_i = i;
    for j in 0 to listLevel.length {
      if(listLevel[j] >= g_v && !(sorted has j)) {
        g_v = listLevel[j];
        g_i = j;
        utils.log("    adding", g_v, g_i);
      }
    }
    sorted = sorted + g_i;
    utils.log("  sorted + ", g_i);
  }

  utils.log("Pick first applicable level");
  // Pick first applicable level
  for i in 0 to sorted.length {
    val index = sorted[i];
    val lvl = listLevel[index];
    utils.log("  checking ", index, lvl);

    if(catal_lvl > lvl)
      return <tconstruct:shard>.withTag({Material: listNames[index]}) * listCost[index];
  }

  utils.log("Return Null");
  return null;
};


RecipeBuilder.get("blacksmith")

  .setShapeless([disassemblable.marked("marked"), <tcomplement:chisel_head>.marked("catal")])
  .setRecipeFunction(function(out, ins, cInfo) {return getShard(ins, 1.0d);})
  .setSecondaryIngredients([<ore:ballDarkSteel>])
  .addOutput(<tconstruct:shard> * 16)
  .addTool(<tcomplement:sledge_hammer>, 10)
  .addTool(<tconstruct:hammer>, 50)
  .addTool(<tconevo:tool_sceptre>, 100)
  .setFluid(<liquid:heavy_metal> * 400)
  .setMinimumTier(2)
  .create()

  .setShapeless([disassemblable.marked("marked"), <tcomplement:chisel_head>.marked("catal")])
  .setRecipeFunction(function(out, ins, cInfo) {return getShard(ins, 0.25d);})
  .setSecondaryIngredients([<ore:ballConstructionAlloy>])
  .addOutput(<tconstruct:shard> * 4)
  .addTool(<tcomplement:sledge_hammer>, 10)
  .addTool(<tconstruct:hammer>, 50)
  .setFluid(<liquid:heavy_metal> * 200)
  .setMinimumTier(1)
  .create()

  .setShapeless([disassemblable.marked("marked"), <tcomplement:chisel_head>.marked("catal")])
  .setRecipeFunction(function(out, ins, cInfo) {return getShard(ins, 0.1d);})
  .addOutput(<tconstruct:shard> * 1)
  .addTool(<tcomplement:sledge_hammer>, 10)
  .setFluid(<liquid:heavy_metal> * 100)
  .setMinimumTier(0)
  .create()
;

