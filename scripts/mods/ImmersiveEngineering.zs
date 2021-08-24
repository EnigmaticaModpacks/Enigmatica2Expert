import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.alfinivia.ImmersiveEngineering.addChemthrowerEffect;
import mods.alfinivia.ImmersiveEngineering.addRailgunBullet;
import crafttweaker.potions.IPotionEffect;
import scripts.craft.grid.Grid;



#modloaded immersiveengineering


	recipes.remove(<immersiveengineering:material:1>);
	recipes.remove(<immersiveengineering:material:2>);
	recipes.remove(<immersiveengineering:material:3>);

# Removing Recycling recipes that produce IE Iron Nuggets
	mods.immersiveengineering.ArcFurnace.removeRecipe(<immersiveengineering:metal:29>);


# Sheetmetal Chute Smeltery compat
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:iron> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_iron"}));
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:steel> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_steel"}));
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:aluminum> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_aluminum"}));
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:copper> * 72, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:chute_copper"}));


# Crude Oil Unification
	scripts.wrap.immersivepetroleum.Distillation.addRecipe(
	[<liquid:lubricant> * 9, <liquid:diesel> * 27,  <liquid:gasoline> * 39],
	[<immersivepetroleum:material>], 
	<liquid:crude_oil> * 75, 
	4096, 20, [0.07]);

# Coal Coke Unification
	recipes.remove(<thermalfoundation:storage_resource:1>);
	recipes.addShaped("immersiveengineering_stone_decoration_3_custom", <immersiveengineering:stone_decoration:3>, [[<ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>], [<ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>], [<ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>]]);

	utils.rh(<thermalfoundation:material:802>);
	mods.thermalexpansion.RedstoneFurnace.removePyrolysisRecipe(<minecraft:coal>);
	scripts.wrap.thermalexpansion.RedstoneFurnace.addPyrolysisRecipe(<immersiveengineering:material:6>, 
	<minecraft:coal>, 3000, 250);

	mods.thermalexpansion.RedstoneFurnace.removePyrolysisRecipe(<minecraft:coal_block>);
	scripts.wrap.thermalexpansion.RedstoneFurnace.addPyrolysisRecipe(<immersiveengineering:stone_decoration:3>, 
	<minecraft:coal_block>, 30000, 2500);

# Sulfur Unification
  mods.immersiveengineering.Crusher.removeRecipe(<minecraft:blaze_powder>);
  scripts.wrap.immersiveengineering.Crusher.addRecipe(<minecraft:blaze_powder> * 4, <ore:rodBlaze>, 2048, <thermalfoundation:material:771>, 0.5);

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
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<immersiveengineering:material:17>, <thermalfoundation:material:802>);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<immersiveengineering:material:17>, <immersiveengineering:material:6>);
	scripts.wrap.extrautils2.Crusher.add(<immersiveengineering:material:17>, <thermalfoundation:material:802>);
	scripts.wrap.extrautils2.Crusher.add(<immersiveengineering:material:17>, <immersiveengineering:material:6>);
	scripts.wrap.mekanism.crusher.addRecipe(<thermalfoundation:material:802>, <immersiveengineering:material:17>);
	scripts.wrap.mekanism.crusher.addRecipe(<immersiveengineering:material:6>, <immersiveengineering:material:17>);
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<immersiveengineering:material:17>, <thermalfoundation:material:802>, 4000);
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<immersiveengineering:material:17>, <immersiveengineering:material:6>, 4000);

# Energy Capacitors
	recipes.remove(<immersiveengineering:metal_device0:1>);
	recipes.addShaped("MV Capacitor", 
	<immersiveengineering:metal_device0:1>, 
	[[<ore:ingotFakeIron>, <ore:ingotFakeIron>, <ore:ingotFakeIron>],
	[<ore:ingotElectrum>, <immersiveengineering:metal_device0>, <ore:ingotElectrum>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]]);
	
	recipes.remove(<immersiveengineering:metal_device0:2>);
	recipes.addShaped("HV Capacitor", 
	<immersiveengineering:metal_device0:2>, 
	[[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>],
	[<ore:blockLead>, <immersiveengineering:metal_device0:1>, <ore:blockLead>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]]);
	
# LV - MV Connectors/Relays
	recipes.addShapeless("LV - MV Connector", <immersiveengineering:connector:2>, [<immersiveengineering:connector>, <ore:ingotFakeIron>]);
	recipes.addShapeless("LV - MV Relay", <immersiveengineering:connector:3>, [<immersiveengineering:connector:1>, <ore:ingotFakeIron>]);

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
	[<ore:ingotConstantan>, <ore:gemRedstone>, <ore:ingotConstantan>], 
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
	scripts.wrap.forestry.ThermionicFabricator.addCast(<immersiveengineering:metal_device1:13>, 
	[[null, <actuallyadditions:block_greenhouse_glass>, null],
	[null, <ic2:upgrade:4>, null], 
	[<ore:plankTreatedWood>, <immersiveengineering:metal_decoration0:5>, <ore:plankTreatedWood>]], 
	<liquid:glass> * 4000);
	
# Crusher Recipes
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:68> * 4, <ore:oreNetherAluminum>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:64> * 4, <ore:oreNetherCopper>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:67> * 4, <ore:oreNetherLead>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:69> * 4, <ore:oreNetherNickel>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:70> * 4, <ore:oreNetherPlatinum>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:66> * 4, <ore:oreNetherSilver>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:65> * 4, <netherendingores:ore_nether_modded_1:8>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<appliedenergistics2:material:2> * 4, <ore:oreNetherCertusQuartz>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<appliedenergistics2:material:2> * 4, <ore:oreNetherChargedCertusQuartz>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<mekanism:dust:2> * 4, <ore:oreNetherOsmium>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<immersiveengineering:metal:14> * 4, <ore:oreNetherUranium>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<libvulpes:productgem:0> * 4, <ore:oreNetherDilithium>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<minecraft:coal> * 5, <ore:oreNetherCoal>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<minecraft:diamond> * 5, <ore:oreNetherDiamond>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<minecraft:emerald> * 5, <ore:oreNetherEmerald>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:1> * 4, <ore:oreNetherGold>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:0> * 4, <netherendingores:ore_nether_vanilla:4>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<minecraft:dye:4> * 22, <ore:oreNetherLapis>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<minecraft:redstone> * 14, <ore:oreNetherRedstone>, 6000, <minecraft:netherrack>, 0.15);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:892> * 3, <ore:oreClathrateOilShale>, 6000, <minecraft:flint>, 0.50);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:892> * 3, <ore:oreClathrateOilSand>, 6000, <thermalfoundation:material:833>, 0.50);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:893> * 3, <ore:oreClathrateRedstone>, 6000, <thermalfoundation:material:866>, 0.50);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:894> * 3, <ore:oreClathrateGlowstone>, 6000, <thermalfoundation:material:771>, 0.30);
	scripts.wrap.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:895> * 3, <ore:oreClathrateEnder>, 6000);
	
# Unbreakable Graphite Electrodes
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe(<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1, display: {Lore: ["Reinforced with Titanium Iridium Alloy"], Name: "Unbreakable Graphite Electrode"}}), <immersiveengineering:graphite_electrode>, <advancedrocketry:productingot:1> * 4, 25000);
	mods.jei.JEI.addItem(<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1, display: {Lore: ["Reinforced with Titanium Iridium Alloy"], Name: "Unbreakable Graphite Electrode"}}));


# Excavator new veins
mods.immersiveengineering.Excavator.addMineral("Osmium", 50, 0.005, ["oreTin", "oreOsmium", "oreSilver"], [0.01, 0.006, 0.003]);
mods.immersiveengineering.Excavator.addMineral("Nuclear Ore", 20, 0.005, ["oreThorium", "oreBoron", "oreLithium", "oreMagnesium"], [0.01, 0.01, 0.01, 0.01]);
mods.immersiveengineering.Excavator.addMineral("Black Quartz", 20, 0.005, ["oreQuartzBlack", "oreCoal"], [0.1, 0.3]);
mods.immersiveengineering.Excavator.getMineral("Platinum").removeOre("oreIridium");

# *======= Railgun rods =======*

# addRailgunBullet(IIngredient item, float damage, float gravity, int[][] colorMap)
# addRailgunBullet(IIngredient item, float damage, float gravity, IRailgunImpact effect, int[][] colorMap)

/* Patchouli_js('Items/Railgui Bullets', paged({
	item: 'immersiveengineering:railgun',
	title: 'New Railgui Bullets',
	type:  'item_list',
},[
	[undefined, ' Damage  |  Gravity'],
  ...match_regex_below(/^addRailgunBullet\(<(.*?)> *, *(.*?), *(.*?), *.*\);/gm)
  .sort((a,b)=>b[2]-a[2])
  .map(m=>[m[1], ` ${m[2].padStart(6)}    |   ${m[3].padStart(4)}`])
]))*/

val colorMap = [[0x777777, 0xa4a4a4]] as int[][];
addRailgunBullet(<ore:stickCopper>             , 21, 1.1, colorMap);
addRailgunBullet(<ore:stickTitanium>           , 30, 1.15,colorMap);
addRailgunBullet(<ore:stickTitaniumAluminide>  , 33, 0.9, colorMap);
addRailgunBullet(<redstonearsenal:material:193>, 32, 1.2, colorMap); # Flux-Infused Obsidian Rod
addRailgunBullet(<ore:stickIridium>            , 36, 1.15,colorMap);
addRailgunBullet(<ic2:crafting:29>,              28, 0.8, colorMap); # Shaft (Iron)
addRailgunBullet(<ic2:crafting:42>,              34, 0.8, colorMap); # Shaft (Bronze)
addRailgunBullet(<ic2:crafting:30>,              40, 0.8, colorMap); # Shaft (Steel)
addRailgunBullet(<ore:stickTitaniumIridium>    , 44, 0.8, colorMap);
addRailgunBullet(<extendedcrafting:material:3> , 48, 1.0, colorMap);

# *======= Fertilizers =======*

# addLiquidFertilizer(ILiquidStack liquid, float multiplier)
# addLiquidFertilizer(ILiquidStack liquid, IFluidFertilizerMultiplier multiplier)
# removeLiquidFertilizer(ILiquidStack liquid)
# addItemFertilizer(IIngredient item, float multiplier)
# addItemFertilizer(IIngredient item, IItemFertilizerMultiplier multiplier)
# removeItemFertilizer(IItemStack item)

function addLiquidFertilizer(fluid as ILiquidStack, mult as float) {
	if (fluid.name != 'water') mods.alfinivia.ImmersiveEngineering.addLiquidFertilizer(fluid, mult);
	scripts.requiousJei.addGardenClocheFluid(fluid, (mult * 80.0f + 0.5f) as int);
}

addLiquidFertilizer(<liquid:water>                , 0.20f);
addLiquidFertilizer(<liquid:meat>                 , 0.40f);
addLiquidFertilizer(<liquid:sewage>               , 0.43f);
addLiquidFertilizer(<liquid:for.honey>            , 0.45f);
addLiquidFertilizer(<liquid:short.mead>           , 0.50f);
addLiquidFertilizer(<liquid:lifeessence>          , 0.55f);
addLiquidFertilizer(<liquid:nutrient_distillation>, 0.65f);
addLiquidFertilizer(<liquid:vapor_of_levity>      , 0.80f);


# *======= Chemical Thrower liquids =======*

# addChemthrowerEffect(ILiquidStack liquid, boolean isGas, boolean isFlammable, String source, float damage);
# addChemthrowerEffect(ILiquidStack liquid, boolean isGas, boolean isFlammable, String source, float damage, IPotionEffect[] effects)
# addChemthrowerEffect(ILiquidStack liquid, boolean isGas, boolean isFlammable, IChemEntityEffect entityEffect, IChemBlockEffect blockEffect)

/* Patchouli_js('Liquids/Chemical Thrower', {
	icon: "immersiveengineering:chemthrower",
	title: "New Chemicals",
	_text: `
		Many liquids can be used in $(l)Chemical Thrower/$ as ammo.
		$(li)$(#727900)Strong Radiation/$ liquids have low damage, but gave Radiation III effect for 1-6 minutes
		$(li)$(#C01B1B)High damage/$ only do big amount of damage
		$(li)$(#957143)Flammable/$ set things on fire
		$(li)$(#25A2AB)Potion effects/$ damages and adds effects
		$(li)$(#3F1B10)Chocolates/$ gives several strong positive effects
	`,
})*/

# ----------------------------------------
# ☢️ Strong radiation
/* Patchouli_js('Liquids/Chemical Thrower', {
	title: "Strong radiation",
	type:  "grid",
	...match_block_below(/^addChemthrowerEffect\(<liquid:(.+?)>/gm)
    .reduce((o, m, i) => Object.assign(o, {
      [`item${i}`]: wrap_bucket(m[1])
    }),{}),
})*/
addChemthrowerEffect(<liquid:californium_250>, false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect(130, 2, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:plutonium_241>  , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect(120, 2, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:curium_243>     , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect(110, 2, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:plutonium_238>  , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 90, 2, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:americium_242>  , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 80, 2, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:berkelium_248>  , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 60, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:californium_249>, false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 50, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:americium_241>  , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 40, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:californium_251>, false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 30, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:berkelium_247>  , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:curium_246>     , false, false, "chemicals" , 2, [<potion:ic2:radiation>.makePotionEffect( 10, 1, false, true)] as IPotionEffect[]);


# ----------------------------------------
# ⚡ Just high damage liquids
/* Patchouli_js('Liquids/Chemical Thrower', {
	title: "High Damage",
	type:  "grid_description",
	...match_block_below(/^addChemthrowerEffect\(<liquid:(.+?)>.*?(\d+)\);$/gm)
    .sort((a,b)=>b[2]-a[2]).reduce((o, m, i) => Object.assign(o, {
      [`item${i}`]: wrap_bucket(m[1]),
      [`text${i}`]: m[2],
    }),{}),
})*/
addChemthrowerEffect(<liquid:ic2superheated_steam>,true , false, "chemicals", 14);
addChemthrowerEffect(<liquid:ic2uu_matter>        ,false, false, "ic2uu_matter", 50);
addChemthrowerEffect(<liquid:ic2hot_coolant>      ,false, false, "chemicals", 11);
addChemthrowerEffect(<liquid:crystal>             ,false, false, "chemicals", 20);
addChemthrowerEffect(<liquid:plasma>              ,true , false, "chemicals", 28);
addChemthrowerEffect(<liquid:liquid_death>        ,false, false, "chemicals", 30);
addChemthrowerEffect(<liquid:neutron>             ,false, false, "chemicals", 36);


# ----------------------------------------
# 🔥 Flammable fuels that only do damage
/* Patchouli_js('Liquids/Chemical Thrower', {
	title: "Flammable",
	type:  "grid_description",
	...match_block_below(/^addChemthrowerEffect\(<liquid:(.+?)>.*?(\d+)\);$/gm)
    .sort((a,b)=>b[2]-a[2]).reduce((o, m, i) => Object.assign(o, {
      [`item${i}`]: wrap_bucket(m[1]),
      [`text${i}`]: m[2],
    }),{}),
})*/
addChemthrowerEffect(<liquid:oil>          ,false, true, "chemicals", 2);
addChemthrowerEffect(<liquid:canolaoil>    ,false, true, "chemicals", 3);
addChemthrowerEffect(<liquid:crystaloil>   ,false, true, "chemicals", 6);
addChemthrowerEffect(<liquid:empoweredoil> ,false, true, "chemicals", 12);
addChemthrowerEffect(<liquid:biomass>      ,false, true, "chemicals", 3);
addChemthrowerEffect(<liquid:biofuel>      ,false, true, "chemicals", 4);
addChemthrowerEffect(<liquid:rocket_fuel>  ,false, true, "chemicals", 13);
addChemthrowerEffect(<liquid:refined_fuel> ,false, true, "chemicals", 10);
addChemthrowerEffect(<liquid:rocketfuel>   ,false, true, "chemicals", 35);
addChemthrowerEffect(<liquid:perfect_fuel> ,false, true, "chemicals", 350);


# ----------------------------------------
# 🎇 Liquids with potion effects
/* Patchouli_js('Liquids/Chemical Thrower', 
  match_block_below(/^addChemthrowerEffect\(<liquid:(.+?)>.*?(\d+), \[<potion:\w+:(\w+\.)?(\w+)>.*$/gm)
    .sort((a,b)=>b[2]-a[2])
    .reduce((o, m, i) => {
      var j = ~~(i/7);
      o[j] = o[j]||{};
      o[j][`item${i%7}`] = wrap_bucket(m[1])
      o[j][`text${i%7}`] = `${m[2]}, ${m[4]}`
      return o;
    },[])
    .map(o=>Object.assign(o, {
      title: "Potion Effects",
      type:  "item_list",
    }))
)*/
addChemthrowerEffect(<liquid:cloud_seed_concentrated>, false, false, "chemicals" , 2, [<potion:minecraft:levitation>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:vapor_of_levity>        , false, false, "chemicals" , 9, [<potion:minecraft:levitation>.makePotionEffect(200, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:hydrofluoric_acid>      , false, false, "chemicals",17, [<potion:minecraft:poison>.makePotionEffect(20, 3, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:blockfluiddirt>         , false, false, "chemicals", 2, [<potion:immersiveengineering:sticky>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:mutagen>                , false, false, "chemicals", 8, [<potion:biomesoplenty:curse>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:if.pink_slime>          , false, false, "chemicals" , 2, [<potion:immersiveengineering:sticky>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:menrilresin>            , false, false, "chemicals", 4, [<potion:immersiveengineering:sticky>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:liquidchorus>           , false, false, "chemicals", 6, [<potion:cyclicmagic:potion.bounce>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:xpjuice>                , false, false, "chemicals" , 1, [<potion:quark:white>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:lifeessence>            , false, false, "chemicals" ,11, [<potion:potioncore:love>.makePotionEffect(20, 1, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:fire_water>             , false, false, "chemicals",14, [<potion:potioncore:fire>.makePotionEffect(20, 3, false, true)] as IPotionEffect[]);
addChemthrowerEffect(<liquid:ic2hot_water>           , false, false, "chemicals" , 0, [<potion:minecraft:regeneration>.makePotionEffect(20, 5, false, true)] as IPotionEffect[]);


# ----------------------------------------
# 🍫 Chocolates
/* Patchouli_js('Liquids/Chemical Thrower', {
	title: "Chocolates",
	type:  "grid",
	...match_block_below(/^addChemthrowerEffect\(<liquid:(.+?)>/gm)
    .reduce((o, m, i) => Object.assign(o, {
      [`item${i}`]: wrap_bucket(m[1])
    }),{}),
})*/
val chocPotions = [
	<potion:randomthings:imbue_experience>.makePotionEffect(20, 1, false, true),
	<potion:scalinghealth:bandaged>.makePotionEffect(20, 1, false, true)
] as IPotionEffect[];
addChemthrowerEffect(<liquid:chocolate_liquor>       , false, false, "chemicals", 0, chocPotions);
addChemthrowerEffect(<liquid:unsweetened_chocolate>  , false, false, "chemicals", 0, chocPotions);
addChemthrowerEffect(<liquid:dark_chocolate>         , false, false, "chemicals", 0, chocPotions);
addChemthrowerEffect(<liquid:milk_chocolate>         , false, false, "chemicals", 0, chocPotions);


// addChemthrowerEffect(<liquid:liquid_sunshine>, false /*isGas*/, true /*isFlammable*/, 
// 	# IChemEntityEffect
// 	function(target,shooter,throwerstack,fluid) {

// 	}, 

// 	# IChemBlockEffect
// 	function(world,pos,side,shooter,throwerstack,fluid) {
// 	}
// );

# Thermoelectric generator
mods.immersiveengineering.Thermoelectric.addTemperatureSource(<nuclearcraft:block_ice>,   50);
mods.immersiveengineering.Thermoelectric.addTemperatureSource(<ore:blockFiery>,         5000);
mods.immersiveengineering.Thermoelectric.addTemperatureSource(<ore:blockLudicrite>,     9900);


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

# Bitumen change to oredict
craft.remake(<immersivepetroleum:stone_decoration> * 12, [
	"ABA",
	"CDC",
	"ABA"], {
	A: <ore:itemSlag>,
	B: <ore:bitumen>,
	C: <ore:gravel>,
	D: Bucket("water"),
});
craft.remake(<immersivepetroleum:stone_decoration> * 8, [
	"ABA",
	"CDC",
	"ABA"], {
	A: <ore:sand>,
	B: <ore:bitumen>,
	C: <ore:gravel>,
	D: Bucket("water"),
});

# [Portable_Drill] from [Bedrock_Miner][+2]
craft.remake(<portabledrill:portable_drill>, ["pretty",
  "╱ B ╱",
  "  |  ",
  "  |  "], {
  "╱": <ore:stickSteel>,                 # Steel Rod
  "B": <bedrockores:bedrock_miner>,      # Bedrock Miner
  "|": <immersiveengineering:coresample> # Core Sample
});

# Forge hammer from IC2 harder to craft, so everyone used IE hammer
# This change will force players to use Forge Hammer for making plates
# [Engineer's_Hammer] from [Iron_Hammer_Head][+1]
craft.remake(<immersiveengineering:tool>, ["pretty",
  "    I",
  "  /  ",
  "/    "], {
  "/": <ore:stickWood>, # Stick
  "I": <tconstruct:hammer_head>.withTag({Material: "iron"}) 
			|<tconstruct:hammer_head>.withTag({Material: "construction_alloy"})
});

// Liquid Concrete alts
scripts.process.solution([<tconstruct:soil>], [<liquid:water> * 250], [<liquid:concrete> * 250], null, "except: Vat Highoven Mixer");

# [Conveyor Belt*32] from [Redstone][+2]
craft.remake(<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 32, ["pretty",
  "l l l",
  "▬ ♥ ▬"], {
  "♥": <ore:dustRedstone>, # Redstone
  "l": <ore:leather>,      # Leather
  "▬": <ore:ingotFakeIron>, # Iron Alloy Ingot
});

# [Conveyor Belt*32] from [Redstone][+2]
craft.remake(<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 32, ["pretty",
  "R R R",
  "▬ ♥ ▬"], {
  "R": <ore:itemRubber>, # Plastic
  "♥": <ore:dustRedstone>, # Redstone
  "▬": <ore:ingotFakeIron>, # Iron Alloy Ingot
});


# ---------------------------------------------------------
# Wax cast alternative for Insulating glass

recipes.remove(<immersiveengineering:stone_decoration:8>);

# [Insulating Glass*4] from [Cactus Green][+1]
craft.make(<immersiveengineering:stone_decoration:8>, ["pretty",
  "  □  ",
  "▲ d ▲",
  "  □  "], {
  "□": <ore:blockGlass>, # Glass
  "▲": <ore:dustIron>,   # Pulverized Iron
  "d": <ore:dyeGreen>,   # Cactus Green
});

# [Insulating Glass*4] from [Cactus Green][+1]
scripts.wrap.forestry.ThermionicFabricator.addCast(<immersiveengineering:stone_decoration:8> * 6, Grid([
  "▲d▲"], {
  "▲": <ore:dustIron>, # Pulverized Iron
  "d": <ore:dyeGreen>, # Cactus Green
}).shaped(), <liquid: glass> * 1000, <forestry:wax_cast:*>);

# ---------------------------------------------------------

# For some reason all coils melt into gold only in Magmatic Crucible
mods.thermalexpansion.Crucible.removeRecipe(<immersiveengineering:metal_decoration0:0>);


# [Concrete Trapdoor] from [Concrete]
craft.remake(<engineersdoors:trapdoor_concrete>, ["pretty",
  "c c",
  "c c"], {
  "c": <ore:concrete>, # Concrete
});



if(!isNull(loadedMods["immersivetech"])) {
	# Cloud seed harder (also BoP Hotspring water as extra)
	mods.enderio.Vat.removeRecipe(<liquid:cloud_seed>);
	mods.immersivetechnology.CoolingTower.addRecipe(<liquid:cloud_seed> * 500, <liquid:hot_spring_water> * 10, <liquid:ice> * 200, <liquid:ice> * 200, <liquid:ic2hot_water> * 1000, 20);

	# Rplace wrong salt
	utils.rh(<immersivetech:material>);
	mods.immersivetechnology.Distiller.removeRecipe(<liquid:water>);
	mods.immersivetechnology.Distiller.addRecipe(<liquid:water> * 1000, <liquid:distwater> * 500, <mekanism:salt>, 2000, 20, 1.0f);
}
