import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
#modloaded advancedrocketry

# Rename basalt as it not oredicted and have different uses
<advancedrocketry:basalt>.displayName = game.localize("e2ee.tile.basalt_sediment");

# Vulpes Library Silicon dust Manufactory* Recipe Removal (Credit TheShadoWZYE2)
	mods.nuclearcraft.manufactory.removeRecipeWithOutput(<libvulpes:productdust:3>);
	
# Airtight Seal Enchant
	recipes.addShapedMirrored("Airtight Seal Enchant", 
	<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: (<enchantment:advancedrocketry:spacebreathing>.id) as short}]}), 
	[[<ore:plateTitaniumAluminide>, <advancedrocketry:liquidtank>, <ore:plateTitaniumAluminide>],
	[<ore:ingotCarbon>, <advancedrocketry:blocklens>, <ore:ingotCarbon>], 
	[<ore:plateTitaniumAluminide>, <advancedrocketry:liquidtank>, <ore:plateTitaniumAluminide>]]);

# HeatProof Brick
	recipes.remove(<advancedrocketry:blastbrick>);
	recipes.addShaped("HeatProof Brick", 
	<advancedrocketry:blastbrick> * 6, 
	[[<minecraft:brick_block>, <immersiveengineering:stone_decoration:2>, <minecraft:brick_block>],
	[<minecraft:brick_block>, <ore:slimecrystalMagma>, <minecraft:brick_block>], 
	[<minecraft:brick_block>, <minecraft:nether_brick>, <minecraft:brick_block>]]);

# Elite Motor
	recipes.remove(<libvulpes:elitemotor>);
	recipes.addShapedMirrored("Elite Motor", 
	<libvulpes:elitemotor>, 
	[[<ore:gemDilithium>, <ore:coilTitanium>, <ore:plateIridium>],
	[<ore:gemDilithium>, <ore:gearDiamond>, <ore:plateIridium>], 
	[<ore:gemDilithium>, <ore:coilTitanium>, <ore:plateIridium>]]);

# Machine Structure
	recipes.remove(<libvulpes:structuremachine>);
	recipes.addShapedMirrored("Lib Vulpes Machine Structure", 
	<libvulpes:structuremachine> * 6, 
	[[<ic2:crafting:29>, <ore:plateElite>, <ic2:crafting:29>],
	[<ore:plateElite>, <thermalexpansion:frame:147>, <ore:plateElite>], 
	[<ic2:crafting:29>, <ore:plateElite>, <ic2:crafting:29>]]);

# Liquid IO Circuit Board
	recipes.remove(<advancedrocketry:ic:5>);
	recipes.addShapedMirrored("Liquid IO Circuit Board", 
	<advancedrocketry:ic:5>, 
	[[<appliedenergistics2:material:54>, <forestry:chipsets:2>.withTag({T:2 as short},false), <appliedenergistics2:material:54>],
	[<appliedenergistics2:material:54>, <immersiveengineering:material:27>, <appliedenergistics2:material:54>], 
	[<appliedenergistics2:material:54>, <forestry:chipsets:2>.withTag({T:2 as short},false), <appliedenergistics2:material:54>]]);

# Item IO Circuit Board
	recipes.remove(<advancedrocketry:ic:4>);
	recipes.addShapedMirrored("Item IO Circuit Board", 
	<advancedrocketry:ic:4>, 
	[[<appliedenergistics2:material:18>, <forestry:chipsets:1>.withTag({T:1 as short},false), <appliedenergistics2:material:18>],
	[<appliedenergistics2:material:18>, <immersiveengineering:material:27>, <appliedenergistics2:material:18>], 
	[<appliedenergistics2:material:18>, <forestry:chipsets:1>.withTag({T:1 as short},false), <appliedenergistics2:material:18>]]);

# Control Circuit Board
	recipes.remove(<advancedrocketry:ic:3>);
	recipes.addShapedMirrored("Control Circuit Board", 
	<advancedrocketry:ic:3>, 
	[[<ore:circuitElite>, <immersiveengineering:metal_decoration0>, <ore:circuitElite>],
	[<ore:bioplastic>, <immersiveengineering:material:27>, <ore:bioplastic>], 
	[<ore:circuitElite>, <immersiveengineering:metal_decoration0>, <ore:circuitElite>]]);
	

# *======= Remove & Hide =======*

	val removals = [
	<libvulpes:productdust:1>,
	<libvulpes:productdust:2>,
	<libvulpes:productdust:3>,
	<libvulpes:productdust:4>,
	<libvulpes:productdust:5>,
	<libvulpes:productdust:6>,
	<libvulpes:productdust:9>,
	<libvulpes:productdust:10>,
	<libvulpes:productingot:4>,
	<libvulpes:productingot:5>,
	<libvulpes:productingot:6>,
	<libvulpes:productingot:9>,
	<libvulpes:productingot:10>,
	<libvulpes:productnugget:4>,
	<libvulpes:productnugget:5>,
	<libvulpes:productnugget:6>,
	<libvulpes:productnugget:9>,
	<libvulpes:productnugget:10>,
	<libvulpes:ore0:4>,
	<libvulpes:ore0:5>,
	<libvulpes:ore0:9>,
	<libvulpes:ore0:10>,
	<libvulpes:productrod:1>,
	<libvulpes:productrod:6>

	] as IItemStack[];
	
	for item in removals {
		utils.rh(item);
	}
	
	val recipesToRemove = [
	
	<advancedrocketry:productrod>,
	<advancedrocketry:productrod:1>,
	<libvulpes:productrod:4>,
	<libvulpes:productrod:7>,
	<libvulpes:productrod:10>,
	<immersiveengineering:material:3>,
	<advancedrocketry:productgear:*>,
	<libvulpes:productgear:*>
	
	] as IItemStack[];

	for item in recipesToRemove {
		recipes.remove(item);
	}

	<ore:stickIron>.remove(<advancedrocketry:productrod:1>);


# [Pressurized Tank] from [Omnivoir][+2]
craft.remake(<advancedrocketry:liquidtank>, ["pretty",
  "T ■ T",
  "T O T",
  "T ■ T"], {
  "■": <ore:blockDilithium>,           # Block of Dilithium
  "T": <ore:sheetTitaniumIridium>,     # Titanium Iridium Alloy Sheet
  "O": <enderio:block_omni_reservoir>, # Omnivoir
});
recipes.addShapeless("Clearing AdvRock Tank", <advancedrocketry:liquidtank>, [<advancedrocketry:liquidtank>]);

# Mushrooms as energy providers
mods.thermalexpansion.EnervationDynamo.addFuel(<advancedrocketry:electricmushroom>, 90000000);

# Crystalls recycling
val alienCrystals = {
  Red   : [<advancedrocketry:crystal:3>, <actuallyadditions:item_crystal_empowered:2>, <jaopca:item_crystalardite>,  <environmentaltech:ionite_crystal>   ],
  Blue  : [<advancedrocketry:crystal:1>, <actuallyadditions:item_crystal_empowered:1>, <jaopca:item_crystalcobalt>,  <environmentaltech:pladium_crystal>  ],
  Violet: [<advancedrocketry:crystal:0>, <actuallyadditions:item_crystal_empowered:4>, <jaopca:item_crystalplatinum>,<environmentaltech:litherite_crystal>],
  Orange: [<advancedrocketry:crystal:5>, <actuallyadditions:item_crystal_empowered:0>, <jaopca:item_crystalthorium>, <environmentaltech:kyronite_crystal> ],
  Green : [<advancedrocketry:crystal:2>, <actuallyadditions:item_crystal_empowered:5>, <jaopca:item_crystaluranium>, <environmentaltech:erodium_crystal>  ],
  Yellow: [<advancedrocketry:crystal:4>, <actuallyadditions:item_crystal_empowered:3>, <jaopca:item_crystaliridium>, <environmentaltech:aethium_crystal>  ],
} as IItemStack[][string];

for crystalName, ingrs in alienCrystals {
  val input       = ingrs[0];
  val output      = ingrs[1];
  val secondary   = ingrs[2];
  val evt_crystal = ingrs[3];

  # Main output + secondary
  scripts.process.crush(input, output, "only: eu2Crusher AACrusher", [secondary], [0.3f]);

  # Meat washing for EVT crystals
  val tag = {Ore: "aliencrystal" + crystalName} as IData;
  mods.industrialforegoing.WashingFactory.add("aliencrystal" + crystalName, <liquid:meat> * 200, <fluid:if.ore_fluid_raw>.withTag(tag) * 50);
  mods.industrialforegoing.FermentationStation.add(<liquid:if.ore_fluid_raw>.withTag(tag), <liquid:if.ore_fluid_fermented>.withTag(tag));
  mods.industrialforegoing.FluidSievingMachine.add(<liquid:if.ore_fluid_fermented>.withTag(tag) * 100, evt_crystal, <environmentaltech:mica>);

  # Crystaltine extraction
	scripts.process.fill(input, <liquid:ic2hot_water> * 250, <ore:nuggetCrystaltine>.firstItem, "only: NCInfuser Transposer");
}

scripts.process.compress(<ore:blockCharcoal>, <advancedrocketry:misc:1>, "No Exceptions");

# Generator was too cheap compared to other coal gens
# [Coal Generator] from [Furnace][+2]
craft.remake(<libvulpes:coalgenerator>, [
  "B",
  "F",
  "□"], {
  "□": <ore:plateTitanium>, # Titanium Plate
  "B": <ore:itemBattery>,   # Small Battery
  "F": <minecraft:furnace>, # Furnace
});

# [Advanced Machine Structure*4] from [Silicon Boule][+2]
recipes.remove(<libvulpes:advstructuremachine>);
scripts.processUtils.avdRockXmlRecipeEx("PrecisionAssembler",	[
	<libvulpes:structuremachine> * 4, # Machine Structure
	<ore:sheetTitanium> * 4,
	<ore:gemDilithium> * 2,
	<ore:bouleSilicon>,          
], null,
	[<libvulpes:advstructuremachine> * 4], null, {power: 60000, timeRequired: 80}
);

# Press recipe instead crafting table
recipes.remove(<advancedrocketry:misc>);
scripts.wrap.immersiveengineering.MetalPress.addRecipe(<advancedrocketry:misc>, <ore:oc:screen3>, <immersiveengineering:mold:0>, 2000);

# Advanced Alloys
scripts.process.alloy([<ore:ingotElectricalSteel> * 2, <ore:ingotPlatinum>, <actuallyadditions:item_crystal_empowered:1>], <ore:ingotModularium>.firstItem * 2,        "only: AdvRockArc");
scripts.process.alloy([<ore:ingotRefinedObsidian>, <ore:ingotOsmium>, <ore:ingotRefinedGlowstone>                       ], <ore:ingotOsgloglas>.firstItem * 2,         "only: AdvRockArc");
scripts.process.alloy([<ore:ingotManasteel>, <ore:ingotElvenElementium>, <ore:ingotTerrasteel>, <ore:blockGlass> * 10   ], <ore:ingotMirion>.firstItem * 6,            "only: AdvRockArc");
scripts.process.alloy([<ore:ingotIridium>, <ore:ingotOsmium>                                                            ], <ore:ingotOsmiridium>.firstItem * 4,        "only: AdvRockArc");
scripts.process.alloy([<ore:blockDiamond>, <ore:blockRedstone> * 5                                                      ], <ore:blockCrystalFlux>.firstItem,           "only: AdvRockArc");
scripts.process.alloy([<ore:ingotMagnesium> * 3, <ore:ingotBoron> * 6                                                   ], <ore:ingotMagnesiumDiboride>.firstItem * 9, "only: AdvRockArc");
scripts.process.alloy([<ore:dustBorax>, <ore:itemSalt> * 4, <ore:plateCarbon>                                           ], <ore:ingotTitanium>.firstItem,              "only: AdvRockArc");

# [Space Suit Helmet] from [Glass][+3]
recipes.removeShaped(<advancedrocketry:spacehelmet>);
craft.make(<advancedrocketry:spacehelmet>, ["pretty",
  "□ ╱ □",
  "╱ ■ ╱",
  "w w w"], {
  "■": <ore:blockGlass>, # Glass
  "╱": <ore:stickTitanium>, # Titanium Rod
  "□": <ore:plateTitanium>, # Titanium Plate
  "w": <ore:woolPrime>, # Wool (Merino, White)
});

# [Space Suit Chest-Piece] from [Titanium Plate][+3]
recipes.removeShaped(<advancedrocketry:spacechestplate>);
craft.make(<advancedrocketry:spacechestplate>, ["pretty",
  "w ╱ w",
  "w □ w",
  "w S w"], {
  "□": <ore:plateTitanium>, # Titanium Plate
  "╱": <ore:stickTitanium>, # Titanium Rod
  "S": <ore:fanSteel>,      # Steel Fan
  "w": <ore:woolPrime>, # Wool (Merino, White)
});

# [Space Suit Leggings] from [Titanium Rod][+1]
recipes.removeShaped(<advancedrocketry:spaceleggings>);
craft.make(<advancedrocketry:spaceleggings>, ["pretty",
  "w ╱ w",
  "w   w",
  "w   w"], {
  "╱": <ore:stickTitanium>, # Titanium Rod
  "w": <ore:woolPrime>, # Wool (Merino, White)
});

# [Space Suit Boots] from [Titanium Rod][+2]
recipes.removeShaped(<advancedrocketry:spaceboots>);
craft.make(<advancedrocketry:spaceboots>, ["pretty",
  "  ╱  ",
  "w   w",
  "□   □"], {
  "□": <ore:plateTitanium>, # Titanium Plate
  "╱": <ore:stickTitanium>, # Titanium Rod
  "w": <ore:woolPrime>, # Wool (Merino, White)
});

# [Suit Workstation] from [Crafting Table][+3]
recipes.removeShaped(<advancedrocketry:suitworkstation>);
craft.make(<advancedrocketry:suitworkstation>, ["pretty",
  "* * *",
  "3 w 3",
  "■ ■ ■"], {
  "■": <ore:blockTitanium>, # Titanium Block
  "3": <opencomputers:print>, # 3D Print
  "w": <ore:workbench>, # Crafting Table
  "*": <ore:crystalEmeraldic>, # Emeradic Crystal
});

# [Low Pressure Tank] from [Titanium Plate][+2]
craft.make(<advancedrocketry:pressuretank>, ["pretty",
  "п ◘ п",
  "□ ◘ □",
  "□ ◘ □"], {
  "□": <ore:plateIron>,     # Iron Plate
  "◘": <ic2:fluid_cell>.withTag({Fluid: {FluidName: "steam", Amount: 1000}}), # Universal Fluid Cell
  "п": <ore:plateTitanium>, # Titanium Plate
});

# [Pressure Tank] from [Titanium Plate][+2]
craft.make(<advancedrocketry:pressuretank:1>, ["pretty",
  "п ◘ п",
  "□ ◘ □",
  "□ ◘ □"], {
  "□": <ore:plateSteel>,    # Steel Plate
  "◘": <ic2:fluid_cell>.withTag({Fluid: {FluidName: "ic2superheated_steam", Amount: 1000}}), # Universal Fluid Cell
  "п": <ore:plateTitanium>, # Titanium Plate
});

# [High Pressure Tank] from [Titanium Plate][+2]
craft.make(<advancedrocketry:pressuretank:2>, ["pretty",
  "п ◘ п",
  "□ ◘ □",
  "□ ◘ □"], {
  "□": <ore:plateAluminium>, # Aluminum Plate
  "◘": <ic2:fluid_cell>.withTag({Fluid: {FluidName: "high_pressure_steam", Amount: 1000}}), # Universal Fluid Cell
  "п": <ore:plateTitanium>,                        # Titanium Plate
});

# [Super High Pressure Tank] from [Titanium Plate][+2]
craft.make(<advancedrocketry:pressuretank:3>, ["pretty",
  "п ◘ п",
  "□ ◘ □",
  "□ ◘ □"], {
  "□": <ore:plateTitaniumIridium>, # Titanium Iridium Alloy Plate
  "◘": <ic2:fluid_cell>.withTag({Fluid: {FluidName: "preheated_water", Amount: 1000}}), # Universal Fluid Cell
  "п": <ore:plateTitanium>,        # Titanium Plate
});

# [Hover Upgrade] from [Control Circuit Board][+3]
craft.make(<advancedrocketry:itemupgrade>, ["pretty",
  "  o  ",
  "□ C □",
  "* * *"], {
  "□": <ore:plateTitanium>,        # Titanium Plate
  "C": <advancedrocketry:ic:3>,    # Control Circuit Board
  "*": <ore:crystalEmeraldic>,     # Emeradic Crystal
  "o": <advgenerators:controller>, # Control Circuit
});

# [Flight Speed Control Upgrade] from [Control Circuit Board][+3]
craft.make(<advancedrocketry:itemupgrade:1>, ["pretty",
  "  M  ",
  "□ C □",
  "* * *"], {
  "□": <ore:plateTitanium>,              # Titanium Plate
  "C": <advancedrocketry:ic:3>,          # Control Circuit Board
  "*": <ore:crystalEmeraldic>,           # Emeradic Crystal
  "M": <modularmachinery:blockcasing:5>, # Machine Circuitry
});

# [Bionic Leg Upgrade] from [Control Circuit][+2]
craft.make(<advancedrocketry:itemupgrade:2>, [
  "■",
  "C",
  "F"], {
  "■": <ore:blockMotor>,           # Motor
  "C": <advgenerators:controller>, # Control Circuit
  "F": <ore:foodFrograw>,          # Frog Leg
});

# [Padded Landing Boots] from [Control Circuit][+2]
craft.make(<advancedrocketry:itemupgrade:3>, [
  "RCw"], {
  "R": <ic2:rubber_boots>.anyDamage(), # Rubber Boots
  "C": <advgenerators:controller>,     # Control Circuit
  "w": <ore:woolPrime>, # Wool (Merino, White)
});

# [Anti-Fog Visor] from [Traveller's Goggles (Base)][+1]
craft.shapeless(<advancedrocketry:itemupgrade:4>, 
  "CT", {
  "C": <advgenerators:controller>,   # Control Circuit
  "T": <conarm:travel_goggles_base>, # Traveller's Goggles (Base)
});

# [Beacon Finder] from [Engineer's Goggles][+1]
craft.shapeless(<advancedrocketry:beaconfinder>, 
  "CE", {
  "C": <advgenerators:controller>,                # Control Circuit
  "E": <actuallyadditions:item_engineer_goggles>, # Engineer's Goggles
});

# [Jet Pack] from [Cobweb][+3]
craft.remake(<advancedrocketry:jetpack>, ["pretty",
  "L C L",
  "╱ C ╱",
  "▲   ▲"], {
  "╱": <ore:stickTitanium>,             # Titanium Rod
  "▲": <ore:dustPyrotheum>,             # Pyrotheum Dust
  "C": <minecraft:web>,                 # Cobweb
  "L": <advancedrocketry:pressuretank>, # Low Pressure Tank
});

# [Atmosphere Analyzer] from [User Interface][+1]
craft.shapeless(<advancedrocketry:atmanalyser>, 
  "BU", {
  "B": <ore:itemBattery>,       # Small Battery
  "U": <advancedrocketry:misc>, # User Interface
});

# Some Alts with advanced machines
scripts.processUtils.avdRockXmlRecipeEx("ChemicalReactor", [<ore:dustSulfur> * 60], [<fluid:oxygen> * 3000], null, [<fluid:sulfuric_acid> * 6000], {power: 140000, timeRequired: 30});
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:dustFluorite> * 6], [<fluid:sulfuric_acid> * 6000], [<nuclearcraft:compound> * 6], null);

# Remove carbon (defined in ExNihilio configs)
recipes.remove(<advancedrocketry:misc:1>);