import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;
#modloaded immersiveengineering


# Removing Recycling recipes that produce IE Iron Nuggets
	mods.immersiveengineering.ArcFurnace.removeRecipe(<immersiveengineering:metal:29>);


# Sheetmetal Chute Smeltery compat
	mods.tconstruct.Melting.addRecipe(<liquid:iron> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_iron"}));
	mods.tconstruct.Melting.addRecipe(<liquid:steel> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_steel"}));
	mods.tconstruct.Melting.addRecipe(<liquid:aluminum> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_aluminum"}));
	mods.tconstruct.Melting.addRecipe(<liquid:copper> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_copper"}));


# Crude Oil Unification
	mods.immersivepetroleum.Distillation.addRecipe(
	[<liquid:lubricant> * 9, <liquid:diesel> * 27,  <liquid:gasoline> * 39],
	[<immersivepetroleum:material>], 
	<liquid:crude_oil> * 75, 
	4096, 20, [0.07]);

# Coal Coke Unification
	recipes.remove(<thermalfoundation:storage_resource:1>);
	recipes.addShaped("immersiveengineering_stone_decoration_3_custom", <immersiveengineering:stone_decoration:3>, [[<ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>], [<ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>], [<ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>]]);

	rh(<thermalfoundation:material:802>);
	mods.thermalexpansion.RedstoneFurnace.removePyrolysisRecipe(<minecraft:coal>);
	mods.thermalexpansion.RedstoneFurnace.addPyrolysisRecipe(<immersiveengineering:material:6>, 
	<minecraft:coal>, 3000, 250);

	mods.thermalexpansion.RedstoneFurnace.removePyrolysisRecipe(<minecraft:coal_block>);
	mods.thermalexpansion.RedstoneFurnace.addPyrolysisRecipe(<immersiveengineering:stone_decoration:3>, 
	<minecraft:coal_block>, 2400, 2500);

# Sulfur Unification
  mods.immersiveengineering.Crusher.removeRecipe(<minecraft:blaze_powder>);
  mods.immersiveengineering.Crusher.addRecipe(<minecraft:blaze_powder> * 4, <ore:itemBlazeRod>, 2048, <thermalfoundation:material:771>, 0.5);

# Aluminum Scaffolding
	recipes.remove(<immersiveengineering:metal_decoration2:8>);
	recipes.addShapedMirrored("Aluminum Scaffolding", 
	<immersiveengineering:metal_decoration2:8> * 4, 
	[[<ore:stickAluminum>, null, null],
	[<ore:scaffoldingAluminium>, <ore:stickAluminum>, null], 
	[<ore:scaffoldingAluminium>, <ore:scaffoldingAluminium>, <ore:stickAluminum>]]);
	
# Steel Scaffolding
	recipes.remove(<immersiveengineering:metal_decoration2:7>);
	recipes.addShapedMirrored("Steel Scaffolding", 
	<immersiveengineering:metal_decoration2:7> * 4, 
	[[<ore:stickSteel>, null, null],
	[<ore:scaffoldingSteel>, <ore:stickSteel>, null], 
	[<ore:scaffoldingSteel>, <ore:scaffoldingSteel>, <ore:stickSteel>]]);

# Concrete Conversion recipes
	recipes.addShapeless("Concrete Sheet", <immersiveengineering:stone_device:3> * 8, [<immersiveengineering:stone_decoration:5>,<tconstruct:throwball:1>]);
	recipes.addShapedMirrored("Concrete Panel", <immersiveengineering:stone_device:4>, [[<immersiveengineering:stone_device:3>, null, null],[<immersiveengineering:stone_device:3>, null, null], [null, null, null]]);
	recipes.addShapedMirrored("Concrete Slab", <immersiveengineering:stone_decoration_slab:5>, [[<immersiveengineering:stone_device:4>, null, null],[<immersiveengineering:stone_device:4>, null, null], [null, null, null]]);

# Coke Dust Compatibility
	mods.actuallyadditions.Crusher.addRecipe(<immersiveengineering:material:17>, <thermalfoundation:material:802>);
	mods.actuallyadditions.Crusher.addRecipe(<immersiveengineering:material:17>, <immersiveengineering:material:6>);
	mods.extrautils2.Crusher.add(<immersiveengineering:material:17>, <thermalfoundation:material:802>);
	mods.extrautils2.Crusher.add(<immersiveengineering:material:17>, <immersiveengineering:material:6>);
	mods.mekanism.crusher.addRecipe(<thermalfoundation:material:802>, <immersiveengineering:material:17>);
	mods.mekanism.crusher.addRecipe(<immersiveengineering:material:6>, <immersiveengineering:material:17>);
	mods.thermalexpansion.Pulverizer.addRecipe(<immersiveengineering:material:17>, <thermalfoundation:material:802>, 4000);
	mods.thermalexpansion.Pulverizer.addRecipe(<immersiveengineering:material:17>, <immersiveengineering:material:6>, 4000);

# Energy Capacitors
	recipes.remove(<immersiveengineering:metal_device0:1>);
	recipes.addShaped("MV Capacitor", 
	<immersiveengineering:metal_device0:1>, 
	[[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
	[<ore:ingotElectrum>, <immersiveengineering:metal_device0>, <ore:ingotElectrum>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]]);
	
	recipes.remove(<immersiveengineering:metal_device0:2>);
	recipes.addShaped("HV Capacitor", 
	<immersiveengineering:metal_device0:2>, 
	[[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>],
	[<ore:blockLead>, <immersiveengineering:metal_device0:1>, <ore:blockLead>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]]);
	
# LV - MV Connectors/Relays
	recipes.addShapeless("LV - MV Connector", <immersiveengineering:connector:2>, [<immersiveengineering:connector>, <ore:ingotIron>]);
	recipes.addShapeless("LV - MV Relay", <immersiveengineering:connector:3>, [<immersiveengineering:connector:1>, <ore:ingotIron>]);

# MV - HV Connectors/Relays
	recipes.addShapeless("MV - HV Connector", <immersiveengineering:connector:4>, [<immersiveengineering:connector:2>, <ore:ingotAluminium>]);
	recipes.addShapeless("MV - HV Relay", <immersiveengineering:connector:5>, [<immersiveengineering:connector:3>, <ore:ingotAluminium>]);

# Coke Bricks
	recipes.remove(<immersiveengineering:stone_decoration>);
	recipes.addShaped("Coke Brick", 
	<immersiveengineering:stone_decoration> * 3, 
	[[<ore:clayPorcelain>, <ore:ingotBrick>, <ore:clayPorcelain>],
	[<ore:ingotBrick>, <ore:sandstone>, <ore:ingotBrick>], 
	[<ore:clayPorcelain>, <ore:ingotBrick>, <ore:clayPorcelain>]]);
	
# Redstone Engineering Block
	recipes.remove(<immersiveengineering:metal_decoration0:3>);
	recipes.addShaped("Redstone Engineering Block", 
	<immersiveengineering:metal_decoration0:3> * 2, 
	[[<ore:plateCopper>, <ore:ingotConstantan>, <ore:plateCopper>],
	[<ore:ingotConstantan>, <ore:gearRedstone>, <ore:ingotConstantan>], 
	[<ore:plateCopper>, <ore:ingotConstantan>, <ore:plateCopper>]]);

# Light Engineering Block
	recipes.remove(<immersiveengineering:metal_decoration0:4>);
	recipes.addShaped("Light Engineering Block", 
	<immersiveengineering:metal_decoration0:4> * 4, 
	[[<ore:plateBronze>, <ore:alloyAdvanced>, <ore:plateBronze>],
	[<ore:alloyAdvanced>, <immersiveengineering:metal_decoration1:5>, <ore:alloyAdvanced>], 
	[<ore:plateBronze>, <ore:alloyAdvanced>, <ore:plateBronze>]]);

# Heavy Engineering Block
	recipes.remove(<immersiveengineering:metal_decoration0:5>);
	recipes.addShaped("Heavy Engineering Block", 
	<immersiveengineering:metal_decoration0:5> * 4, 
	[[<ore:plateUranium>, <ore:alloyElite>, <ore:plateUranium>],
	[<immersiveengineering:material:8>, <immersiveengineering:metal_decoration1:1>, <immersiveengineering:material:8>], 
	[<ore:plateUranium>, <ore:alloyElite>, <ore:plateUranium>]]);

# Garden Cloche
	recipes.remove(<immersiveengineering:metal_device1:13>);
	mods.forestry.ThermionicFabricator.addCast(<immersiveengineering:metal_device1:13>, 
	[[null, <immersiveengineering:connector>, null],
	[null, <ic2:upgrade:4>, null], 
	[<ore:plankTreatedWood>, <immersiveengineering:metal_decoration0:5>, <ore:plankTreatedWood>]], 
	<liquid:glass> * 4000);
	
# Crusher Recipes
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:68> * 4, <ore:oreNetherAluminum>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:64> * 4, <ore:oreNetherCopper>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:67> * 4, <ore:oreNetherLead>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:69> * 4, <ore:oreNetherNickel>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:70> * 4, <ore:oreNetherPlatinum>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:66> * 4, <ore:oreNetherSilver>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:65> * 4, <netherendingores:ore_nether_modded_1:8>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<appliedenergistics2:material:2> * 4, <ore:oreNetherCertusQuartz>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<appliedenergistics2:material:2> * 4, <ore:oreNetherChargedCertusQuartz>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<mekanism:dust:2> * 4, <ore:oreNetherOsmium>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<immersiveengineering:metal:14> * 4, <ore:oreNetherUranium>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<libvulpes:productgem:0> * 4, <ore:oreNetherDilithium>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<minecraft:coal> * 5, <ore:oreNetherCoal>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<minecraft:diamond> * 5, <ore:oreNetherDiamond>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<minecraft:emerald> * 5, <ore:oreNetherEmerald>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:1> * 4, <ore:oreNetherGold>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:0> * 4, <netherendingores:ore_nether_vanilla:4>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<minecraft:dye:4> * 22, <ore:oreNetherLapis>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<minecraft:redstone> * 14, <ore:oreNetherRedstone>, 6000, <minecraft:netherrack>, 0.15);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:892> * 3, <ore:oreClathrateOilShale>, 6000, <minecraft:flint>, 0.50);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:892> * 3, <ore:oreClathrateOilSand>, 6000, <thermalfoundation:material:833>, 0.50);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:893> * 3, <ore:oreClathrateRedstone>, 6000, <thermalfoundation:material:866>, 0.50);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:894> * 3, <ore:oreClathrateGlowstone>, 6000, <thermalfoundation:material:771>, 0.30);
	mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:895> * 3, <ore:oreClathrateEnder>, 6000);

# Excavator new veins
mods.immersiveengineering.Excavator.addMineral("Osmium", 50, 0.005, ["oreTin", "oreOsmium", "oreSilver"], [0.01, 0.006, 0.003]);


# ----------------------------------------
# Slabs from oredicted resources
for block, slab in {
	<ore:blockCopper>     : <immersiveengineering:storage_slab>,
	<ore:blockAluminum>   : <immersiveengineering:storage_slab:1>,
	<ore:blockLead>       : <immersiveengineering:storage_slab:2>,
	<ore:blockSilver>     : <immersiveengineering:storage_slab:3>,
	<ore:blockNickel>     : <immersiveengineering:storage_slab:4>,
	<ore:blockConstantan> : <immersiveengineering:storage_slab:6>,
	<ore:blockElectrum>   : <immersiveengineering:storage_slab:7>,
	<ore:blockSteel>      : <immersiveengineering:storage_slab:8>,
} as IItemStack[IIngredient] {
	craft.remake(slab * 6, ["AAA"], {A: block});
}


# [Conveyor Belt]*32 from [Redstone][+2]
craft.remake(<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 32, ["pretty",
  "l l l",
  "▬ ♥ ▬"], {
  "♥": <ore:dustRedstone>, # Redstone
  "l": <ore:leather>,      # Leather
  "▬": <ore:ingotIron>, # Iron Alloy Ingot
  remove: <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 8, # Conveyor Belt
});

# [Conveyor Belt]*32 from [Redstone][+2]
craft.remake(<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 32, ["pretty",
  "R R R",
  "▬ ♥ ▬"], {
  "R": <ore:itemRubber>, # Plastic
  "♥": <ore:dustRedstone>, # Redstone
  "▬": <ore:ingotIron>, # Iron Alloy Ingot
  remove: <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 8, # Conveyor Belt
});

# Unbreakable Graphite Electrodes
    mods.thermalexpansion.InductionSmelter.addRecipe(<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1, display: {Lore: ["Reinforced with Titanium Iridium Alloy"], Name: "Unbreakable Graphite Electrode"}}), <immersiveengineering:graphite_electrode>, <advancedrocketry:productingot:1> * 4, 25000);
    mods.jei.JEI.addItem(<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1, display: {Lore: ["Reinforced with Titanium Iridium Alloy"], Name: "Unbreakable Graphite Electrode"}}));
