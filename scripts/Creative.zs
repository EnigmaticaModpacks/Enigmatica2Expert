import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemCondition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# *======= Gas Trophy Frame =======*

var creativeGasTankFrame = <simple_trophies:trophy>.withTag({
	TrophyItem:{id:"mekanism:gastank",Count:1 as byte, Damage:0 as short},
	TrophyName:"Creative Gas Tank Frame",
	TrophyVariant:"gold"
});

# Add to JEI and apply Information
mods.jei.JEI.addItem(creativeGasTankFrame);
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
var gt as IIngredient = <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000/* , gasName: allGasesNames[0] */}}}) as IIngredient;
for i in 0 to allGasesNames.length {
  if (!isNull(mods.mekanism.MekanismHelper.getGas(allGasesNames[i]))) {
    gt = gt.or( <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: allGasesNames[i]}}}) );
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
    return out;
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
	"☑": <draconicevolution:draconium_chest>,
	"☠": <extendedcrafting:material:13>,
	"ⱋ": <extracells:storage.component:3>,
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
	"▨": <mekanism:basicblock2:3>.withTag({tier: 3}),
	"▩": <mekanism:basicblock2:4>.withTag({tier: 3}),
	"⍤": <mekanism:gastank>.withTag({tier: 4}),
	"⍣": <mekanism:machineblock2:11>.withTag({tier: 4}),
	"ⰷ": <mysticalagradditions:stuff:69>,
	"▦": <ore:blockDraconiumAwakened>,
	"▤": <ore:blockMirion>,
	"▧": <ore:blockOsgloglas>,
	"◇": <ore:gemDilithium>,
	"▭": <ore:ingotMirion>,
	"▬": <ore:ingotUltimate>,
	"▢": <ore:plateElite>,
	"▥": <thermalexpansion:cell>.withTag({Level: 4 as byte}),
	"◽": <thermalexpansion:frame:148>,
	"♠": Bucket("ic2uu_matter"),
	"♣": Bucket("rocket_fuel"),
} as IIngredient[string];



var twilightForestMasterTrophy = <simple_trophies:trophy>.withTag({
  TrophyItem:{id:"twilightforest:trophy",Count:1 as byte, Damage:5 as short},
  TrophyName:"Twilight Forest Master Trophy",
  TrophyVariant:"gold"
});

# Twilight Forest Master Trophy
	recipes.addShapedMirrored("Twilight Forest Master Trophy", twilightForestMasterTrophy, 
	[[<twilightforest:trophy>, <twilightforest:trophy:1>, <twilightforest:trophy:2>],
	[<twilightforest:trophy:5>, <ore:blockCrystalMatrix>, <twilightforest:trophy:3>], 
	[<twilightforest:trophy:4>, <twilightforest:trophy:8>, <twilightforest:trophy:6>]]);

# Master Trophy
	mods.jei.JEI.addItem(twilightForestMasterTrophy);
	
# *======= Recipes =======*

# Mystical Agradditions Creative Essence
	list["α"] = <ore:blockInsaniumEssence>;
	list["β"] = <ore:ingotVoid>;
	list["γ"] = <ore:essenceTier6>;
	list["δ"] = <ore:blockBaseEssence>;
	list["ε"] = <ore:blockInsanium>;

	craft.make( <mysticalagradditions:stuff:69>, ["pretty",
	"α β α β α",
	"β γ δ γ β",
	"α δ ε δ α",
	"β γ δ γ β",
	"α β α β α"], list);

# Ultimate Ingot
	mods.extendedcrafting.TableCrafting.addShapeless(0, <extendedcrafting:material:32>, 
	[<nuclearcraft:ingot:3>, <nuclearcraft:ingot:5>, <minecraft:iron_ingot>,<minecraft:gold_ingot>,
	<advancedrocketry:productingot>,<advancedrocketry:productingot:1>,<advancedrocketry:misc:1>,
	<astralsorcery:itemcraftingcomponent:1>,<botania:manaresource>,<botania:manaresource:4>,
	<botania:manaresource:7>,<draconicevolution:draconium_ingot>,<draconicevolution:draconic_ingot>,
	<extendedcrafting:material>,<extendedcrafting:material:24>,<extrautils2:ingredients:11>,<extrautils2:ingredients:12>,
	<extrautils2:ingredients:17>,<bigreactors:ingotcyanite>,<bigreactors:ingotblutonium>,
	<bigreactors:ingotludicrite>,<immersiveengineering:material:19>,<immersiveengineering:metal:5>,
	<mekanism:ingot>,<mekanism:ingot:1>,<mekanism:ingot:3>,<thermalfoundation:material:131>,
	<thermalfoundation:material:132>,<thermalfoundation:material:133>,<thermalfoundation:material:134>,
	<thermalfoundation:material:135>,<thermalfoundation:material:136>,<thermalfoundation:material:160>,
	<thermalfoundation:material:161>,<nuclearcraft:ingot:6>,<nuclearcraft:ingot:7>,<nuclearcraft:ingot:8>,
	<nuclearcraft:ingot:9>,<nuclearcraft:ingot:10>,<nuclearcraft:alloy:1>,<nuclearcraft:alloy:2>,
	<nuclearcraft:alloy:3>,<nuclearcraft:alloy:4>,<nuclearcraft:alloy:6>,<plustic:alumiteingot>,
	<plustic:osgloglasingot>,<plustic:osmiridiumingot>,<plustic:mirioningot>,<psi:material:1>,
	<psi:material:3>,<psi:material:4>,<redstonearsenal:material:32>,<twilightforest:ironwood_ingot>,
	<twilightforest:fiery_ingot>,<twilightforest:knightmetal_ingot>,<thermalfoundation:material:128>,
	<thermalfoundation:material:129>,<thermalfoundation:material:162>,<thermalfoundation:material:163>,
	<thermalfoundation:material:164>,<thermalfoundation:material:165>,<thermalfoundation:material:166>,
	<thermalfoundation:material:167>,<tconstruct:ingots>,<tconstruct:ingots:1>,<tconstruct:ingots:2>,
	<tconstruct:ingots:3>,<tconstruct:ingots:4>,<tconstruct:ingots:5>,<libvulpes:productingot:3>,
	<libvulpes:productingot:7>, <extendedcrafting:material:36>, <extendedcrafting:material:48>,
	<enderio:item_alloy_ingot:8>, <enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:2>,
	<enderio:item_alloy_ingot>, <mysticalagradditions:insanium:2>, <thaumcraft:ingot:2>,
	<thaumcraft:ingot>, <thaumcraft:ingot:1>]);
	
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



# Storage Drawers Unlimited Withdrawel Upgrade
	list["χ"] = <ore:blockCrystalMatrix>;
	list["◳"] = <ore:blockAethium>;
	list["✝"] = <draconicevolution:chaotic_core>;
	list["⌧"] = <ore:ingotInfinity>;
	list["⇯"] = <rftools:powercell_creative>;
	list["⇫"] = <ic2:te:86>;
	list["⇬"] = <environmentaltech:solar_cont_6>;
	list["⇭"] = twilightForestMasterTrophy;

	craft.make(<storagedrawers:upgrade_creative:1> * 2, ["pretty",
	"χ ▣ ☠ ☠ ◊ ☠ ☠ ▣ χ",
	"▣ ◽ ◽ ☑ ⱋ ☑ ◽ ◽ ▣",
	"☠ ◽ ◳ ✝ ♦ ✝ ◳ ◽ ☠",
	"☠ ☑ ⰷ ⇯ ⌧ ⇫ ⰷ ☑ ☠",
	"◊ ⱋ ♦ ⇬ ⇭ ⇬ ♦ ⱋ ◊",
	"☠ ☑ ⰷ ⍣ ⌧ ⍤ ⰷ ☑ ☠",
	"☠ ◽ ◳ ✝ ♦ ✝ ◳ ◽ ☠",
	"▣ ◽ ◽ ☑ ⱋ ☑ ◽ ◽ ▣",
	"χ ▣ ☠ ☠ ◊ ☠ ☠ ▣ χ"], list);
	
	recipes.addShapeless("Creative Storage Upgrade Duplication", 
	<storagedrawers:upgrade_creative:1> * 2, 
	[<storagedrawers:upgrade_creative:1>]);

	
# Psi Creative Rod Frame
	mods.extendedcrafting.TableCrafting.addShaped(4, <psi:cad_assembly:5>, 
	[[<psi:cad_assembly:4>, <psi:cad_assembly:4>, <ore:ingotIvoryPsi>, null, null, null, null, null, null], 
	[<psi:cad_assembly:4>, <ore:blockInfinity>, <psi:cad_assembly:4>, <ore:ingotIvoryPsi>, null, null, null, null, null], 
	[<ore:ingotIvoryPsi>, <psi:cad_assembly:4>, <psi:cad_colorizer_:16>, <psi:cad_assembly:4>, null, null, null, null, null], 
	[null, <ore:ingotIvoryPsi>, <psi:cad_assembly:4>, <bigreactors:mineralbenitoite>, <bigreactors:mineralbenitoite>, null, null, null, null], 
	[null, null, null, <bigreactors:mineralbenitoite>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null, null, null], 
	[null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null, null], 
	[null, null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null], 
	[null, null, null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <bigreactors:mineralbenitoite>], 
	[null, null, null, null, null, null, null, <bigreactors:mineralbenitoite>, <bigreactors:mineralbenitoite>]]); 

	list["π"] = <storagedrawers:upgrade_creative:1>;
	list["ρ"] = <botania:exchangerod>;
	list["ς"] = <buildinggadgets:exchangertool>.withTag({});

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
	
# Creative Wireless Crafting Terminal
	recipes.addShapeless("Creative Wireless Crafting Terminal", 
	<wct:wct_creative>, 
	[<wct:wct>.withTag({}),<rftools:powercell_creative>.anyDamage()]);


# TIC Creative Modifier
	list["F"] = <ore:blockPigiron>;
	list["G"] = <ore:blockAlubrass>;
	list["H"] = <tconstruct:materials:19>;
	list["I"] = <ore:blockManyullyn>;
	list["J"] = <ore:blockOsmiridium>;
	list["K"] = <ore:slimecrystalBlue>;
	list["L"] = <tconstruct:large_plate>.withTag({Material: "xu_magical_wood"});
	list["M"] = <ore:blockKnightslime>;
	list["N"] = <ore:slimecrystalGreen>;
	list["O"] = <ore:blockAlumite>;
	list["P"] = <tconstruct:metal:6>;
	list["Q"] = <tconstruct:materials:12>;
	list["R"] = <tconstruct:materials:13>;
	list["S"] = <extendedcrafting:singularity:5>;
	list["T"] = <ore:slimecrystalMagma>;

	craft.make( <tconstruct:materials:50>, ["pretty",
	"F G H H H H H G F",
	"G F I J J J I F G",
	"K I L M M M L I N",
	"K O M P Q P M ▤ N",
	"K O M R S R M ▤ N",
	"K O M P Q P M ▤ N",
	"K I L M M M L I N",
	"G F I ▧ ▧ ▧ I F G",
	"F G T T T T T G F"], list);

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
	

# Draconic Evolution Creative Flux Capacitor
	list["σ"] = <avaritia:resource:5>;
	craft.make(<draconicevolution:draconium_capacitor:2>.withTag({Energy: 1073741823}), ["pretty",
	"        ▦        ",
	"    ▬ ▬ ▦ ▬ ▬    ",
	"  ▬ ⰷ ⰷ ▦ ⰷ ⰷ ▬  ",
	"  ▬ ⰷ Ж Ж Ж ⰷ ▬  ",
	"▦ ▦ ▦ Ж σ Ж ▦ ▦ ▦",
	"  ▬ ⰷ Ж Ж Ж ⰷ ▬  ",
	"  ▬ ⰷ ⰷ ▦ ⰷ ⰷ ▬  ",
	"    ▬ ▬ ▦ ▬ ▬    ",
	"        ▦        "], list);
	


list["τ"] = <nuclearcraft:rtg_californium>;
list["ψ"] = <environmentaltech:solar_cont_4>;
list["υ"] = <environmentaltech:solar_cont_5>;
list["φ"] = <draconicevolution:draconic_energy_core>;
list["⫲"] = <extrautils2:rainbowgenerator>;

# RFTools Creative Powercell
	craft.make(<rftools:powercell_creative>, ["pretty",
	"◘ ◽ ▬ ▬ ▬ ▬ ▬ ◽ ◘",
	"◽ τ ▢ ◊ ◇ ◊ ▢ τ ◽",
	"▬ ▢ ▩ ▥ υ ▥ ▩ ▢ ▬",
	"▬ ♦ ▥ ▨ φ ▨ ▥ ♦ ▬",
	"▬ ◇ ψ ⫲ ☠ ⫲ ψ ◇ ▬",
	"▬ ♦ ▥ ▨ φ ▨ ▥ ♦ ▬",
	"▬ ▢ ▩ ▥ υ ▥ ▩ ▢ ▬",
	"◽ τ ▢ ◊ ◇ ◊ ▢ τ ◽",
	"◘ ◽ ▬ ▬ ▬ ▬ ▬ ◽ ◘"], list);
	
/*  •■◆○◎◯◴◵◶◷☹♀♥♪♫♱✓⸕₅₆₇₈₉⇮⫳⩈  */


# Mekanism Creative Tank
	list["a"] = Bucket("milk_goat");
	list["b"] = Bucket("blood");
	list["c"] = Bucket("liquiddna");
	list["d"] = Bucket("juice");
	list["e"] = Bucket("mutagen");
	list["f"] = Bucket("biomass");
	list["g"] = Bucket("empoweredoil");
	list["h"] = Bucket("witchwater");
	list["i"] = Bucket("xu_demonic_metal");
	list["j"] = Bucket("essence");
	list["k"] = Bucket("draconium");
	list["l"] = Bucket("sewage");
	list["m"] = Bucket("pyrotheum");
	list["n"] = Bucket("ic2pahoehoe_lava");
	list["o"] = Bucket("aerotheum");
	list["p"] = Bucket("clay");
	list["q"] = Bucket("essence");
	list["r"] = Bucket("tritium");
	list["s"] = Bucket("ender");
	list["t"] = Bucket("cryotheum");
	list["u"] = Bucket("petrotheum");
	list["v"] = Bucket("refined_fuel");
	list["w"] = Bucket("mirion");
	list["x"] = Bucket("neutron");
	list["A"] = <industrialforegoing:black_hole_tank>;
	list["B"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "bio.ethanol", Amount: 32000}});
	list["C"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "tree_oil", Amount: 32000}});
	list["D"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "ic2uu_matter", Amount: 32000}});
	list["E"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "mana", Amount: 32000}});

	craft.make( <mekanism:machineblock2:11>.withTag({tier: 4, mekData:{}}), ["pretty",
	"A a b c B d e f A",
	"g ◽ ▬ ▬ ◊ ▬ ▬ ◽ h",
	"i ▬ ⩉ ⩉ ⩉ ⩉ ⩉ ▬ j",
	"k ▬ ⩉ ж ☠ ж ⩉ ▬ l",
	"C ◊ ⩉ ☠ ✝ ☠ ⩉ ◊ D",
	"m ▬ ⩉ ж ☠ ж ⩉ ▬ n",
	"o ▬ ⩉ ⩉ ⩉ ⩉ ⩉ ▬ p",
	"q ◽ ▬ ▬ ◊ ▬ ▬ ◽ r",
	"A s t u E v w x A"], list);

	recipes.addShapeless("Creative Tank Reset", 
	<mekanism:machineblock2:11>.withTag({tier: 4, mekData: {}}), 
	[<mekanism:machineblock2:11>.withTag({tier: 4})]);


# ExU2 Mill
	craft.make(<extrautils2:passivegenerator:6>, ["pretty",
	"ⱄ ⱄ ▬ ☐ ☐ ☐ ▬ ⱄ ⱄ",
	"ⱄ ▬ ◩ ◩ ◊ ◩ ◩ ▬ ⱄ",
	"▬ ◧ ♦ ♂ ☺ ♂ ♦ ◪ ▬",
	"☐ ◧ ♂ ⰻ φ ⰻ ♂ ◪ ☐",
	"☐ ◊ ☺ φ ж φ ☺ ◊ ☐",
	"☐ ◧ ♂ ☼ φ ☼ ♂ ◪ ☐",
	"▬ ◧ ♦ ♂ ☺ ♂ ♦ ◪ ▬",
	"ⱄ ▬ ◨ ◨ ◊ ◨ ◨ ▬ ⱄ",
	"ⱄ ⱄ ▬ ☐ ☐ ☐ ▬ ⱄ ⱄ"], list);
	
# IC2 Creative Generator	
	list["U"] = <ic2:te:75>;
	list["V"] = <ic2:te:22>;
	list["W"] = <nuclearcraft:fusion_core>;
	list["X"] = <extrautils2:decorativesolid:8>;

	craft.make(  <ic2:te:86>, ["pretty",
	"♠ ◘ ◘ ◘ ♠ ◘ ◘ ◘ ♠",
	"◙ ▩ ▩ ◊ ◊ ◊ ▩ ▩ ◙",
	"◙ ▩ U V W V U ▩ ◙",
	"◙ ◊ V ▨ ☠ ▨ V ◊ ◙",
	"♠ ◊ W ☠ X ☠ W ◊ ♠",
	"◙ ◊ V ▨ ☠ ▨ V ◊ ◙",
	"◙ ▩ U V W V U ▩ ◙",
	"◙ ▩ ▩ ◊ ◊ ◊ ▩ ▩ ◙",
	"♠ ◘ ◘ ◘ ♠ ◘ ◘ ◘ ♠"], list);

# Creative Gas Tank
	list["ζ"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "neutron", Amount: 512000}, Level: 3 as byte});
	list["η"] = <avaritia:resource:4>;
	list["θ"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "mana", Amount: 512000}, Level: 3 as byte});
	list["ι"] = <advancedrocketry:liquidtank>;
	list["κ"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "ic2uu_matter", Amount: 512000}, Level: 3 as byte});
	list["λ"] = <thermalexpansion:tank>.withTag({Fluid: {FluidName: "liquiddna", Amount: 512000}, Level: 3 as byte});
	list["μ"] = creativeGasTankFrame;

	craft.make( <mekanism:gastank>.withTag({tier: 4, mekData: {}}), ["pretty",
	"▬ ▬ ▬ ◫ ♣ ◫ ▬ ▬ ▬",
	"▬ ◉ ▧ ◊ ♣ ◊ ▧ ◉ ▬",
	"▬ ▤ ζ η ☠ η θ ▤ ▬",
	"◫ ♦ ⰱ ж ι ж ⰱ ♦ ◫",
	"♣ ♣ ☠ ι μ ι ☠ ♣ ♣",
	"◫ ♦ ⰱ ж ⍣ ж ⰱ ♦ ◫",
	"▬ ▤ κ η ☠ η λ ▤ ▬",
	"▬ ◉ ▧ ◊ ♣ ◊ ▧ ◉ ▬",
	"▬ ▬ ▬ ◫ ♣ ◫ ▬ ▬ ▬"], list);

	recipes.addShapeless("Creative Gas Tank Reset", 
	<mekanism:gastank>.withTag({tier: 4, mekData: {}}), 
	[<mekanism:gastank>.withTag({tier: 4})]);