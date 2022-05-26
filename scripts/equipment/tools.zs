import crafttweaker.item.IItemStack;
import mods.zentoolforge.Toolforge;

# *======= Recipes =======*

val toolsToRemove = [
	<botania:glasspick>,
	<forestry:bronze_pickaxe>,
	<ic2:bronze_pickaxe>,
	<ic2:bronze_sword>,
	<ic2:bronze_chestplate>,
	<ic2:bronze_helmet>,
	<ic2:bronze_leggings>,
	<ic2:bronze_boots>,

	<immersiveengineering:pickaxe_steel>,
	<immersiveengineering:shovel_steel>,
	<immersiveengineering:axe_steel>,
	<immersiveengineering:sword_steel>,
	<immersiveengineering:hoe_steel>,

	<twilightforest:fiery_pickaxe>,
	<twilightforest:steeleaf_pickaxe>.withTag({ench: [{lvl: 2 as short, id: 35 as short}]}),
	<twilightforest:ironwood_pickaxe>.withTag({ench: [{lvl: 1 as short, id: 32 as short}]}),

	<botania:manasteelpick>, 
	<botania:manasteelshovel>, 
	<botania:manasteelaxe>, 
	<botania:manasteelsword>, 
	<botania:manasteelshears>, 
	<botania:elementiumpick>,
	<botania:elementiumshovel>,
	<botania:elementiumsword>,
	<botania:elementiumshears>,

	<exnihilocreatio:crook_wood>,
	<exnihilocreatio:crook_stone>,
	<exnihilocreatio:crook_andesite>,
	<exnihilocreatio:crook_granite>,
	<exnihilocreatio:crook_diorite>,
	<exnihilocreatio:crook_gold>,
	<exnihilocreatio:crook_iron>,
	<exnihilocreatio:crook_diamond>,
	<exnihilocreatio:crook_bone>,
	<exnihilocreatio:crook_clay_uncooked>,
	<exnihilocreatio:crook_clay>,
	<exnihilocreatio:crook_prismarine>,
	<exnihilocreatio:crook_netherrack>,
	<exnihilocreatio:crook_purpur>,
	<exnihilocreatio:crook_blaze>,

	<exnihilocreatio:hammer_wood>,
	<exnihilocreatio:hammer_stone>,
	<exnihilocreatio:hammer_iron>,
	<exnihilocreatio:hammer_gold>,

	<excompressum:compressed_crook>,
	<excompressum:compressed_hammer_wood>,
	<excompressum:compressed_hammer_stone>,
	<excompressum:compressed_hammer_iron>,
	<excompressum:compressed_hammer_gold>,
	<excompressum:hammer_mana>,

	<randomthings:spectrepickaxe>,
	<randomthings:spectreaxe>,
	<randomthings:spectreshovel>,
	<randomthings:spectresword>,
] as IItemStack[];
	
for tool in toolsToRemove {
	utils.rh(tool);
}

# Vanilla tool nerfs

val toolsToNerf = [

	<minecraft:golden_axe>,
	<minecraft:golden_shovel>,
	<minecraft:golden_hoe>,
	<minecraft:golden_pickaxe>,
	<minecraft:golden_sword>,

	<minecraft:diamond_shovel>,
	<minecraft:diamond_axe>,
	<minecraft:diamond_pickaxe>,
	<minecraft:diamond_hoe>,

	<minecraft:iron_shovel>,
	<minecraft:iron_axe>,
	<minecraft:iron_pickaxe>,
	<minecraft:iron_hoe>,
		
	<minecraft:wooden_pickaxe>,
	<minecraft:wooden_sword>,
	<minecraft:wooden_hoe>,
	<minecraft:wooden_shovel>,
	<minecraft:wooden_axe>,

	<minecraft:stone_pickaxe>,
	<minecraft:stone_hoe>,
	<minecraft:stone_axe>,
	<minecraft:stone_shovel>,

	<minecraft:shears>,

] as IItemStack[];

val matConversion = {
	wooden: "wood",
	stone : "stone",
} as string[string];

val defConversion = {
	pickaxe: "pickaxe",
	sword  : "broadsword",
	hoe    : "mattock",
	shovel : "shovel",
	axe    : "hatchet",
} as string[string];

for tool in toolsToNerf {
	tool.maxDamage = 1;
	scripts.category.tooltip_utils.desc.both(tool, "vanilla_tools");

	val splitted = tool.definition.id.split(":")[1].split("_");
	if(splitted.length <= 1) continue;

	val matTcon = matConversion[splitted[0]];
	if(isNull(matTcon)) continue;

	val tconID = defConversion[splitted[1]];
	if(isNull(tconID)) continue;

	val tconDef = itemUtils.getItem('tconstruct:'~tconID);
	if(isNull(tconDef)) continue;

	val woodMat = Toolforge.getMaterialFromID("wood");
	if(isNull(woodMat)) continue;

	val toolTcon = Toolforge.buildTool(tconDef.definition, [woodMat, Toolforge.getMaterialFromID(matTcon), woodMat]);
	if(isNull(toolTcon)) continue;

	recipes.addShapeless('convert_'~tool.definition.id.replaceAll(":", "_"), toolTcon, [tool]);
}

<minecraft:stone_sword>.maxDamage = 2;
<minecraft:iron_sword>.maxDamage = 10;
<minecraft:diamond_sword>.maxDamage = 20;

