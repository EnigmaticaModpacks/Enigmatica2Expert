import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
#modloaded iceandfire

# *======= Recipes =======*

# Cockatrice Scepter
	recipes.addShaped("Cockatrice Scepter", 
	<iceandfire:cockatrice_scepter>, 
	[[<ore:boneWither>], 
	[<iceandfire:cockatrice_eye>], 
	[<ore:boneWither>]]);

# Bone Conversion 
	recipes.addShapeless("Dragon Bone Conversion", <minecraft:bone> * 9, [<iceandfire:dragonbone>]);
	
# Dragon Heart -> Draconic Dragon Heart
	recipes.addShapeless("Dragon Heart Conversion1", 
	<draconicevolution:dragon_heart>, 
	[<iceandfire:ice_dragon_heart>]);
	
	recipes.addShapeless("Dragon Heart Conversion2", 
	<draconicevolution:dragon_heart>, 
	[<iceandfire:fire_dragon_heart>]);

# Witherbone conversion
	recipes.addShapeless("Witherbone Conversion1", 
	<tconstruct:materials:17>, 
	[<iceandfire:witherbone>]);
	
	recipes.addShapeless("Witherbone Conversion2", 
	<iceandfire:witherbone>, 
	[<tconstruct:materials:17>]);
	
# Remove existing Ash -> Charcoal recipe (Credit TheShadoWZYE)
	recipes.removeShaped(<minecraft:coal:1>, 
	[[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>],
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>], 
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>]]);
# Ash -> Coal Coke
	recipes.addShaped("Ash To Coal Coke", 
	<immersiveengineering:stone_decoration:3>, 
	[[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>],
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>], 
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>]]);

# Removals
	val removals = [
		<iceandfire:sapphire_ore>,
		<iceandfire:sapphire_block>,
		<iceandfire:sapphire_gem>,
		<iceandfire:armor_silver_metal_helmet>,
		<iceandfire:armor_silver_metal_chestplate>,
		<iceandfire:armor_silver_metal_leggings>,
		<iceandfire:armor_silver_metal_boots>,
		<iceandfire:silver_pickaxe>,
		<iceandfire:silver_sword>,
		<iceandfire:silver_shovel>,
		<iceandfire:silver_axe>,
		<iceandfire:silver_hoe>,
		<iceandfire:dragonbone_bow>,
		<iceandfire:dragonbone_arrow>,
		<iceandfire:dragonbone_hoe>,
		<iceandfire:dragonbone_axe>,
		<iceandfire:dragonbone_pickaxe>,
		<iceandfire:dragonbone_shovel>,
		<iceandfire:dragonsteel_fire_axe>,
		<iceandfire:dragonsteel_fire_hoe>,
		<iceandfire:dragonsteel_fire_pickaxe>,
		<iceandfire:dragonsteel_fire_shovel>,
		<iceandfire:dragonsteel_ice_axe>,
		<iceandfire:dragonsteel_ice_hoe>,
		<iceandfire:dragonsteel_ice_pickaxe>,
		<iceandfire:dragonsteel_ice_shovel>,
		<iceandfire:myrmex_desert_axe>,
		<iceandfire:myrmex_desert_hoe>,
		<iceandfire:myrmex_desert_pickaxe>,
		<iceandfire:myrmex_desert_shovel>,
		<iceandfire:myrmex_desert_sword>,
		<iceandfire:myrmex_jungle_axe>,
		<iceandfire:myrmex_jungle_hoe>,
		<iceandfire:myrmex_jungle_pickaxe>,
		<iceandfire:myrmex_jungle_shovel>,
		<iceandfire:myrmex_jungle_sword>,
		<iceandfire:wither_shard>,
		<iceandfire:silver_ore>,
		<iceandfire:cockatrice_scepter>
	] as IItemStack[];
	
	for item in removals {
	rh(item);
	}

	# Dragon Armor
	val dragonArmor = [
		<iceandfire:armor_red_helmet>,
		<iceandfire:armor_red_chestplate>,
		<iceandfire:armor_red_leggings>,
		<iceandfire:armor_red_boots>,
		<iceandfire:armor_bronze_helmet>,
		<iceandfire:armor_bronze_chestplate>,
		<iceandfire:armor_bronze_leggings>,
		<iceandfire:armor_bronze_boots>,
		<iceandfire:armor_green_helmet>,
		<iceandfire:armor_green_chestplate>,
		<iceandfire:armor_green_leggings>,
		<iceandfire:armor_green_boots>,
		<iceandfire:armor_gray_helmet>,
		<iceandfire:armor_gray_chestplate>,
		<iceandfire:armor_gray_leggings>,
		<iceandfire:armor_gray_boots>,
		<iceandfire:armor_blue_helmet>,
		<iceandfire:armor_blue_chestplate>,
		<iceandfire:armor_blue_leggings>,
		<iceandfire:armor_blue_boots>,
		<iceandfire:armor_white_helmet>,
		<iceandfire:armor_white_chestplate>,
		<iceandfire:armor_white_leggings>,
		<iceandfire:armor_white_boots>,
		<iceandfire:armor_sapphire_helmet>,
		<iceandfire:armor_sapphire_chestplate>,
		<iceandfire:armor_sapphire_leggings>,
		<iceandfire:armor_sapphire_boots>,
		<iceandfire:armor_silver_helmet>,
		<iceandfire:armor_silver_chestplate>,
		<iceandfire:armor_silver_leggings>,
		<iceandfire:armor_silver_boots>
	] as IItemStack[];
	
	for armor in dragonArmor {
	<ore:armorDragon>.add(armor);
	}


# Recycling myrmex resin
scripts.process.squeeze([<iceandfire:myrmex_resin>          ], <liquid:resin>*120, null, <iceandfire:myrmex_desert_resin>);
scripts.process.squeeze([<iceandfire:myrmex_resin:1>        ], <liquid:resin>*120, null, <iceandfire:myrmex_jungle_resin>);
scripts.process.squeeze([<iceandfire:myrmex_resin_sticky>   ], <liquid:resin>*180, null, <iceandfire:myrmex_desert_resin> * 2);
scripts.process.squeeze([<iceandfire:myrmex_resin_sticky:1> ], <liquid:resin>*180, null, <iceandfire:myrmex_jungle_resin> * 2);
scripts.process.squeeze([<iceandfire:desert_myrmex_cocoon>  ], <liquid:resin>*480, null, <iceandfire:myrmex_desert_resin> * 8);
scripts.process.squeeze([<iceandfire:jungle_myrmex_cocoon>  ], <liquid:resin>*480, null, <iceandfire:myrmex_jungle_resin> * 8);

# StackSize was 1
<iceandfire:ambrosia>.maxStackSize = 64;

# Add recipe because snow villages is disabled
# [Fishing Spear] from [Steel Arrow Head][+2]
craft.remake(<iceandfire:fishing_spear>, ["pretty",
  "S w  ",
  "w M  ",
  "    M"], {
  "S": <tconstruct:arrow_head>.withTag({Material: "steel"}), # Steel Arrow Head
  "w": <ore:wool>, # Wool
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# Dragons Breath from Dragon Forges
	mods.iceandfire.recipes.addFireDragonForgeRecipe(<integrateddynamics:crystalized_chorus_chunk>, <botania:manaresource:15>, <minecraft:dragon_breath>); 
	mods.iceandfire.recipes.addIceDragonForgeRecipe(<integrateddynamics:crystalized_chorus_chunk>, <botania:manaresource:15>, <minecraft:dragon_breath>);
