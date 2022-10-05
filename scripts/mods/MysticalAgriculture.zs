import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.grid.Grid;

#modloaded mysticalagriculture

# Enderman Chunks -> Ender Pearls
mods.nuclearcraft.pressurizer.addRecipe(<mysticalagriculture:chunk:19> * 2, <minecraft:ender_pearl>);

# [Inferium Seeds] from [Seeds][+1]
craft.remake(<mysticalagriculture:tier1_inferium_seeds>, ["pretty",
  "W W W",
  "W h W",
  "W W W"], {
  "W": <ic2:crop_res:5>, # Weed
  "h": <ore:seed>, # Seeds
});

# Wither Proof Blocks
recipes.addShapedMirrored("Wither Proof Block",
<mysticalagriculture:witherproof_block> * 16,
[[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>],
[<enderio:block_reinforced_obsidian>, <ore:dyeBlack>, <enderio:block_reinforced_obsidian>],
[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>]]);

recipes.addShapedMirrored("Wither Proof Glass",
<mysticalagriculture:witherproof_glass> * 16,
[[<enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>],
[<extrautils2:decorativeglass:3>, <ore:dyeBlack>, <extrautils2:decorativeglass:3>],
[<enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>]]);

# Readding Essence to Ingot recipes because of an unidentified bug - 20-12-2018
	recipes.addShaped("Lead Essence to Ingot", <thermalfoundation:material:131> * 4, [[<mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>],[<mysticalagriculture:lead_essence>, null, <mysticalagriculture:lead_essence>], [<mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>]]);
	recipes.addShaped("Silver Essence to Ingot", <thermalfoundation:material:130> * 4, [[<mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>],[<mysticalagriculture:silver_essence>, null, <mysticalagriculture:silver_essence>], [<mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>]]);
	recipes.addShaped("Tin Essence to Ingot", <thermalfoundation:material:129> * 8, [[<mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>],[<mysticalagriculture:tin_essence>, null, <mysticalagriculture:tin_essence>], [<mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>]]);
	recipes.addShaped("Copper Essence to Ingot", <thermalfoundation:material:128> * 8, [[<mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>],[<mysticalagriculture:copper_essence>, null, <mysticalagriculture:copper_essence>], [<mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>]]);

# Disabling Obsidian recipe, readding Essence recipe
	recipes.remove(<minecraft:obsidian>);
	recipes.addShaped("Obsidian From Essence",
	<minecraft:obsidian> * 8,
	[[<mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>],
	[<mysticalagriculture:obsidian_essence>, null, <mysticalagriculture:obsidian_essence>],
	[<mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>]]);

# [Ultimate Furnace] from [Supremium Furnace][+3]
craft.remake(<mysticalagriculture:ultimate_furnace>, ["pretty",
  "▲ W ▲",
  "W § W",
  "▲ B ▲"], {
  "▲": <ore:dustWither>,                        # Wither Ash
  "W": <mysticalagradditions:stuff:1>,          # Withering Soul
  "§": <mysticalagriculture:supremium_furnace>, # Supremium Furnace
  "B": <endreborn:sword_shard>,                 # Broken Sword Part
});

# Growth Accelerator
	recipes.remove(<mysticalagriculture:growth_accelerator>);
	recipes.addShapedMirrored("Growth Accelerator",
	<mysticalagriculture:growth_accelerator> * 2,
	[[<ore:blockInferiumEssence>, <ore:blockPrudentiumEssence>, <ore:blockInferiumEssence>],
	[<ore:manaDiamond>, <appliedenergistics2:quartz_growth_accelerator>, <ore:manaDiamond>],
	[<ore:blockInferiumEssence>, <ore:blockPrudentiumEssence>, <ore:blockInferiumEssence>]]);

# Master Infusion Crystal
	recipes.remove(<mysticalagriculture:master_infusion_crystal>);
	mods.astralsorcery.Altar.addConstellationAltarRecipe("enigmatica2expert:shaped/internal/altar/master_infusion_crystal",
		<mysticalagriculture:master_infusion_crystal>, 3000, 600,
	[<botania:rune:12>, <botania:storage:3>, <botania:rune:15>,
	<botania:storage:2>, <matc:supremiumcrystal>.anyDamage(), <botania:storage>,
	<botania:rune:11>, <botania:storage:1>, <botania:rune:10>,
	<botania:spark>, <botania:spark>, <botania:spark>, <botania:spark>,
	<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <botania:manaresource:1>, <botania:manaresource:1>,
	<botania:manaresource:1>, <botania:manaresource:1>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>]);

# *======= Crafting Seeds =======*
val essenceByTier = [
	<ore:essenceInferium>,
	<ore:essencePrudentium>,
	<ore:essenceIntermedium>,
	<ore:essenceSuperium>,
	<ore:essenceSupremium>,
	<ore:essenceInsanium>,
] as IIngredient[];

val seedIngrByTier = [
  <ic2:crop_res:5>,                  # Weed
  <biomesoplenty:coral:*>,           # Glowing Coral
  <ore:gemXorcite>,                  # Xorcite Shard
  <bloodmagic:component:28>,         # Simple Lengthening Catalyst
  <ore:carminite>,                   # Carminite
  <actuallyadditions:item_misc:24>,  # Empowered Canola Seed
] as IIngredient[];


for i in 0 .. 6 {
	val shape = scripts.craft.grid.Grid(["pretty",
		"o w o",
		"w ! w",
		"o w o"], {
		"!": <mysticalagriculture:crafting>.definition.makeStack(i + 16),
		"w": essenceByTier[i],
		"o": seedIngrByTier[i],
	}).shaped();
	val output = i==5
		? <mysticalagradditions:insanium:1>
		: <mysticalagriculture:crafting>.definition.makeStack(i + 17);
	recipes.remove(output);
	if(i==5) mods.forestry.Carpenter.addRecipe(output, shape, 40, <liquid:sewage> * 1000);
	else recipes.addShaped(output, shape);
}

# *======= Universal Recipe =======*

/*
	Astral Sorcery altair pattern:

	9   13  21  14  10

	15  0   1   2   16

	22  3   4   5   23

	17  6   7   8   18

	11  19  24  20  12
*/

static L as IIngredient[string] = {
  "¹": <mysticalagriculture:crafting:17>,
  "²": <mysticalagriculture:crafting:18>,
  "³": <mysticalagriculture:crafting:19>,
  "⁴": <mysticalagriculture:crafting:20>,
  "⁵": <mysticalagriculture:crafting:21>,
  "⁶": <mysticalagradditions:insanium:1>,

  "₁": <ore:essenceTier1>,
  "₂": <ore:essenceTier2>,
  "₃": <ore:essenceTier3>,
  "₄": <ore:essenceTier4>,
  "₅": <ore:essenceTier5>,

  "1": <ore:blockInferiumEssence>,
  "2": <ore:blockPrudentiumEssence>,
  "3": <ore:blockIntermediumEssence>,
  "4": <ore:blockSuperiumEssence>,
  "5": <ore:blockSupremiumEssence>,
  "6": <ore:blockInsaniumEssence>,

  "▪": <ore:ingotSuperium>,
  "▬": <ore:ingotSupremium>,
  "‗": <ore:ingotInsanium>,
  "┉": <ore:ingotCrystaltine>,
} as IIngredient[string];

static curr_tier as int = 1 as int;

function addTieredRecipe(
	output as IItemStack,
	ingrs as IIngredient[],
	constelation as string
) as void {
	if(isNull(output)) return;
	val tier = curr_tier;

	recipes.remove(output);

	L['○'] = ingrs[0];
	L['□'] = ingrs[ingrs.length==1?0:1];
	L['╳'] = ingrs.length==3 ? ingrs[2] : L['○₁₂₃₄₅'[tier - 1]];

	if(tier == 1) {
		recipes.addShapedMirrored(output, Grid([
			"╳1╳",
			"□¹□",
			"╳1╳"], L).shaped());
	} else

	if(tier == 2) {
		var grid = Grid([
			"╳2╳"+
			"2²2"+
			"╳2╳"+
			"○○□□"], L);
		mods.astralsorcery.Altar.addAttunementAltarRecipe(
			craft.uniqueRecipeName(output, grid),	output, 500, 200, grid.shapeless());
	} else

	if(tier == 3) {
		var grid = Grid([
			"╳3╳"+
			"3³3"+
			"╳3╳"+
			"○○□□"], L);
		mods.astralsorcery.Altar.addAttunementAltarRecipe(
			craft.uniqueRecipeName(output, grid),	output, 500, 200, grid.shapeless());
	} else

	if(tier == 4) {
		var grid = Grid([
			"╳4╳"+
			"4⁴4"+
			"╳4╳"+
			"○○□□"+
			"▪▪▪▪▪▪▪▪"], L);
		mods.astralsorcery.Altar.addConstellationAltarRecipe(
			craft.uniqueRecipeName(output, grid),	output, 1500, 250, grid.shapeless());
	} else

	if(tier == 5) {
		var grid = Grid([
			"╳5╳"+
			"5⁵5"+
			"╳5╳"+
			"○○□□"+
			"▬▬▬▬▬▬▬▬"+
			"○○□□"+
			"☼"], L);
		mods.astralsorcery.Altar.addTraitAltarRecipe(
			craft.uniqueRecipeName(output, grid),	output, 3500, 300,
			grid.shapeless(), "astralsorcery.constellation." ~ constelation
		);
	} else

	if(tier == 6) {
		L['▲'] = ingrs[min(ingrs.length, 2) - 1];
		var grid = Grid([
			"₅6₅"+
			"6⁶6"+
			"₅6₅"+
			"┉┉‗‗"+
			"○○□□▲▲○○"+
			"‗‗‗‗"+
			"☼"], L);
		mods.astralsorcery.Altar.addTraitAltarRecipe(
			craft.uniqueRecipeName(output, grid),	output, 5500, 600,
			grid.shapeless(), "astralsorcery.constellation." ~ constelation
		);
	}
}

# *======= Seeds Tier 1 =======*
curr_tier = 1;
addTieredRecipe(<mysticalagriculture:nature_seeds>,         [<mysticalagriculture:crafting:6>, <ore:ingotInferium>], null);
addTieredRecipe(itemUtils.getItem("mysticalcreations:creosolite_seeds"), [utils.tryCatch(utils.get("openblocks:tank", 0, 1, {tank: {FluidName: "creosote", Amount: 24000}}), Bucket("creosote")),<ore:runeEarthB>], null);


# *======= Seeds Tier 2 =======*
curr_tier = 2;
addTieredRecipe(<mysticalagriculture:tier2_inferium_seeds>, [<ore:blockInferiumEssence>], null);
addTieredRecipe(<mysticalagriculture:aluminum_seeds>,       [<ore:blockAluminum>,<ore:runeWaterB>], null);
addTieredRecipe(<mysticalagriculture:copper_seeds>,         [<ore:blockCopper>,<ore:runeFireB>], null);
addTieredRecipe(<mysticalagriculture:mystical_flower_seeds>,[<ore:manaDiamond>, <ore:manaPearl>, <mysticalagriculture:crafting:10>], null);
addTieredRecipe(<mysticalagriculture:apatite_seeds>,        [<ore:blockApatite>,<ore:runeWaterB>], null);
addTieredRecipe(<mysticalagriculture:coal_seeds>,           [<ore:blockCoal>,<ore:runeEarthB>], null);
addTieredRecipe(<mysticalagriculture:tin_seeds> ,           [<ore:blockTin> ,<ore:runeSummerB> ], null);
addTieredRecipe(<mysticalagriculture:sky_stone_seeds> ,     [<appliedenergistics2:material:45>, <ore:runeSummerB>] , null);
addTieredRecipe(<mysticalagriculture:nether_seeds> ,        [<ore:blockNetherWart> ,<ore:runeAutumnB>], null);
addTieredRecipe(itemUtils.getItem("mysticalcreations:cheese_seeds"), [<ore:cheeseWheels>,<ore:runeSummerB>], null);


# *======= Seeds Tier 3 =======*
curr_tier = 3;
addTieredRecipe(<mysticalagriculture:tier3_inferium_seeds>, [<ore:blockPrudentiumEssence>] , null);
addTieredRecipe(<mysticalagriculture:sulfur_seeds>,         [Bucket("sulfur"),<ore:runeAirB>], null);
addTieredRecipe(<mysticalagriculture:certus_quartz_seeds> , [<ore:blockCertusQuartz> ,<ore:runeSummerB>], null);
addTieredRecipe(<mysticalagriculture:aquamarine_seeds> ,    [<ore:oreAquamarine> , <ore:runeSpringB>], null);
addTieredRecipe(<mysticalagriculture:obsidian_seeds> ,      [<ore:plateDenseObsidian> ,<ore:runeAutumnB>], null);
addTieredRecipe(<mysticalagriculture:redstone_seeds> ,      [<ore:blockRedstone> ,<ore:runeAutumnB>], null);
addTieredRecipe(<mysticalagriculture:glowstone_seeds> ,     [<ore:glowstone> , <ore:runeWinterB>], null);
addTieredRecipe(<mysticalagriculture:nether_quartz_seeds> , [<ore:blockQuartz> ,<ore:runeSummerB>], null);
addTieredRecipe(<mysticalagriculture:iron_seeds> ,          [<ore:blockFakeIron> ,<ore:runeSummerB>], null);
addTieredRecipe(<mysticalagriculture:lead_seeds> ,          [<ore:blockLead> , <ore:runeWinterB>], null);
addTieredRecipe(<mysticalagriculture:silver_seeds> ,        [<ore:blockSilver> ,<ore:runeSpringB>], null);
addTieredRecipe(<mysticalagriculture:knightslime_seeds> ,   [<ore:blockKnightslime> ,<ore:runeWinterB>], null);
addTieredRecipe(<mysticalagriculture:steeleaf_seeds> ,      [<ore:blockSteel>, <ore:runeSpringB>] , null);
addTieredRecipe(<mysticalagriculture:ironwood_seeds> ,      [<twilightforest:block_storage>, <ore:runeSummerB>] , null);
addTieredRecipe(<mysticalagriculture:black_quartz_seeds> ,  [<ore:blockQuartzBlack> , <ore:runeAutumnB>], null);
addTieredRecipe(<mysticalagriculture:end_seeds>,            [<excompressum:compressed_block:10> ,<ore:runeWinterB>], null);
addTieredRecipe(itemUtils.getItem("mysticalcreations:astral_starmetal_seeds"), [<ore:blockAstralStarmetal> ,<ore:runeAutumnB>], null);

# *======= Seeds Tier 4 =======*
curr_tier = 4;
addTieredRecipe(<mysticalagriculture:tier4_inferium_seeds>, [<ore:blockIntermediumEssence>], null);
addTieredRecipe(<mysticalagriculture:thaumium_seeds>,       [<ore:blockThaumium> ,<ore:runeWrathB>], null);
addTieredRecipe(<mysticalagriculture:ruby_seeds>,           [<biomesoplenty:gem_block:1> ,<ore:runeEnvyB>], null);
addTieredRecipe(<mysticalagriculture:fiery_ingot_seeds>,    [<thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "infernum"}]}), <ore:runeManaB>], null);
addTieredRecipe(<mysticalagriculture:knightmetal_seeds>,    [<twilightforest:knightmetal_block>, <ore:runeManaB>], null);
addTieredRecipe(<mysticalagriculture:fluix_seeds>,          [<appliedenergistics2:fluix_block> ,<ore:runeManaB>], null);
addTieredRecipe(<mysticalagriculture:ardite_seeds>,         [<ore:blockArdite> ,<ore:runeWrathB>], null);
addTieredRecipe(<mysticalagriculture:peridot_seeds>,        [<biomesoplenty:gem_block:2> ,<ore:runeGluttonyB>], null);
addTieredRecipe(<mysticalagriculture:cobalt_seeds>,         [<ore:blockCobalt> ,<ore:runeWrathB>], null);
addTieredRecipe(<mysticalagriculture:sapphire_seeds>,       [<biomesoplenty:gem_block:6> ,<ore:runePrideB>], null);
addTieredRecipe(<mysticalagriculture:lapis_lazuli_seeds>,   [<ore:blockLapis> ,<ore:runeSlothB>], null);
addTieredRecipe(<mysticalagriculture:gold_seeds>,           [<ore:blockGold> ,<ore:runeSlothB>], null);
addTieredRecipe(<mysticalagriculture:amber_seeds>,          [<ore:blockAmber> ,<ore:runeGluttonyB>], null);
addTieredRecipe(<mysticalagriculture:topaz_seeds>,          [<biomesoplenty:gem_block:3> ,<ore:runeGluttonyB>], null);
addTieredRecipe(<mysticalagriculture:osmium_seeds>,         [<ore:blockOsmium> ,<ore:runeEnvyB>], null);
addTieredRecipe(<mysticalagriculture:malachite_seeds>,      [<biomesoplenty:gem_block:5> ,<ore:runePrideB>], null);
addTieredRecipe(<mysticalagriculture:tanzanite_seeds>,      [<biomesoplenty:gem_block:4> ,<ore:runeLustB>], null);
addTieredRecipe(<mysticalagriculture:nickel_seeds>,         [<ore:blockNickel> ,<ore:runeGreedB>], null);
addTieredRecipe(<mysticalagriculture:fluxed_electrum_seeds>,[<ore:blockElectrumFlux> ,<ore:runeGreedB>], null);
addTieredRecipe(<mysticalagriculture:diamond_seeds>,        [<ore:blockDiamond> ,<ore:runePrideB>], null);
addTieredRecipe(<mysticalagriculture:emerald_seeds>,        [<ore:blockEmerald> ,<ore:runeEnvyB>], null);
addTieredRecipe(<mysticalagriculture:ender_amethyst_seeds>, [<ore:blockAmethyst>, <astralsorcery:itemcoloredlens:2>], null);
addTieredRecipe(<mysticalagriculture:void_metal_seeds>,     [<ore:blockVoid>], null);
addTieredRecipe(<mysticalagriculture:rock_crystal_seeds>,   [<astralsorcery:itemcelestialcrystal:*>], "mineralis");
addTieredRecipe(<mysticalagriculture:uranium_seeds>,        [<ore:blockUranium>], "mineralis");


# *======= Seeds Tier 5 =======*
curr_tier = 5;
L['☼'] = <minecraft:nether_star>;
addTieredRecipe(<mysticalagriculture:tier5_inferium_seeds>, [<ore:blockSuperiumEssence>], "aevitas");
addTieredRecipe(<mysticalagriculture:platinum_seeds>,       [<ore:blockPlatinum>], "mineralis");
addTieredRecipe(<mysticalagriculture:draconium_seeds>,      [<ore:blockDraconium>], "mineralis");
addTieredRecipe(<mysticalagradditions:neutronium_seeds>,    [<ore:ingotCosmicNeutronium>], "mineralis");


# *======= Seeds Tier 6 =======*
curr_tier = 6;
addTieredRecipe(<mysticalagradditions:tier6_inferium_seeds>    , [<ore:blockSupremiumEssence>   , <astralsorcery:itemcoloredlens:2>, <botania:prism>],"aevitas");
addTieredRecipe(<mysticalagriculture:iridium_seeds>            , [<ore:blockIridium>            , <astralsorcery:itemcoloredlens:2>],"mineralis");
addTieredRecipe(<mysticalagriculture:enderium_seeds>           , [<ore:blockEnderium>           , <astralsorcery:itemcoloredlens:2>],"mineralis");
addTieredRecipe(<mysticalagriculture:terrasteel_seeds>         , [<botania:storage:1>           , <botania:laputashard>, <botania:prism>],"mineralis");

L['☼'] = <ore:blockNetherStar>;
addTieredRecipe(<mysticalagradditions:awakened_draconium_seeds>, [<ore:blockDraconiumAwakened>  , <astralsorcery:itemcoloredlens:2>, <draconicevolution:wyvern_energy_core>] ,"mineralis");
addTieredRecipe(<mysticalagradditions:nether_star_seeds>       , [<ore:blockNetherStar>         , <astralsorcery:itemcoloredlens:2>], "aevitas");
addTieredRecipe(<mysticalagradditions:dragon_egg_seeds>        , [<mysticalagradditions:stuff:3>], "aevitas");
addTieredRecipe(itemUtils.getItem("mysticalcreations:ultimate_seeds") , [<ore:blockUltimate>           ], "horologium");


# *======= Remove & Hide =======*

var itemsToRemoveAndHide as IItemStack[] = [
	<mysticalagriculture:chunk>,
	<mysticalagriculture:chunk:1>,
	<mysticalagriculture:chunk:2>,
	<mysticalagriculture:chunk:3>,
	<mysticalagriculture:chunk:4>,
	<mysticalagradditions:insanium:4>
];

for item in itemsToRemoveAndHide {
	utils.rh(item);
}

# *======= Unification =======*

# Sulfur Essence to Dust
  recipes.removeByRecipeName("mysticalagriculture:dustsulfur");
  recipes.addShapeless("Mystical Agriculture Sulfur", <thermalfoundation:material:771> * 8, [<mysticalagriculture:sulfur_essence>,<mysticalagriculture:sulfur_essence>,<mysticalagriculture:sulfur_essence>]);

# Uranium Essence to Ingot
  recipes.removeByRecipeName("mysticalagriculture:ingoturanium");
  recipes.addShaped("Mystical Agriculture Uranium", <immersiveengineering:metal:5> * 3, [[<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>],[<mysticalagriculture:uranium_essence>,null,<mysticalagriculture:uranium_essence>],[<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>]]);

# Changed Amber Essence to the more sensible amber
  recipes.removeByRecipeName("mysticalagriculture:gemamber");
  recipes.addShaped("Mystical Agriculture Amber", <thaumcraft:amber> * 6, [[<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>],[<mysticalagriculture:amber_essence>,null,<mysticalagriculture:amber_essence>],[<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>]]);

# Hydroponics Inferium grows
val inferCount = {
	<mysticalagriculture:tier1_inferium_seeds>  : 3,
	<mysticalagriculture:tier2_inferium_seeds>  : 6,
	<mysticalagriculture:tier3_inferium_seeds>  : 9,
	<mysticalagriculture:tier4_inferium_seeds>  : 12,
	<mysticalagriculture:tier5_inferium_seeds>  : 15,
	<mysticalagradditions:tier6_inferium_seeds> : 18,
} as int[IItemStack];

for seed, count in inferCount {
	scripts.process.grow(seed, <mysticalagriculture:crafting> * count, "only: Hydroponics", seed, 1.0f);
}

for input, output in {
/*Inject_js(
Object.entries(
	Object.fromEntries(
		loadJson('exports/recipes/thermalexpansion__insolator.json')
			.recipes.filter((rec) => rec.output.items[1]?.stacks[0]?.name.startsWith('mysticalagriculture:'))
			.map((rec) => {
				const seed = rec.output.items[1].stacks[0].name
				return [
					(seed.endsWith('_inferium_seeds:0')?'# ':'')+`<${seed}>`,
					`: <${rec.output.items[0].stacks[0].name}>,`
				]
			})
			.sort((a, b) => naturalSort(a[0], b[0]))
	)
)
)*/
# <mysticalagriculture:tier1_inferium_seeds:0>: <mysticalagriculture:crafting:0>,
# <mysticalagriculture:tier2_inferium_seeds:0>: <mysticalagriculture:crafting:0>,
# <mysticalagriculture:tier3_inferium_seeds:0>: <mysticalagriculture:crafting:0>,
# <mysticalagriculture:tier4_inferium_seeds:0>: <mysticalagriculture:crafting:0>,
# <mysticalagriculture:tier5_inferium_seeds:0>: <mysticalagriculture:crafting:0>,
<mysticalagriculture:aluminum_seeds:0>        : <mysticalagriculture:aluminum_essence:0>,
<mysticalagriculture:amber_seeds:0>           : <mysticalagriculture:amber_essence:0>,
<mysticalagriculture:apatite_seeds:0>         : <mysticalagriculture:apatite_essence:0>,
<mysticalagriculture:aquamarine_seeds:0>      : <mysticalagriculture:aquamarine_essence:0>,
<mysticalagriculture:ardite_seeds:0>          : <mysticalagriculture:ardite_essence:0>,
<mysticalagriculture:basalt_seeds:0>          : <mysticalagriculture:basalt_essence:0>,
<mysticalagriculture:black_quartz_seeds:0>    : <mysticalagriculture:black_quartz_essence:0>,
<mysticalagriculture:blaze_seeds:0>           : <mysticalagriculture:blaze_essence:0>,
<mysticalagriculture:certus_quartz_seeds:0>   : <mysticalagriculture:certus_quartz_essence:0>,
<mysticalagriculture:chicken_seeds:0>         : <mysticalagriculture:chicken_essence:0>,
<mysticalagriculture:coal_seeds:0>            : <mysticalagriculture:coal_essence:0>,
<mysticalagriculture:cobalt_seeds:0>          : <mysticalagriculture:cobalt_essence:0>,
<mysticalagriculture:copper_seeds:0>          : <mysticalagriculture:copper_essence:0>,
<mysticalagriculture:cow_seeds:0>             : <mysticalagriculture:cow_essence:0>,
<mysticalagriculture:creeper_seeds:0>         : <mysticalagriculture:creeper_essence:0>,
<mysticalagriculture:diamond_seeds:0>         : <mysticalagriculture:diamond_essence:0>,
<mysticalagriculture:dirt_seeds:0>            : <mysticalagriculture:dirt_essence:0>,
<mysticalagriculture:draconium_seeds:0>       : <mysticalagriculture:draconium_essence:0>,
<mysticalagriculture:dye_seeds:0>             : <mysticalagriculture:dye_essence:0>,
<mysticalagriculture:emerald_seeds:0>         : <mysticalagriculture:emerald_essence:0>,
<mysticalagriculture:end_seeds:0>             : <mysticalagriculture:end_essence:0>,
<mysticalagriculture:ender_amethyst_seeds:0>  : <mysticalagriculture:ender_amethyst_essence:0>,
<mysticalagriculture:enderium_seeds:0>        : <mysticalagriculture:enderium_essence:0>,
<mysticalagriculture:enderman_seeds:0>        : <mysticalagriculture:enderman_essence:0>,
<mysticalagriculture:experience_seeds:0>      : <mysticalagriculture:experience_essence:0>,
<mysticalagriculture:fiery_ingot_seeds:0>     : <mysticalagriculture:fiery_ingot_essence:0>,
<mysticalagriculture:fire_seeds:0>            : <mysticalagriculture:fire_essence:0>,
<mysticalagriculture:fluix_seeds:0>           : <mysticalagriculture:fluix_essence:0>,
<mysticalagriculture:fluxed_electrum_seeds:0> : <mysticalagriculture:fluxed_electrum_essence:0>,
<mysticalagriculture:ghast_seeds:0>           : <mysticalagriculture:ghast_essence:0>,
<mysticalagriculture:glowstone_seeds:0>       : <mysticalagriculture:glowstone_essence:0>,
<mysticalagriculture:gold_seeds:0>            : <mysticalagriculture:gold_essence:0>,
<mysticalagriculture:guardian_seeds:0>        : <mysticalagriculture:guardian_essence:0>,
<mysticalagriculture:ice_seeds:0>             : <mysticalagriculture:ice_essence:0>,
<mysticalagriculture:iridium_seeds:0>         : <mysticalagriculture:iridium_essence:0>,
<mysticalagriculture:iron_seeds:0>            : <mysticalagriculture:iron_essence:0>,
<mysticalagriculture:ironwood_seeds:0>        : <mysticalagriculture:ironwood_essence:0>,
<mysticalagriculture:knightmetal_seeds:0>     : <mysticalagriculture:knightmetal_essence:0>,
<mysticalagriculture:knightslime_seeds:0>     : <mysticalagriculture:knightslime_essence:0>,
<mysticalagriculture:lapis_lazuli_seeds:0>    : <mysticalagriculture:lapis_lazuli_essence:0>,
<mysticalagriculture:lead_seeds:0>            : <mysticalagriculture:lead_essence:0>,
<mysticalagriculture:limestone_seeds:0>       : <mysticalagriculture:limestone_essence:0>,
<mysticalagriculture:malachite_seeds:0>       : <mysticalagriculture:malachite_essence:0>,
<mysticalagriculture:marble_seeds:0>          : <mysticalagriculture:marble_essence:0>,
<mysticalagriculture:menril_seeds:0>          : <mysticalagriculture:menril_essence:0>,
<mysticalagriculture:mystical_flower_seeds:0> : <mysticalagriculture:mystical_flower_essence:0>,
<mysticalagriculture:nature_seeds:0>          : <mysticalagriculture:nature_essence:0>,
<mysticalagriculture:nether_quartz_seeds:0>   : <mysticalagriculture:nether_quartz_essence:0>,
<mysticalagriculture:nether_seeds:0>          : <mysticalagriculture:nether_essence:0>,
<mysticalagriculture:nickel_seeds:0>          : <mysticalagriculture:nickel_essence:0>,
<mysticalagriculture:obsidian_seeds:0>        : <mysticalagriculture:obsidian_essence:0>,
<mysticalagriculture:osmium_seeds:0>          : <mysticalagriculture:osmium_essence:0>,
<mysticalagriculture:peridot_seeds:0>         : <mysticalagriculture:peridot_essence:0>,
<mysticalagriculture:pig_seeds:0>             : <mysticalagriculture:pig_essence:0>,
<mysticalagriculture:platinum_seeds:0>        : <mysticalagriculture:platinum_essence:0>,
<mysticalagriculture:quicksilver_seeds:0>     : <mysticalagriculture:quicksilver_essence:0>,
<mysticalagriculture:rabbit_seeds:0>          : <mysticalagriculture:rabbit_essence:0>,
<mysticalagriculture:redstone_seeds:0>        : <mysticalagriculture:redstone_essence:0>,
<mysticalagriculture:rock_crystal_seeds:0>    : <mysticalagriculture:rock_crystal_essence:0>,
<mysticalagriculture:ruby_seeds:0>            : <mysticalagriculture:ruby_essence:0>,
<mysticalagriculture:saltpeter_seeds:0>       : <mysticalagriculture:saltpeter_essence:0>,
<mysticalagriculture:sapphire_seeds:0>        : <mysticalagriculture:sapphire_essence:0>,
<mysticalagriculture:sheep_seeds:0>           : <mysticalagriculture:sheep_essence:0>,
<mysticalagriculture:silver_seeds:0>          : <mysticalagriculture:silver_essence:0>,
<mysticalagriculture:skeleton_seeds:0>        : <mysticalagriculture:skeleton_essence:0>,
<mysticalagriculture:sky_stone_seeds:0>       : <mysticalagriculture:sky_stone_essence:0>,
<mysticalagriculture:slate_seeds:0>           : <mysticalagriculture:slate_essence:0>,
<mysticalagriculture:slime_seeds:0>           : <mysticalagriculture:slime_essence:0>,
<mysticalagriculture:spider_seeds:0>          : <mysticalagriculture:spider_essence:0>,
<mysticalagriculture:steeleaf_seeds:0>        : <mysticalagriculture:steeleaf_essence:0>,
<mysticalagriculture:stone_seeds:0>           : <mysticalagriculture:stone_essence:0>,
<mysticalagriculture:sulfur_seeds:0>          : <mysticalagriculture:sulfur_essence:0>,
<mysticalagriculture:tanzanite_seeds:0>       : <mysticalagriculture:tanzanite_essence:0>,
<mysticalagriculture:terrasteel_seeds:0>      : <mysticalagriculture:terrasteel_essence:0>,
<mysticalagriculture:thaumium_seeds:0>        : <mysticalagriculture:thaumium_essence:0>,
<mysticalagriculture:tin_seeds:0>             : <mysticalagriculture:tin_essence:0>,
<mysticalagriculture:topaz_seeds:0>           : <mysticalagriculture:topaz_essence:0>,
<mysticalagriculture:uranium_seeds:0>         : <mysticalagriculture:uranium_essence:0>,
<mysticalagriculture:void_metal_seeds:0>      : <mysticalagriculture:void_metal_essence:0>,
<mysticalagriculture:water_seeds:0>           : <mysticalagriculture:water_essence:0>,
<mysticalagriculture:wood_seeds:0>            : <mysticalagriculture:wood_essence:0>,
<mysticalagriculture:zombie_seeds:0>          : <mysticalagriculture:zombie_essence:0>,
/**/
} as IItemStack[IItemStack] {
	scripts.process.grow(input, output * 9, "only: Hydroponics", input);
}

# Remake crystals to consume previous level
var crystals = [
	<mysticalagriculture:infusion_crystal>,
	<matc:inferiumcrystal>,
	<matc:prudentiumcrystal>,
	<matc:intermediumcrystal>,
	<matc:superiumcrystal>,
	<matc:supremiumcrystal>,
] as IItemStack[];

# Infusion crystals
var prospetry = <mysticalagriculture:crafting:5>;
for i in 0 .. 5 {
	craft.remake(crystals[i+1], ["ABA","BCB","ABA"], {
		A: prospetry,
		B: itemUtils.getItem("mysticalagriculture:crafting", i),
		C: crystals[i].anyDamage().noReturn().marked("marked")},
		function(out, ins, cInfo) {
			if(ins has "marked" && !isNull(ins.marked) && ins.marked.isDamageable && out.isDamageable) {
				return out.withDamage(ins.marked.damage);
			}
			return out;
		});
}

# ######################################################################
#
# Harder Supremium armor
#
# ######################################################################

var liquidAmount = [4,6,5,4] as int[];
var bases = [
	<contenttweaker:supremium_helmet_base>  ,
	<contenttweaker:supremium_chest_base>   ,
	<contenttweaker:supremium_leggings_base>,
	<contenttweaker:supremium_boots_base>   ,
] as IItemStack[];
var cores = [
	<conarm:helmet_core>  .withTag({Material: "ma.supremium"}),
	<conarm:chest_core>   .withTag({Material: "ma.supremium"}),
	<conarm:leggings_core>.withTag({Material: "ma.supremium"}),
	<conarm:boots_core>   .withTag({Material: "ma.supremium"}),
] as IItemStack[];

var castNames = [
	"conarm:helmet_core",
	"conarm:chest_core",
	"conarm:leggings_core",
	"conarm:boots_core",
] as string[];

for i in 0 .. 4 {
	var l = 144 * liquidAmount[i];

	# Replace casting of cores to Base ones
	mods.tconstruct.Casting.removeTableRecipe(cores[i]);
	mods.tconstruct.Casting.addTableRecipe(bases[i], <tconstruct:cast>     .withTag({PartType: castNames[i]}), <liquid:supremium>, l, false);
	mods.tconstruct.Casting.addTableRecipe(bases[i], <tconstruct:clay_cast>.withTag({PartType: castNames[i]}), <liquid:supremium>, l, true);

	# Add core base melting
	mods.tconstruct.Melting.addRecipe(<liquid:supremium> * l, bases[i]);

	# Add recipe of making core from base
	# mods.rt.RandomThingsTweaker.addAnvilRecipe(IItemStack input1, IItemStack input2, IItemStack result, int levelcost);
	if(!isNull(loadedMods["rockytweaks"])) {
		mods.rockytweaks.Anvil.addRecipe(<mysticalagriculture:master_infusion_crystal>, bases[i], cores[i], 350);
	} else {
		recipes.addShapeless("core from crystal " ~i, cores[i], [<mysticalagriculture:master_infusion_crystal>, bases[i]]);
	}
}

# Missed 4 types of dyes
val dyeEssence = {x: <mysticalagriculture:dye_essence>} as IIngredient[string];
craft.make(<biomesoplenty:green_dye> * 4, ["pretty",
	"x    ",
	"  x  ",
	"x    "], dyeEssence);
craft.make(<biomesoplenty:brown_dye> * 4, ["pretty",
	"  x  ",
	"    x",
	"  x  "], dyeEssence);
craft.make(<biomesoplenty:blue_dye> * 4, ["pretty",
	"    x",
	"  x  ",
	"    x"], dyeEssence);
craft.make(<biomesoplenty:white_dye> * 4, ["pretty",
	"  x  ",
	"x    ",
	"  x  "], dyeEssence);

# Squeeze cow essence
scripts.process.squeeze([<mysticalagriculture:cow_essence>], <liquid:milk> * 250, "no exceptions", null);

# Squeeze water essence
scripts.process.squeeze([<mysticalagriculture:water_essence>], <liquid:water> * 250, "no exceptions", null);

# Saplings from essence
# ----------------------------
val defGroup = [
	<mysticalagriculture:wood_essence>,
	<mysticalagriculture:wood_essence>,
	<mysticalagriculture:nature_essence>,
] as IIngredient[];

val uniq_biomesoplenty = scripts.unique.Unique(defGroup + <biomesoplenty:biome_essence>);
val uniq_tconstruct    = scripts.unique.Unique(defGroup + <ore:slimeball>);
val uniq_other         = scripts.unique.Unique(defGroup + <mysticalagriculture:nature_essence>);

/*Inject_js(
getByOredict('treeSapling')
.filter(o=>
  !'minecraft|harvestcraft|twilightforest|randomthings|forestry|advancedrocketry|integrateddynamics'
  .split('|').includes(o.owner)
)
.filter(o=>o.commandString != '<biomesoplenty:sapling_1:7>')
.map((o,i)=>[
  `recipes.addShaped("sap #${i}", `,
  o.commandString,
  '* ', o.owner==='biomesoplenty'?10:6,
  `, uniq_${
    ['biomesoplenty','tconstruct'].includes(o.owner) ? o.owner : 'other'
  }.next());`
])
)*/
recipes.addShaped("sap #0",  <biomesoplenty:sapling_0>       * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #1",  <biomesoplenty:sapling_0:1>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #2",  <biomesoplenty:sapling_0:2>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #3",  <biomesoplenty:sapling_0:3>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #4",  <biomesoplenty:sapling_0:4>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #5",  <biomesoplenty:sapling_0:5>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #6",  <biomesoplenty:sapling_0:6>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #7",  <biomesoplenty:sapling_1>       * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #8",  <biomesoplenty:sapling_1:1>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #9",  <biomesoplenty:sapling_1:2>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #10", <biomesoplenty:sapling_1:3>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #11", <biomesoplenty:sapling_1:4>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #12", <biomesoplenty:sapling_1:5>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #13", <biomesoplenty:sapling_1:6>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #14", <biomesoplenty:sapling_2>       * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #15", <biomesoplenty:sapling_2:1>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #16", <biomesoplenty:sapling_2:2>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #17", <biomesoplenty:sapling_2:3>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #18", <biomesoplenty:sapling_2:4>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #19", <biomesoplenty:sapling_2:5>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #20", <biomesoplenty:sapling_2:6>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #21", <biomesoplenty:sapling_2:7>     * 10, uniq_biomesoplenty.next());
recipes.addShaped("sap #22", <extrautils2:ironwood_sapling>  * 6 , uniq_other.next());
recipes.addShaped("sap #23", <extrautils2:ironwood_sapling:1>* 6 , uniq_other.next());
recipes.addShaped("sap #24", <ic2:sapling>                   * 6 , uniq_other.next());
recipes.addShaped("sap #25", <quark:variant_sapling>         * 6 , uniq_other.next());
recipes.addShaped("sap #26", <quark:variant_sapling:1>       * 6 , uniq_other.next());
recipes.addShaped("sap #27", <rustic:sapling>                * 6 , uniq_other.next());
recipes.addShaped("sap #28", <rustic:sapling:1>              * 6 , uniq_other.next());
recipes.addShaped("sap #29", <rustic:sapling_apple>          * 6 , uniq_other.next());
recipes.addShaped("sap #30", <thaumcraft:sapling_greatwood>  * 6 , uniq_other.next());
recipes.addShaped("sap #31", <thaumcraft:sapling_silverwood> * 6 , uniq_other.next());
recipes.addShaped("sap #32", <tconstruct:slime_sapling>      * 6 , uniq_tconstruct.next());
recipes.addShaped("sap #33", <tconstruct:slime_sapling:1>    * 6 , uniq_tconstruct.next());
recipes.addShaped("sap #34", <tconstruct:slime_sapling:2>    * 6 , uniq_tconstruct.next());
/**/

# ----------------------------

# Remove previous 1 -> 4
recipes.removeByRecipeName("mysticalagriculture:core/compression/inferium_essence_from");
recipes.removeByRecipeName("mysticalagriculture:core/compression/prudentium_essence_from");
recipes.removeByRecipeName("mysticalagriculture:core/compression/intermedium_essence_from");
recipes.removeByRecipeName("mysticalagriculture:core/compression/superium_essence_from");
recipes.removeByRecipeName("mysticalagradditions:insanium_essence_from");

# 1 -> 4 required crystal
val essesnses = [
	<ore:essenceInsanium>.firstItem,
	<ore:essenceSupremium>.firstItem,
	<ore:essenceSuperium>.firstItem,
	<ore:essenceIntermedium>.firstItem,
	<ore:essencePrudentium>.firstItem,
	<ore:essenceInferium>.firstItem,
] as IItemStack[];

# Create ingredient for any crystal
var anyDamageCrystal as IIngredient = <ore:infusionCrystal>.itemArray[0].anyDamage();
for i, it in <ore:infusionCrystal>.itemArray {
	if(i==0) continue;
	anyDamageCrystal = anyDamageCrystal.or(it.anyDamage());
}

for i, ess in essesnses {
	if(i==0) continue;
	craft.shapeless(ess * 4, "AB", {A: anyDamageCrystal, B: essesnses[i - 1]});
}

# New Crystals entry
mods.rats.recipes.addChefRatRecipe(<ore:quartzMana>.firstItem, <mysticalagriculture:infusion_crystal>);

# [Fertilized Essence] from [Phyto-Gro]*2[+4]
craft.reshapeless(<mysticalagriculture:fertilized_essence>, "rF*ef", {
  "*": anyDamageCrystal, # Inferium Infusion Crystal
  "r": <actuallyadditions:item_fertilizer>, # Fertilizer
  "F": <ic2:crop_res:2>,                    # Fertilizer
  "e": <forestry:fertilizer_compound>,      # Fertilizer
  "f": <thermalfoundation:fertilizer>,      # Phyto-Gro
});

# Better enderpearl recipe
recipes.removeByRecipeName("mysticalagriculture:ender_pearl");
craft.shapeless(<minecraft:ender_pearl> * 6, "AAA", {A: <mysticalagriculture:enderman_essence>});

# Base essence harder to use more magic
recipes.removeByRecipeName("mysticalagriculture:crafting_16");
scripts.process.solution(
	[<ore:shardProsperity>, <ore:powderMana>, <ore:dustAstralStarmetal>],
	[<liquid:brass> * 16],
	[<liquid:base_essence> * 16],
	[0.5, 0.05, 0.05, 3300], "only: highoven"
);

# [Base Essence Ingot] from [Stardust][+3]
scripts.processUtils.avdRockXmlRecipe("ElectricArcFurnace", [
	<ore:ingotBrass> * 3,       # Alchemical Brass Ingot
	<ore:shardProsperity> * 10, # Prosperity Shard
	<ore:powderMana>,           # Mana Powder
	<ore:dustAstralStarmetal>,  # Stardust
], null, [<mysticalagriculture:crafting:32> * 3], null);

# [Base Crafting Seed] Harder to encourage Villager Trades
craft.remake(<mysticalagriculture:crafting:16>, ["pretty",
  "l l l",
  "l s l",
  "l l l"], {
  "l": <ore:shardProsperity>,
  "s": <ore:seed>,
});

# Watering Cans WAAAAY cheaper
val watering_ingrs = {
  "e": <mysticalagriculture:watering_can>,   # Inferium Watering Can
  "p": <mysticalagriculture:watering_can:1>, # Prudentium Watering Can
  "§": <mysticalagriculture:watering_can:2>, # Intermedium Watering Can
  "b": <mysticalagriculture:watering_can:3>, # Superium Watering Can
  "B": <actuallyadditions:item_water_bowl>,  # Bowl of Water
  "I": <ore:essenceInferium>,                # Inferium Essence
  "P": <ore:essencePrudentium>,              # Prudentium Essence
  "n": <ore:essenceIntermedium>,             # Intermedium Essence
  "u": <ore:essenceSuperium>,                # Superium Essence
  "S": <ore:essenceSupremium>,               # Supremium Essence
} as IIngredient[string];

# [Inferium Watering Can] from [Bowl of Water][+1]
craft.remake(<mysticalagriculture:watering_can>, ["pretty",
  "I    ",
  "I B I",
  "  I I"], watering_ingrs
);
craft.reshapeless(<mysticalagriculture:watering_can:1>, "eP", watering_ingrs);
craft.reshapeless(<mysticalagriculture:watering_can:2>, "pn", watering_ingrs);
craft.reshapeless(<mysticalagriculture:watering_can:3>, "§u", watering_ingrs);
craft.reshapeless(<mysticalagriculture:watering_can:4>, "bS", watering_ingrs);

# [Mud Ball]*16 from [Water Essence]*2[+1]
craft.make(<biomesoplenty:mudball> * 16, ["pretty",
  "i T i",
  "T   T",
  "i T i"], {
  "i": <mysticalagriculture:dirt_essence>,  # Dirt Essence
  "T": <mysticalagriculture:water_essence>, # Water Essence
});

# [Wood Pile]*8 from [Wood Essence]
craft.make(<forestry:wood_pile> * 12, ["pretty",
  "T   T",
  "T   T",
  "T   T"], {
  "T": <mysticalagriculture:wood_essence>, # Wood Essence
});

# [Slime Ball]*8 from [Water Essence]*2[+1]
craft.make(<tconstruct:edible:1> * 8, ["pretty",
  "  T  ",
  "T i T",
  "  T  "], {
  "T": <mysticalagriculture:slime_essence>, # Slime Essence
  "i": <mysticalagriculture:water_essence>, # Water Essence
});

# [Slime Ball]*8 from [Obsidian Essence]*2[+1]
craft.make(<tconstruct:edible:2> * 8, ["pretty",
  "  T  ",
  "T i T",
  "  T  "], {
  "T": <mysticalagriculture:slime_essence>,    # Slime Essence
  "i": <mysticalagriculture:obsidian_essence>, # Obsidian Essence
});

# [Coagulated Blood]*8 from [Zombie Essence]*2[+1]
craft.make(<tconstruct:edible:3> * 8, ["pretty",
  "  T  ",
  "T i T",
  "  T  "], {
  "T": <mysticalagriculture:slime_essence>,  # Slime Essence
  "i": <mysticalagriculture:zombie_essence>, # Zombie Essence
});

# [Slime Ball]*8 from [Fire Essence]*2[+1]
craft.make(<tconstruct:edible:4> * 8, ["pretty",
  "  T  ",
  "T i T",
  "  T  "], {
  "T": <mysticalagriculture:slime_essence>, # Slime Essence
  "i": <mysticalagriculture:fire_essence>,  # Fire Essence
});

# [Slime in a Bucket] from [Bucket][+1]
craft.make(<quark:slime_bucket>, ["pretty",
  "  T  ",
  "T ~ T",
  "  T  "], {
  "T": <mysticalagriculture:slime_essence>, # Slime Essence
  "~": <minecraft:bucket>,                  # Bucket
});

# "Purification" or [Prosperity Shard Shard] into pure shards
scripts.category.expire_in_block.set(<tconstruct:shard>.withTag({Material: "ma.prosperity"}),  {"biomesoplenty:blue_fire": <mysticalagriculture:crafting:5>});

function remakeInAltair(oldRecipeName as string, output as IItemStack, gridStr as string[], ingrsMap as IIngredient[string]) as void {
	recipes.removeByRecipeName(oldRecipeName);
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe(craft.uniqueRecipeName(output), output, 200, 800, Grid(gridStr, ingrsMap).shapeless(true));
}

# Remake some essence in other machines rather then in crafting table
remakeInAltair("mysticalagriculture:blockcustomore", <astralsorcery:blockcustomore>, [
	"xxx",
	"x x",
	"xxx"], {x: <mysticalagriculture:rock_crystal_essence>}
);

# Adventure way to obtain Prudentium Essence
scripts.loot.entity_kill_entity.add("minecraft:slime", "betteranimalsplus:feralwolf", <mysticalagriculture:crafting:2>);

val mobChunks = {
	"minecraft:zombie": 6,
	"minecraft:pig": 7,
	"minecraft:chicken": 8,
	"minecraft:cow": 9,
	"minecraft:sheep": 10,
	"minecraft:slime": 11,
	"minecraft:skeleton": 12,
	"minecraft:creeper": 13,
	"minecraft:spider": 14,
	"minecraft:rabbit": 15,
	"minecraft:guardian": 16,
	"minecraft:blaze": 17,
	"minecraft:ghast": 18,
	"minecraft:enderman": 19,
	"minecraft:wither_skeleton": 20,
	"thermalfoundation:blizz": 21,
	"thermalfoundation:blitz": 22,
	"thermalfoundation:basalz": 23,
} as int[string];
for id, meta in mobChunks {
	recipes.addShapeless(<mysticalagriculture:chunk>.definition.makeStack(meta) * 4, [
		<ore:craftingToolForgeHammer>,
		<enderio:item_broken_spawner>.withTag({entityId: id})
	]);
}

// Other spawners
recipes.addShapeless(<mysticalagriculture:chunk:5> * 12, [
	<ore:craftingToolForgeHammer>,
	<enderio:item_broken_spawner>,
]);

# [Withering Soul] from [Black Stained Glass Pane][+1]
craft.make(<mysticalagradditions:stuff:1>, ["pretty",
  "T T T",
  "T G T",
  "T T T"], {
  "T": <mysticalagradditions:nether_star_essence>, # Nether Star Essence
  "G": <ore:paneGlassBlack>, # Black Stained Glass Pane
});

# ---------------------------------
# Furnaces rework
# ---------------------------------
# Now they are silmply compressed
val furnaceByTier = [
	<minecraft:furnace>,
	<mysticalagriculture:inferium_furnace>,
	<mysticalagriculture:prudentium_furnace>,
	<mysticalagriculture:intermedium_furnace>,
	<mysticalagriculture:superium_furnace>,
	<mysticalagriculture:supremium_furnace>,
] as IItemStack[];

for i, item in furnaceByTier {
	if(i==0) continue;
	val prev = furnaceByTier[i - 1];
	recipes.remove(item);
	recipes.addShapeless('4x' ~ craft.uniqueRecipeName(item), item, [prev, prev, prev, prev]);
	recipes.addShapeless('1x' ~ craft.uniqueRecipeName(item), prev * 4, [item]);
}
# ---------------------------------
