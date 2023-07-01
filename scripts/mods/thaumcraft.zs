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

# Since Alch Brass is cheaper, it should not be used for casts
mods.tconstruct.Casting.removeTableRecipe(<tconstruct:cast>, <liquid:brass>);

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

function getAnyVisCrystal(key as string = '8', col as int = 0x333333, matchNBTCheck as bool = false) as IItemStack {
  return <thaumcraft:crystal_essence>.withTag(
    utils.shinigTag(col) + {
      Aspects: [{key: 'ordo', amount: 1}],
      display: {Name: "§"~key~"§lAny Different Vis Crystal"}
    } as IData,
  matchNBTCheck);
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
  D: getAnyVisCrystal('4', 0xff0000, true),
  E: getAnyVisCrystal('2', 0x00ff00, true),
  F: getAnyVisCrystal('b', 0x00ffff, true),
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

# Compressed brain
recipes.remove(<rats:brain_block>);
utils.compact(<thaumcraft:brain>, <rats:brain_block>);

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
[<aspect:aer>, <aspect:ignis>, <aspect:aqua>, <aspect:terra>, <aspect:ordo>, <aspect:perditio>], 
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
[<aspect:aer>, <aspect:ignis>, <aspect:aqua>, <aspect:terra>, <aspect:ordo>, <aspect:perditio>], 
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
[<aspect:aer>, <aspect:terra>], 
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
[<aspect:aer>*2, <aspect:ignis>*2, <aspect:aqua>*2, <aspect:terra>*2, <aspect:ordo>*2, <aspect:perditio>*2], 
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
[<aspect:aer>, <aspect:terra>], 
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
[<aspect:aer>, <aspect:terra>], 
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
[<aspect:aer>, <aspect:terra>], 
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
[<aspect:aer>, <aspect:aqua>], 
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
[<aspect:aer>, <aspect:aqua>], 
<thaumcraft:essentia_input>, 
  Grid(["pretty",
  "B D B",
  "Q A Q"], {
  "B": <ore:plateBrass>, #Brass plate
  "D": <minecraft:dispenser>, #Dispenser
  "A": <thaumcraft:metal_alchemical>, #Alchemical construct
  "Q": <ore:gemQuartzBlack>, #Black quartz
}).shaped());

#[Hungry chest]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:HungryChest");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("HungryChest", 
"HUNGRYCHEST", 
15,
[], 
<thaumcraft:hungry_chest>, 
  Grid(["pretty",
  "G T G",
  "G   G",
  "G G G"], {
  "G": <thaumcraft:plank_greatwood>, #Greatwood plank
  "T": <ore:trapdoorWood>, #Trap door
}).shaped());

#[Automated crossbow]
mods.thaumcraft.ArcaneWorkbench.removeRecipe("thaumcraft:automatedcrossbow");
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("automatedcrossbow", 
"BASICTURRET", 
100,
[], 
<thaumcraft:turret>, 
  Grid(["pretty",
  "  M  ",
  "G B G",
  "S   S"], {
  "S": <ore:stickWood>, #Stick
  "G": <thaumcraft:plank_greatwood>, #Greatwood planks
  "M": <thaumcraft:mind>, #Clockwork Mind
  "B": <minecraft:bow:*>, #Bow
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

# [Crimson Blade] from [Skullfire Sword][+6]
craft.remake(<thaumcraft:crimson_blade>, ["pretty",
  "          □ T",
  "        □ T □",
  "      □ T □  ",
  "п п B S □    ",
  "  C B B      ",
  "п F C п      ",
  "F п   п      "], {
  "□": <ore:plateMithminite>,                  # Mithminite Plate
  "T": <thaumadditions:taintkin>,              # Taintkin
  "п": <ore:plateVoid>,                        # Void Metal Plate
  "B": <bloodmagic:bound_sword>.withTag({Unbreakable: 1 as byte, activated: 1 as byte}, false), # Bound Blade
  "S": <avaritia:skullfire_sword>.anyDamage(), # Skullfire Sword
  "C": <thaumcraft:curio:6>,                   # Crimson Rites
  "F": <botania:brewflask>.withTag({brewKey: "bloodthirst"}), # Flask of Crimson Shade (6)
});

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
  [<thaumcraft:quicksilver>,<ore:nuggetVoid>,<thaumcraft:quicksilver>,<ore:nuggetVoid>]
);

#[Primal metal]
mods.thaumcraft.Infusion.removeRecipe(<tconevo:metal:20>);
mods.thaumcraft.Infusion.registerRecipe(
  "primal_metal", # Name
  "TCONEVO_PRIMALMETAL", # Research
  <tconevo:metal:20>, # Output
  2, # Instability
  [<aspect:aer>*10, <aspect:ignis>*10, <aspect:ordo>*10, <aspect:aqua>*10, <aspect:terra>*10, <aspect:perditio>*10, <aspect:metallum>*30],
  <tconevo:material>, # CentralItem
  [<thaumicwonders:primordial_grain>,<thaumcraft:salis_mundus>]
);

#[Arcane bore]
mods.thaumcraft.Infusion.removeRecipe(<thaumcraft:turret:2>);
mods.thaumcraft.Infusion.registerRecipe(
  "ArcaneBore", # Name
  "ARCANEBORE", # Research
  <thaumcraft:turret:2>, # Output
  1, # Instability
  [<aspect:exitium>*25, <aspect:machina>*50],
  <thaumcraft:turret>, # CentralItem
  [<thaumcraft:plank_greatwood>,<thaumcraft:plate>,<thaumcraft:plank_greatwood>,<minecraft:iron_pickaxe:*>]
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
  [<aspect:auram>*5, <aspect:praecantatio>*10, <aspect:vitreus>*20]
);

# [Alumentum]
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:alumentum>);
mods.thaumcraft.Crucible.registerRecipe(
  "alumentum", # Name
  "ALUMENTUM", # Research
  <thaumcraft:alumentum>*10, # Output
  <minecraft:coal>, # Input
  [<aspect:potentia>*10, <aspect:ignis>*10, <aspect:perditio>*5]
);

# [Energetic nitor]
mods.thaumcraft.Crucible.removeRecipe(<thaumictinkerer:energetic_nitor>);
mods.thaumcraft.Crucible.registerRecipe(
  "energetic_nitor", # Name
  "TT_ENERGETIC_NITOR", # Research
  <thaumictinkerer:energetic_nitor>, # Output
  <ore:nitor>, # Input
  [<aspect:lux>*25, <aspect:potentia>*25, <aspect:ignis>*10, <aspect:aer>*10]
);

# Native cluster fix
function NativeClusterRecipe(name as string, native as IItemStack, ore as IItemStack) as void {
	mods.thaumcraft.Crucible.removeRecipe(native);
  mods.thaumcraft.Crucible.registerRecipe(
  name, # Name
  "METALPURIFICATION", # Research
  native, # Output
  ore, # Input
  [<aspect:ordo>*5, <aspect:metallum>*5]
  );
}

NativeClusterRecipe("metal_purification_aluminium"            , <jaopca:item_clusteraluminium>            , <thermalfoundation:ore:4>);
NativeClusterRecipe("metal_purification_nickel"               , <jaopca:item_clusternickel>               , <thermalfoundation:ore:5>);
NativeClusterRecipe("metal_purification_iridium"              , <jaopca:item_clusteriridium>              , <thermalfoundation:ore:7>);
NativeClusterRecipe("metal_purification_platinum"             , <jaopca:item_clusterplatinum>             , <thermalfoundation:ore:6>);
NativeClusterRecipe("metal_purification_uranium"              , <jaopca:item_clusteruranium>              , <immersiveengineering:ore:5>);
NativeClusterRecipe("metal_purification_osmium"               , <jaopca:item_clusterosmium>               , <mekanism:oreblock>);
NativeClusterRecipe("metal_purification_ardite"               , <jaopca:item_clusterardite>               , <tconstruct:ore:1>);
NativeClusterRecipe("metal_purification_cobalt"               , <jaopca:item_clustercobalt>               , <tconstruct:ore>);
NativeClusterRecipe("metal_purification_tungsten"             , <jaopca:item_clustertungsten>             , <endreborn:block_wolframium_ore>);
NativeClusterRecipe("metal_purification_starmetal"            , <jaopca:item_clusterastralstarmetal>      , <astralsorcery:blockcustomore:1>);
NativeClusterRecipe("metal_purification_boron"                , <jaopca:item_clusterboron>                , <nuclearcraft:ore:5>);
NativeClusterRecipe("metal_purification_lithium"              , <jaopca:item_clusterlithium>              , <nuclearcraft:ore:6>);
NativeClusterRecipe("metal_purification_magnesium"            , <jaopca:item_clustermagnesium>            , <nuclearcraft:ore:7>);
NativeClusterRecipe("metal_purification_thorium"              , <jaopca:item_clusterthorium>              , <nuclearcraft:ore:3>);
NativeClusterRecipe("metal_purification_manainfusedingot"     , <jaopca:item_clustermithril>              , <thermalfoundation:ore:8>);
NativeClusterRecipe("metal_purification_blackquartz"          , <jaopca:item_clusterquartzblack>          , <actuallyadditions:block_misc:3>);
NativeClusterRecipe("metal_purification_draconium"            , <jaopca:item_clusterdraconium>            , <draconicevolution:draconium_ore>);
NativeClusterRecipe("metal_purification_titanium"             , <jaopca:item_clustertitanium>             , <libvulpes:ore0:8>);
NativeClusterRecipe("metal_purification_coal"                 , <jaopca:item_clustercoal>                 , <minecraft:coal_ore>);
NativeClusterRecipe("metal_purification_emerald"              , <jaopca:item_clusteremerald>              , <minecraft:emerald_ore>);
NativeClusterRecipe("metal_purification_lapis"                , <jaopca:item_clusterlapis>                , <minecraft:lapis_ore>);
NativeClusterRecipe("metal_purification_redstone"             , <jaopca:item_clusterredstone>             , <minecraft:redstone_ore>);
NativeClusterRecipe("metal_purification_diamond"              , <jaopca:item_clusterdiamond>              , <minecraft:diamond_ore>);
NativeClusterRecipe("metal_purification_dimensionalshard"     , <jaopca:item_clusterdimensionalshard>     , <rftools:dimensional_shard_ore>);
NativeClusterRecipe("metal_purification_dilithium"            , <jaopca:item_clusterdilithium>            , <libvulpes:ore0>);
NativeClusterRecipe("metal_purification_certusquartz"         , <jaopca:item_clustercertusquartz>         , <appliedenergistics2:quartz_ore>);
NativeClusterRecipe("metal_purification_chargedcertusquartz"  , <jaopca:item_clusterchargedcertusquartz>  , <appliedenergistics2:charged_quartz_ore>);
NativeClusterRecipe("metal_purification_aquamarine"           , <jaopca:item_clusteraquamarine>           , <astralsorcery:blockcustomsandore>);
NativeClusterRecipe("metal_purification_apatite"              , <jaopca:item_clusterapatite>              , <forestry:resources>);
NativeClusterRecipe("metal_purification_amber"                , <jaopca:item_clusteramber>                , <biomesoplenty:gem_ore:7>);
NativeClusterRecipe("metal_purification_amberthaumcraft"      , <jaopca:item_clusteramber>                , <thaumcraft:ore_amber>);
NativeClusterRecipe("metal_purification_trinitite"            , <jaopca:item_clustertrinitite>            , <trinity:trinitite>);
NativeClusterRecipe("metal_purification_malachite"            , <jaopca:item_clustermalachite>            , <biomesoplenty:gem_ore:5>);
NativeClusterRecipe("metal_purification_topaz"                , <jaopca:item_clustertopaz>                , <biomesoplenty:gem_ore:3>);
NativeClusterRecipe("metal_purification_tanzanite"            , <jaopca:item_clustertanzanite>            , <biomesoplenty:gem_ore:4>);
NativeClusterRecipe("metal_purification_sapphire"             , <jaopca:item_clustersapphire>             , <biomesoplenty:gem_ore:6>);
NativeClusterRecipe("metal_purification_ruby"                 , <jaopca:item_clusterruby>                 , <biomesoplenty:gem_ore:1>);
NativeClusterRecipe("metal_purification_peridot"              , <jaopca:item_clusterperidot>              , <biomesoplenty:gem_ore:2>);
NativeClusterRecipe("metal_purification_amethyst"             , <jaopca:item_clusteramethyst>             , <biomesoplenty:gem_ore>);

/*
███████╗███╗   ██╗████████╗██╗████████╗██═╗    ██╗
██╔════╝████╗  ██║╚══██╔══╝██║╚══██╔══╝ ╚██═╗██╔═╝
█████╗  ██╔██╗ ██║   ██║   ██║   ██║      ╚██╔═╝
██╔══╝  ██║╚██╗██║   ██║   ██║   ██║       ██║
███████╗██║ ╚████║   ██║   ██║   ██║       ██║
╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝   ╚═╝       ╚═╝
*/

function L(legend as string) as string{
  if(legend=="hvanilla"){
    return "CREATION_HOSTILE_VANILLA";
  }
  if(legend=="pvanilla"){
    return "CREATION_PASSIVE_VANILLA";
  }
  if(legend=="vanilla_nether"){
    return "CREATION_HOSTILE_VANILLA_NETHER";
  }
  if(legend=="vanilla_end"){
    return "CREATION_HOSTILE_VANILLA_END";
  }
  if(legend=="elementals"){
    return "CREATION_HOSTILE_ELEMENTALS";
  }
  if(legend=="cow"){
    return "CREATION_ANIMANIA_COW";
  }
  if(legend=="sheep"){
    return "CREATION_ANIMANIA_SHEEP";
  }
  if(legend=="pig"){
    return "CREATION_ANIMANIA_PIG";
  }
  if(legend=="goat"){
    return "CREATION_ANIMANIA_GOAT";
  }
  if(legend=="chicken"){
    return "CREATION_ANIMANIA_CHICKEN";
  }
  if(legend=="rabbit"){
    return "CREATION_ANIMANIA_RABBIT";
  }
  if(legend=="horse"){
    return "CREATION_ANIMANIA_HORSE";
  }
  if(legend=="peacock"){
    return "CREATION_ANIMANIA_PEACOCK";
  }
  if(legend=="frog"){
    return "CREATION_ANIMANIA_FROG";
  }
  if(legend=="exotic"){
    return "CREATION_ANIMANIA_EXOTIC";
  }
}

function soulRecipe(entityId as string ,research as string ,aspects as CTAspectStack[] ,items as IIngredient[] = []) as void {
  if (items.length==0){
    mods.thaumcraft.Crucible.registerRecipe(
    entityId, L(research),
    <enderio:item_soul_vial:1>.withTag({entityId: entityId}),
    <enderio:item_soul_vial>,
    aspects
  );
  }
  else{
  mods.thaumcraft.Infusion.registerRecipe(
    entityId, L(research),
    <enderio:item_soul_vial:1>.withTag({entityId: entityId}),
    2,
    aspects,
    <enderio:item_soul_vial>,
    items
  );
  }
}

function IsThatEgg(egg as IItemStack, entityId as string) as IItemStack{
  if (egg.name == <minecraft:spawn_egg>.name){
    return <minecraft:spawn_egg>.withTag({EntityTag: {id: entityId}});
  }
  else{
    return egg;
  }
}

function eggRecipe(entityId as string ,research as string ,aspects as CTAspectStack[] ,output as IItemStack = <minecraft:spawn_egg> ,input as IIngredient = <ore:egg> ,items as IIngredient[] = []) as void {
  if (items.length==0){
    mods.thaumcraft.Crucible.registerRecipe(
    entityId, L(research),
    IsThatEgg(output, entityId),
    input,
    aspects
  );
  }
  else{
  mods.thaumcraft.Infusion.registerRecipe(
    entityId, L(research),
    IsThatEgg(output, entityId),
    2,
    aspects,
    input,
    items
  );
  }
}

#Passive Vanilla
eggRecipe("minecraft:cow"               ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:terra>*30          ,<aspect:praemunio>*15]);
eggRecipe("minecraft:sheep"             ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:terra>*30          ,<aspect:fabrico>*15]);
eggRecipe("minecraft:pig"               ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:terra>*30          ,<aspect:victus>*15]);
eggRecipe("minecraft:chicken"           ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:volatus>*30        ,<aspect:ventus>*15]);
eggRecipe("minecraft:rabbit"            ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:terra>*30          ,<aspect:visum>*15]);
eggRecipe("minecraft:wolf"              ,"pvanilla"         , [<aspect:bestia>*60    ,<aspect:terra>*30          ,<aspect:aversio>*15]);
eggRecipe("minecraft:ocelot"            ,"pvanilla"         , [<aspect:bestia>*60    ,<aspect:terra>*30          ,<aspect:desiderium>*15]);
eggRecipe("minecraft:parrot"            ,"pvanilla"         , [<aspect:bestia>*60    ,<aspect:volatus>*30        ,<aspect:sonus>*15]);
eggRecipe("minecraft:horse"             ,"pvanilla"         , [<aspect:bestia>*120   ,<aspect:terra>*30          ,<aspect:motus>*15]);
eggRecipe("minecraft:donkey"            ,"pvanilla"         , [<aspect:bestia>*90    ,<aspect:terra>*30          ,<aspect:vinculum>*15]);
eggRecipe("minecraft:mule"              ,"pvanilla"         , [<aspect:bestia>*90    ,<aspect:terra>*30          ,<aspect:imperium>*15]);
eggRecipe("minecraft:llama"             ,"pvanilla"         , [<aspect:bestia>*90    ,<aspect:terra>*30          ,<aspect:permutatio>*15]);
eggRecipe("minecraft:squid"             ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:aqua>*30           ,<aspect:tenebrae>*15]);
eggRecipe("minecraft:bat"               ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:volatus>*30        ,<aspect:tenebrae>*15]);
#eggRecipe("minecraft:mooshroom"         ,"pvanilla"         , [<aspect:bestia>*30    ,<aspect:terra>*30          ,<aspect:vitium>*15]);
eggRecipe("minecraft:polar_bear"        ,"pvanilla"         , [<aspect:bestia>*150   ,<aspect:terra>*30          ,<aspect:gelum>*60]);

#Hostile Vanilla Overworld
soulRecipe("minecraft:zombie"           ,"hvanilla"         , [<aspect:exanimis>*50  ,<aspect:mortuus>*50        ,<aspect:humanus>*100]);
soulRecipe("minecraft:husk"             ,"hvanilla"         , [<aspect:exanimis>*50  ,<aspect:mortuus>*50        ,<aspect:humanus>*100       ,<aspect:perditio>*50]);
soulRecipe("minecraft:skeleton"         ,"hvanilla"         , [<aspect:mortuus>*50   ,<aspect:perditio>*50       ,<aspect:aversio>*100]);
soulRecipe("minecraft:stray"            ,"hvanilla"         , [<aspect:mortuus>*50   ,<aspect:perditio>*50       ,<aspect:aversio>*100       ,<aspect:gelum>*50]);
soulRecipe("minecraft:creeper"          ,"hvanilla"         , [<aspect:exitium>*100  ,<aspect:ignis>*50          ,<aspect:alkimia>*25        ,<aspect:perditio>*50]);
soulRecipe("minecraft:spider"           ,"hvanilla"         , [<aspect:bestia>*100   ,<aspect:vinculum>*50       ,<aspect:sensus>*50]);
soulRecipe("minecraft:cave_spider"      ,"hvanilla"         , [<aspect:bestia>*75    ,<aspect:vinculum>*50       ,<aspect:sensus>*50         ,<aspect:alkimia>*25]);
soulRecipe("minecraft:witch"            ,"hvanilla"         , [<aspect:humanus>*100  ,<aspect:praecantatio>*50   ,<aspect:alkimia>*50]);
soulRecipe("minecraft:slime"            ,"hvanilla"         , [<aspect:aqua>*50      ,<aspect:victus>*50]);
soulRecipe("minecraft:guardian"         ,"hvanilla"         , [<aspect:aqua>*100     ,<aspect:praemunio>*50      ,<aspect:sensus>*50]);
soulRecipe("minecraft:silverfish"       ,"hvanilla"         , [<aspect:perditio>*100 ,<aspect:vacuos>*50         ,<aspect:vinculum>*50]);
soulRecipe("minecraft:zombie_horse"     ,"hvanilla"         , [<aspect:bestia>*100   ,<aspect:exanimis>*50       ,<aspect:motus>*50]);
soulRecipe("minecraft:skeleton_horse"   ,"hvanilla"         , [<aspect:bestia>*100   ,<aspect:mortuus>*50        ,<aspect:motus>*50]);
soulRecipe("minecraft:giant"            ,"hvanilla"         , [<aspect:exanimis>*500 ,<aspect:praemunio>*500     ,<aspect:mythus>*500]); #Probably recipe to delete

#Hostile Vanilla Nether
soulRecipe("minecraft:zombie_pigman"    ,"vanilla_nether"  , [<aspect:exanimis>*50  ,<aspect:mortuus>*50        ,<aspect:bestia>*100]);
soulRecipe("minecraft:magma_cube"       ,"vanilla_nether"  , [<aspect:aqua>*50      ,<aspect:victus>*50         ,<aspect:infernum>*25]);
soulRecipe("minecraft:wither_skeleton"  ,"vanilla_nether"  , [<aspect:mortuus>*50   ,<aspect:perditio>*100      ,<aspect:aversio>*100       ,<aspect:spiritus>*100]);
soulRecipe("minecraft:ghast"            ,"vanilla_nether"  , [<aspect:spiritus>*250 ,<aspect:volatus>*50        ,<aspect:fluctus>*100]);

#Hostile Vanilla End
soulRecipe("minecraft:enderman"         ,"vanilla_end"     , [<aspect:alienis>*200  ,<aspect:tenebrae>*100]);
soulRecipe("minecraft:endermite"        ,"vanilla_end"     , [<aspect:alienis>*100  ,<aspect:vacuos>*50         ,<aspect:vinculum>*50]);
soulRecipe("minecraft:shulker"          ,"vanilla_end"     , [<aspect:alienis>*200  ,<aspect:volatus>*100       ,<aspect:sonus>*50]);

#Elementals
soulRecipe("minecraft:blaze"            ,"elementals"      , [<aspect:ignis>*60     ,<aspect:infernum>*60]);
soulRecipe("thermalfoundation:blizz"    ,"elementals"      , [<aspect:aqua>*60      ,<aspect:gelum>*60]);
soulRecipe("thermalfoundation:basalz"   ,"elementals"      , [<aspect:terra>*60     ,<aspect:metallum>*60]);
soulRecipe("thermalfoundation:blitz"    ,"elementals"      , [<aspect:aer>*60       ,<aspect:ventus>*60]);

/*
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
*/

/*
#######################################################

Animania

#######################################################
*/

#Cows
eggRecipe("animania:cow_angus"          ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:tenebrae>*30],
<animania:entity_egg_cow_angus>         ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<ore:gemQuartzBlack> ,<minecraft:beef> ,<minecraft:beef> ,<ore:gemQuartzBlack>]);
eggRecipe("animania:bull_angus"         ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:tenebrae>*30],
<animania:entity_egg_bull_angus>        ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<ore:gemQuartzBlack> ,<minecraft:beef> ,<minecraft:beef> ,<ore:gemQuartzBlack>]);

eggRecipe("animania:cow_friesian"       ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:aer>*30],
<animania:entity_egg_cow_friesian>      ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<ore:grassTall> ,<harvestcraft:freshmilkitem> ,<harvestcraft:freshmilkitem> ,<ore:grassTall>]);
eggRecipe("animania:bull_friesian"      ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:aer>*30],
<animania:entity_egg_bull_friesian>     ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<ore:grassTall> ,<harvestcraft:freshmilkitem> ,<harvestcraft:freshmilkitem> ,<ore:grassTall>]);

eggRecipe("animania:cow_hereford"       ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:gelum>*30],
<animania:entity_egg_cow_hereford>      ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<minecraft:snowball> ,<minecraft:beef> ,<minecraft:beef> ,<minecraft:snowball>]);
eggRecipe("animania:bull_hereford"      ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:gelum>*30],
<animania:entity_egg_bull_hereford>     ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:snowball> ,<minecraft:beef> ,<minecraft:beef> ,<minecraft:snowball>]);

eggRecipe("animania:cow_holstein"       ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:ordo>*30],
<animania:entity_egg_cow_holstein>      ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<minecraft:sapling:2> ,<harvestcraft:freshmilkitem> ,<harvestcraft:freshmilkitem> ,<minecraft:sapling:1>]);
eggRecipe("animania:bull_holstein"      ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:ordo>*30],
<animania:entity_egg_bull_holstein>     ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:sapling:2> ,<harvestcraft:freshmilkitem> ,<harvestcraft:freshmilkitem> ,<minecraft:sapling:1>]);

eggRecipe("animania:cow_longhorn"       ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:ignis>*30],
<animania:entity_egg_cow_longhorn>      ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<minecraft:bone> ,<minecraft:beef> ,<minecraft:beef> ,<minecraft:bone>]);
eggRecipe("animania:bull_longhorn"      ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:ignis>*30],
<animania:entity_egg_bull_longhorn>     ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:bone> ,<minecraft:beef> ,<minecraft:beef> ,<minecraft:bone>]);

eggRecipe("animania:cow_highland"       ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:desiderium>*30],
<animania:entity_egg_cow_highland>      ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<harvestcraft:hardenedleatheritem> ,<minecraft:beef> ,<minecraft:beef> ,<harvestcraft:hardenedleatheritem>]);
eggRecipe("animania:bull_highland"      ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:desiderium>*30],
<animania:entity_egg_bull_highland>     ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<harvestcraft:hardenedleatheritem> ,<minecraft:beef> ,<minecraft:beef> ,<harvestcraft:hardenedleatheritem>]);

eggRecipe("animania:cow_jersey"         ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:permutatio>*30],
<animania:entity_egg_cow_jersey>        ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<harvestcraft:freshmilkitem> ,<minecraft:beef> ,<biomesoplenty:mudball>]);
eggRecipe("animania:bull_jersey"        ,"cow", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:praemunio>*30    ,<aspect:permutatio>*30],
<animania:entity_egg_bull_jersey>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<harvestcraft:freshmilkitem> ,<minecraft:beef> ,<biomesoplenty:mudball>]);

#Sheeps

eggRecipe("animania:ewe_dorper"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:ignis>*30],
<animania:entity_egg_ewe_dorper>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<botania:doubleflower2:7> ,<minecraft:mutton> ,<minecraft:mutton> ,<botania:doubleflower2:7>]);
eggRecipe("animania:ram_dorper"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:ignis>*30],
<animania:entity_egg_ewe_dorper>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<botania:doubleflower2:7> ,<minecraft:mutton> ,<minecraft:mutton> ,<botania:doubleflower2:7>]);

eggRecipe("animania:ewe_dorset"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:gelum>*30],
<animania:entity_egg_ewe_dorset>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<botania:doubleflower1:6> ,<minecraft:mutton> ,<minecraft:mutton> ,<botania:doubleflower1:6>]);
eggRecipe("animania:ram_dorset"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:gelum>*30],
<animania:entity_egg_ewe_dorset>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<botania:doubleflower1:6> ,<minecraft:mutton> ,<minecraft:mutton> ,<botania:doubleflower1:6>]);

eggRecipe("animania:ewe_friesian"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:ordo>*30],
<animania:entity_egg_ewe_friesian>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<botania:doubleflower2:4> ,<ore:wool> ,<ore:wool> ,<botania:doubleflower2:4>]);
eggRecipe("animania:ram_friesian"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:ordo>*30],
<animania:entity_egg_ewe_friesian>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<botania:doubleflower2:4> ,<ore:wool> ,<ore:wool> ,<botania:doubleflower2:4>]);

eggRecipe("animania:ewe_jacob"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:herba>*30],
<animania:entity_egg_ewe_jacob>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<botania:doubleflower2> ,<ore:wool> ,<ore:wool> ,<botania:doubleflower2>]);
eggRecipe("animania:ram_jacob"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:herba>*30],
<animania:entity_egg_ewe_jacob>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<botania:doubleflower2> ,<ore:wool> ,<ore:wool> ,<botania:doubleflower2>]);

eggRecipe("animania:ewe_merino"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:aer>*30],
<animania:entity_egg_ewe_merino>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<botania:doubleflower1> ,<ore:wool> ,<ore:wool> ,<botania:doubleflower1>]);
eggRecipe("animania:ram_merino"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:aer>*30],
<animania:entity_egg_ewe_merino>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<botania:doubleflower1> ,<ore:wool> ,<ore:wool> ,<botania:doubleflower1>]);

eggRecipe("animania:ewe_suffolk"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:visum>*30],
<animania:entity_egg_ewe_suffolk>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<botania:doubleflower2:5> ,<minecraft:mutton> ,<ore:wool> ,<botania:doubleflower2:5>]);
eggRecipe("animania:ram_suffolk"        ,"sheep", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:fabrico>*30    ,<aspect:visum>*30],
<animania:entity_egg_ewe_suffolk>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<botania:doubleflower2:5> ,<minecraft:mutton> ,<ore:wool> ,<botania:doubleflower2:5>]);

#Pigs

eggRecipe("animania:sow_yorkshire"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:ordo>*30],
<animania:entity_egg_sow_yorkshire>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<minecraft:porkchop> ,<minecraft:porkchop> ,<biomesoplenty:mudball>]);
eggRecipe("animania:hog_yorkshire"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:ordo>*30],
<animania:entity_egg_hog_yorkshire>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<minecraft:porkchop> ,<minecraft:porkchop> ,<biomesoplenty:mudball>]);

eggRecipe("animania:sow_old_spot"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:perditio>*30],
<animania:entity_egg_sow_old_spot>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<exnihilocreatio:item_material:3> ,<exnihilocreatio:item_material:3> ,<biomesoplenty:mudball>]);
eggRecipe("animania:hog_old_spot"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:perditio>*30],
<animania:entity_egg_hog_old_spot>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<exnihilocreatio:item_material:3> ,<exnihilocreatio:item_material:3> ,<biomesoplenty:mudball>]);

eggRecipe("animania:sow_large_black"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:tenebrae>*30],
<animania:entity_egg_sow_large_black>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<minecraft:brown_mushroom> ,<minecraft:brown_mushroom> ,<biomesoplenty:mudball>]);
eggRecipe("animania:hog_large_black"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:tenebrae>*30],
<animania:entity_egg_hog_large_black>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<minecraft:brown_mushroom> ,<minecraft:brown_mushroom> ,<biomesoplenty:mudball>]);

eggRecipe("animania:sow_large_white"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:fluctus>*30],
<animania:entity_egg_sow_large_white>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<harvestcraft:whitemushroomitem> ,<harvestcraft:whitemushroomitem> ,<biomesoplenty:mudball>]);
eggRecipe("animania:hog_large_white"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:fluctus>*30],
<animania:entity_egg_hog_large_white>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<harvestcraft:whitemushroomitem> ,<harvestcraft:whitemushroomitem> ,<biomesoplenty:mudball>]);

eggRecipe("animania:sow_hampshire"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:gelum>*30],
<animania:entity_egg_sow_hampshire>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<minecraft:snowball> ,<minecraft:snowball> ,<biomesoplenty:mudball>]);
eggRecipe("animania:hog_hampshire"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:gelum>*30],
<animania:entity_egg_hog_hampshire>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<minecraft:snowball> ,<minecraft:snowball> ,<biomesoplenty:mudball>]);

eggRecipe("animania:sow_duroc"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:infernum>*30],
<animania:entity_egg_sow_duroc>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<rustic:grape_stem> ,<biomesoplenty:mudball> ,<harvestcraft:netherwingsitem> ,<harvestcraft:netherwingsitem> ,<biomesoplenty:mudball>]);
eggRecipe("animania:hog_duroc"        ,"pig", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:victus>*30    ,<aspect:infernum>*30],
<animania:entity_egg_hog_duroc>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:mudball> ,<harvestcraft:netherwingsitem> ,<harvestcraft:netherwingsitem> ,<biomesoplenty:mudball>]);

#Chickens

eggRecipe("animania:hen_leghorn"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:ordo>*30],
<animania:entity_egg_hen_leghorn>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<minecraft:wheat_seeds> ,<ore:feather> ,<ore:feather> ,<minecraft:wheat_seeds>]);
eggRecipe("animania:rooster_leghorn"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:ordo>*30],
<animania:entity_egg_rooster_leghorn>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:wheat_seeds> ,<ore:feather> ,<ore:feather> ,<minecraft:wheat_seeds>]);

eggRecipe("animania:hen_orpington"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:sonus>*30],
<animania:entity_egg_hen_orpington>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<minecraft:vine> ,<minecraft:chicken> ,<minecraft:chicken> ,<minecraft:vine>]);
eggRecipe("animania:rooster_orpington"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:sonus>*30],
<animania:entity_egg_rooster_orpington>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:vine> ,<minecraft:chicken> ,<minecraft:chicken> ,<minecraft:vine>]);

eggRecipe("animania:hen_plymouth_rock"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:exitium>*30],
<animania:entity_egg_hen_plymouth_rock>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<biomesoplenty:grass:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<biomesoplenty:grass:1>]);
eggRecipe("animania:rooster_plymouth_rock"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:exitium>*30],
<animania:entity_egg_rooster_plymouth_rock>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:grass:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<biomesoplenty:grass:1>]);

eggRecipe("animania:hen_rhode_island_red"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:ignis>*30],
<animania:entity_egg_hen_rhode_island_red>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<minecraft:sand:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<minecraft:sand:1>]);
eggRecipe("animania:rooster_rhode_island_red"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:ignis>*30],
<animania:entity_egg_rooster_rhode_island_red>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:sand:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<minecraft:sand:1>]);

eggRecipe("animania:hen_wyandotte"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:visum>*30],
<animania:entity_egg_hen_wyandotte>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<tconstruct:brownstone:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<tconstruct:brownstone:1>]);
eggRecipe("animania:rooster_wyandotte"        ,"chicken", 
[<aspect:bestia>*60    ,<aspect:volatus>*60        ,<aspect:ventus>*30       ,<aspect:visum>*30],
<animania:entity_egg_rooster_wyandotte>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<tconstruct:brownstone:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<tconstruct:brownstone:1>]);

#Rabbits

eggRecipe("animania:doe_cottontail"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:fabrico>*30],
<animania:entity_egg_doe_cottontail>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:14> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:14>]);
eggRecipe("animania:buck_cottontail"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:fabrico>*30],
<animania:entity_egg_buck_cottontail>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:14> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:14>]);

eggRecipe("animania:doe_chinchilla"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:aer>*30],
<animania:entity_egg_doe_chinchilla>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:13> ,<minecraft:rabbit> ,<minecraft:rabbit> ,<botania:biomestonea:13>]);
eggRecipe("animania:buck_chinchilla"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:aer>*30],
<animania:entity_egg_buck_chinchilla>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:13> ,<minecraft:rabbit> ,<minecraft:rabbit> ,<botania:biomestonea:13>]);

eggRecipe("animania:doe_dutch"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:fluctus>*30],
<animania:entity_egg_doe_dutch>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:9> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:9>]);
eggRecipe("animania:buck_dutch"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:fluctus>*30],
<animania:entity_egg_buck_dutch>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:9> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:9>]);

eggRecipe("animania:doe_havana"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:exitium>*30],
<animania:entity_egg_doe_havana>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:10> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:10>]);
eggRecipe("animania:buck_havana"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:exitium>*30],
<animania:entity_egg_buck_havana>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:10> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:10>]);

eggRecipe("animania:doe_jack"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:vinculum>*30],
<animania:entity_egg_doe_jack>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:12> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:12>]);
eggRecipe("animania:buck_jack"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:vinculum>*30],
<animania:entity_egg_buck_jack>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:12> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:12>]);

eggRecipe("animania:doe_new_zealand"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:ordo>*30],
<animania:entity_egg_doe_new_zealand>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:8> ,<minecraft:rabbit> ,<minecraft:rabbit> ,<botania:biomestonea:8>]);
eggRecipe("animania:buck_new_zealand"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:ordo>*30],
<animania:entity_egg_buck_new_zealand>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:8> ,<minecraft:rabbit> ,<minecraft:rabbit> ,<botania:biomestonea:8>]);

eggRecipe("animania:doe_rex"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:imperium>*30],
<animania:entity_egg_doe_rex>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:15> ,<minecraft:rabbit> ,<minecraft:rabbit> ,<botania:biomestonea:15>]);
eggRecipe("animania:buck_rex"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:imperium>*30],
<animania:entity_egg_buck_rex>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:15> ,<minecraft:rabbit> ,<minecraft:rabbit> ,<botania:biomestonea:15>]);

eggRecipe("animania:doe_lop"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:cognitio>*30],
<animania:entity_egg_doe_lop>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<rustic:grape_stem> ,<botania:biomestonea:11> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:11>]);
eggRecipe("animania:buck_lop"        ,"rabbit", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:visum>*30        ,<aspect:cognitio>*30],
<animania:entity_egg_buck_lop>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}),
[<minecraft:pumpkin_seeds> ,<botania:biomestonea:11> ,<minecraft:leather> ,<minecraft:leather> ,<botania:biomestonea:11>]);

#Goats

eggRecipe("animania:doe_alpine"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:gelum>*30],
<animania:entity_egg_doe_alpine>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<minecraft:bone> ,<minecraft:mutton> ,<minecraft:mutton> ,<minecraft:bone>]);
eggRecipe("animania:buck_alpine"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:gelum>*30],
<animania:entity_egg_buck_alpine>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:bone> ,<minecraft:mutton> ,<minecraft:mutton> ,<minecraft:bone>]);

eggRecipe("animania:doe_angora"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:ordo>*30],
<animania:entity_egg_doe_angora>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<minecraft:bone> ,<ore:wool> ,<ore:wool> ,<minecraft:bone>]);
eggRecipe("animania:buck_angora"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:ordo>*30],
<animania:entity_egg_buck_angora>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:bone> ,<ore:wool> ,<ore:wool> ,<minecraft:bone>]);

eggRecipe("animania:doe_fainting"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:imperium>*30],
<animania:entity_egg_doe_fainting>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<biomesoplenty:plant_1:7> ,<minecraft:leather> ,<minecraft:leather> ,<biomesoplenty:plant_1:7>]);
eggRecipe("animania:buck_fainting"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:imperium>*30],
<animania:entity_egg_buck_fainting>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:plant_1:7> ,<minecraft:leather> ,<minecraft:leather> ,<biomesoplenty:plant_1:7>]);

eggRecipe("animania:doe_kiko"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:sensus>*30],
<animania:entity_egg_doe_kiko>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<biomesoplenty:plant_0:10> ,<minecraft:mutton> ,<minecraft:mutton> ,<biomesoplenty:plant_0:10>]);
eggRecipe("animania:buck_kiko"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:sensus>*30],
<animania:entity_egg_buck_kiko>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:plant_0:10> ,<minecraft:mutton> ,<minecraft:mutton> ,<biomesoplenty:plant_0:10>]);

eggRecipe("animania:doe_kinder"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:vacuos>*30],
<animania:entity_egg_doe_kinder>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<biomesoplenty:plant_1> ,<minecraft:leather> ,<minecraft:leather> ,<biomesoplenty:plant_1>]);
eggRecipe("animania:buck_kinder"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:vacuos>*30],
<animania:entity_egg_buck_kinder>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:plant_1> ,<minecraft:leather> ,<minecraft:leather> ,<biomesoplenty:plant_1>]);

eggRecipe("animania:doe_nigerian_dwarf"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:perditio>*30],
<animania:entity_egg_doe_nigerian_dwarf>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<biomesoplenty:plant_0:7> ,<minecraft:leather> ,<minecraft:leather> ,<biomesoplenty:plant_0:7>]);
eggRecipe("animania:buck_nigerian_dwarf"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:perditio>*30],
<animania:entity_egg_buck_nigerian_dwarf>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:plant_0:7> ,<minecraft:leather> ,<minecraft:leather> ,<biomesoplenty:plant_0:7>]);

eggRecipe("animania:doe_pygmy"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:fluctus>*30],
<animania:entity_egg_doe_pygmy>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<rustic:grape_stem> ,<biomesoplenty:plant_0:6> ,<minecraft:mutton> ,<minecraft:mutton> ,<biomesoplenty:plant_0:6>]);
eggRecipe("animania:buck_pygmy"        ,"goat", 
[<aspect:bestia>*60    ,<aspect:terra>*60          ,<aspect:sanguis>*30        ,<aspect:fluctus>*30],
<animania:entity_egg_buck_pygmy>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
[<minecraft:pumpkin_seeds> ,<biomesoplenty:plant_0:6> ,<minecraft:mutton> ,<minecraft:mutton> ,<biomesoplenty:plant_0:6>]);

#Horse

eggRecipe("animania:mare_draft"        ,"horse", 
[<aspect:bestia>*150    ,<aspect:terra>*90          ,<aspect:motus>*90          ,<aspect:victus>*150],
<animania:entity_egg_doe_pygmy>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:horse"}}),
[<rustic:grape_stem> ,<minecraft:hay_block> ,<minecraft:hay_block> ,<minecraft:hay_block> ,<minecraft:hay_block>]);
eggRecipe("animania:stallion_draft"        ,"horse", 
[<aspect:bestia>*150    ,<aspect:terra>*90          ,<aspect:motus>*90          ,<aspect:victus>*150],
<animania:entity_egg_buck_pygmy>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:horse"}}),
[<minecraft:pumpkin_seeds> ,<minecraft:hay_block> ,<minecraft:hay_block> ,<minecraft:hay_block> ,<minecraft:hay_block>]);

#Peacocks

eggRecipe("animania:peahen_charcoal"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:tenebrae>*30],
<animania:entity_egg_peahen_charcoal>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune:15> ,<ore:feather> ,<ore:feather> ,<quark:rune:15>]);
eggRecipe("animania:peacock_charcoal"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:tenebrae>*30],
<animania:entity_egg_peacock_charcoal>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune:15> ,<ore:feather> ,<ore:feather> ,<quark:rune:15>]);

eggRecipe("animania:peahen_opal"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:fluctus>*30],
<animania:entity_egg_peahen_opal>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune:11> ,<ore:feather> ,<ore:feather> ,<quark:rune:11>]);
eggRecipe("animania:peacock_opal"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:fluctus>*30],
<animania:entity_egg_peacock_opal>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune:11> ,<ore:feather> ,<ore:feather> ,<quark:rune:11>]);

eggRecipe("animania:peahen_peach"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:vinculum>*30],
<animania:entity_egg_peahen_peach>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune:1>]);
eggRecipe("animania:peacock_peach"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:vinculum>*30],
<animania:entity_egg_peacock_peach>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune:1> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune:1>]);

eggRecipe("animania:peahen_purple"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:alienis>*30],
<animania:entity_egg_peahen_purple>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune:2> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune:2>]);
eggRecipe("animania:peacock_purple"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:alienis>*30],
<animania:entity_egg_peacock_purple>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune:2> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune:2>]);

eggRecipe("animania:peahen_taupe"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:sonus>*30],
<animania:entity_egg_peahen_taupe>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune:4> ,<ore:feather> ,<ore:feather> ,<quark:rune:4>]);
eggRecipe("animania:peacock_taupe"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:sonus>*30],
<animania:entity_egg_peacock_taupe>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune:4> ,<ore:feather> ,<ore:feather> ,<quark:rune:4>]);

eggRecipe("animania:peahen_blue"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:aqua>*30],
<animania:entity_egg_peahen_blue>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune:3> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune:3>]);
eggRecipe("animania:peacock_blue"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:aqua>*30],
<animania:entity_egg_peacock_blue>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune:3> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune:3>]);

eggRecipe("animania:peahen_white"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:ordo>*30],
<animania:entity_egg_peahen_white>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<rustic:grape_stem> ,<quark:rune> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune>]);
eggRecipe("animania:peacock_white"        ,"peacock", 
[<aspect:bestia>*60    ,<aspect:ventus>*60         ,<aspect:auram>*30          ,<aspect:ordo>*30],
<animania:entity_egg_peacock_white>       ,<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
[<minecraft:pumpkin_seeds> ,<quark:rune> ,<minecraft:chicken> ,<minecraft:chicken> ,<quark:rune>]);

#Frogs

eggRecipe("animania:frog"        ,"frog", 
[<aspect:bestia>*60    ,<aspect:exanimis>*60       ,<aspect:perditio>*30          ,<aspect:victus>*30],
<animania:entity_egg_frog>       ,<ore:egg>,
[<biomesoplenty:flower_0:1> ,<minecraft:waterlily> ,<minecraft:waterlily>]);

eggRecipe("animania:toad"        ,"frog", 
[<aspect:bestia>*60    ,<aspect:exanimis>*60       ,<aspect:perditio>*30          ,<aspect:vinculum>*30],
<animania:entity_egg_toad>       ,<ore:egg>,
[<biomesoplenty:mushroom:4> ,<minecraft:waterlily> ,<minecraft:waterlily>]);

eggRecipe("animania:dart_frog"        ,"frog", 
[<aspect:bestia>*60    ,<aspect:exanimis>*60       ,<aspect:perditio>*30          ,<aspect:alkimia>*30],
<animania:entity_egg_dart_frog>       ,<ore:egg>,
[<biomesoplenty:plant_0:4> ,<minecraft:waterlily> ,<minecraft:waterlily>]);

#Exotics

eggRecipe("animania:hedgehog"        ,"exotic", 
[<aspect:bestia>*60    ,<aspect:terra>*60       ,<aspect:aversio>*30          ,<aspect:praemunio>*30],
<animania:entity_egg_hedgehog>       ,<ore:egg>,
[<quark:root_flower:2> ,<extrautils2:spike_wood> ,<extrautils2:spike_wood> ,<extrautils2:spike_wood>]);

eggRecipe("animania:hedgehog_albino"        ,"exotic", 
[<aspect:bestia>*60    ,<aspect:terra>*60       ,<aspect:aversio>*30          ,<aspect:ordo>*30],
<animania:entity_egg_hedgehog_albino>       ,<ore:egg>,
[<quark:root_flower:1> ,<extrautils2:spike_wood> ,<extrautils2:spike_wood> ,<extrautils2:spike_wood>]);

eggRecipe("animania:hamster"        ,"exotic", 
[<aspect:bestia>*60    ,<aspect:terra>*60       ,<aspect:machina>*30          ,<aspect:motus>*30],
<animania:entity_egg_hamster>       ,<ore:egg>,
[<animania:hamster_ball_colored:*> ,<ore:listAllseed> ,<ore:listAllseed>]);

eggRecipe("animania:ferret_white"        ,"exotic", 
[<aspect:bestia>*60    ,<aspect:terra>*60       ,<aspect:desiderium>*30          ,<aspect:ordo>*30],
<animania:entity_egg_ferret_white>       ,<ore:egg>,
[<botania:petal> ,<quark:golden_frog_leg> ,<quark:golden_frog_leg>]);

eggRecipe("animania:ferret_grey"        ,"exotic", 
[<aspect:bestia>*60    ,<aspect:terra>*60       ,<aspect:desiderium>*30          ,<aspect:perditio>*30],
<animania:entity_egg_ferret_grey>       ,<ore:egg>,
[<botania:petal:7> ,<quark:golden_frog_leg> ,<quark:golden_frog_leg>]);

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

# Tattered scrolls alt recipe
mods.astralsorcery.Altar.addConstellationAltarRecipe(
  'Tattered Scrolls alt', <thaumicaugmentation:research_notes>, 1500, 250, Grid([
  "KCK"+
  "NIN"+
  "KVK"+
  "LERP"+
  "HHGGGGHH"], {
  "K": <astralsorcery:itemknowledgeshare>,  # Scroll of written expertise
  "V": <thaumadditions:void_fruit>,         # Void fruit
  "C": <thaumcraft:curiosity_band>,         # Curiosity band
  "I": <thaumicaugmentation:material:3>,    # Impetus Cell
  "G": <thaumicwonders:primordial_grain>,   # Primordial grain
  "H": <warptheory:item_something>,         # Hunk of Somethink
  "N": <enderio:item_material:75>,          # Infinity reagent
  "L": <botania:rune:9>,                    # Rune of Lust
  "E": <botania:rune:14>,                   # Rune of Envy
  "R": <botania:rune:11>,                   # Rune of Greed
  "P": <botania:rune:15>,                   # Rune of Pride
  }).shapeless()
);

# Add rare drop to loot crates
# TODO: Seems like this tweak not working
loottweaker.LootTweaker.getTable("thaumicaugmentation:block/loot_common").getPool("loot_common").addItemEntry(<qmd:semiconductor:1>, 1);
loottweaker.LootTweaker.getTable("thaumicaugmentation:block/loot_uncommon").getPool("loot_uncommon").addItemEntry(<qmd:semiconductor>, 1);
