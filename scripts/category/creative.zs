#modloaded extendedcrafting

import crafttweaker.item.IItemCondition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# *======= Gas Trophy Frame =======*


recipes.remove(<plustic:centrifuge>);
var creativeGasTankFrame = <plustic:centrifuge>;
mods.jei.JEI.addDescription(creativeGasTankFrame, "Craft with 9 DIFFERENT gases");

# Gases to previwe. Not actual gases that used to craft
var allGasesNames as string[] = ["hydrogen", "oxygen", "water", "chlorine", "sulfurdioxide",
	"sulfurtrioxide", "sulfuricacid", "hydrogenchloride", "ethene", "sodium", "brine", "deuterium",
	"tritium", "fusionfuel", "lithium", "liquidosmium", "cleanIron", "iron", "cleanGold", "gold",
	"cleanOsmium", "osmium", "cleanCopper", "copper", "cleanTin", "tin", "cleanSilver", "silver",
	"cleanLead", "lead", "slurryCleanAluminium", "slurryCleanArdite", "slurryCleanAstralStarmetal",
	"slurryCleanBoron", "slurryCleanCobalt", "slurryCleanDraconium", "slurryCleanIridium",
	"slurryCleanLithium", "slurryCleanMagnesium", "slurryCleanMithril", "slurryCleanNickel",
	"slurryCleanPlatinum", "slurryCleanThorium", "slurryCleanTitanium", "slurryCleanUranium",
	"slurryAluminium", "slurryArdite", "slurryAstralStarmetal", "slurryBoron", "slurryCobalt",
	"slurryDraconium", "slurryIridium", "slurryLithium", "slurryMagnesium", "slurryMithril",
	"slurryNickel", "slurryPlatinum", "slurryThorium", "slurryTitanium", "slurryUranium"] as string[];

# Gas Ingredients (can use even gas tank without any gas)
var gt as IIngredient = <mekanism:gastank>.withTag({tier: 1, mekData: { stored: {amount: 640000/* , gasName: allGasesNames[0] */}}}) as IIngredient;
for i in 0 to allGasesNames.length {
  if (!isNull(mods.mekanism.MekanismHelper.getGas(allGasesNames[i]))) {
    gt = gt.or( <mekanism:gastank>.withTag({tier: 1, mekData: { stored: {amount: 640000, gasName: allGasesNames[i]}}}) );
  }
}

# Create list of 9 gases and mark them
var ingList as IIngredient[] = [] as IIngredient[];
for i in 0 to 9 {
  ingList += gt.marked("g"~i);
}

# Get gas name from IItemStack
function getGas(item as IItemStack) as string {
  if (!isNull(item) && !isNull(item.tag) && !isNull(item.tag.mekData) && !isNull(item.tag.mekData.stored) && !isNull(item.tag.mekData.stored.gasName)) {
    return item.tag.mekData.stored.gasName.asString();
  }
  return "";
}

# Add Shapeless Gas Tank recipe
recipes.addShapeless("Creative Gas Tank Frame", 
  creativeGasTankFrame.withLore(["Craft with 9 DIFFERENT gases"]), 
  ingList, 
  
  function(out, ins, cInfo) {
    for i in 0 to 8 {
      for j in (i+1) to 9 {
        if (getGas(ins["g"~i]) == getGas(ins["g"~j])) {
          return null; # We found gas duplicate, return nothing
        }
      }
    }
    return out.withTag(null);
  }, 
null);



# *======= Variables =======*


var list = {
	"ⰱ": <advancedrocketry:oxygencharger>,
	"ⱎ": <appliedenergistics2:chest>,
	"◫": <bigreactors:blockludicrite>,
	"◊": <bigreactors:mineralanglesite>,
	"♦": <bigreactors:mineralbenitoite>,
	"◰": <botania:manatablet>.withTag({mana: 500000}),
	"◙": <compactsolars:compact_solar_block:2>,
	"ж": <draconicevolution:awakened_core>,
	"Ж": <draconicevolution:draconium_capacitor:1>,
	"☑": utils.tryCatch("threng:material", 14, <gendustry:genetics_processor>), # Speculative Processor
	"☠": <extendedcrafting:material:13>,
	"ⱋ": <aeadditions:storage.component:3>,
	"☒": <extrautils2:compressedcobblestone:7>,
	"◱": <extrautils2:decorativesolid:3>,
	"⩉": <extrautils2:drum:3>,
	"☺": <extrautils2:ingredients:5>,
	"♂": <extrautils2:ingredients:16>,
	"ⰻ": <extrautils2:klein>,
	"ⱄ": <extrautils2:opinium:6>,
	"◧": <extrautils2:passivegenerator:2>,
	"◨": <extrautils2:passivegenerator:3>,
	"◩": <extrautils2:passivegenerator:4>,
	"◪": <extrautils2:passivegenerator:5>,
	"☐": <extrautils2:passivegenerator:8>,
	"☼": <extrautils2:suncrystal>,
	"◘": <ic2:nuclear:10>,
	"◉": <industrialforegoing:black_hole_tank>,
	"▣": <industrialforegoing:black_hole_unit>,
	"▨": <mekanism:basicblock2:3>.withTag({tier: 2}),
	"▩": <mekanism:basicblock2:4>.withTag({tier: 3}),
	"▦": <ore:blockDraconiumAwakened>,
	"▤": <ore:blockMirion>,
	"▧": <ore:blockOsgloglas>,
	"◇": <ore:gemDilithium>,
	"▭": <ore:ingotMirion>,
	"▬": <ore:ingotUltimate>,
	"▢": <ore:plateElite>,
	"◽": <thermalexpansion:frame:148>,
	"♠": Bucket("ic2uu_matter"),
} as IIngredient[string];

	
# *======= Recipes =======*

# Ultimate Ingot
	mods.extendedcrafting.TableCrafting.addShapeless(0, <extendedcrafting:material:32>, 
	[
		<ore:ingotIridium>,
		<ore:ingotTitaniumIridium>,
		<ore:ingotConductiveIron>,
		<ore:ingotEnergium>,
		<ore:ingotRedstoneAlloy>,
		<ore:ingotConstantan>,
		<ore:ingotElectrumFlux>,
		<ore:ingotAlubrass>,
		<ore:ingotLumium>,
		<ore:ingotInvar>,
		<ore:ingotElectricalSteel>,
		<ore:ingotIronwood>,
		<ore:ingotFiery>,
		<ore:ingotEvilMetal>,
		<ore:ingotBrass>,
		<ore:ingotEnergeticAlloy>,
		<ore:ingotBronze>,
		<ore:ingotRefinedGlowstone>,
		<ore:ingotOsmium>,
		<ore:ingotSteel>,
		<ore:ingotSoularium>,
		<ore:ingotBoundMetal>,
		<ore:ingotDemonicMetal>,
		<ore:ingotSignalum>,
		<ore:ingotDraconiumAwakened>,
		<ore:ingotEndSteel>,
		<ore:ingotPigiron>,
		<ore:ingotManganese>,
		<ore:ingotBoron>,
		<ore:ingotSoulium>,
		<ore:ingotThorium>,
		<ore:ingotHeavy>,
		<ore:ingotArdite>,
		<ore:ingotLudicrite>,
		<ore:ingotElvenElementium>,
		<ore:ingotMagnesium>,
		<ore:ingotLithium>,
		<ore:ingotIvoryPsi>,
		<ore:ingotGraphite>,
		<ore:ingotEbonyPsi>,
		<ore:ingotBlackIron>,
		<ore:ingotPrimordial>,
		<ore:ingotKnightslime>,
		<ore:ingotUUMatter>,
		<ore:ingotAlumite>,
		<ore:dragonsteelIngot>,
		<ore:ingotSilver>,
		<ore:ingotAluminium>,
		<ore:ingotTungsten>,
		<ore:ingotDarkSteel>,
		<ore:ingotVoid>,
		<ore:ingotDraconium>,
		<ore:ingotRefinedObsidian>,
		<ore:ingotMelodicAlloy>,
		<ore:ingotTin>,
		<ore:ingotWyvernMetal>,
		<ore:ingotThaumium>,
		<ore:ingotAstralStarmetal>,
		<ore:ingotEnderEnhanced>,
		<ore:ingotManyullyn>,
		<ore:ingotGlitch>,
		<ore:ingotEndorium>,
		<ore:ingotEnderat>,
		<ore:ingotCrystaltine>,
		<ore:ingotGelidEnderium>,
		<ore:ingotCobalt>,
		<ore:ingotLead>,
		<ore:ingotEssenceMetal>,
		<ore:ingotEnderium>,
		<ore:ingotUranium>,
		<ore:ingotPulsatingIron>,
		<ore:ingotTerrasteel>,
		<ore:ingotPlatinum>,
		<ore:ingotPsi>,
		<ore:ingotOsmiridium>,
		<ore:ingotMithril>,
		<ore:ingotKnightmetal>,
		<ore:ingotZirconium>,
		<ore:ingotMirion>,
		<ore:ingotOsgloglas>,
		<ore:ingotEnchantedMetal>,
	]);
	

# Ultimate Block
	mods.extendedcrafting.TableCrafting.addShapeless(0, <extendedcrafting:storage:4>, 
	[
		<ore:blockIridium>,
		<ore:blockTitaniumIridium>,
		<ore:blockConductiveIron>,
		<ore:blockEnergium>,
		<ore:blockRedstoneAlloy>,
		<ore:blockConstantan>,
		<ore:blockElectrumFlux>,
		<ore:blockAlubrass>,
		<ore:blockLumium>,
		<ore:blockInvar>,
		<ore:blockElectricalSteel>,
		<twilightforest:block_storage>,
		<ore:blockFiery>,
		<ore:blockEvilMetal>,
		<ore:blockBrass>,
		<ore:blockEnergeticAlloy>,
		<ore:blockBronze>,
		<ore:blockRefinedGlowstone>,
		<ore:blockOsmium>,
		<ore:blockSteel>,
		<ore:blockSoularium>,
		<ore:blockBoundMetal>,
		<ore:blockDemonicMetal>,
		<ore:blockSignalum>,
		<ore:blockDraconiumAwakened>,
		<ore:blockEndSteel>,
		<ore:blockPigiron>,
		<ore:blockManganese>,
		<ore:blockBoron>,
		<ore:blockSoulium>,
		<ore:blockThorium>,
		<ore:blockHeavy>,
		<ore:blockArdite>,
		<ore:blockLudicrite>,
		<botania:storage:2>,
		<ore:blockMagnesium>,
		<ore:blockLithium>,
		<psi:psi_decorative:8>,
		<ore:blockGraphite>,
		<psi:psi_decorative:7>,
		<ore:blockBlackIron>,
		<ore:blockPrimordial>,
		<ore:blockKnightslime>,
		<ore:blockUUMatter>,
		<ore:blockAlumite>,
		<ore:blockDragonsteel>,
		<ore:blockSilver>,
		<ore:blockAluminium>,
		<endreborn:block_wolframium>,
		<ore:blockDarkSteel>,
		<ore:blockVoid>,
		<ore:blockDraconium>,
		<ore:blockRefinedObsidian>,
		<ore:blockMelodicAlloy>,
		<ore:blockTin>,
		<ore:blockWyvernMetal>,
		<ore:blockThaumium>,
		<ore:blockAstralStarmetal>,
		<extendedcrafting:storage:7>,
		<ore:blockManyullyn>,
		<ore:blockGlitch>,
		<endreborn:block_endorium>,
		<ore:blockEnderat>,
		<ore:blockCrystaltine>,
		<ore:blockGelidEnderium>,
		<ore:blockCobalt>,
		<ore:blockLead>,
		<ore:blockEssenceMetal>,
		<ore:blockEnderium>,
		<ore:blockUranium>,
		<ore:blockPulsatingIron>,
		<botania:storage:1>,
		<ore:blockPlatinum>,
		<psi:psi_decorative:1>,
		<ore:blockOsmiridium>,
		<ore:blockMithril>,
		<ore:blockKnightmetal>,
		<ore:blockZirconium>,
		<ore:blockMirion>,
		<ore:blockOsgloglas>,
		<ore:blockEnchantedMetal>,
	]);

# Creative Builder's Wand
	mods.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:itemcreativebuilderswand>, 
	[[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>], 
	[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>], 
	[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>]]);  

# Creative RFTools Screen
	mods.extendedcrafting.CombinationCrafting.addRecipe(<rftools:creative_screen>, 
	100000000, 1000000, <rftools:screen_controller>, 
	[<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <extrautils2:screen>, <extrautils2:screen>, 
	<extrautils2:screen>, <opencomputers:screen3>, 
	<opencomputers:screen2>, <opencomputers:screen1>]);


# [Rat Upgrade: Creative] from [Rat Upgrade_ Nonbeliever][+7]
craft.remake(<rats:rat_upgrade_creative>, ["pretty",
  "▬ W W W W W ▬",
  "W F R R R F W",
  "W R ▲ H ▲ R W",
  "W R C § C R W",
  "W R ▲ H ▲ R W",
  "W F R R R F W",
  "▬ W W W W W ▬"], {
  "R": <ore:myrmexResinGlass>,         # Desert Myrmex Resin Glass
  "▲": <scalinghealth:heartdust>,      # Heart Dust
  "C": <rats:chunky_cheese_token>,     # Chunky Cheese Token
  "F": <botania:brewflask>.withTag({brewKey: "overload"}), # Flask of Overload (6)
  "W": <ore:cheeseAnimania>,
  "§": <rats:rat_upgrade_nonbeliever>, # Rat Upgrade: Nonbeliever
  "H": <scalinghealth:heartcontainer>, # Heart Container
  "▬": <ore:ingotCrystaltine>,         # Crystaltine Ingot
});


# Creative Mana Tablet
	list["‡"] = <botania:laputashard>;
	list["‗"] = <ore:gaiaIngot>;
	list["◲"] = <botania:storage:1>;
	list["♰"] = <botania:pylon:2>;
	list["Ⰰ"] = <botania:manaringgreater>.withTag({mana: 2000000});
	list["₀"] = <botania:specialflower>.withTag({type: "narslimmus"});
	list["₁"] = <botania:specialflower>.withTag({type: "kekimurus"});
	list["₂"] = <botania:specialflower>.withTag({type: "gourmaryllis"});
	list["₃"] = <botania:specialflower>.withTag({type: "munchdew"});
	list["₄"] = <botania:specialflower>.withTag({type: "entropinnyum"});

	craft.make(<botania:manatablet>.withTag({mana: 500000, creative: 1 as byte}), ["pretty",
	"◰ ▭ ▭ ▭ ◰ ▭ ▭ ▭ ◰", 
	"▭ ‡ ♦ ♦ ♦ ♦ ♦ ‡ ▭", 
	"▭ ♦ ‗ ◲ ♰ ◲ ‗ ♦ ▭", 
	"▭ ♦ ◲ ₀ ₁ ₃ ◲ ♦ ▭", 
	"◰ ♦ ♰ ₁ Ⰰ ₁ ♰ ♦ ◰", 
	"▭ ♦ ◲ ₂ ₁ ₄ ◲ ♦ ▭", 
	"▭ ♦ ‗ ◲ ♰ ◲ ‗ ♦ ▭", 
	"▭ ‡ ♦ ♦ ♦ ♦ ♦ ‡ ▭", 
	"◰ ▭ ▭ ▭ ◰ ▭ ▭ ▭ ◰"], list);
	
# Everlasting Guilty Pool
	list["∪"] = <botania:pool:3>;

	craft.make(<botania:pool:1>, ["pretty",
	"∪ ▭ ▭ ▭ ∪ ▭ ▭ ▭ ∪",
	"▭ ‡ ♦ ♦ ♦ ♦ ♦ ‡ ▭",
	"▭ ♦ ‗ ◲ ♰ ◲ ‗ ♦ ▭",
	"▭ ♦ ◲ ₀ ₁ ₃ ◲ ♦ ▭",
	"∪ ♦ ♰ ₁ Ⰰ ₁ ♰ ♦ ∪",
	"▭ ♦ ◲ ₂ ₁ ₄ ◲ ♦ ▭",
	"▭ ♦ ‗ ◲ ♰ ◲ ‗ ♦ ▭",
	"▭ ‡ ♦ ♦ ♦ ♦ ♦ ‡ ▭",
	"∪ ▭ ▭ ▭ ∪ ▭ ▭ ▭ ∪"], list);


# [Creative Gas Tank] from [Centrifuge Tank][+17]
craft.remake(<mekanism:gastank>.withTag({tier: 4}), ["pretty",
  "▬ ▬ ▬ ■ ◘ ■ ▬ ▬ ▬",
  "▬ R ▄ ♦ ◘ ♦ ▄ R ▬",
  "▬ ▀ U - E - v ▀ ▬",
  "■ ◊ G A B A G ◊ ■",
  "◘ ◘ E B C B E ◘ ◘",
  "■ ◊ G A B A G ◊ ■",
  "▬ ▀ i - E - n ▀ ▬",
  "▬ R ▄ ♦ ◘ ♦ ▄ R ▬",
  "▬ ▬ ▬ ■ ◘ ■ ▬ ▬ ▬"], {
  "▬": <ore:ingotUltimate>,               # The Ultimate Ingot
  "■": <ore:blockLudicrite>,              # Ludicrite Block
  "R": <extrautils2:drum:2>,              # Reinforced Large Drum
  "▄": <ore:blockOsgloglas>,              # Osgloglas Block
  "♦": <ore:gemAnglesite>,                # Anglesite
  "▀": <ore:blockMirion>,                 # Mirion Block
  "-": <ore:ingotCosmicNeutronium>,       # Neutronium Ingot
  "E": <advgenerators:turbine_enderium>,  # Enderium Turbine
  "◊": <ore:gemBenitoite>,                # Benitoite
  "G": <advancedrocketry:oxygencharger>,  # Gas Charge Pad
  "A": <draconicevolution:awakened_core>, # Awakened Core
  "B": <bloodmagic:blood_tank:9>,         # Blood Tank Tier 10
  "C": <plustic:centrifuge>,              # Centrifuge Tank
  "n": FluidCell("aerotheum"),            # Universal Fluid Cell
  "i": FluidCell("exhauststeam"),         # Universal Fluid Cell
  "U": FluidCell("helium3"),              # Universal Fluid Cell
  "v": FluidCell("tritium"),              # Universal Fluid Cell
  "◘": FluidCell("vapor_of_levity"),      # Universal Fluid Cell
});

recipes.addShapeless("Creative Gas Tank Clearing", 
<mekanism:gastank>.withTag({tier: 4}), [<mekanism:gastank>.withTag({tier: 4})]);


# *======= Fluid Trophy Frame =======*

recipes.remove(<plustic:centrifuge:1>);
var creativeFluidTankFrame = <plustic:centrifuge:1>;

function advTank(fluid as string) as IIngredient {
	return <mekanism:machineblock2:11>.withTag({tier: 1, mekData: {fluidTank: {FluidName: fluid, Amount: 400000}}});
}

recipes.addShapeless("creative Fluid Tank Frame", creativeFluidTankFrame, [
	advTank("cloud_seed_concentrated"), Bucket("corium")      , advTank("essence")    ,
	Bucket("red_matter")              , Bucket("perfect_fuel"), Bucket("ic2uu_matter"),
	advTank("witchwater")             , Bucket("crystal")     , advTank("plasma")     ,
]);

# *======= Mekanism Creative Tank =======*
list["⍤"] = <mekanism:gastank>.withTag({tier: 4});
list["✝"] = <draconicevolution:chaotic_core>;
list["♥"] = creativeFluidTankFrame;
list["♀"] = <mctsmelteryio:upgrade:4>;
list["θ"] = <ic2:te:134>;
list["◆"] = <enderio:item_capacitor_stellar>;


craft.make( <mekanism:machineblock2:11>.withTag({tier: 4}), ["pretty",
"◉ ◉ ♀ ♀ ◆ ♀ ♀ . .",
"◉ ◽ ▬ ▬ ◊ ▬ ▬ ◽ .",
"θ ▬ ⩉ ⩉ ⩉ ⩉ ⩉ ▬ .",
"θ ▬ ⩉ ж ✝ ж ⩉ ▬ .",
"◆ ◊ ⩉ ☠ ♥ ☠ ⩉ ◊ .",
"θ ▬ ⩉ ж ⍤ ж ⩉ ▬ .",
"θ ▬ ⩉ ⩉ ⩉ ⩉ ⩉ ▬ .",
". ◽ ▬ ▬ ◊ ▬ ▬ ◽ .",
". . . . . . . . ."], list);

recipes.addShapeless("Creative Tank Reset", 
<mekanism:machineblock2:11>.withTag({tier: 4}), 
[<mekanism:machineblock2:11>.withTag({tier: 4})]);

	list["π"] = <storagedrawers:upgrade_creative:1>;
	list["ρ"] = <botania:exchangerod>;
	list["ς"] = <buildinggadgets:exchangertool>;

# DE Creative Block Exchanger
	craft.make(<draconicevolution:creative_exchanger>, ["pretty",
	"    ☠            ", 
	"      ☠          ", 
	"☠   π ☠          ", 
	"  ☠ ☠ ρ ☠        ", 
	"      ☠ ☠        ", 
	"          ☠ ☠    ", 
	"          ☠ ς ☠  ", 
	"            ☠ ☠  ", 
	"                ◊"], list);

# [Creative Modifier] from [Gold Singularity][+10]
craft.remake(<tconstruct:materials:50>, ["pretty",
  "S A A A S",
  "▀ ■ □ ■ ▄",
  "▀ s G M ▄",
  "▀ ■ O ■ ▄",
  "S P P P S"], {
  "■": <tconstruct:metal:6>,             # Silky Block of Jewel
  "▀": <ore:blockKnightslime>,           # Block of Knightslime
  "P": <ore:blockPigiron>,               # Block of Pigiron
  "A": <ore:blockAlubrass>,              # Block of Aluminum Brass
  "□": <tconevo:material:2>,             # Plate of Unsealing
  "S": <cyclicmagic:soulstone>,          # Soulstone
  "s": <ore:blockOsgloglas>,             # Osgloglas Block
  "▄": <ore:blockAlumite>,               # Alumite Block
  "G": <extendedcrafting:singularity:5>, # Gold Singularity
  "M": <ore:blockMirion>,                # Mirion Block
  "O": <ore:blockOsmiridium>,            # Osmiridium Block
});


# AE2 Creative Cell
	craft.make(<appliedenergistics2:creative_storage_cell>, ["pretty",
	"        ◱        ",
	"      ☒ ⱋ ☒      ",
	"    ◱ ⱋ ⱎ ⱋ ◱    ",
	"  ☒ ⱋ ⱎ ☑ ⱎ ⱋ ☒  ",
	"◱ ⱋ ⱎ ☑ π ☑ ⱎ ⱋ ◱",
	"  ☒ ⱋ ⱎ ☑ ⱎ ⱋ ☒  ",
	"    ◱ ⱋ ⱎ ⱋ ◱    ",
	"      ☒ ⱋ ☒      ",
	"        ◱        "], list);
	

# [Creative Flux Capacitor] from [Infinity Catalyst][+4]
craft.remake(<draconicevolution:draconium_capacitor:2>.withTag({Energy: 1073741823}), ["pretty",
  "        ■        ",
  "    ▬ ▬ ■ ▬ ▬    ",
  "  ▬ □ □ ■ □ □ ▬  ",
  "  ▬ □ D D D □ ▬  ",
  "■ ■ ■ D I D ■ ■ ■",
  "  ▬ □ D D D □ ▬  ",
  "  ▬ □ □ ■ □ □ ▬  ",
  "    ▬ ▬ ■ ▬ ▬    ",
  "        ■        "], {
  "■": <ore:blockDraconiumAwakened>,              # Awakened Draconium Block
  "▬": <ore:ingotUltimate>,                       # The Ultimate Ingot
  "□": <tconstruct:large_plate>.withTag({Material: "red_matter"}), # Red Matter Large Plate
  "D": <draconicevolution:draconium_capacitor:1>, # Draconic Flux Capacitor
  "I": <avaritia:resource:5>,                     # Infinity Catalyst
});


# [Creative Mill] from [Deep Dark Portal][+11]
craft.remake(<extrautils2:passivegenerator:6>, ["pretty",
  "C ■ ⌃ W ⌃ ■ C",
  "■ ⌃ a a a ⌃ ■",
  "⌃ L O B O i ⌃",
  "W L A D A i W",
  "⌃ L O B O i ⌃",
  "■ ⌃ F F F ⌃ ■",
  "C ■ ⌃ W ⌃ ■ C"], {
  "■": <ore:blockDraconiumCharged>,      # Charged Draconium Block
  "a": <extrautils2:passivegenerator:3>, # Water Mill
  "A": <bigreactors:mineralanglesite>,   # Anglesite
  "B": <bigreactors:mineralbenitoite>,   # Benitoite
  "⌃": <extrautils2:decorativesolid:6>,  # Blue Quartz
  "C": <extendedcrafting:material:12>,   # Crystaltine Catalyst
  "D": <extrautils2:teleporter:1>,       # Deep Dark Portal
  "F": <extrautils2:passivegenerator:5>, # Fire Mill
  "W": <draconicevolution:wyvern_core>,  # Wyvern Core
  "i": <extrautils2:passivegenerator:4>, # Wind Mill
  "L": <extrautils2:passivegenerator:2>, # Lava Mill
  "O": <extrautils2:opinium:6>,          # Opinium Core (Amazing)
});



list["τ"] = utils.tryCatch("notenoughrtgs:rtg_californium_compact", <nuclearcraft:rtg_californium>);
list["⁴"] = <environmentaltech:solar_cont_4>;
list["⁵"] = <environmentaltech:solar_cont_5>;
list["⁶"] = <environmentaltech:solar_cont_6>;
list["⫲"] = <extrautils2:decorativesolid:8>;
list["V"] = <ic2:te:22>;
list["W"] = <mekanismgenerators:reactor>;
list["X"] = <tconevo:metal_block:1>;
list["■"] = <draconicevolution:fusion_crafting_core>;
list["κ"] = <extrautils2:decorativesolid:6>;

# Mekanism Creative Energy
list["☹"] = <draconicevolution:draconium_capacitor:1>;
var creativeCube = <mekanism:energycube>.withTag({tier:4,mekData:{energyStored:1.7976931348623157E308}});
craft.make(creativeCube, ["pretty",
	"◘ ◘ ◙ ◙ τ . . . .",
	"◘ ◊ V ▩ ▩ . . . .",
	"☠ V W ◽ ⁵ . . . .",
	"☠ ▨ ◽ ■ ☹ . . . .",
	"κ ▨ ⁵ ⫲ X . . . .",
	". . . . . . . . .",
	". . . . . . . . .",
	". . . . . . . . .",
	". . . . . . . . ."], list);

recipes.addHiddenShapeless('Recharging cube', creativeCube, [<mekanism:energycube>.withTag({tier:4,mekData:{}})]);

# [Creative Wireless Ultimate Terminal] from [Creative Energy Cube][+4]
craft.make(<ae2wtlib:wut_creative>, ["pretty",
  "  e  ",
  "r Ϟ i",
  "  W  "], {
  "e": <wct:wct:*>.withTag({}), # Wireless Crafting Terminal
  "r": <wpt:wpt:*>.withTag({}), # Wireless Pattern Terminal
  "Ϟ": creativeCube.reuse(), # Creative Energy Cube
  "i": <wft:wft:*>.withTag({}), # Wireless Fluid Terminal
  "W": <wit:wit:*>.withTag({}), # Wireless Interface Terminal
});

# [Creative Vending Upgrade] from [Lamp of Cinders][+18]
craft.make(<storagedrawers:upgrade_creative:1>, ["pretty",
  "* B T T ♦ T T B *",
  "B ◘ ◘ S 1 S ◘ ◘ B",
  "T ◘ ■ C ◊ C ■ ◘ T",
  "T S r e ▬ a r S T",
  "♦ 1 ◊ D L D ◊ 1 ♦",
  "T S r Ϟ ▬ o r S T",
  "T ◘ ■ C ◊ C ■ ◘ T",
  "B ◘ ◘ S 1 S ◘ ◘ B",
  "* B T T ♦ T T B *"], {
  "*": <ore:blockCrystalMatrix>,              # Crystal Matrix
  "B": <industrialforegoing:black_hole_unit>, # Black Hole Unit
  "T": <extendedcrafting:material:13>,        # The Ultimate Catalyst
  "♦": <ore:gemAnglesite>,                    # Anglesite
  "◘": <thermalexpansion:frame:148>,          # Resonant Cell Frame (Full)
  "S": <threng:material:14>,                  # Speculative Processor
  "1": <aeadditions:storage.component:3>,     # 16384k ME Storage Component
  "■": <ore:blockAethium>,                    # Aethium
  "C": <draconicevolution:chaotic_core>,      # Chaotic Core
  "◊": <ore:gemBenitoite>,                    # Benitoite
  "r": <tconstruct:large_plate>.withTag({Material: "red_matter"}),
  "▬": <ore:ingotInfinity>,                   # Infinity Ingot
  "D": <draconicevolution:reactor_core>,      # Draconic Reactor Core
  "o": <environmentaltech:solar_cont_6>,      # Solar Array Controller Tier 6
  "L": <twilightforest:lamp_of_cinders>.anyDamage(), # Lamp of Cinders
  "e": <mekanism:machineblock2:11>.withTag({tier: 4}), # Creative Fluid Tank
  "a": <mekanism:gastank>.withTag({tier: 4}), # Creative Gas Tank
  "Ϟ": creativeCube, 													# Creative Energy Cube
});

recipes.addHiddenShapeless("Creative Storage Upgrade Duplication", 
<storagedrawers:upgrade_creative:1> * 2, 
[<storagedrawers:upgrade_creative:1>]);

# Add later
recipes.remove(<twilightforest:uncrafting_table>);
recipes.remove(<cyclicmagic:uncrafting_block>);
