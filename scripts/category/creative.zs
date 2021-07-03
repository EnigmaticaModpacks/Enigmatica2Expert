import crafttweaker.item.IItemCondition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.craft.grid.Grid;
import mods.artisanworktables.builder.RecipeBuilder;

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
var gt as IIngredient = <mekanism:gastank>.withTag({tier: 1, mekData: { stored: {amount: 320000/* , gasName: allGasesNames[0] */}}}) as IIngredient;
for i in 0 to allGasesNames.length {
  if (!isNull(mods.mekanism.MekanismHelper.getGas(allGasesNames[i]))) {
    gt = gt.or( <mekanism:gastank>.withTag({tier: 1, mekData: { stored: {amount: 320000, gasName: allGasesNames[i]}}}) );
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
	"☑": <threng:material:14>, # Speculative Processor
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
	"ⰷ": <mysticalagradditions:stuff:69>,
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



var twilightForestMasterTrophy = <simple_trophies:trophy>.withTag({
  TrophyItem:{id:"twilightforest:miniature_structure",Count:1 as byte, Damage:0 as short},
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
	scripts.wrap.extendedcrafting.TableCrafting.addShapeless(0, <extendedcrafting:material:32>, 
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
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:itemcreativebuilderswand>, 
	[[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>], 
	[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>], 
	[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>]]);  

# Creative RFTools Screen
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<rftools:creative_screen>, 
	100000000, 1000000, <rftools:screen_controller>, 
	[<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <extrautils2:screen>, <extrautils2:screen>, 
	<extrautils2:screen>, <opencomputers:screen3>, 
	<opencomputers:screen2>, <opencomputers:screen1>]);


# Rat upgrade
craft.make( <rats:rat_upgrade_creative>, ["pretty",
		"▬ ▢ ▢ ▢ ▢ ▢ ▬",
		"▢ ⩉ ☼ ☼ ☼ ⩉ ▢",
		"▢ ☼ ◊ ♥ ◊ ☼ ▢",
		"▢ ☼ ♥ ◪ ♥ ☼ ▢",
		"▢ ☼ ◊ ♥ ◊ ☼ ▢",
		"▢ ⩉ ☼ ☼ ☼ ⩉ ▢",
		"▬ ▢ ▢ ▢ ▢ ▢ ▬"], {
	"▢": <ore:cheeseWheels>,
	"▬": <extendedcrafting:material:24>,
	"☼": <rats:chunky_cheese_token>,
	"⩉": <botania:brewflask>.withTag({brewKey: "overload"}),
	"◊": <scalinghealth:difficultychanger>,
	"♥": <scalinghealth:heartcontainer>,
	"◪": <rats:rat_upgrade_nonbeliever>,
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


# Creative Gas Tank
list["η"] = <avaritia:resource:4>;
list["ι"] = <bloodmagic:blood_tank:9>;
list["◴"] = Bucket("helium3");
list["◵"] = Bucket("tritium");
list["◶"] = Bucket("fluegas");
list["◷"] = Bucket("aerotheum");
list["♣"] = Bucket("vapor_of_levity");
list["μ"] = creativeGasTankFrame;
list["⫳"] = <advgenerators:turbine_enderium>;

craft.make( <mekanism:gastank>.withTag({tier: 4}), ["pretty",
	"▬ ▬ ▬ ◫ ♣ ◫ ▬ ▬ ▬",
	"▬ ◉ ▧ ◊ ♣ ◊ ▧ ◉ ▬",
	"▬ ▤ ◴ η ⫳ η ◵ ▤ ▬",
	"◫ ♦ ⰱ ж ι ж ⰱ ♦ ◫",
	"♣ ♣ ⫳ ι μ ι ⫳ ♣ ♣",
	"◫ ♦ ⰱ ж ι ж ⰱ ♦ ◫",
	"▬ ▤ ◶ η ⫳ η ◷ ▤ ▬",
	"▬ ◉ ▧ ◊ ♣ ◊ ▧ ◉ ▬",
	"▬ ▬ ▬ ◫ ♣ ◫ ▬ ▬ ▬"], list);

recipes.addShapeless("Creative Gas Tank Clearing", 
<mekanism:gastank>.withTag({tier: 4}), [<mekanism:gastank>.withTag({tier: 4})]);


# *======= Fluid Trophy Frame =======*

var creativeFluidTankFrame = <simple_trophies:trophy>.withTag({
	TrophyItem:{id:"mekanism:machineblock2",Count:1 as byte, Damage:11 as short},
	TrophyName:"Creative Fluid Tank Frame",
	TrophyVariant:"gold"
});

# Add to JEI and apply Information
mods.jei.JEI.addItem(creativeFluidTankFrame);

// 25 buckets of liquids
var fluidFrameIngr = [] as IIngredient[];
for fname in [
	"milk_goat"   , "for.honey"     , "amber"       ,"blockfluidantimatter","mutagen"    ,
	"biomass"     , "empoweredoil"  , "witchwater"  , "xu_demonic_metal"  , "essence"    ,
	"draconium"   , "sewage"        , "pyrotheum"   , "ic2pahoehoe_lava"  , "liquiddna"  ,
	"corium"      , "essence"       , "juice"       , "ender"             , "cryotheum"  ,
	"petrotheum"  , "refined_fuel"  , "mirion"      , "neutron"           , "plasma"     ,
] as string[] {
	fluidFrameIngr =  fluidFrameIngr + Bucket(fname);
}

// 9 Tanks of additionals
var fluidFrameSecondary = [] as IIngredient[];
for fname in [
	"latex","tree_oil",  "bio.ethanol", "liquidchorus", "heavy_metal", "mana", 	"crystal", "cloud_seed_concentrated", "ic2hot_coolant", 	
] as string[] {
	fluidFrameSecondary =  fluidFrameSecondary + 
		<thermalexpansion:tank>.withTag({Fluid: {FluidName: fname, Amount: 400000} , Level: 2 as byte});
}

# Build the recipe
RecipeBuilder.get("chemist")
  .setShapeless(fluidFrameIngr)
  .setFluid(<liquid:ic2uu_matter> * 16000)
  .setSecondaryIngredients(fluidFrameSecondary)
  .addOutput(creativeFluidTankFrame)
  .create();


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

	
# Psi Creative Rod Frame
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(4, <psi:cad_assembly:5>, 
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

# [Creative Modifier*2] from [Gold Singularity][+16]
craft.remake(<tconstruct:materials:50> * 2, ["pretty",
  "▄ ▀ e e e e e ▀ ▄",
  "▀ ▄ M m m m M ▄ ▀",
  "l M □ ■ ■ ■ □ M i",
  "l A ■ S E S ■ r i",
  "l A ■ x G x ■ r i",
  "l A ■ S E S ■ r i",
  "l M □ ■ ■ ■ □ M i",
  "▀ ▄ M O O O M ▄ ▀",
  "▄ ▀ s s s s s ▀ ▄"], {
  "■": <ore:blockKnightslime>,           # Block of Knightslime
  "▀": <ore:blockAlubrass>,              # Block of Aluminum Brass
  "□": <tconstruct:large_plate>.withTag({Material: "xu_magical_wood"}), # Magical Wooden Large Plate
  "A": <ore:blockAlumite>,               # Alumite Block
  "▄": <ore:blockPigiron>,               # Block of Pigiron
  "e": <tconstruct:materials:19>,        # Mending Moss
  "E": <tconstruct:materials:12>,        # Expander (Horizontal)
  "G": <extendedcrafting:singularity:5>, # Gold Singularity
  "i": <ore:slimecrystalGreen>,          # Green Slime Crystal
  "l": <ore:slimecrystalBlue>,           # Blue Slime Crystal
  "M": <ore:blockManyullyn>,             # Block of Manyullyn
  "m": <ore:blockOsmiridium>,            # Osmiridium Block
  "O": <ore:blockOsgloglas>,             # Osgloglas Block
  "r": <ore:blockMirion>,                # Mirion Block
  "s": <ore:slimecrystalMagma>,          # Magma Slime Crystal
  "S": <tconstruct:metal:6>,             # Silky Block of Jewel
  "x": <tconstruct:materials:13>,        # Expander (Vertical)
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
	

# ExU2 Mill
list["☹"] = <draconicevolution:draconium_capacitor:1>;
craft.make(<extrautils2:passivegenerator:6>, ["pretty",
	"ⱄ ⱄ ▬ ☐ ☐ ☐ ▬ ⱄ ⱄ",
	"ⱄ ▬ ◩ ◩ ◊ ◩ ◩ ▬ ⱄ",
	"▬ ◧ ♦ ♂ ☺ ♂ ♦ ◪ ▬",
	"☐ ◧ ♂ ⰻ ☹ ⰻ ♂ ◪ ☐",
	"☐ ◊ ☺ ☹ ж ☹ ☺ ◊ ☐",
	"☐ ◧ ♂ ☼ ☹ ☼ ♂ ◪ ☐",
	"▬ ◧ ♦ ♂ ☺ ♂ ♦ ◪ ▬",
	"ⱄ ▬ ◨ ◨ ◊ ◨ ◨ ▬ ⱄ",
	"ⱄ ⱄ ▬ ☐ ☐ ☐ ▬ ⱄ ⱄ"], list);



list["τ"] = <notenoughrtgs:rtg_californium_compact>;
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

# Recharging cube
craft.shapeless(creativeCube, "A", {A: <mekanism:energycube>.withTag({tier:4,mekData:{}})});
	
# Creative Wireless Crafting Terminal
recipes.addShapeless("Creative Wireless Crafting Terminal", 
<wct:wct_creative>, [<wct:wct>.withTag({}), creativeCube.reuse()]);

# Storage Drawers Unlimited Withdrawel Upgrade
list["χ"] = <ore:blockCrystalMatrix>;
list["◳"] = <ore:blockAethium>;
list["⌧"] = <ore:ingotInfinity>;
list["⇭"] = twilightForestMasterTrophy;
list["◯"] = <draconicevolution:reactor_core>;
list["⇯"] = creativeCube;
list["⇫"] = <mekanism:machineblock2:11>.withTag({tier: 4});

/*  •◎♪♫♱✓⸕₇₈₉⇮⩈ζλ  */
craft.make(<storagedrawers:upgrade_creative:1> * 2, ["pretty",
	"χ ▣ ☠ ☠ ◊ ☠ ☠ ▣ χ",
	"▣ ◽ ◽ ☑ ⱋ ☑ ◽ ◽ ▣",
	"☠ ◽ ◳ ✝ ♦ ✝ ◳ ◽ ☠",
	"☠ ☑ ⰷ ⇫ ⌧ ⍤ ⰷ ☑ ☠",
	"◊ ⱋ ♦ ◯ ⇭ ◯ ♦ ⱋ ◊",
	"☠ ☑ ⰷ ⇯ ⌧ ⁶ ⰷ ☑ ☠",
	"☠ ◽ ◳ ✝ ♦ ✝ ◳ ◽ ☠",
	"▣ ◽ ◽ ☑ ⱋ ☑ ◽ ◽ ▣",
	"χ ▣ ☠ ☠ ◊ ☠ ☠ ▣ χ"], list);

recipes.addShapeless("Creative Storage Upgrade Duplication", 
<storagedrawers:upgrade_creative:1> * 2, 
[<storagedrawers:upgrade_creative:1>]);
