import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
import mods.immersiveengineering.MetalPress;

	
# *======= Variables =======*

# All plates that are added by 2 or more mods 
	val plateIron = <ore:plateIron>;
	val plateGold = <ore:plateGold>;
	val plateCopper = <ore:plateCopper>;
	val plateTin = <ore:plateTin>;
	val plateSilver = <ore:plateSilver>;
	val plateLead = <ore:plateLead>;
	val plateAluminum = <ore:plateAluminum>;
	val plateNickel = <ore:plateNickel>;
	val plateSteel = <ore:plateSteel>;
	val plateElectrum = <ore:plateElectrum>;
	val plateInvar = <ore:plateInvar>;
	val plateBronze = <ore:plateBronze>;
	val plateConstantan = <ore:plateConstantan>;
	val plateIridium = <ore:plateIridium>;

# *======= Metal Plates =======*
	
	val platesToRemove = [
	<immersiveengineering:metal:30>,
	<immersiveengineering:metal:31>,
	<immersiveengineering:metal:32>,
	<immersiveengineering:metal:33>,
	<immersiveengineering:metal:34>,
	<immersiveengineering:metal:36>,
	<immersiveengineering:metal:37>,
	<immersiveengineering:metal:38>,
	<immersiveengineering:metal:39>,
	<immersiveengineering:metal:40>,

	<ic2:plate>,
	<ic2:plate:1>,
	<ic2:plate:2>,
	<ic2:plate:3>,
	<ic2:plate:5>,
	<ic2:plate:7>,
	<ic2:plate:8>,
	
	<thaumcraft:plate:1>,

	<libvulpes:productplate:1>,
	<libvulpes:productplate:2>,
	<libvulpes:productplate:4>,
	<libvulpes:productplate:5>,
	<libvulpes:productplate:6>,
	<libvulpes:productplate:9>,
	<libvulpes:productplate:10>,

	] as IItemStack[];
	
	for items in platesToRemove {
		rh(items);
	}

	recipes.remove(<thaumcraft:plate>);
	recipes.remove(<thaumcraft:plate:2>);
	recipes.remove(<thaumcraft:plate:3>);
	
	val platesIE = [
	<immersiveengineering:metal:30>,
	<immersiveengineering:metal:31>,
	<immersiveengineering:metal:32>,
	<immersiveengineering:metal:33>,
	<immersiveengineering:metal:34>,
	<immersiveengineering:metal:35>,
	<immersiveengineering:metal:36>,
	<immersiveengineering:metal:37>,
	<immersiveengineering:metal:38>,
	<immersiveengineering:metal:39>,
	<immersiveengineering:metal:40>
	] as IItemStack[];
	
	for plate in platesIE {
	mods.immersiveengineering.MetalPress.removeRecipe(plate);
	}
	
# Immersive Engineering hammer compatibility for Thermal Expansion plates
recipes.addShapeless("plate32a", <thermalfoundation:material:32>, [<ore:ingotIron>, <ore:ingotIron>, <immersiveengineering:tool>]);
recipes.addShapeless("plate33a", <thermalfoundation:material:33>, [<ore:ingotGold>, <ore:ingotGold>, <immersiveengineering:tool>]);
recipes.addShapeless("plate35a", <immersiveengineering:metal:35>, [<ore:ingotUranium>, <ore:ingotUranium>, <immersiveengineering:tool>]);
recipes.addShapeless("plate128a", <redstonearsenal:material:128>, [<ore:ingotElectrumFlux>, <ore:ingotElectrumFlux>, <immersiveengineering:tool>]);
recipes.addShapeless("plate320a", <thermalfoundation:material:320>, [<ore:ingotCopper>, <ore:ingotCopper>, <immersiveengineering:tool>]);
recipes.addShapeless("plate321a", <thermalfoundation:material:321>, [<ore:ingotTin>, <ore:ingotTin>, <immersiveengineering:tool>]);
recipes.addShapeless("plate322a", <thermalfoundation:material:322>, [<ore:ingotSilver>, <ore:ingotSilver>, <immersiveengineering:tool>]);
recipes.addShapeless("plate323a", <thermalfoundation:material:323>, [<ore:ingotLead>, <ore:ingotLead>, <immersiveengineering:tool>]);
recipes.addShapeless("plate324a", <thermalfoundation:material:324>, [<ore:ingotAluminum>, <ore:ingotAluminum>, <immersiveengineering:tool>]);
recipes.addShapeless("plate325a", <thermalfoundation:material:325>, [<ore:ingotNickel>, <ore:ingotNickel>, <immersiveengineering:tool>]);
recipes.addShapeless("plate326a", <thermalfoundation:material:326>, [<ore:ingotPlatinum>, <ore:ingotPlatinum>, <immersiveengineering:tool>]);
recipes.addShapeless("plate327a", <thermalfoundation:material:327>, [<ore:ingotIridium>, <ore:ingotIridium>, <immersiveengineering:tool>]);
recipes.addShapeless("plate328a", <thermalfoundation:material:328>, [<ore:ingotMithril>, <ore:ingotMithril>, <immersiveengineering:tool>]);
recipes.addShapeless("plate352a", <thermalfoundation:material:352>, [<ore:ingotSteel>, <ore:ingotSteel>, <immersiveengineering:tool>]);
recipes.addShapeless("plate353a", <thermalfoundation:material:353>, [<ore:ingotElectrum>, <ore:ingotElectrum>, <immersiveengineering:tool>]);
recipes.addShapeless("plate354a", <thermalfoundation:material:354>, [<ore:ingotInvar>, <ore:ingotInvar>, <immersiveengineering:tool>]);
recipes.addShapeless("plate355a", <thermalfoundation:material:355>, [<ore:ingotBronze>, <ore:ingotBronze>, <immersiveengineering:tool>]);
recipes.addShapeless("plate356a", <thermalfoundation:material:356>, [<ore:ingotConstantan>, <ore:ingotConstantan>, <immersiveengineering:tool>]);
recipes.addShapeless("plate357a", <thermalfoundation:material:357>, [<ore:ingotSignalum>, <ore:ingotSignalum>, <immersiveengineering:tool>]);
recipes.addShapeless("plate358a", <thermalfoundation:material:358>, [<ore:ingotLumium>, <ore:ingotLumium>, <immersiveengineering:tool>]);
recipes.addShapeless("plate359a", <thermalfoundation:material:359>, [<ore:ingotEnderium>, <ore:ingotEnderium>, <immersiveengineering:tool>]);

# IndustrialCraft2 hammer compatibility for Thermal Expansion plates
recipes.addShapeless("plate32b", <thermalfoundation:material:32>, [<ore:ingotIron>, <ore:ingotIron>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate33b", <thermalfoundation:material:33>, [<ore:ingotGold>, <ore:ingotGold>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate35b", <immersiveengineering:metal:35>, [<ore:ingotUranium>, <ore:ingotUranium>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate128b", <redstonearsenal:material:128>, [<ore:ingotElectrumFlux>, <ore:ingotElectrumFlux>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate320b", <thermalfoundation:material:320>, [<ore:ingotCopper>, <ore:ingotCopper>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate321b", <thermalfoundation:material:321>, [<ore:ingotTin>, <ore:ingotTin>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate322b", <thermalfoundation:material:322>, [<ore:ingotSilver>, <ore:ingotSilver>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate323b", <thermalfoundation:material:323>, [<ore:ingotLead>, <ore:ingotLead>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate324b", <thermalfoundation:material:324>, [<ore:ingotAluminum>, <ore:ingotAluminum>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate325b", <thermalfoundation:material:325>, [<ore:ingotNickel>, <ore:ingotNickel>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate326b", <thermalfoundation:material:326>, [<ore:ingotPlatinum>, <ore:ingotPlatinum>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate327b", <thermalfoundation:material:327>, [<ore:ingotIridium>, <ore:ingotIridium>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate328b", <thermalfoundation:material:328>, [<ore:ingotMithril>, <ore:ingotMithril>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate352b", <thermalfoundation:material:352>, [<ore:ingotSteel>, <ore:ingotSteel>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate353b", <thermalfoundation:material:353>, [<ore:ingotElectrum>, <ore:ingotElectrum>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate354b", <thermalfoundation:material:354>, [<ore:ingotInvar>, <ore:ingotInvar>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate355b", <thermalfoundation:material:355>, [<ore:ingotBronze>, <ore:ingotBronze>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate356b", <thermalfoundation:material:356>, [<ore:ingotConstantan>, <ore:ingotConstantan>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate357b", <thermalfoundation:material:357>, [<ore:ingotSignalum>, <ore:ingotSignalum>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate358b", <thermalfoundation:material:358>, [<ore:ingotLumium>, <ore:ingotLumium>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("plate359b", <thermalfoundation:material:359>, [<ore:ingotEnderium>, <ore:ingotEnderium>, <ic2:forge_hammer>.anyDamage()]);

# IndustrialCraft MetalFormer & Block Cutter compatibility for Thermal Expansion plates
	# Can be found in the config/ic2 folder
	
# Immersive Engineering Metal Press compatibility for Thermal Expansion Plates
MetalPress.addRecipe(<thermalfoundation:material:32>, <ore:ingotIron>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:33>, <ore:ingotGold>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:320>, <ore:ingotCopper>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:321>, <ore:ingotTin>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:322>, <ore:ingotSilver>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:323>, <ore:ingotLead>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:324>, <ore:ingotAluminum>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:325>, <ore:ingotNickel>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:352>, <ore:ingotSteel>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:353>, <ore:ingotElectrum>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:355>, <ore:ingotBronze>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<thermalfoundation:material:356>, <ore:ingotConstantan>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<immersiveengineering:metal:35>, <ore:ingotUranium>, <immersiveengineering:mold>, 125, 1);

recipes.addShapeless("Brass Plate1", <thaumcraft:plate>, [<ore:ingotBrass>, <ore:ingotBrass>, <immersiveengineering:tool>]);
recipes.addShapeless("Thaumium Plate1", <thaumcraft:plate:2>, [<ore:ingotThaumium>, <ore:ingotThaumium>, <immersiveengineering:tool>]);
recipes.addShapeless("Void Metal Plate1", <thaumcraft:plate:3>, [<ore:ingotVoid>, <ore:ingotVoid>, <immersiveengineering:tool>]);

recipes.addShapeless("Brass Plate2", <thaumcraft:plate>, [<ore:ingotBrass>, <ore:ingotBrass>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("Thaumium Plate2", <thaumcraft:plate:2>, [<ore:ingotThaumium>, <ore:ingotThaumium>, <ic2:forge_hammer>.anyDamage()]);
recipes.addShapeless("Void Metal Plate2", <thaumcraft:plate:3>, [<ore:ingotVoid>, <ore:ingotVoid>, <ic2:forge_hammer>.anyDamage()]);

recipes.addShapeless("enigmatica_steel_casing_with_tool", <ic2:casing:5> * 2, [<ore:plateSteel>, <immersiveengineering:tool>]);
recipes.addShapeless("enigmatica_steel_casing_with_forge_hammer", <ic2:casing:5> * 2, [<ore:plateSteel>, <ic2:forge_hammer>.anyDamage()]);

MetalPress.addRecipe(<ic2:casing> * 2, <ore:plateBronze>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:1> * 2, <ore:plateCopper>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:2> * 2, <ore:plateGold>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:3> * 2, <ore:plateIron>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:4> * 2, <ore:plateLead>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:5> * 2, <ore:plateSteel>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:6> * 2, <ore:plateTin>, <immersiveengineering:mold>, 125, 1);
	
# Removing plates from JEI "cycling".
plateIron.remove(<immersiveengineering:metal:39>);
plateIron.remove(<libvulpes:productplate:1>);
plateIron.remove(<ic2:plate:3>);
#plateIron.remove(<thaumcraft:plate:1>);
plateGold.remove(<immersiveengineering:metal:40>);
plateGold.remove(<libvulpes:productplate:2>);
plateGold.remove(<ic2:plate:2>);
plateCopper.remove(<immersiveengineering:metal:30>);
plateCopper.remove(<libvulpes:productplate:4>);
plateCopper.remove(<ic2:plate:1>);
plateTin.remove(<ic2:plate:8>);
plateTin.remove(<libvulpes:productplate:5>);
plateSilver.remove(<immersiveengineering:metal:33>);
plateLead.remove(<immersiveengineering:metal:32>);
plateLead.remove(<ic2:plate:5>);
plateAluminum.remove(<immersiveengineering:metal:31>);
plateAluminum.remove(<libvulpes:productplate:9>);
plateNickel.remove(<immersiveengineering:metal:34>);
plateSteel.remove(<immersiveengineering:metal:38>);
plateSteel.remove(<libvulpes:productplate:6>);
plateSteel.remove(<ic2:plate:7>);
plateElectrum.remove(<immersiveengineering:metal:37>);
plateConstantan.remove(<immersiveengineering:metal:36>);
plateBronze.remove(<ic2:plate>);
plateIridium.remove(<libvulpes:productplate:10>);

