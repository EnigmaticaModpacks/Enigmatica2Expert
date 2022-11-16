import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;
import thaumcraft.aspect.CTAspectStack;

#modloaded thaumcraft

# Add durability to scribbing tools
<thaumcraft:scribing_tools>.maxDamage = 600;

# Missed Cluster furnace recipes
furnace.addRecipe(<thaumcraft:quicksilver> * 2, <thaumcraft:cluster:6>);
furnace.addRecipe(<thermalfoundation:material:131> * 2, <thaumcraft:cluster:5>);


# Primordial Pearl alt (for some people who dont want to close rifts)
mods.astralsorcery.Altar.addConstellationAltarRecipe(
  'Primordial Pearl alt', <thaumcraft:primordial_pearl>, 1500, 250, scripts.craft.grid.Grid([
  "TVT"+
  "CSC"+
  "TVT"+
  "EEEE"+
  "♦♦♦♦◊◊◊◊"], {
  "C": <thaumcraft:causality_collapser>,    # Causality Collapser
  "S": <ore:runeSlothB>,                    # Rune of Sloth
  "T": <thaumcraft:taint_log>,              # Taintwood Log
  "E": <contenttweaker:empowered_phosphor>, # Empowered Phosphor
  "V": <thaumcraft:void_seed>,              # Void Seed
  "♦": <ore:gemTopaz>,                      # Topaz
  "◊": <ore:gemTanzanite>,                  # Tanzanite
  }).shapeless()
);


// ---------------------------
// No-exploration recipe
for aspect, ingr in {
  aer     : <minecraft:feather>,
  terra   : <minecraft:mossy_cobblestone>,
  ignis   : <rustic:chili_pepper>,
  aqua    : <harvestcraft:freshwateritem>,
  ordo    : <advancedrocketry:misc:1>,
  perditio: <minecraft:gunpowder>,
} as IItemStack[string] {
  mods.rustic.Condenser.addRecipe(
    <thaumcraft:crystal_essence>.withTag({Aspects: [{key: aspect, amount: 1}]}),
    [<thaumcraft:nugget:9>, ingr], null, null
  );
}


/*
████████╗ █████╗ ██████╗ ██╗     ███████╗
╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔════╝
   ██║   ███████║██████╔╝██║     █████╗
   ██║   ██╔══██║██╔══██╗██║     ██╔══╝
   ██║   ██║  ██║██████╔╝███████╗███████╗
   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝
*/

# [Void Seed] from [Insanium Essence][+4]
craft.remake(<thaumcraft:void_seed> * 4, ["pretty",
  "A I A",
  "© T ©",
  "T E T"], {
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "E": <ore:runeEnvyB>,                   # Rune of Envy
  "©": <contenttweaker:blasted_coal>,     # Blasted Coal
  "I": <ore:essenceInsanium>,             # Insanium Essence
  "T": <thaumcraft:taint_rock>|<thaumcraft:taint_soil>|<thaumcraft:taint_crust>, # Tainted Rock
});

# Amber Block
recipes.removeByRecipeName("thaumcraft:ambertoblock");
recipes.addShapeless("Thaumcraft Amber Block",
<thaumcraft:amber_block>, [
  <ore:gemAmber>,<ore:gemAmber>,<ore:gemAmber>,<ore:gemAmber>,<ore:gemAmber>,
  <ore:gemAmber>,<ore:gemAmber>,<ore:gemAmber>,<ore:gemAmber>
]);

# Amber Gem
recipes.removeByRecipeName("biomesoplenty:amber");
recipes.removeByRecipeName("thaumcraft:amberblocktoamber");
recipes.addShapeless("Amber Gem", <thaumcraft:amber> * 9, [<ore:blockAmber>]);

# Amber Bricks
recipes.remove(<thaumcraft:amber_brick>);
recipes.addShapeless("Thaumcraft Amber Brick",
<thaumcraft:amber_brick> * 4,
[<thaumcraft:amber_block>,<thaumcraft:amber_block>,<thaumcraft:amber_block>,<thaumcraft:amber_block>]);

# Mundane Ring
recipes.remove(<thaumcraft:baubles:1>);
recipes.addShaped(<thaumcraft:baubles:1>,
[[<ore:ingotGold>, <ore:ingotBrass>, <ore:ingotGold>],
[<ore:ingotBrass>, <ore:clusterGold>, <ore:ingotBrass>],
[<ore:ingotGold>, <ore:ingotBrass>, <ore:ingotGold>]]);

# Fancy Ring
recipes.remove(<thaumcraft:baubles:5>);
recipes.addShaped(<thaumcraft:baubles:5>,
[[<ore:ingotGold>, <ore:gemEmerald>, <ore:ingotGold>],
[<ore:ingotGold>, <thaumcraft:baubles:1>, <ore:ingotGold>],
[<ore:ingotGold>, <ore:blockGold>, <ore:ingotGold>]]);

# Fancy Belt
recipes.remove(<thaumcraft:baubles:6>);
recipes.addShaped(<thaumcraft:baubles:6>,
[[<ore:leather>, <ore:leather>, <ore:leather>],
[<ore:leather>, <ore:clusterCopper>, <ore:leather>],
[<ore:gemEmerald>, <thaumcraft:baubles:2>, <ore:gemEmerald>]]);

# Salis Mundus visible recipe (actually not working)
craft.shapeless(<thaumcraft:salis_mundus>, "DEFCAB", {
  A: <ore:itemFlint>.reuse(),
  B: <minecraft:bowl>.reuse(),
  C: <ore:dustRedstone>,
  D: <thaumcraft:crystal_essence>.withDisplayName("§4§lAny Different Vis Crystal").updateTag(utils.shinigTag(0xff0000)),
  E: <thaumcraft:crystal_essence>.withDisplayName("§2§lAny Different Vis Crystal").updateTag(utils.shinigTag(0x00ff00)),
  F: <thaumcraft:crystal_essence>.withDisplayName("§b§lAny Different Vis Crystal").updateTag(utils.shinigTag(0x00ffff)),
  }
);

// ---------------------------
// Remake colored candles
val candleColors = [
  <thaumcraft:candle_white>,
  <thaumcraft:candle_orange>,
  <thaumcraft:candle_magenta>,
  <thaumcraft:candle_lightblue>,
  <thaumcraft:candle_yellow>,
  <thaumcraft:candle_lime>,
  <thaumcraft:candle_pink>,
  <thaumcraft:candle_gray>,
  <thaumcraft:candle_silver>,
  <thaumcraft:candle_cyan>,
  <thaumcraft:candle_purple>,
  <thaumcraft:candle_blue>,
  <thaumcraft:candle_brown>,
  <thaumcraft:candle_green>,
  <thaumcraft:candle_red>,
  <thaumcraft:candle_black>,
] as IItemStack[];
for i, candle in candleColors {
  recipes.remove(candle);

  # [White Tallow Candle]*16 from [String][+1]
  craft.make(candle * 16, [
    "s",
    "M",
    "M"], {
    "s": scripts.category.dye.oreDye[i],
    "M": <thaumcraft:tallow>, # Magic Tallow
  });
}

# [Zombie Brain]*8 from [Zombie Essence]*2
craft.make(<thaumcraft:brain> * 8, ["pretty",
  "T T",
  "T T"], {
  "T": <mysticalagriculture:zombie_essence>, # Zombie Essence
});

/*
██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗  ██╗
██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔════╝████╗  ██║██╔════╝██║  ██║
██║ █╗ ██║██║   ██║██████╔╝█████╔╝ ██████╔╝█████╗  ██╔██╗ ██║██║     ███████║
██║███╗██║██║   ██║██╔══██╗██╔═██╗ ██╔══██╗██╔══╝  ██║╚██╗██║██║     ██╔══██║
╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗██████╔╝███████╗██║ ╚████║╚██████╗██║  ██║
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝
*/

function remakeWorkbench(
  name as string,
  research as string,
  visCost as int,
  aspects as CTAspectStack[],
  output as IItemStack,
  gridMap as string[],
  ingrMap as IIngredient[string]
) as void {
  mods.thaumcraft.ArcaneWorkbench.removeRecipe(output.anyAmount());
  mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
    name, research, visCost, aspects, output, scripts.craft.grid.Grid(gridMap, ingrMap).shaped()
  );
}

# [Grappler Spool] from [Copper Plate][+2]
remakeWorkbench("GrappleGunSpool", "GRAPPLEGUN", 25, [<aspect:aqua>],
  <thaumcraft:grapple_gun_spool>, ["pretty",
  "s T s",
  "s □ s",
  "s s s"], {
  "s": <ore:string>,              # String
  "T": <minecraft:tripwire_hook>, # Tripwire Hook
  "□": <ore:plateCopper>,         # Copper Plate
});

# [Grappler Head] from [Rare Earths][+2]
remakeWorkbench("GrappleGunTip", "GRAPPLEGUN", 25, [<aspect:terra>],
  <thaumcraft:grapple_gun_tip>, ["pretty",
  "‚ T ‚",
  "‚ R ‚",
  "‚ ‚ ‚"], {
  "‚": <ore:nuggetBrass>,         # Alchemical Brass Nugget
  "T": <minecraft:tripwire_hook>, # Tripwire Hook
  "R": <thaumcraft:nugget:10>,    # Rare Earths
});

# [Arcane Grappler] from [Grappler Head][+3]
remakeWorkbench("GrappleGun", "GRAPPLEGUN", 25, [<aspect:ignis>],
  <thaumcraft:grapple_gun>, ["pretty",
  "    r",
  "G ‚ ‚",
  "  # #"], {
  "r": <thaumcraft:grapple_gun_spool>, # Grappler Spool
  "G": <thaumcraft:grapple_gun_tip>,   # Grappler Head
  "‚": <ore:nuggetFakeIron>,           # Iron Alloy Nugget
  "#": <ore:plankWood>,                # Greatwood Planks
});

# Cheaper to help use more
# [Paving Stone of Travel] from [Arcane Stone Brick]
remakeWorkbench("PaveTravel", "PAVINGSTONES", 10,
  [<aspect:terra>],
  <thaumcraft:paving_stone_travel> * 4, ["pretty",
  "A A",
  "A A"], {
  "A": <thaumcraft:stone_arcane_brick>, # Arcane Stone Brick
});

# [Simple Arcane Mechanism] from [Stick][+4]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:mechanism_simple>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "mechanism_simple", # Name
  "BASEARTIFICE", # Research
  10, # Vis cost
  [<aspect:ignis>, <aspect:aqua>],
  <thaumcraft:mechanism_simple>, # Output
  scripts.craft.grid.Grid(["pretty",
  "‚ ‚ ‚",
  "‚ # ‚",
  "‚ ‚ ‚"], {
  "‚": <ore:nuggetBrass>, # Alchemical Brass Nugget
  "#": <ore:stickWood>,   # Stick
}).shaped());

# [Complex Arcane Mechanism] from [Nickel Plate][+5]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:mechanism_complex>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "mechanism_complex", # Name
  "BASEARTIFICE", # Research
  30, # Vis cost
  [<aspect:ignis>, <aspect:aqua>],
  <thaumcraft:mechanism_complex>, # Output
  scripts.craft.grid.Grid(["pretty",
  "  S  ",
  "‚ □ ‚",
  "  S  "], {
  "S": <thaumcraft:mechanism_simple>, # Simple Arcane Mechanism
  "‚": <ore:nuggetThaumium>,          # Thaumium Nugget
  "□": <ore:plateNickel>,             # Nickel Plate
}).shaped());

# [Arcane Pattern Crafter] from [Hopper][+5]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:pattern_crafter>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "patterncrafter", # Name
  "ARCANEPATTERNCRAFTER", # Research
  50, # Vis cost
  [<aspect:terra>, <aspect:aqua>],
  <thaumcraft:pattern_crafter>, # Output
  scripts.craft.grid.Grid(["pretty",
  "  ■  ",
  "S # S"], {
  "■": <ore:hopper>, # Hopper
  "S": <thaumcraft:mechanism_simple>, # Simple Arcane Mechanism
  "#": <thaumcraft:plank_greatwood>,  # Greatwood Planks
}).shaped());

# [Vis Battery]*8 from [Vis Resonator][+8]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:vis_battery>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "VisBattery", # Name
  "VISBATTERY@1", # Research
  150, # Vis cost
  [<aspect:aer>, <aspect:aqua>, <aspect:ordo>, <aspect:perditio>, <aspect:terra>, <aspect:ignis>],
  <thaumcraft:vis_battery> * 8, # Output
  scripts.craft.grid.Grid(["pretty",
  "A A A",
  "A V A",
  "A A A"], {
  "A": <thaumcraft:stone_arcane>,  # Arcane Stone
  "V": <thaumcraft:vis_resonator>, # Vis Resonator
}).shaped());

# [Impetus Generator] from [Vis Generator][+9]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumicaugmentation:impetus_generator>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "impetus_generator", # Name
  "IMPETUS_GENERATOR", # Research
  700, # Vis cost
  [<aspect:ignis> * 2, <aspect:ordo> * 2, <aspect:perditio> * 2, <aspect:aer> * 2],
  <thaumicaugmentation:impetus_generator>, # Output
  scripts.craft.grid.Grid(["pretty",
  "E P E",
  "R V R",
  "E I E"], {
  "E": <thaumcraft:stone_eldritch_tile>,          # Eldritch Stone
  "P": <thaumcraft:primordial_pearl>.anyDamage(), # Primordial Pearl
  "R": <thaumcraft:nugget:10>,                    # Rare Earths
  "V": <ore:craftingPiston>,                      # Piston
  "I": <thaumicaugmentation:material:5>,          # Impetus Jewel
}).shaped());

/*
 █████╗ ███████╗██████╗ ███████╗ ██████╗████████╗███████╗
██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔════╝
███████║███████╗██████╔╝█████╗  ██║        ██║   ███████╗
██╔══██║╚════██║██╔═══╝ ██╔══╝  ██║        ██║   ╚════██║
██║  ██║███████║██║     ███████╗╚██████╗   ██║   ███████║
╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝
*/

# Removing wrong aspects from stuff
<conarm:armor_trim:*>.setAspects(<aspect:terra>);
<harvestcraft:freshwateritem>.removeAspects(<aspect:metallum>);

# Override aspects
<rats:rat_diamond>                             .setAspects(<aspect:desiderium>*4  ,<aspect:vitreus>*4      , <aspect:rattus>*4);
<enderio:block_enderman_skull>                 .setAspects(<aspect:mortuus>*40    ,<aspect:alienis>*50     ,<aspect:tenebrae>*60);
<ic2:dust:5>                                   .setAspects(<aspect:desiderium>*20 ,<aspect:vitreus>*15);
<additionalcompression:gemdiamond_compressed:1>.setAspects(<aspect:desiderium>*500,<aspect:vitreus>*500);
<additionalcompression:gemdiamond_compressed:2>.setAspects(<aspect:desiderium>*500,<aspect:vitreus>*500    ,<aspect:caeles>*100);
<mekanism:compresseddiamond>                   .setAspects(<aspect:desiderium>*20 ,<aspect:vitreus>*20);
<avaritia:resource>                            .setAspects(<aspect:desiderium>*250,<aspect:vitreus>*250);
<thermalfoundation:material:26>                .setAspects(<aspect:desiderium>*50 ,<aspect:machina>*40);
<actuallyadditions:item_crystal:2>             .setAspects(<aspect:desiderium>*20 ,<aspect:vitreus>*20     , <aspect:potentia>*80);
<actuallyadditions:block_crystal:2>            .setAspects(<aspect:desiderium>*140,<aspect:vitreus>*140    , <aspect:potentia>*80);
<actuallyadditions:item_crystal_empowered:2>   .setAspects(<aspect:desiderium>*60 ,<aspect:vitreus>*60     , <aspect:potentia>*150);
<actuallyadditions:block_crystal_empowered:2>  .setAspects(<aspect:desiderium>*400,<aspect:vitreus>*400    , <aspect:potentia>*400);
<forestry:candle>                              .setAspects(<aspect:lux>*20        , <aspect:herba>*5       , <aspect:aer>*5);
<forestry:stump>                               .setAspects(<aspect:lux>*20        , <aspect:herba>*5       , <aspect:aer>*5);
<forestry:beeswax>                             .setAspects(<aspect:lux>*5         , <aspect:aer>*2);
<extrautils2:compressedcobblestone:0>          .setAspects(<aspect:terra>*45      , <aspect:perditio>*9);
<extrautils2:compressedcobblestone:1>          .setAspects(<aspect:terra>*405     , <aspect:perditio>*81);
<extrautils2:compressedcobblestone:2>          .setAspects(<aspect:terra>*500     , <aspect:perditio>*500);
<biomesoplenty:hard_ice>                       .setAspects(<aspect:gelum>*21);
<appliedenergistics2:sky_stone_block>          .setAspects(<aspect:alienis>*2     , <aspect:tenebrae>*7);


/*
██╗███╗   ██╗███████╗███████╗██████╗ ███╗   ██╗ █████╗ ██╗
██║████╗  ██║██╔════╝██╔════╝██╔══██╗████╗  ██║██╔══██╗██║
██║██╔██╗ ██║█████╗  █████╗  ██████╔╝██╔██╗ ██║███████║██║
██║██║╚██╗██║██╔══╝  ██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║
██║██║ ╚████║██║     ███████╗██║  ██║██║ ╚████║██║  ██║███████╗
╚═╝╚═╝  ╚═══╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
*/


# Unification for the Smelting Bonus
// IIngredient input, IItemStack stack
function swapBonus(input as IIngredient, wrong as IItemStack, right as WeightedItemStack) as void {
  mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(input, wrong);
  mods.thaumcraft.SmeltingBonus.addSmeltingBonus(input, right);
}

for i, oreBase in "Copper Tin Silver Lead".split(' ') {
  val wrong = <thaumcraft:nugget>.definition.makeStack(i+1);
  val nugget = oreDict["nugget"~oreBase].firstItem;
  swapBonus(oreDict["ore"~oreBase], wrong, nugget % 33);
  swapBonus(<thaumcraft:cluster>.definition.makeStack(i+2), wrong, nugget * 2 % 33);
  swapBonus(<thaumicwonders:eldritch_cluster>.definition.makeStack(i+2), wrong, nugget * 4 % 33);
}



/*
██╗███╗   ██╗███████╗██╗   ██╗███████╗██╗ ██████╗ ███╗   ██╗
██║████╗  ██║██╔════╝██║   ██║██╔════╝██║██╔═══██╗████╗  ██║
██║██╔██╗ ██║█████╗  ██║   ██║███████╗██║██║   ██║██╔██╗ ██║
██║██║╚██╗██║██╔══╝  ██║   ██║╚════██║██║██║   ██║██║╚██╗██║
██║██║ ╚████║██║     ╚██████╔╝███████║██║╚██████╔╝██║ ╚████║
╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
*/

# Shapeless Totem of Undying
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:charm_undying>);
recipes.addShapeless('Totem conversion', <thaumcraft:charm_undying>, [<minecraft:totem_of_undying>]);

# Crimson Rites
mods.thaumcraft.Infusion.registerRecipe("crimson_rites", "INFUSION",
<thaumcraft:curio:6>, 15,
[<aspect:vitium> * 30, <aspect:mortuus> * 15, <aspect:praecantatio> * 30, <aspect:auram> * 10],
<thaumcraft:thaumonomicon>,
[<thaumcraft:ingot>, <thaumictinkerer:energetic_nitor>, <thaumcraft:salis_mundus>, <thaumictinkerer:energetic_nitor>, <thaumcraft:salis_mundus>, <thaumictinkerer:energetic_nitor>, <thaumcraft:ingot>, <thaumictinkerer:energetic_nitor>]);

# [Spawn Lesser Crimson Portal] from [Golden Egg][+3]
mods.thaumcraft.Infusion.registerRecipe("spawn_lesser_crimson_portal", "INFUSION",
<minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumcraft:cultistportallesser"}}), 15,
[<aspect:vitium> * 90, <aspect:mortuus> * 45, <aspect:praecantatio> * 90, <aspect:auram> * 30],
<randomthings:ingredient:11>,      # Golden Egg
scripts.craft.grid.Grid(["-K-T-K-T"], {
  "-": <thaumictinkerer:energetic_nitor>, # Energetic Nitor
  "K": <extrautils2:klein>,               # Klein Bottle
  "T": <thaumcraft:taint_log>,            # Taintwood Log
}).shapeless());

# [Blank Greater Focus] from [Blank Advanced Focus][+5]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:focus_3>);
mods.thaumcraft.Infusion.registerRecipe(
  "focus_3", # Name
  "INFUSION", # Research
  <thaumcraft:focus_3>, # Output
  1, # Instability
  [<aspect:vacuos> * 100, <aspect:praecantatio> * 20],
  <thaumcraft:focus_2>, # CentralItem
  scripts.craft.grid.Grid(["pretty",
  "  ˛  ",
  "q   q",
  "  ‚  "], {
  "˛": <ore:nuggetNetherStar>, # Nether Star Nugget
  "q": <ore:quicksilver>,      # Quicksilver
  "‚": <ore:nuggetVoid>,       # Void Metal Nugget
}).spiral(1));

# [Control Seal_ Block Breaker] from [Blank Seal][+3]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:seal:12>);
mods.thaumcraft.Infusion.registerRecipe(
  "SealBreak", # Name
  "SEALBREAK", # Research
  <thaumcraft:seal:12>, # Output
  1, # Instability
  [<aspect:perditio> * 10],
  <thaumcraft:seal>, # Central Item
  scripts.craft.grid.Grid(["oG"], {
  "o": <minecraft:golden_pickaxe>.anyDamage(), # Golden Pickaxe
  "G": <minecraft:golden_shovel>.anyDamage(),  # Golden Shovel
}).spiral(1));

# [Biothaumic Mind] from [Clockwork Mind][+2]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:mind:1>);
mods.thaumcraft.Infusion.registerRecipe(
  "MindBiothaumic", # Name
  "MINDBIOTHAUMIC", # Research
  <thaumcraft:mind:1>, # Output
  1, # Instability
  [<aspect:cognitio> * 10],
  <thaumcraft:mind>, # Central Item
  scripts.craft.grid.Grid(["ZZ"], {
  "Z": <thaumcraft:brain>, # Zombie Brain
}).spiral(1));

# [Causality Collapser]*4 from [TNT][+4]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:causality_collapser>);
mods.thaumcraft.Infusion.registerRecipe(
  "CausalityCollapser", # Name
  "RIFTCLOSER", # Research
  <thaumcraft:causality_collapser>, # Output
  2, # Instability
  [<aspect:alienis> * 20, <aspect:vitium> * 20],
  <thaumictinkerer:energetic_nitor>, # Central Item
  scripts.craft.grid.Grid(["pretty",
  "  ▲  ",
  "D   D",
  "  ▲  "], {
  "▲": <ore:dustBedrock>,         # Grains of Infinity
  "D": <cyclicmagic:ender_tnt_1>, # Dynamite I
}).spiral(1));

# --------------------------------------------
# Remake items that output more than 1

mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:shimmerleaf_seed>);
mods.thaumcraft.Crucible.registerRecipe(
  "shimmerleaf_seed", # Name
  "TWOND_MYSTIC_GARDENING@1", # Research
  <thaumicwonders:shimmerleaf_seed> * 8, # Output
  <rustic:tomato_seeds>, # Input
  [<aspect:auram> * 60]
);

mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:cinderpearl_seed>);
mods.thaumcraft.Crucible.registerRecipe(
  "cinderpearl_seed", # Name
  "TWOND_MYSTIC_GARDENING@1", # Research
  <thaumicwonders:cinderpearl_seed> * 8, # Output
  <rustic:chili_pepper_seeds>, # Input
  [<aspect:ignis> * 60]
);

mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:vishroom_spore>);
mods.thaumcraft.Crucible.registerRecipe(
  "vishroom_spore", # Name
  "TWOND_MYSTIC_GARDENING@1", # Research
  <thaumicwonders:vishroom_spore> * 8, # Output
  <rustic:apple_seeds>, # Input
  [<aspect:praecantatio> * 60]
);

/*
 ██████╗██████╗ ██╗   ██╗ ██████╗██╗██████╗ ██╗     ███████╗
██╔════╝██╔══██╗██║   ██║██╔════╝██║██╔══██╗██║     ██╔════╝
██║     ██████╔╝██║   ██║██║     ██║██████╔╝██║     █████╗  
██║     ██╔══██╗██║   ██║██║     ██║██╔══██╗██║     ██╔══╝  
╚██████╗██║  ██║╚██████╔╝╚██████╗██║██████╔╝███████╗███████╗
 ╚═════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝╚═════╝ ╚══════╝╚══════╝
*/

scripts.jei.crafting_hints.addInsOutCatl([<minecraft:cauldron>, <thaumcraft:salis_mundus>], <thaumcraft:crucible>);
scripts.jei.crafting_hints.addInsOutCatl([<ore:bookshelf>, <thaumcraft:salis_mundus>], <thaumcraft:thaumonomicon>);
scripts.jei.crafting_hints.addInsOutCatl([<ore:workbench>, <thaumcraft:salis_mundus>], <thaumcraft:arcane_workbench>);

function remakeCrucible(name as string, research as string, output as IItemStack, input as IIngredient, aspects as CTAspectStack[]) as void {
  mods.thaumcraft.Crucible.removeRecipe(output.anyAmount());
  mods.thaumcraft.Crucible.registerRecipe(name, research, output, input, aspects);
}

mods.thaumcraft.Crucible.registerRecipe("Quartz ore fix", "METALPURIFICATION", <thaumcraft:cluster:7>, <ore:oreQuartz>, [<aspect:metallum>*5, <aspect:ordo>*5]);

# Tallow harder
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:tallow>);
mods.thaumcraft.Crucible.registerRecipe("hedge_tallow"       , "HEDGEALCHEMY@1", <thaumcraft:tallow>,   <minecraft:rotten_flesh>, [<aspect:ignis>]);
mods.thaumcraft.Crucible.registerRecipe("Tallow from tallow" , "HEDGEALCHEMY@1", <thaumcraft:tallow>*2, <quark:tallow>, [<aspect:ignis>*2]);
mods.thaumcraft.Crucible.registerRecipe("Tallow from blubber", "HEDGEALCHEMY@1", <thaumcraft:tallow>*8, utils.tryCatch('betteranimalsplus:blubber', <animania:raw_prime_pork>), [<aspect:ignis>*4]);

function soulRecipe(entityId as string, aspects as CTAspectStack[]) as void {
  mods.thaumcraft.Crucible.registerRecipe(
    entityId, "HEDGEALCHEMY",
    <enderio:item_soul_vial:1>.withTag({entityId: entityId}),
    <enderio:item_soul_vial>,
    aspects
  );
}

soulRecipe("minecraft:zombie"             , [<aspect:exanimis> * 200, <aspect:perditio>     * 200]);
soulRecipe("minecraft:skeleton"           , [<aspect:exanimis> * 200, <aspect:ordo>         * 200]);
soulRecipe("minecraft:husk"               , [<aspect:exanimis> * 500, <aspect:spiritus>     * 500]);
soulRecipe("minecraft:giant"              , [<aspect:exanimis> * 500, <aspect:praemunio>    * 500]);
soulRecipe("minecraft:wither_skeleton"    , [<aspect:exanimis> * 500, <aspect:tenebrae>     * 500]);
soulRecipe("minecraft:skeleton_horse"     , [<aspect:exanimis> * 500, <aspect:mortuus>      * 500]);
soulRecipe("minecraft:zombie_horse"       , [<aspect:exanimis> * 500, <aspect:herba>        * 500]);
soulRecipe("minecraft:ghast"              , [<aspect:exanimis> * 500, <aspect:cognitio>     * 500]);
soulRecipe("minecraft:zombie_pigman"      , [<aspect:exanimis> * 500, <aspect:metallum>     * 500]);
soulRecipe("minecraft:stray"              , [<aspect:exanimis> * 500, <aspect:volatus>      * 500]);
soulRecipe("minecraft:creeper"            , [<aspect:exanimis> * 500, <aspect:ignis>        * 500]);
soulRecipe("minecraft:spider"             , [<aspect:exanimis> * 500, <aspect:sensus>       * 500]);
soulRecipe("minecraft:cave_spider"        , [<aspect:exanimis> * 500, <aspect:alkimia>      * 500]);
soulRecipe("minecraft:slime"              , [<aspect:exanimis> * 500, <aspect:vinculum>     * 500]);
soulRecipe("minecraft:endermite"          , [<aspect:exanimis> * 500, <aspect:ventus>       * 500]);
soulRecipe("minecraft:silverfish"         , [<aspect:exanimis> * 500, <aspect:motus>        * 500]);
soulRecipe("minecraft:magma_cube"         , [<aspect:exanimis> * 500, <aspect:lux>          * 500]);
soulRecipe("minecraft:witch"              , [<aspect:exanimis> * 500, <aspect:praecantatio> * 500]);
soulRecipe("minecraft:blaze"              , [<aspect:exanimis> * 500, <aspect:sonus>        * 500]);
soulRecipe("minecraft:shulker"            , [<aspect:exanimis> * 500, <aspect:machina>      * 500]);
soulRecipe("minecraft:guardian"           , [<aspect:exanimis> * 500, <aspect:mythus>       * 500]);
soulRecipe("minecraft:enderman"           , [<aspect:exanimis> * 500, <aspect:alienis>      * 500]);

soulRecipe("minecraft:horse"              , [<aspect:bestia> * 100, <aspect:machina>  * 100]);
soulRecipe("minecraft:donkey"             , [<aspect:bestia> * 100, <aspect:metallum> * 100]);
soulRecipe("minecraft:mule"               , [<aspect:bestia> * 100, <aspect:perditio> * 100]);
soulRecipe("minecraft:pig"                , [<aspect:bestia> * 100, <aspect:vacuos>   * 100]);
soulRecipe("minecraft:sheep"              , [<aspect:bestia> * 100, <aspect:ordo>     * 100]);
soulRecipe("minecraft:cow"                , [<aspect:bestia> * 100, <aspect:herba>    * 100]);
soulRecipe("minecraft:mooshroom"          , [<aspect:bestia> * 100, <aspect:cognitio> * 100]);
soulRecipe("minecraft:snowman"            , [<aspect:bestia> * 100, <aspect:alienis>  * 100]);
soulRecipe("minecraft:ocelot"             , [<aspect:bestia> * 100, <aspect:victus>   * 100]);
soulRecipe("minecraft:chicken"            , [<aspect:bestia> * 100, <aspect:lux>      * 100]);
soulRecipe("minecraft:squid"              , [<aspect:bestia> * 100, <aspect:aqua>     * 100]);
soulRecipe("minecraft:wolf"               , [<aspect:bestia> * 100, <aspect:aversio>  * 100]);
soulRecipe("minecraft:bat"                , [<aspect:bestia> * 100, <aspect:sensus>   * 100]);
soulRecipe("minecraft:rabbit"             , [<aspect:bestia> * 100, <aspect:fluctus>  * 100]);
soulRecipe("minecraft:polar_bear"         , [<aspect:bestia> * 100, <aspect:gelum>    * 100]);
soulRecipe("minecraft:llama"              , [<aspect:bestia> * 100, <aspect:fabrico>  * 100]);
soulRecipe("minecraft:parrot"             , [<aspect:bestia> * 100, <aspect:volatus>  * 100]);

soulRecipe("thermalfoundation:blizz"     , [<aspect:caeles> * 100, <aspect:gelum>      * 100]);
soulRecipe("tconstruct:blueslime"        , [<aspect:caeles> * 100, <aspect:alkimia>    * 100]);
soulRecipe("twilightforest:kobold"       , [<aspect:caeles> * 100, <aspect:praemunio>  * 100]);
soulRecipe("twilightforest:swarm_spider" , [<aspect:caeles> * 100, <aspect:tenebrae>   * 100]);
soulRecipe("twilightforest:penguin"      , [<aspect:caeles> * 100, <aspect:sensus>     * 100]);
soulRecipe("twilightforest:minotaur"     , [<aspect:caeles> * 100, <aspect:mythus>     * 100]);

soulRecipe("minecraft:villager"           , [<aspect:humanus> * 500, <aspect:rattus> * 500, <aspect:imperium> * 500]);
soulRecipe("minecraft:villager_golem"     , [<aspect:humanus> * 500, <aspect:rattus> * 500, <aspect:caeles> * 500]);
soulRecipe("minecraft:evocation_illager"  , [<aspect:humanus> * 500, <aspect:rattus> * 500, <aspect:exanimis> * 500]);
soulRecipe("minecraft:vindication_illager", [<aspect:humanus> * 500, <aspect:rattus> * 500, <aspect:visum> * 500]);
soulRecipe("minecraft:illusion_illager"   , [<aspect:humanus> * 500, <aspect:rattus> * 500, <aspect:victus> * 500]);

soulRecipe("minecraft:vex"                , [<aspect:alienis> * 500, <aspect:draco> * 500, <aspect:visum> * 500]);


# Cheaper stuff
remakeCrucible("nitor"          ,  "BASEALCHEMY", <thaumcraft:nitor_yellow> * 10, <minecraft:glowstone_dust>, [<aspect:potentia> * 10, <aspect:ignis> * 10, <aspect:lux> * 10]);
// remakeCrucible("hedge_dye"      , "HEDGEALCHEMY@2", <minecraft:dye> * 2, <minecraft:dye>, [<aspect:sensus>]);
// remakeCrucible("hedge_slime"    , "HEDGEALCHEMY@2", <minecraft:slime_ball> * 2, <minecraft:slime_ball>, [<aspect:victus>]);
// remakeCrucible("hedge_glowstone", "HEDGEALCHEMY@2", <minecraft:glowstone_dust> * 2, <minecraft:glowstone_dust>, [<aspect:lux>*2, <aspect:sensus>]);
// remakeCrucible("hedge_gunpowder", "HEDGEALCHEMY@2", <minecraft:gunpowder> * 2, <minecraft:gunpowder>, [<aspect:exitium>*5]);
remakeCrucible("hedge_leather"  , "HEDGEALCHEMY@2", <minecraft:leather>, <minecraft:rotten_flesh>, [<aspect:bestia>*2]);

# TODO: Remove this temporary recipe when resolved: https://github.com/LoliKingdom/Thaumic-Speedup/issues/3
remakeCrucible("hedge_web"      , "HEDGEALCHEMY@3", <minecraft:web>, <minecraft:string>, [<aspect:vinculum>*2]);
remakeCrucible("hedge_string"   , "HEDGEALCHEMY@3", <minecraft:string>, <minecraft:wheat>, [<aspect:bestia>*2]);

# Cheaper Focus
remakeCrucible("focus_1", "UNLOCKAUROMANCY", <thaumcraft:focus_1>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}), [<aspect:auram>*15]);

# Cheaper metals
remakeCrucible("brassingot"   , "METALLURGY@1", <thaumcraft:ingot:2> * 2, <ore:ingotAlubrass>, [<aspect:instrumentum> * 5]);
remakeCrucible("thaumiumingot", "METALLURGY@2", <thaumcraft:ingot>, <ore:ingotLead>, [<aspect:praecantatio>*5, <aspect:terra>*5]);

# [Ash Block] from [Compressed Dust][+1]
remakeCrucible("ash_block", "HEDGEALCHEMY@3", <biomesoplenty:ash_block> * 9, <ore:compressed1xDust>, [<aspect:infernum>]);

# Cheaper to less microcraftings
# [Sanitizing Soap] from [Phial of Cognitio Essentia]*6[+2]
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:sanity_soap>);
mods.thaumcraft.Crucible.registerRecipe(
  "SaneSoap", # Name
  "SANESOAP", # Research
  <thaumcraft:sanity_soap>, # Output
  <ore:blockFlesh>, # Input
  [<aspect:cognitio> * 60, <aspect:victus> * 60]
);

# Skyblock alt
mods.thaumcraft.SalisMundus.addSingleConversion(<ore:plankWood>, <thaumcraft:plank_silverwood>);
mods.thaumcraft.SalisMundus.addSingleConversion(<ore:logWood>, <thaumcraft:log_greatwood>);
scripts.jei.crafting_hints.addInsOutCatl([<ore:plankWood>, <thaumcraft:salis_mundus>], <thaumcraft:plank_silverwood>);
scripts.jei.crafting_hints.addInsOutCatl([<ore:logWood>, <thaumcraft:salis_mundus>], <thaumcraft:log_greatwood>);

<entity:thaumcraft:firebat>.addDrop(<randomthings:flootoken>, 1, 3);
<entity:thaumcraft:thaumslime>.addPlayerOnlyDrop(<thermalexpansion:florb>.withTag({Fluid: "liquiddna"}) % 30, 1, 1);
