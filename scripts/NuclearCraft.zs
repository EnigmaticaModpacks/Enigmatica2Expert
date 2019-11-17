import mods.jei.JEI.removeAndHide as rh;
#modloaded nuclearcraft
print("--- loading NuclearCraft.zs ---");

# Lithium Ingot Mekanism Compat
	//mods.mekanism.smelter.addRecipe(<ic2:dust:11>, <nuclearcraft:ingot:6>);
	
# Rhodochrosite
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem>, <biomesoplenty:gem:1>, 15000);

# Fluorite
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem:2>, <biomesoplenty:gem:2>, 15000);

# Rock Crusher
	recipes.remove(<nuclearcraft:rock_crusher_idle>);
	recipes.addShapedMirrored("Rock Crusher", 
	<nuclearcraft:rock_crusher_idle>, 
	[[<ore:plateDU>, <ore:motor>, <ore:plateDU>],
	[<ore:actuator>, <ore:chassis>, <ore:actuator>], 
	[<ore:plateDU>, <ore:motor>, <ore:plateDU>]]);

# Clay Dust
	mods.nuclearcraft.manufactory.addRecipe(<minecraft:clay>, <ic2:dust:1> * 4);
	mods.nuclearcraft.manufactory.removeRecipeWithOutput(<ic2:dust:1> * 2);

# A slight buff to the Deuterium recipe
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:heavywater> * 1000, <liquid:deuterium> * 500,  <liquid:deuterium> * 500, <liquid:oxygen> * 500, <liquid:tritium> * 50]);
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:ic2heavy_water> * 1000, <liquid:deuterium> * 500,  <liquid:deuterium> * 500, <liquid:oxygen> * 500, <liquid:tritium> * 50]);
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:water> * 1000, <liquid:hydrogen> * 500, <liquid:hydrogen> * 500,  <liquid:deuterium> * 50, <liquid:oxygen> * 500]);
	mods.nuclearcraft.electrolyser.removeRecipeWithOutput([<liquid:deuterium> * 950, <liquid:oxygen> * 500, <liquid:tritium> * 50, null]);
	mods.nuclearcraft.electrolyser.removeRecipeWithOutput([<liquid:hydrogen> * 950, <liquid:deuterium> * 50, <liquid:oxygen> * 500, null]);

# Basic Plating
	recipes.remove(<nuclearcraft:part>);
	recipes.addShapedMirrored("Basic Plating", 
	<nuclearcraft:part> * 4, 
	[[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>],
	[<ic2:casing:4>, <ore:blockGraphite>, <ic2:casing:4>], 
	[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>]]);

# Copper Solenoid
	recipes.remove(<nuclearcraft:part:4>);
	recipes.addShapedMirrored("Copper Solenoid", 
	<nuclearcraft:part:4> * 4, 
	[[<ore:plateCopper>, <ic2:casing:1>, <ore:plateCopper>],
	[<ore:stickAluminum>, <ic2:ingot>, <ore:stickAluminum>], 
	[<ore:plateCopper>, <ic2:casing:1>, <ore:plateCopper>]]);

# Add missing ingots/bricks to ingot former
	//Brick
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:clay>*144, <minecraft:brick>, 1.0, 1.0]);
	//Starmetal Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:astral_starmetal>*144, <astralsorcery:itemcraftingcomponent:1>, 1.0, 1.0]);
	//Demon Metal Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:xu_demonic_metal>*144, <extrautils2:ingredients:11>, 2.0, 2.0]);
	//Enchanted Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:xu_enchanted_metal>*144, <extrautils2:ingredients:12>, 1.0, 1.0]);
	//Evil Infused Iron Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:xu_evil_metal>*144, <extrautils2:ingredients:17>, 1.0, 1.0]);
	//Fire Dragonsteel Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:dragonsteel_fire>*144, <iceandfire:dragonsteel_fire_ingot>, 1.0, 1.0]);
	//Ice Dragonsteel Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:dragonsteel_ice>*144, <iceandfire:dragonsteel_ice_ingot>, 1.0, 1.0]);
	//Pink Slime Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:molten_reinforced_pink_slime>*144, <industrialforegoing:pink_slime_ingot>, 1.0, 1.0]);
	//Refined Obsidian Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:refinedobsidian>*144, <mekanism:ingot>, 1.0, 1.0]);
	//Refined Glowstone Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:refinedglowstone>*144, <mekanism:ingot:3>, 1.0, 1.0]);
	//Base Essence Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:base_essence>*144, <mysticalagriculture:crafting:32>, 1.0, 1.0]);
	//Psimetal Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:psimetal>*144, <psi:material:1>, 1.0, 1.0]);
	//Fiery Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:fierymetal>*144, <twilightforest:fiery_ingot>, 1.0, 1.0]);
	//Seared Brick
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:stone>*72, <tconstruct:materials>, 1.0, 1.0]);
	//Mud Brick
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:dirt>*144, <tconstruct:materials:1>, 1.0, 1.0]);
	//Elementium Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:elementium>*144, <botania:manaresource:7>, 1.0, 1.0]);

# *======= Remove & Hide =======*
	
	rh(<nuclearcraft:ore>);
	rh(<nuclearcraft:ore:1>);
	rh(<nuclearcraft:ore:2>);
	rh(<nuclearcraft:ore:4>);
	rh(<nuclearcraft:dust>);
	rh(<nuclearcraft:dust:2>);
	rh(<nuclearcraft:dust:1>);
	rh(<nuclearcraft:ingot:4>);
	rh(<nuclearcraft:ingot:2>);
	rh(<nuclearcraft:ingot:1>);
	rh(<nuclearcraft:dust:4>);
	rh(<nuclearcraft:alloy>);
	rh(<nuclearcraft:alloy:5>);
	rh(<nuclearcraft:ingot>);
# *======= Recipes =======*

	
	print("--- NuclearCraft.zs initialized ---");
