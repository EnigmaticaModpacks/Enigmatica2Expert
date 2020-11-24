import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded avaritia

# *======= Recipes =======*

# Neutronium Ingots with Neutron Fluid
	mods.nuclearcraft.infuser.addRecipe(<advancedrocketry:productingot:1>, <liquid:neutron> * 1000, <avaritia:resource:4>, 4500);
	scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<avaritia:resource:4>, <advancedrocketry:productingot:1>, <liquid:neutron> * 1000, 250000);

# Neutron block fix
	recipes.remove(<avaritia:resource:4>);
	recipes.addShaped("Neutron Ingots from Nuggets",
	<avaritia:resource:4>, 
	[[<avaritia:resource:3>, <avaritia:resource:3>, <avaritia:resource:3>],
	[<avaritia:resource:3>, <avaritia:resource:3>, <avaritia:resource:3>], 
	[<avaritia:resource:3>, <avaritia:resource:3>, <avaritia:resource:3>]]);
	recipes.addShapeless("Neutron Ingots from Block", <avaritia:resource:4> * 9, [<avaritia:block_resource>]);

	mods.avaritia.ExtremeCrafting.remove(<avaritia:ultimate_stew>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:cosmic_meatballs>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_helmet>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_chestplate>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_pants>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_boots>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_sword>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_bow>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_pickaxe>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_shovel>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_axe>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_hoe>);
	mods.avaritia.ExtremeCrafting.remove(<avaritiaio:infinitecapacitor>);

# Infinity Ingot
	mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:6>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <avaritia:resource:6>, [
	[<ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <avaritia:resource:5>, <extendedcrafting:singularity_ultimate>, <avaritia:resource:5>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <avaritia:resource:5>, <extendedcrafting:singularity_ultimate>, <avaritia:resource:5>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>], 
	[null, null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null, null]
	]);

# Neutron Collector
  if (!isNull(itemUtils.getItem("appliedenergistics2:controller"))) {
	  mods.avaritia.ExtremeCrafting.remove(<avaritia:neutron_collector>);
	  scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <avaritia:neutron_collector>, [
	  [<environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>], 
	  [<environmentaltech:mica>, null, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, null, <environmentaltech:mica>], 
	  [<environmentaltech:mica>, null, <forestry:chipsets:3>.withTag({T:3 as short}, false), <ore:circuitUltimate>, <advancedrocketry:ic:2>, <ore:circuitUltimate>, <forestry:chipsets:3>.withTag({T:3 as short}, false), null, <environmentaltech:mica>], 
	  [<ore:ingotCrystalMatrix>, null, <ore:circuitUltimate>, <advgenerators:controller>, <advgenerators:controller>, <advgenerators:controller>, <ore:circuitUltimate>, null, <ore:ingotCrystalMatrix>], 
	  [null, null, <advancedrocketry:ic:2>, <advgenerators:controller>, itemUtils.getItem("appliedenergistics2:controller"), <advgenerators:controller>, <advancedrocketry:ic:2>, null, null], 
	  [<ore:ingotCrystalMatrix>, null, <ore:circuitUltimate>, <advgenerators:controller>, <advgenerators:controller>, <advgenerators:controller>, <ore:circuitUltimate>, null, <ore:ingotCrystalMatrix>], 
	  [<actuallyadditions:block_heat_collector>, null, <forestry:chipsets:3>.withTag({T:3 as short}, false), <ore:circuitUltimate>, <advancedrocketry:ic:2>, <ore:circuitUltimate>, <forestry:chipsets:3>.withTag({T:3 as short}, false), null, <actuallyadditions:block_heat_collector>], 
	  [<actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, null, null, null, null, null, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>], 
	  [<actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, <ore:ingotCrystalMatrix>, <actuallyadditions:block_heat_collector>, <ore:ingotCrystalMatrix>, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>]
		]);
	} else {
	  mods.avaritia.ExtremeCrafting.remove(<avaritia:neutron_collector>);
	  scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <avaritia:neutron_collector>, [
	  [<environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>, <ore:ingotCrystalMatrix>, <environmentaltech:mica>], 
	  [<environmentaltech:mica>, null, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, <nuclearcraft:helium_collector_dense>, null, <environmentaltech:mica>], 
	  [<environmentaltech:mica>, null, <forestry:chipsets:3>.withTag({T:3 as short}, false), <ore:circuitUltimate>, <advancedrocketry:ic:2>, <ore:circuitUltimate>, <forestry:chipsets:3>.withTag({T:3 as short}, false), null, <environmentaltech:mica>], 
	  [<ore:ingotCrystalMatrix>, null, <ore:circuitUltimate>, <advgenerators:controller>, <advgenerators:controller>, <advgenerators:controller>, <ore:circuitUltimate>, null, <ore:ingotCrystalMatrix>], 
	  [null, null, <advancedrocketry:ic:2>, <advgenerators:controller>, <appliedenergistics2:energy_acceptor>, <advgenerators:controller>, <advancedrocketry:ic:2>, null, null], 
	  [<ore:ingotCrystalMatrix>, null, <ore:circuitUltimate>, <advgenerators:controller>, <advgenerators:controller>, <advgenerators:controller>, <ore:circuitUltimate>, null, <ore:ingotCrystalMatrix>], 
	  [<actuallyadditions:block_heat_collector>, null, <forestry:chipsets:3>.withTag({T:3 as short}, false), <ore:circuitUltimate>, <advancedrocketry:ic:2>, <ore:circuitUltimate>, <forestry:chipsets:3>.withTag({T:3 as short}, false), null, <actuallyadditions:block_heat_collector>], 
	  [<actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, null, null, null, null, null, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>], 
	  [<actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, <ore:ingotCrystalMatrix>, <actuallyadditions:block_heat_collector>, <ore:ingotCrystalMatrix>, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>, <actuallyadditions:block_heat_collector>]
		]);
	}

# Neutronium Compressor isn't used
	mods.avaritia.ExtremeCrafting.remove(<avaritia:neutronium_compressor>);

# Infinity Catalyst
	mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:5>);
	scripts.wrap.extendedcrafting.TableCrafting.addShapeless(0, <avaritia:resource:5>, 
	[<avaritia:ultimate_stew>, <avaritia:endest_pearl>, <bigreactors:mineralbenitoite>, 
	<ore:tokenOrIdolFlag>, 	<bigreactors:mineralanglesite>, <ore:record>, <avaritia:cosmic_meatballs>, 
	<quark:soul_bead>, 	<ore:slimecrystalPink>, <ore:plateElite>, <bloodmagic:demon_crystal>, 
	<ore:dragonEgg>, 	<scalinghealth:heartcontainer>, 
	<rustic:fluid_bottle>.withTag({Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1 as float}}}),
	<ore:blockWither>, <ore:blockAethium>, 	<ore:blockCosmicNeutronium>, <ore:dustAlchEmerald>, 
	<ore:blockEvilMetal>, <ore:blockCoalCoke>, 	<ore:compressed3xDustBedrock>, <ore:blockUUMatter>, 
	<ore:blockLudicrite>, <ore:blockAmethyst>, 	<randomthings:spectreilluminator>, 
	<twilightforest:block_storage:4>, <extrautils2:decorativesolid:6>, <ore:blockDilithium>, 	
	<ore:blockCrystalMatrix>, <ore:blockEnderium>, <deepmoblearning:infused_ingot_block>, 	
	<contenttweaker:terrestrial_artifact_block>, <ore:blockInsanium>, <appliedenergistics2:fluix_block>,
	compressIt(<draconicevolution:draconium_block:1>, 2), <ore:blockMyrmexResin>, 
	<ore:blockDraconicMetal>, 	<forestry:bee_combs_0>, <ore:blockPrimordial>, 
	<extendedcrafting:storage:7>, <ore:blockAstralStarmetal>, 	<ore:blockOsgloglas>, <ore:blockMirion>]);
	
# Endest Pearl
	mods.avaritia.ExtremeCrafting.remove(<avaritia:endest_pearl>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <avaritia:endest_pearl>, [
	[null, null, null, <ore:endstone>, <ore:endstone>, <ore:endstone>, null, null, null], 
	[null, null, <ore:endstone>, <extrautils2:endershard>, <cyclicmagic:ender_eye_orb>, <extrautils2:endershard>, <ore:endstone>, null, null], 
	[null, <ore:endstone>, <darkutils:material:1>, <ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>, <darkutils:material:1>, <ore:endstone>, null], 
	[<ore:endstone>, <extrautils2:endershard>, <ore:enderpearl>, <ore:enderpearl>, <actuallyadditions:block_misc:8>, <ore:enderpearl>, <ore:enderpearl>, <extrautils2:endershard>, <ore:endstone>], 
	[<ore:endstone>, <cyclicmagic:ender_eye_orb>, <ore:enderpearl>, <actuallyadditions:block_misc:8>, <actuallyadditions:item_misc:19>, <actuallyadditions:block_misc:8>, <ore:enderpearl>, <cyclicmagic:ender_eye_orb>, <ore:endstone>], 
	[<ore:endstone>, <extrautils2:endershard>, <ore:enderpearl>, <ore:enderpearl>, <actuallyadditions:block_misc:8>, <ore:enderpearl>, <ore:enderpearl>, <extrautils2:endershard>, <ore:endstone>], 
	[null, <ore:endstone>, <darkutils:material:1>, <ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>, <darkutils:material:1>, <ore:endstone>, null], 
	[null, null, <ore:endstone>, <extrautils2:endershard>, <cyclicmagic:ender_eye_orb>, <extrautils2:endershard>, <ore:endstone>, null, null], 
	[null, null, null, <ore:endstone>, <ore:endstone>, <ore:endstone>, null, null, null]
	]);
	
# Skullfire Sword
 	mods.avaritia.ExtremeCrafting.remove(<avaritia:skullfire_sword>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <avaritia:skullfire_sword>, [
	[null, <minecraft:enchanted_book>, null, null, <bloodmagic:lava_crystal>], 
	[null, null, null, <randomthings:obsidianskull>, null], 
	[null, <tconstruct:wide_guard>, <tconstruct:cleaver>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 7.2 as float, FreeModifiers: 3, Durability: 2088, HarvestLevel: 3, Attack: 11.58 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 7.2 as float, FreeModifiers: 2, Durability: 2088, HarvestLevel: 3, Attack: 11.58 as float}, Special: {Categories: ["tool", "weapon"]}, TinkerData: {Materials: ["fierymetal", "fierymetal", "fierymetal", "fierymetal"], Modifiers: ["beheading_cleaver", "toolleveling"]}, Modifiers: [{identifier: "twilit", color: -142243, level: 1}, {identifier: "flammable", color: -142243, level: 1}, {identifier: "autosmelt", color: -142243, level: 1}, {identifier: "superheat", color: -142243, level: 1}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["twilit", "flammable", "autosmelt", "superheat", "toolleveling"]}), null, null], 
	[null, <tconstruct:tough_tool_rod>, <tconstruct:wide_guard>, null, <minecraft:enchanted_book>], 
	[<ore:netherStar>, null, null, null, null]
]);

# Ultimate Stew
	scripts.wrap.extendedcrafting.TableCrafting.addShapeless(4, 
	<avaritia:ultimate_stew> * 9,  
	[<ore:ingotCosmicNeutronium>, 
	<ore:cropWheat>, 
	<ore:cropApple>, 
	<ore:cropMelon>, 
	<ore:cropBean>, 
	<ore:cropPumpkin>, 
	<ore:cropCarrot>, 
	<ore:cropPotato>, 
	<ore:cropBeetroot>, 
	<ore:cropAsparagus>, 
	<ore:cropCorn>, 
	<ore:cropBambooshoot>, 
	<ore:cropCucumber>, 
	<ore:cropWintersquash>, 
	<ore:cropZucchini>, 
	<ore:cropOnion>, 
	<ore:cropBeet>, 
	<ore:cropParsnip>, 
	<ore:cropRadish>, 
	<ore:cropRutabaga>, 
	<ore:cropSweetpotato>, 
	<ore:cropTurnip>, 
	<ore:cropRhubarb>, 
	<ore:cropCelery>, 
	<ore:cropSpiceleaf>, 
	<ore:cropBroccoli>, 
	<ore:cropCauliflower>, 
	<ore:cropLeek>, 
	<ore:cropLettuce>, 
	<ore:cropScallion>, 
	<ore:cropArtichoke>, 
	<ore:cropBrusselsprout>, 
	<ore:cropCabbage>, 
	<ore:cropSpinach>, 
	<ore:mushroomAny>, 
	<ore:cropBellpepper>, 
	<ore:cropEggplant>, 
	<ore:cropOkra>, 
	<ore:cropPeas>, 
	<ore:cropSeaweed>, 
	<ore:cropWaterchestnut>, 
	<ore:cropTomato>, 
	<ore:cropGarlic>, 
	<ore:cropBlackberry>, 
	<ore:cropBlueberry>, 
	<ore:cropRaspberry>, 
	<ore:cropStrawberry>, 
	<ore:cropCranberry>, 
	<ore:cropGooseberry>, 
	<rustic:ironberries>, 
	<rustic:wildberries>, 
	<ore:cropGrape>]);

# Cosmic Meatballs
	scripts.wrap.extendedcrafting.TableCrafting.addShapeless(4, 
	<avaritia:cosmic_meatballs> * 9, 
	[<ore:ingotCosmicNeutronium>, 
	<minecraft:porkchop>, 
	<minecraft:beef>, 
	<minecraft:chicken>, 
	<minecraft:rabbit>, 
	<minecraft:mutton>, 
	<animania:raw_prime_steak>,
	<animania:raw_prime_pork>,
	<animania:raw_prime_bacon>,
	<animania:raw_prime_chicken>,
	<animania:raw_prime_mutton>,
	<animania:raw_prime_rabbit>,
	<animania:raw_frog_legs>,
	<animania:raw_horse>,
	<animania:raw_chevon>,
	<animania:raw_prime_chevon>,
	<animania:raw_peacock>,
	<animania:raw_prime_beef>,
	<animania:raw_prime_peacock>,
	<harvestcraft:turkeyrawitem>, 
	<harvestcraft:venisonrawitem>, 
	<harvestcraft:duckrawitem>]);
		
# Neutronium Ingot
	var ni = <ore:ingotCosmicNeutronium>;
# Infinity Catalyst
	var ic = <avaritia:resource:5>;
# Infinity Ingot
	var ii = <ore:ingotInfinity>;
# Crystal Matrix
	var cm = <ore:blockCrystalMatrix>;
	
# Infinity Armor
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_helmet>, 
	[
	[null, null, ni, ni, ni, ni, ni, null, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, null, ic, ii, ic, null, ni, null],
	[null, ni, ii, ii, <draconicevolution:draconic_helm>.anyDamage(), ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, null, ii, null, ii, ni, null],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null]
	]);

	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_chestplate>, 
	[
	[null, ni, ni, null, null, null, ni, ni, null],
	[ni, ni, ni, null, null, null, ni, ni, ni],
	[ni, ni, ni, null, null, null, ni, ni, ni],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, ii, <draconicevolution:draconic_chest>.anyDamage(), ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, null, ni, ni, ni, ni, ni, null, null]
	]);

	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_pants>, 
	[
	[ni, ni, ni, ni, ni, ni, ni, ni, ni],
	[ni, ii, ii, ii, <draconicevolution:draconic_legs>.anyDamage(), ii, ii, ii, ni],
	[ni, ii, ni, ni, ni, ni, ni, ii, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ic, ni, null, null, null, ni, ic, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ni, ni, null, null, null, ni, ni, ni]
	]);

	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_boots>, 
	[
	[null, ni, ni, ni, null, ni, ni, ni, null],
	[null, ni, ii, ni, null, ni, ii, ni, null],
	[null, ni, ii, ni, null, ni, ii, ni, null],
	[ni, ni, ii, ni, null, ni, ii, ni, ni],
	[ni, ii, ii, ni, null, ni, ii, ii, ni],
	[ni, ni, ni, ni, <draconicevolution:draconic_boots>.anyDamage(), ni, ni, ni, ni],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null]
	]);

# Infinity Sword
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_sword>, 
	[
	[null, null, null, null, null, null, null, ii, ii],
	[null, null, null, null, null, null, ii, ii, ii],
	[null, null, null, null, null, ii, ii, ii, null],
	[null, null, null, null, ii, ii, ii, null, null],
	[null, cm, null, ii, ii, ii, null, null, null],
	[null, null, cm, <draconicevolution:draconic_staff_of_power>.anyDamage(), ii, null, null, null, null],
	[null, null, ni, cm, null, null, null, null, null],
	[null, ni, null, null, cm, null, null, null, null],
	[ic, null, null, null, null, null, null, null, null]
	]);
	
# Infinity Bow
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_bow>, 
	[
	[null, null, null, ii, ii, null, null, null, null],
	[null, null, ii, null, <ore:blockRockwool>, null, null, null, null],
	[null, ii, null, null, <ore:blockRockwool>, null, null, null, null],
	[ii, null, null, null, <ore:blockRockwool>, null, null, null, null],
	[<draconicevolution:draconic_bow>.anyDamage(), null, null, null, <ore:blockRockwool>, null, null, null, null],
	[ii, null, null, null, <ore:blockRockwool>, null, null, null, null],
	[null, ii, null, null, <ore:blockRockwool>, null, null, null, null],
	[null, null, ii, null, <ore:blockRockwool>, null, null, null, null],
	[null, null, null, ii, ii, null, null, null, null]
	]);
	
# Infinity Pickaxe
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_pickaxe>.withTag({ench: [{lvl: 10 as short, id: 35 as short}]}), 
	[
	[null, ii, ii, ii, ii, ii, ii, ii, null],
	[ii, ii, ii, ii, cm, ii, ii, ii, ii],
	[ii, ii, null, null, <draconicevolution:draconic_pick>.anyDamage(), null, null, ii, ii],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null]
	]);
	
# Infinity Shovel
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_shovel>, 
	[
	[null, null, null, null, null, null, ii, ii, ii],
	[null, null, null, null, null, ii, ii, <ore:blockInfinity>, ii],
	[null, null, null, null, null, null, <draconicevolution:draconic_shovel>.anyDamage(), ii, ii],
	[null, null, null, null, null, ni, null, ii, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, ni, null, null, null, null, null],
	[null, null, ni, null, null, null, null, null, null],
	[null, ni, null, null, null, null, null, null, null],
	[ni, null, null, null, null, null, null, null, null]
	]);
	
# Infinity Axe
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_axe>, 
	[
	[null, null, null, ii, null, null, null, null, null],
	[null, null, ii, ii, ii, ii, ii, null, null],
	[null, null, null, ii, ii, <draconicevolution:draconic_axe>.anyDamage(), ii, null, null],
	[null, null, null, null, null, ii, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null]
	]);
	
# Infinity Hoe
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_hoe>, 
	[
	[null, null, null, null, null, ni, null, null, null],
	[null, ii, ii, ii, ii, ii, ii, null, null],
	[ii, ii, ii, ii, ii, <draconicevolution:draconic_hoe>.anyDamage(), ii, null, null],
	[ii, null, null, null, null, ii, ii, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null]
	]);
	
	recipes.remove(<avaritia:extreme_crafting_table>);
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<avaritia:extreme_crafting_table>, 
	100000000, 1000000, <avaritia:double_compressed_crafting_table>, 
	[<avaritia:resource:1>, <avaritia:resource:1>, <extendedcrafting:material:12>, 
	<extendedcrafting:material:12>, <avaritia:resource:1>, <avaritia:resource:1>]);



# Using Dragon forge to harder recipes
function addDragonForgeRecipe(input1 as IItemStack, input2 as IItemStack, output as IItemStack) {
	mods.iceandfire.recipes.addFireDragonForgeRecipe(input1, input2, output);
	mods.iceandfire.recipes.addIceDragonForgeRecipe(input1, input2, output);
}

recipes.removeByRecipeName("avaritia:items/resource/crystal_matrix_ingot");
addDragonForgeRecipe(<minecraft:nether_star> * 2, <avaritia:resource> * 4, <avaritia:resource:1>);

# Lattice
var CD = <mekanism:compresseddiamond>;
recipes.remove(<avaritia:resource>);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<avaritia:resource> * 2, 100000000, 1000000, CD, [CD]);
# Somehow infuser craft item/tick after first item
# mods.thermalexpansion.Infuser.addRecipe(<avaritia:resource>, CD, 50000000);