import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;
import thaumcraft.aspect.CTAspectStack;
import crafttweaker.data.IData;

#modloaded thaumcraft

# Add durability to scribbing tools
<thaumcraft:scribing_tools>.maxDamage = 600;

# Missed Cluster furnace recipes
furnace.addRecipe(<thaumcraft:quicksilver> * 2, <thaumcraft:cluster:6>);
furnace.addRecipe(<thermalfoundation:material:131> * 2, <thaumcraft:cluster:5>);


# Primordial Pearl alt (for some people who dont want to close rifts)
mods.astralsorcery.Altar.addConstellationAltarRecipe(
  'Primordial Pearl alt', <thaumcraft:primordial_pearl>, 1500, 250, Grid([
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

function getAnyVisCrystal(key as string = '8', col as int = 0x333333) as IItemStack {
  return <thaumcraft:crystal_essence>.withTag(
    utils.shinigTag(col) + {
      Aspects: [{key: 'ordo', amount: 1}],
      display: {Name: "§"~key~"§lAny Different Vis Crystal"}
    } as IData,
  false);
}

function getAnyVisSalt(key as string = '8', col as int = 0x333333) as IItemStack {
  return <thaumadditions:salt_essence>.withTag(
    utils.shinigTag(col) + {
      Aspects: [{key: 'ordo', amount: 1}],
      display: {Name: "§"~key~"§lAny Vis Salt"}
    } as IData,
  false);
}

/*
████████╗ █████╗ ██████╗ ██╗     ███████╗
╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔════╝
   ██║   ███████║██████╔╝██║     █████╗
   ██║   ██╔══██║██╔══██╗██║     ██╔══╝
   ██║   ██║  ██║██████╔╝███████╗███████╗
   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝
*/

# [Arcane Stone]*9 from [Ordo Vis Crystal][+1]
recipes.removeByRecipeName("thaumcraft:stonearcane");
craft.shapeless(<thaumcraft:stone_arcane> * 9, "ssss*ssss", {
  "s": <ore:stone>, # Stone
  "*": getAnyVisCrystal(),
});

# [Arcane Stone]*36 from [Single Compressed Stone][+1]
craft.make(<thaumcraft:stone_arcane> * 36, ["pretty",
  "* ■ *",
  "■   ■",
  "* ■ *"], {
  "*": getAnyVisCrystal(),
  "■": <ore:compressedStone1x>, # Single Compressed Stone
});

# [Arcane Stone]*64 from [Double Compressed Stone][+1]
craft.make(<thaumcraft:stone_arcane> * 64, ["pretty",
  "*   *",
  "* S *",
  "* * *"], {
  "*": getAnyVisCrystal(),
  "S": <ore:compressedStone2x>, # Double Compressed Stone
});


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
  D: getAnyVisCrystal('4', 0xff0000),
  E: getAnyVisCrystal('2', 0x00ff00),
  F: getAnyVisCrystal('b', 0x00ffff),
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
    "s": scripts.vars.oreDye[i],
    "M": <thaumcraft:tallow>, # Magic Tallow
  });
}

# [Zombie Brain]*8 from [Zombie Essence]*2
craft.make(<thaumcraft:brain> * 8, ["pretty",
  "T T",
  "T T"], {
  "T": <mysticalagriculture:zombie_essence>, # Zombie Essence
});

# [Thaumonomicon Lectern] from [Lectern][+2]
craft.remake(<thaumadditions:thaumic_lectern>, ["pretty",
  "  T  ",
  "# L #",
  "# # #"], {
  "T": <thaumcraft:thaumonomicon>,  # Thaumonomicon
  "#": <thaumcraft:slab_greatwood>, # Greatwood Slab
  "L": <iceandfire:lectern>,        # Lectern
});

# Bath salt recipe (this one works)
val VS = getAnyVisSalt();
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:bath_salts>);
recipes.addShapeless("bathsalts",<thaumcraft:bath_salts> * 8,
[VS,VS,VS,
VS,<thaumcraft:salis_mundus>,VS,
VS,VS,VS]);

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
    name, research, visCost, aspects, output, Grid(gridMap, ingrMap).shaped()
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
  Grid(["pretty",
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
  Grid(["pretty",
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
  Grid(["pretty",
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
  Grid(["pretty",
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
  Grid(["pretty",
  "E P E",
  "R V R",
  "E I E"], {
  "E": <thaumcraft:stone_eldritch_tile>,          # Eldritch Stone
  "P": <thaumcraft:primordial_pearl>.anyDamage(), # Primordial Pearl
  "R": <thaumcraft:nugget:10>,                    # Rare Earths
  "V": <ore:craftingPiston>,                      # Piston
  "I": <thaumicaugmentation:material:5>,          # Impetus Jewel
}).shaped());

# [Thaumometer]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:thaumometer");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("thaumometer", 
"FIRSTSTEPS@2", 
20,
[<aspect:aer>,<aspect:ignis>,<aspect:aqua>,<aspect:terra>,<aspect:ordo>,<aspect:perditio>], 
<thaumcraft:thaumometer>, 
  Grid(["pretty",
  "  C  ",
  "C P C",
  "  C  "], {
  "C": <ore:ingotCopper>, #Copper ingot
  "P": <ore:paneGlass>, #Glass pane
}).shaped());

# [Thaumometer]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:thaumometer");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("thaumometer", 
"FIRSTSTEPS@2", 
20,
[<aspect:aer>,<aspect:ignis>,<aspect:aqua>,<aspect:terra>,<aspect:ordo>,<aspect:perditio>], 
<thaumcraft:thaumometer>, 
  Grid(["pretty",
  "  C  ",
  "C P C",
  "  C  "], {
  "C": <ore:ingotCopper>, #Copper ingot
  "P": <ore:paneGlass>, #Glass pane
}).shaped());

# [Vis resonator]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:vis_resonator");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("vis_resonator", 
"UNLOCKAUROMANCY@1", 
20,
[<aspect:aer>,<aspect:terra>], 
<thaumcraft:vis_resonator>, 
  Grid(["pretty",
  "A A A",
  "A C A",
  "A A A"], {
  "C": <ore:crystalCertus>, #Copper ingot
  "A": <ore:nuggetAluminium>, #Glass pane
}).shaped());

# [Essentia tubes]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:tube");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("tube", 
"TUBES@2", 
10,
[], 
<thaumcraft:tube> * 16, 
  Grid(["pretty",
  "Q Q Q",
  "S S S",
  "Q Q Q"], {
  "S": <ore:nuggetQuicksilver>, #Quick silver nugget
  "Q": <ore:nuggetQuartzBlack>, #Black quartz nugget
}).shaped());

# [glass tube] recipe use normal tubes
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumicaugmentation:glass_tube");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("glass_tube", 
"GLASS_TUBE", 
5,
[], 
<thaumicaugmentation:glass_tube>*8, 
  Grid(["pretty",
  "T T T",
  "T G T",
  "T T T"], {
  "T": <thaumcraft:tube>, #
  "G": <ore:blockGlass>, #
}).shaped());

#and reverse crafting recipe for [glass tube]
recipes.addShapeless("glass_tube_reverse",<thaumcraft:tube>,[<thaumicaugmentation:glass_tube>]);

# [Essentia filter]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:filter");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("filter", 
"BASEALCHEMY", 
15,
[<aspect:aqua>], 
<thaumcraft:filter>*2, 
  Grid(["pretty",
  "C S C"], {
  "C": <ore:ingotCopper>, #Copper ingot
  "S": <thaumcraft:plank_silverwood>, #Silver wood plank
}).shaped());

# [Alchemical construct]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:alchemicalconstruct");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("alchemicalconstruct", 
"TUBES", 
50,
[<aspect:aer>*2,<aspect:ignis>*2,<aspect:aqua>*2,<aspect:terra>*2,<aspect:ordo>*2,<aspect:perditio>*2], 
<thaumcraft:metal_alchemical>*2, 
  Grid(["pretty",
  "G T G",
  "T F T",
  "G T G"], {
  "G": <thaumcraft:plank_greatwood>, #Greatwood plank
  "T": <thaumcraft:tube>, #Essentia tube
  "F": <thaumcraft:filter>, #Essentia filter
}).shaped());

# [Void smeltery] recipe require now thaumium smelter 
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:essentiasmeltervoid");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("essentiasmeltervoid", 
"ESSENTIASMELTERVOID", 
750,
[<aspect:ignis>*3], 
<thaumcraft:smelter_void>, 
  Grid(["pretty",
  "B S B",
  "V A V",
  "V V V"], {
  "V": <ore:plateVoid>, #Void plate
  "A": <thaumcraft:metal_alchemical_advanced>, #Advanced alchemical construct
  "B": <ore:plateBrass>, #Brass plate
  "S": <thaumcraft:smelter_thaumium>, #Thaumium smelter
}).shaped());

# [Redstone inlay]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:redstoneinlay");
mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe("redstoneinlay", 
"INFUSIONSTABLE", 
25,
[<aspect:aqua>], 
<thaumcraft:inlay>*8, 
Grid(["CR"], {
  "C": <ore:ingotCopper>, #Copper ingot
  "R": <ore:dustRedstone>, #Redstone dust
}).shapeless());

# [Flux condenser] cheaper clearing machine
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:condenser");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("condenser", 
"FLUXCLEANUP", 
100,
[<aspect:ignis>*3], 
<thaumcraft:condenser>, 
  Grid(["pretty",
  "G F G",
  "B M B",
  "G T G"], {
  "G": <thaumcraft:plank_greatwood>, #Greatwood plank
  "F": <thaumcraft:filter>, #Essentia filter
  "M": <thaumcraft:mechanism_simple>, #Simple mechanism
  "T": <thaumcraft:tube>, #Essentia Tube
  "B": <thaumcraft:ingot:2>, #Brass ingot
}).shaped());

# [Condenser Lattice] cheaper flux condenser component
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:condenserlattice");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("condenserlattice", 
"FLUXCLEANUP", 
25,
[<aspect:aer>,<aspect:terra>], 
<thaumcraft:condenser_lattice>*8, 
  Grid(["pretty",
  "S Q S",
  "S F S",
  "S Q S"], {
  "S": <thaumcraft:plank_silverwood>, #Silverwood plank
  "Q": <ore:nuggetQuicksilver>, #Quicksilver nugget
  "F": <thaumcraft:filter>, #Essentia filter
}).shaped());

# [Arcane Bellows]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:bellows");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("bellows", 
"BELLOWS", 
25,
[<aspect:aer>,<aspect:terra>], 
<thaumcraft:bellows>, 
  Grid(["pretty",
  "W W  ",
  "L L A",
  "W W  "], {
  "L": <minecraft:leather>, #Leather
  "W": <ore:plankWood>, #Any plank
  "A": <ore:ingotAluminum>, #Aluminum ingot
}).shaped());

# [Auxiliary Venting Port]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:smeltervent");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("smeltervent", 
"IMPROVEDSMELTING2", 
150,
[<aspect:aer>], 
<thaumcraft:smelter_vent>, 
  Grid(["pretty",
  "B F B",
  "P A P",
  "B T B"], {
  "B": <ore:gemQuartzBlack>, #Black quartz
  "F": <thaumcraft:filter>, #Essentia filter
  "A": <thaumcraft:metal_alchemical>, #Alchemical construct
  "T": <thaumcraft:tube>, #Essentia tube
  "P": <ore:plateBrass>, #Brass plate
}).shaped());

# [Auxiliary Slurry Pump]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:smelteraux");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("smelteraux", 
"IMPROVEDSMELTING", 
100,
[<aspect:aer>,<aspect:terra>], 
<thaumcraft:smelter_aux>, 
  Grid(["pretty",
  "B T B",
  "P A P",
  "B F B"], {
  "B": <ore:gemQuartzBlack>, #Black quartz
  "F": <thaumcraft:bellows>, #Arcane bellows
  "A": <thaumcraft:metal_alchemical>, #Alchemical construct
  "T": <thaumcraft:tube>, #Essentia tube
  "P": <ore:plateBrass>, #Brass plate
}).shaped());

# [Emptying Essentia Transfuser]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:essentiatransportout");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("essentiatransportout", 
"ESSENTIATRANSPORT", 
100,
[<aspect:aer>,<aspect:aqua>], 
<thaumcraft:essentia_output>, 
  Grid(["pretty",
  "B H B",
  "Q A Q"], {
  "B": <ore:plateBrass>, #Brass plate
  "H": <minecraft:hopper>, #Hopper
  "A": <thaumcraft:metal_alchemical>, #Alchemical construct
  "Q": <ore:gemQuartzBlack>, #Black quartz
}).shaped());

# [Filling Essentia Transfuser]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:essentiatransportin");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("essentiatransportin", 
"ESSENTIATRANSPORT", 
100,
[<aspect:aer>,<aspect:aqua>], 
<thaumcraft:essentia_input>, 
  Grid(["pretty",
  "B D B",
  "Q A Q"], {
  "B": <ore:plateBrass>, #Brass plate
  "D": <minecraft:dispenser>, #Dispenser
  "A": <thaumcraft:metal_alchemical>, #Alchemical construct
  "Q": <ore:gemQuartzBlack>, #Black quartz
}).shaped());

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
Grid(["-K-T-K-T"], {
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
  Grid(["pretty",
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
  Grid(["oG"], {
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
  Grid(["ZZ"], {
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
  Grid(["pretty",
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

# [Focus tier 2]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:focus_2>);
mods.thaumcraft.Infusion.registerRecipe(
  "focus_2", # Name
  "FOCUSADVANCED@1", # Research
  <thaumcraft:focus_2>, # Output
  2, # Instability
  [<aspect:ordo> * 50, <aspect:praecantatio> * 25],
  <thaumcraft:focus_1>, # CentralItem
  [<thaumcraft:quicksilver>,<astralsorcery:itemcraftingcomponent>,<thaumcraft:quicksilver>,<botania:spark>]
);

# [Focus tier 3]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:focus_3>);
mods.thaumcraft.Infusion.registerRecipe(
  "focus_3", # Name
  "FOCUSGREATER@1", # Research
  <thaumcraft:focus_3>, # Output
  4, # Instability
  [<aspect:vacuos> * 50,<aspect:mana> * 100, <aspect:ordo> * 50, <aspect:praecantatio> * 25],
  <thaumcraft:focus_2>, # CentralItem
  [<ore:manaPearl>,<thaumcraft:quicksilver>,<iceandfire:pixie_dust>,<thaumcraft:quicksilver>,<ore:manaDiamond>,<thaumcraft:quicksilver>,<iceandfire:pixie_dust>,<thaumcraft:quicksilver>]
);

# [Focus ancient]
mods.thaumcraft.Infusion.registerRecipe(
  "focus_ancient", # Name
  "FOCUSANCIENT", # Research
  <thaumicaugmentation:focus_ancient>, # Output
  3, # Instability
  [<aspect:vacuos> * 100, <aspect:alienis> * 25],
  <thaumcraft:focus_2>, # CentralItem
  [<ore:crystalVoid>,<thaumcraft:quicksilver>,<ore:crystalVoid>,<ore:nuggetVoid>,<ore:crystalVoid>,<thaumcraft:quicksilver>,<ore:crystalVoid>,<ore:nuggetVoid>]
);

#[Primal metal]
mods.thaumcraft.Infusion.removeRecipe(<tconevo:metal:20>);
mods.thaumcraft.Infusion.registerRecipe(
  "primal_metal", # Name
  "TCONEVO_PRIMALMETAL", # Research
  <tconevo:metal:20>, # Output
  2, # Instability
  [<aspect:aer>*10,<aspect:ignis>*10,<aspect:ordo>*10,<aspect:aqua>*10,<aspect:terra>*10,<aspect:perditio>*10,<aspect:metallum>*30],
  <tconevo:material>, # CentralItem
  [<thaumicwonders:primordial_grain>,<thaumcraft:salis_mundus>]
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

# [Sanity soap]
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:sanity_soap>);
mods.thaumcraft.Crucible.registerRecipe(
  "SaneSoap", # Name
  "SANESOAP", # Research
  <thaumcraft:sanity_soap>, # Output
  <thaumcraft:bath_salts>, # Input
  [<aspect:mana> * 5]
);
# [Sanity soap] alternative
mods.botania.ManaInfusion.addAlchemy(<thaumcraft:sanity_soap>,<thaumcraft:bath_salts>,2500);

# [Focus tier 1]
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:focus_1>);
mods.thaumcraft.Crucible.registerRecipe(
  "focus_1", # Name
  "BASEAUROMANCY@1", # Research
  <thaumcraft:focus_1>, # Output
  <thaumcraft:quicksilver>, # Input
  [<aspect:auram> * 5,<aspect:praecantatio>*10,<aspect:vitreus>*20]
);

# [Alumentum]
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:alumentum>);
mods.thaumcraft.Crucible.registerRecipe(
  "alumentum", # Name
  "ALUMENTUM", # Research
  <thaumcraft:alumentum>*10, # Output
  <minecraft:coal>, # Input
  [<aspect:potentia> * 10,<aspect:ignis>*10,<aspect:perditio>*5]
);

/*
 ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
██╔═══██║╚══██╔══╝██║  ██║██╔════╝██╔══██╗
██║   ██║   ██║   ███████║█████╗  ██████╔╝
██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
 ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
*/

scripts.process.crushRock(<thaumicaugmentation:stone>, 
[<jaopca:item_dusttanzanite>,<jaopca:item_dustdimensionalshard>,<actuallyadditions:item_dust:7>], 
[0.8, 0.2, 0.1], 
"No exceptions"); 

scripts.process.crushRock(<thaumicaugmentation:stone:1>, 
[<jaopca:item_dusttanzanite>,<jaopca:item_dustdimensionalshard>,<thaumadditions:salt_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]})], 
[0.8, 0.2, 0.1], 
"No exceptions"); 

scripts.process.crushRock(<thaumicaugmentation:stone:2>, 
[<jaopca:item_dusttanzanite>,<jaopca:item_dustdimensionalshard>,<thaumadditions:salt_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]})], 
[0.8, 0.3, 0.1], 
"No exceptions"); 

# Skyblock alt
mods.thaumcraft.SalisMundus.addSingleConversion(<ore:plankWood>, <thaumcraft:plank_silverwood>);
mods.thaumcraft.SalisMundus.addSingleConversion(<ore:logWood>, <thaumcraft:log_greatwood>);
scripts.jei.crafting_hints.addInsOutCatl([<ore:plankWood>, <thaumcraft:salis_mundus>], <thaumcraft:plank_silverwood>);
scripts.jei.crafting_hints.addInsOutCatl([<ore:logWood>, <thaumcraft:salis_mundus>], <thaumcraft:log_greatwood>);
scripts.jei.crafting_hints.addInsOutCatl([<thaumicwonders:primordial_grain>], <thaumcraft:primordial_pearl:5>, <thaumicwonders:primordial_accretion_chamber>);

<entity:thaumcraft:firebat>.addDrop(<randomthings:flootoken>, 1, 3);
<entity:thaumcraft:thaumslime>.addPlayerOnlyDrop(<thermalexpansion:florb>.withTag({Fluid: "liquiddna"}) % 30, 1, 1);
