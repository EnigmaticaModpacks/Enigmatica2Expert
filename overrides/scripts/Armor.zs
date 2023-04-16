import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

# *======= Energy Armor =======*

	var energyArmor = [
	<immersiveengineering:faraday_suit_head>,
	<immersiveengineering:faraday_suit_chest>,
	<immersiveengineering:faraday_suit_legs>,
	<immersiveengineering:faraday_suit_feet>,
	<ic2:nano_helmet>,
	<ic2:nano_chestplate>,
	<ic2:nano_leggings>,
	<ic2:nano_boots>,
	<redstonearsenal:armor.helmet_flux>,
	<redstonearsenal:armor.plate_flux>,
	<redstonearsenal:armor.legs_flux>,
	<redstonearsenal:armor.boots_flux>,
	<ic2:quantum_helmet>,
	<ic2:quantum_chestplate>,
	<ic2:quantum_leggings>,
	<ic2:quantum_boots>
	] as IItemStack[];
	
		for item in energyArmor {
		recipes.remove(item);
	}

	recipes.addShaped(<immersiveengineering:faraday_suit_head>, [[<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>],[<ore:plateAluminum>, <minecraft:iron_helmet>.anyDamage(), <ore:plateAluminum>], [null, null, null]]);
	recipes.addShaped(<immersiveengineering:faraday_suit_chest>, [[<ore:plateAluminum>, <minecraft:iron_chestplate>.anyDamage(), <ore:plateAluminum>],[<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>], [<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>]]);
	recipes.addShaped(<immersiveengineering:faraday_suit_feet>, [[<ore:plateAluminum>, null, <ore:plateAluminum>],[<ore:plateAluminum>, <minecraft:iron_boots>.anyDamage(), <ore:plateAluminum>], [null, null, null]]);
	recipes.addShaped(<immersiveengineering:faraday_suit_legs>, [[<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>],[<ore:plateAluminum>, <minecraft:iron_leggings>.anyDamage(), <ore:plateAluminum>], [<ore:plateAluminum>, null, <ore:plateAluminum>]]);
	
	recipes.addShaped(<ic2:nano_boots>, [[<ic2:crafting:15>, <ic2:energy_crystal>|<ic2:energy_crystal:*>, <ic2:crafting:15>],[<ic2:crafting:15>, <immersiveengineering:faraday_suit_feet>.anyDamage(), <ic2:crafting:15>], [null, null, null]]);
	recipes.addShaped(<ic2:nano_leggings>, [[<ic2:crafting:15>, <ic2:energy_crystal>|<ic2:energy_crystal:*>, <ic2:crafting:15>],[<ic2:crafting:15>, <immersiveengineering:faraday_suit_legs>.anyDamage(), <ic2:crafting:15>], [<ic2:crafting:15>, null, <ic2:crafting:15>]]);
	recipes.addShaped(<ic2:nano_chestplate>, [[<ic2:crafting:15>, <immersiveengineering:faraday_suit_chest>.anyDamage(), <ic2:crafting:15>],[<ic2:crafting:15>, <ic2:energy_crystal>|<ic2:energy_crystal:*>, <ic2:crafting:15>], [<ic2:crafting:15>, <ic2:crafting:15>, <ic2:crafting:15>]]);
	recipes.addShaped(<ic2:nano_helmet>, [[<ic2:crafting:15>, <ic2:energy_crystal>|<ic2:energy_crystal:*>, <ic2:crafting:15>],[<ic2:crafting:15>, <ic2:nightvision_goggles>.anyDamage(), <ic2:crafting:15>], [null, <immersiveengineering:faraday_suit_head>.anyDamage(), null]]);
	
	recipes.addShaped(<redstonearsenal:armor.boots_flux>, [[<redstonearsenal:material:224>, null, <redstonearsenal:material:224>],[<redstonearsenal:material:224>, <ic2:nano_boots>|<ic2:nano_boots:*>, <redstonearsenal:material:224>], [null, null, null]]);
	recipes.addShaped(<redstonearsenal:armor.legs_flux>, [[<redstonearsenal:material:224>, <redstonearsenal:material:224>, <redstonearsenal:material:224>],[<redstonearsenal:material:224>, <ic2:nano_leggings>|<ic2:nano_leggings:*>, <redstonearsenal:material:224>], [<redstonearsenal:material:224>, null, <redstonearsenal:material:224>]]);
	recipes.addShaped(<redstonearsenal:armor.plate_flux>, [[<redstonearsenal:material:224>, <ic2:nano_chestplate>|<ic2:nano_chestplate:*>, <redstonearsenal:material:224>],[<redstonearsenal:material:224>, <redstonearsenal:material:224>, <redstonearsenal:material:224>], [<redstonearsenal:material:224>, <redstonearsenal:material:224>, <redstonearsenal:material:224>]]);
	recipes.addShaped(<redstonearsenal:armor.helmet_flux>, [[<redstonearsenal:material:224>, <redstonearsenal:material:224>, <redstonearsenal:material:224>],[<redstonearsenal:material:224>, <ic2:nano_helmet>|<ic2:nano_helmet:*>, <redstonearsenal:material:224>], [null, null, null]]);
	
	recipes.addShaped(<ic2:quantum_boots>, [[null, null, null],[<ic2:crafting:4>, <redstonearsenal:armor.boots_flux>.anyDamage(), <ic2:crafting:4>], [<ic2:rubber_boots>, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, <ic2:rubber_boots>]]);
	recipes.addShaped(<ic2:quantum_leggings>, [[<ic2:crafting:3>, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, <ic2:crafting:3>],[<ic2:crafting:4>, <redstonearsenal:armor.legs_flux>.anyDamage(), <ic2:crafting:4>], [null, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, null]]);
	recipes.addShaped(<ic2:quantum_chestplate>, [[<ic2:crafting:3>, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, <ic2:crafting:3>],[<ic2:crafting:4>, <redstonearsenal:armor.plate_flux>.anyDamage(), <ic2:crafting:4>], [<ic2:crafting:3>, <ic2:jetpack_electric>.anyDamage(), <ic2:crafting:3>]]);
	recipes.addShaped(<ic2:quantum_helmet>, [[<ic2:crafting:3>, null, <ic2:crafting:3>],[<ic2:crafting:4>, <redstonearsenal:armor.helmet_flux>.anyDamage(), <ic2:crafting:4>], [null, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, null]]);
			
# *======= Mystical Agriculture Armor =======*

	var mysticalAgricultureArmor = [
	<mysticalagriculture:prudentium_helmet>,
	<mysticalagriculture:prudentium_chestplate>,
	<mysticalagriculture:prudentium_leggings>,
	<mysticalagriculture:prudentium_boots>,
	<mysticalagriculture:intermedium_helmet>,
	<mysticalagriculture:intermedium_chestplate>,
	<mysticalagriculture:intermedium_leggings>,
	<mysticalagriculture:intermedium_boots>,
	<mysticalagriculture:superium_helmet>,
	<mysticalagriculture:superium_chestplate>,
	<mysticalagriculture:superium_leggings>,
	<mysticalagriculture:superium_boots>,
	<mysticalagriculture:supremium_helmet>,
	<mysticalagriculture:supremium_chestplate>,
	<mysticalagriculture:supremium_leggings>,
	<mysticalagriculture:supremium_boots>
	] as IItemStack[];
	
		for item in mysticalAgricultureArmor {
		recipes.remove(item);
	}
	
	recipes.addShaped(<mysticalagriculture:supremium_boots>, [[<ore:ingotSupremium>, null, <ore:ingotSupremium>],[<ore:ingotSupremium>, <mysticalagriculture:superium_boots>.anyDamage(), <mysticalagriculture:gear:9>], [null, null, null]]);
	recipes.addShaped(<mysticalagriculture:supremium_leggings>, [[<ore:ingotSupremium>, <mysticalagriculture:gear:9>, <ore:ingotSupremium>],[<ore:ingotSupremium>, <mysticalagriculture:superium_leggings>.anyDamage(), <ore:ingotSupremium>], [<ore:ingotSupremium>, null, <ore:ingotSupremium>]]);
	recipes.addShaped(<mysticalagriculture:supremium_chestplate>, [[<ore:ingotSupremium>, <mysticalagriculture:superium_chestplate>.anyDamage(), <ore:ingotSupremium>],[<ore:ingotSupremium>, <mysticalagriculture:gear:9>, <ore:ingotSupremium>], [<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>]]);
	recipes.addShaped(<mysticalagriculture:supremium_helmet>, [[<ore:ingotSupremium>, <mysticalagriculture:gear:9>, <ore:ingotSupremium>],[<ore:ingotSupremium>, <mysticalagriculture:superium_helmet>.anyDamage(), <ore:ingotSupremium>], [null, null, null]]);

	recipes.addShaped(<mysticalagriculture:superium_boots>, [[<ore:ingotSuperium>, null, <ore:ingotSuperium>],[<ore:ingotSuperium>, <mysticalagriculture:intermedium_boots>.anyDamage(), <mysticalagriculture:gear:8>], [null, null, null]]);
	recipes.addShaped(<mysticalagriculture:superium_leggings>, [[<ore:ingotSuperium>, <mysticalagriculture:gear:8>, <ore:ingotSuperium>],[<ore:ingotSuperium>, <mysticalagriculture:intermedium_leggings>.anyDamage(), <ore:ingotSuperium>], [<ore:ingotSuperium>, null, <ore:ingotSuperium>]]);
	recipes.addShaped(<mysticalagriculture:superium_chestplate>, [[<ore:ingotSuperium>, <mysticalagriculture:intermedium_chestplate>.anyDamage(), <ore:ingotSuperium>],[<ore:ingotSuperium>, <mysticalagriculture:gear:8>, <ore:ingotSuperium>], [<ore:ingotSuperium>, <ore:ingotSuperium>, <ore:ingotSuperium>]]);
	recipes.addShaped(<mysticalagriculture:superium_helmet>, [[<ore:ingotSuperium>, <mysticalagriculture:gear:8>, <ore:ingotSuperium>],[<ore:ingotSuperium>, <mysticalagriculture:intermedium_helmet>.anyDamage(), <ore:ingotSuperium>], [null, null, null]]);

	recipes.addShaped(<mysticalagriculture:intermedium_boots>, [[<ore:ingotIntermedium>, null, <ore:ingotIntermedium>],[<ore:ingotIntermedium>, <mysticalagriculture:prudentium_boots>.anyDamage(), <mysticalagriculture:gear:7>], [null, null, null]]);
	recipes.addShaped(<mysticalagriculture:intermedium_leggings>, [[<ore:ingotIntermedium>, <mysticalagriculture:gear:7>, <ore:ingotIntermedium>],[<ore:ingotIntermedium>, <mysticalagriculture:prudentium_leggings>.anyDamage(), <ore:ingotIntermedium>], [<ore:ingotIntermedium>, null, <ore:ingotIntermedium>]]);
	recipes.addShaped(<mysticalagriculture:intermedium_chestplate>, [[<ore:ingotIntermedium>, <mysticalagriculture:prudentium_chestplate>.anyDamage(), <ore:ingotIntermedium>],[<ore:ingotIntermedium>, <mysticalagriculture:gear:7>, <ore:ingotIntermedium>], [<ore:ingotIntermedium>, <ore:ingotIntermedium>, <ore:ingotIntermedium>]]);
	recipes.addShaped(<mysticalagriculture:intermedium_helmet>, [[<ore:ingotIntermedium>, <mysticalagriculture:gear:7>, <ore:ingotIntermedium>],[<ore:ingotIntermedium>, <mysticalagriculture:prudentium_helmet>.anyDamage(), <ore:ingotIntermedium>], [null, null, null]]);

	recipes.addShaped(<mysticalagriculture:prudentium_boots>, [[<ore:ingotPrudentium>, null, <ore:ingotPrudentium>],[<ore:ingotPrudentium>, <mysticalagriculture:inferium_boots>.anyDamage(), <mysticalagriculture:gear:6>], [null, null, null]]);
	recipes.addShaped(<mysticalagriculture:prudentium_leggings>, [[<ore:ingotPrudentium>, <mysticalagriculture:gear:6>, <ore:ingotPrudentium>],[<ore:ingotPrudentium>, <mysticalagriculture:inferium_leggings>.anyDamage(), <ore:ingotPrudentium>], [<ore:ingotPrudentium>, null, <ore:ingotPrudentium>]]);
	recipes.addShaped(<mysticalagriculture:prudentium_chestplate>, [[<ore:ingotPrudentium>, <mysticalagriculture:inferium_chestplate>.anyDamage(), <ore:ingotPrudentium>],[<ore:ingotPrudentium>, <mysticalagriculture:gear:6>, <ore:ingotPrudentium>], [<ore:ingotPrudentium>, <ore:ingotPrudentium>, <ore:ingotPrudentium>]]);
	recipes.addShaped(<mysticalagriculture:prudentium_helmet>, [[<ore:ingotPrudentium>, <mysticalagriculture:gear:6>, <ore:ingotPrudentium>],[<ore:ingotPrudentium>, <mysticalagriculture:inferium_helmet>.anyDamage(), <ore:ingotPrudentium>], [null, null, null]]);
	
# *======= Magical Armor =======*

	var magicalArmor = [
	<psi:psimetal_exosuit_helmet>,
	<psi:psimetal_exosuit_chestplate>,
	<psi:psimetal_exosuit_leggings>,
	<psi:psimetal_exosuit_boots>,
	<botania:manasteelhelm>,
	<botania:manasteelchest>,
	<botania:manasteellegs>,
	<botania:manasteelboots>,
	<botania:elementiumhelm>,
	<botania:elementiumchest>,
	<botania:elementiumlegs>,
	<botania:elementiumboots>,
	<botania:terrasteelhelm>,
	<botania:terrasteelchest>,
	<botania:terrasteellegs>,
	<botania:terrasteelboots>,
	<botania:terrasteelhelmreveal>
	] as IItemStack[];
	
		for item in magicalArmor {
		recipes.remove(item);
	}
	
	recipes.addShaped(<botania:terrasteelboots>, [[<ore:dreamwoodTwig>, <ore:runeWinterB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumboots>, <ore:ingotTerrasteel>], [null, <ore:ingotTerrasteel>, null]]);
	recipes.addShaped(<botania:terrasteellegs>, [[<ore:dreamwoodTwig>, <ore:runeAutumnB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumlegs>, <ore:ingotTerrasteel>], [null, <ore:ingotTerrasteel>, null]]);
	recipes.addShaped(<botania:terrasteelchest>, [[<ore:dreamwoodTwig>, <ore:runeSummerB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumchest>, <ore:ingotTerrasteel>], [<ore:ingotTerrasteel>, <ore:ingotTerrasteel>, <ore:ingotTerrasteel>]]);
	recipes.addShaped(<botania:terrasteelhelm>, [[<ore:dreamwoodTwig>, <ore:runeSpringB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumhelm>, <ore:ingotTerrasteel>], [null, <ore:ingotTerrasteel>, null]]);
	recipes.addShapeless(<botania:terrasteelhelmreveal>, [<botania:terrasteelhelm>.anyDamage(),<thaumcraft:goggles>.anyDamage()]);

	recipes.addShaped(<botania:elementiumboots>, [[<ore:ingotElvenElementium>, null, <ore:ingotElvenElementium>],[<ore:ingotElvenElementium>, <psi:psimetal_exosuit_boots>, <ore:ingotElvenElementium>], [null, null, null]]);
	recipes.addShaped(<botania:elementiumlegs>, [[<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>],[<ore:ingotElvenElementium>, <psi:psimetal_exosuit_leggings>, <ore:ingotElvenElementium>], [<ore:ingotElvenElementium>, null, <ore:ingotElvenElementium>]]);
	recipes.addShaped(<botania:elementiumchest>, [[<ore:ingotElvenElementium>, <psi:psimetal_exosuit_chestplate>, <ore:ingotElvenElementium>],[<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>], [<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>]]);
	recipes.addShaped(<botania:elementiumhelm>, [[<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>],[<ore:ingotElvenElementium>, <psi:psimetal_exosuit_helmet>, <ore:ingotElvenElementium>], [null, null, null]]);

	recipes.addShaped(<psi:psimetal_exosuit_boots>, [[<ore:gemPsi>, null, <ore:gemPsi>],[<ore:ingotPsi>, <botania:manasteelboots>, <ore:ingotPsi>], [null, null, null]]);
	recipes.addShaped(<psi:psimetal_exosuit_leggings>, [[<ore:gemPsi>, <ore:ingotPsi>, <ore:gemPsi>],[<ore:ingotPsi>, <botania:manasteellegs>, <ore:ingotPsi>], [<ore:ingotPsi>, null, <ore:ingotPsi>]]);
	recipes.addShaped(<psi:psimetal_exosuit_chestplate>, [[<ore:gemPsi>, <botania:manasteelchest>, <ore:gemPsi>],[<ore:ingotPsi>, <ore:ingotPsi>, <ore:ingotPsi>], [<ore:ingotPsi>, <ore:ingotPsi>, <ore:ingotPsi>]]);
	recipes.addShaped(<psi:psimetal_exosuit_helmet>, [[<ore:ingotPsi>, <ore:gemPsi>, <ore:ingotPsi>],[<ore:ingotPsi>, <botania:manasteelhelm>, <ore:ingotPsi>], [null, null, null]]);

	recipes.addShaped(<botania:manasteelboots>, [[<ore:ingotManasteel>, null, <ore:ingotManasteel>],[<ore:ingotManasteel>, <botania:manaweaveboots>.anyDamage(), <ore:ingotManasteel>], [null, null, null]]);
	recipes.addShaped(<botania:manasteellegs>, [[<ore:ingotManasteel>, <ore:ingotManasteel>, <ore:ingotManasteel>],[<ore:ingotManasteel>, <botania:manaweavelegs>.anyDamage(), <ore:ingotManasteel>], [<ore:ingotManasteel>, null, <ore:ingotManasteel>]]);
	recipes.addShaped(<botania:manasteelchest>, [[<ore:ingotManasteel>, <botania:manaweavechest>.anyDamage(), <ore:ingotManasteel>],[<ore:ingotManasteel>, <ore:ingotManasteel>, <ore:ingotManasteel>], [<ore:ingotManasteel>, <ore:ingotManasteel>, <ore:ingotManasteel>]]);
	recipes.addShaped(<botania:manasteelhelm>, [[<ore:ingotManasteel>, <ore:ingotManasteel>, <ore:ingotManasteel>],[<ore:ingotManasteel>, <botania:manaweavehelm>.anyDamage(), <ore:ingotManasteel>], [null, null, null]]);
	
# *======= NuclearCraft Armor =======*

	var nuclearcraftArmor = [
	<nuclearcraft:helm_boron>,
	<nuclearcraft:chest_boron>,
	<nuclearcraft:legs_boron>,
	<nuclearcraft:boots_boron>,
	<nuclearcraft:helm_tough>,
	<nuclearcraft:chest_tough>,
	<nuclearcraft:legs_tough>,
	<nuclearcraft:boots_tough>,
	<nuclearcraft:helm_hard_carbon>,
	<nuclearcraft:chest_hard_carbon>,
	<nuclearcraft:legs_hard_carbon>,
	<nuclearcraft:boots_hard_carbon>,
	<nuclearcraft:helm_boron_nitride>,
	<nuclearcraft:chest_boron_nitride>,
	<nuclearcraft:legs_boron_nitride>,
	<nuclearcraft:boots_boron_nitride>
	] as IItemStack[];
	
		for item in nuclearcraftArmor {
		recipes.remove(item);
	}
	
	recipes.addShaped(<nuclearcraft:boots_boron_nitride>, [[<ore:gemBoronNitride>, null, <ore:gemBoronNitride>],[<ore:gemBoronNitride>, <nuclearcraft:boots_tough>.anyDamage(), <ore:gemBoronNitride>], [null, null, null]]);
	recipes.addShaped(<nuclearcraft:legs_boron_nitride>, [[<ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>],[<ore:gemBoronNitride>, <nuclearcraft:legs_tough>.anyDamage(), <ore:gemBoronNitride>], [<ore:gemBoronNitride>, null, <ore:gemBoronNitride>]]);
	recipes.addShaped(<nuclearcraft:chest_boron_nitride>, [[<ore:gemBoronNitride>, <nuclearcraft:chest_tough>.anyDamage(), <ore:gemBoronNitride>],[<ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>], [<ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>]]);
	recipes.addShaped(<nuclearcraft:helm_boron_nitride>, [[<ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>],[<ore:gemBoronNitride>, <nuclearcraft:helm_tough>.anyDamage(), <ore:gemBoronNitride>], [null, null, null]]);
	
	recipes.addShaped(<nuclearcraft:legs_tough>, [[<ore:ingotTough>, <ore:ingotTough>, <ore:ingotTough>],[<ore:ingotTough>, <nuclearcraft:legs_hard_carbon>.anyDamage(), <ore:ingotTough>], [<ore:ingotTough>, null, <ore:ingotTough>]]);
	recipes.addShaped(<nuclearcraft:chest_tough>, [[<ore:ingotTough>, <nuclearcraft:chest_hard_carbon>.anyDamage(), <ore:ingotTough>],[<ore:ingotTough>, <ore:ingotTough>, <ore:ingotTough>], [<ore:ingotTough>, <ore:ingotTough>, <ore:ingotTough>]]);
	recipes.addShaped(<nuclearcraft:boots_tough>, [[<ore:ingotTough>, null, <ore:ingotTough>],[<ore:ingotTough>, <nuclearcraft:boots_hard_carbon>.anyDamage(), <ore:ingotTough>], [null, null, null]]);
	recipes.addShaped(<nuclearcraft:helm_tough>, [[<ore:ingotTough>, <ore:ingotTough>, <ore:ingotTough>],[<ore:ingotTough>, <nuclearcraft:helm_hard_carbon>.anyDamage(), <ore:ingotTough>], [null, null, null]]);
	
	recipes.addShaped(<nuclearcraft:boots_hard_carbon>, [[<ore:ingotHardCarbon>, null, <ore:ingotHardCarbon>],[<ore:ingotHardCarbon>, <nuclearcraft:boots_boron>.anyDamage(), <ore:ingotHardCarbon>], [null, null, null]]);
	recipes.addShaped(<nuclearcraft:helm_hard_carbon>, [[<ore:ingotHardCarbon>, <ore:ingotHardCarbon>, <ore:ingotHardCarbon>],[<ore:ingotHardCarbon>, <nuclearcraft:helm_boron>.anyDamage(), <ore:ingotHardCarbon>], [null, null, null]]);
	recipes.addShaped(<nuclearcraft:legs_hard_carbon>, [[<ore:ingotHardCarbon>, <ore:ingotHardCarbon>, <ore:ingotHardCarbon>],[<ore:ingotHardCarbon>, <nuclearcraft:legs_boron>.anyDamage(), <ore:ingotHardCarbon>], [<ore:ingotHardCarbon>, null, <ore:ingotHardCarbon>]]);
	recipes.addShaped(<nuclearcraft:chest_hard_carbon>, [[<ore:ingotHardCarbon>, <nuclearcraft:chest_boron>.anyDamage(), <ore:ingotHardCarbon>],[<ore:ingotHardCarbon>, <ore:ingotHardCarbon>, <ore:ingotHardCarbon>], [<ore:ingotHardCarbon>, <ore:ingotHardCarbon>, <ore:ingotHardCarbon>]]);
	
	recipes.addShaped(<nuclearcraft:chest_boron>, [[<ore:ingotBoron>, <minecraft:iron_chestplate>.anyDamage(), <ore:ingotBoron>],[<ore:ingotBoron>, <ore:ingotBoron>, <ore:ingotBoron>], [<ore:ingotBoron>, <ore:ingotBoron>, <ore:ingotBoron>]]);
	recipes.addShaped(<nuclearcraft:boots_boron>, [[<ore:ingotBoron>, null, <ore:ingotBoron>],[<ore:ingotBoron>, <minecraft:iron_boots>.anyDamage(), <ore:ingotBoron>], [null, null, null]]);
	recipes.addShaped(<nuclearcraft:legs_boron>, [[<ore:ingotBoron>, <ore:ingotBoron>, <ore:ingotBoron>],[<ore:ingotBoron>, <minecraft:iron_leggings>.anyDamage(), <ore:ingotBoron>], [<ore:ingotBoron>, null, <ore:ingotBoron>]]);
	recipes.addShaped(<nuclearcraft:helm_boron>, [[<ore:ingotBoron>, <ore:ingotBoron>, <ore:ingotBoron>],[<ore:ingotBoron>, <minecraft:iron_helmet>.anyDamage(), <ore:ingotBoron>], [null, null, null]]);
	
	
# *======= Vanilla Armor =======*

	var vanillaStyleArmor = [
	<minecraft:iron_boots>,
	<minecraft:iron_leggings>,
	<minecraft:iron_chestplate>,
	<minecraft:iron_helmet>,
	<minecraft:golden_boots>,
	<minecraft:golden_leggings>,
	<minecraft:golden_chestplate>,
	<minecraft:golden_helmet>,
	<minecraft:diamond_helmet>,
	<minecraft:diamond_chestplate>,
	<minecraft:diamond_leggings>,
	<minecraft:diamond_boots>,
	<tcomplement:manyullyn_helmet>,
	<tcomplement:manyullyn_chestplate>,
	<tcomplement:manyullyn_leggings>,
	<tcomplement:manyullyn_boots>,
	<tcomplement:knightslime_helmet>,
	<tcomplement:knightslime_chestplate>,
	<tcomplement:knightslime_leggings>,
	<tcomplement:knightslime_boots>
	
	] as IItemStack[];
	
		for item in vanillaStyleArmor {
		recipes.remove(item);
	}

	recipes.addShaped(<minecraft:iron_boots>, [[<ore:plateIron>, null, <ore:plateIron>], [<ore:plateIron>, <minecraft:leather_boots>.anyDamage(), <ore:plateIron>]]);
	recipes.addShaped(<minecraft:iron_leggings>, [[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], [<ore:plateIron>, <minecraft:leather_leggings>.anyDamage(), <ore:plateIron>], [<ore:plateIron>, null, <ore:plateIron>]]);
	recipes.addShaped(<minecraft:iron_chestplate>, [[<ore:plateIron>, <minecraft:leather_chestplate>.anyDamage(), <ore:plateIron>], [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);
	recipes.addShaped(<minecraft:iron_helmet>, [[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], [<ore:plateIron>, <minecraft:leather_helmet>.anyDamage(), <ore:plateIron>]]);
	
	recipes.addShaped(<minecraft:golden_boots>, [[<ore:plateGold>, null, <ore:plateGold>], [<ore:plateGold>, <minecraft:iron_boots>.anyDamage(), <ore:plateGold>]]);
	recipes.addShaped(<minecraft:golden_leggings>, [[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>], [<ore:plateGold>, <minecraft:iron_leggings>.anyDamage(), <ore:plateGold>], [<ore:plateGold>, null, <ore:plateGold>]]);
	recipes.addShaped(<minecraft:golden_chestplate>, [[<ore:plateGold>, <minecraft:iron_chestplate>.anyDamage(), <ore:plateGold>], [<ore:plateGold>, <ore:plateGold>, <ore:plateGold>], [<ore:plateGold>, <ore:plateGold>, <ore:plateGold>]]);
	recipes.addShaped(<minecraft:golden_helmet>, [[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>], [<ore:plateGold>, <minecraft:iron_helmet>.anyDamage(), <ore:plateGold>]]);
	
	recipes.addShaped(<minecraft:diamond_boots>, [[<ore:gemDiamond>, null, <ore:gemDiamond>], [<ore:gemDiamond>, <minecraft:golden_boots>.anyDamage(), <ore:gemDiamond>]]);
	recipes.addShaped(<minecraft:diamond_leggings>, [[<ore:gemDiamond>, <ore:gemDiamond>, <ore:gemDiamond>], [<ore:gemDiamond>, <minecraft:golden_leggings>.anyDamage(), <ore:gemDiamond>], [<ore:gemDiamond>, null, <ore:gemDiamond>]]);
	recipes.addShaped(<minecraft:diamond_chestplate>, [[<ore:gemDiamond>, <minecraft:golden_chestplate>.anyDamage(), <ore:gemDiamond>], [<ore:gemDiamond>, <ore:gemDiamond>, <ore:gemDiamond>], [<ore:gemDiamond>, <ore:gemDiamond>, <ore:gemDiamond>]]);
	recipes.addShaped(<minecraft:diamond_helmet>, [[<ore:gemDiamond>, <ore:gemDiamond>, <ore:gemDiamond>], [<ore:gemDiamond>, <minecraft:golden_helmet>.anyDamage(), <ore:gemDiamond>]]);
	
	recipes.addShaped(<tcomplement:manyullyn_boots>, [[<ore:ingotManyullyn>, null, <ore:ingotManyullyn>], [<ore:ingotManyullyn>, <minecraft:diamond_boots>.anyDamage(), <ore:ingotManyullyn>]]);
	recipes.addShaped(<tcomplement:manyullyn_leggings>, [[<ore:ingotManyullyn>, <ore:ingotManyullyn>, <ore:ingotManyullyn>], [<ore:ingotManyullyn>, <minecraft:diamond_leggings>.anyDamage(), <ore:ingotManyullyn>], [<ore:ingotManyullyn>, null, <ore:ingotManyullyn>]]);
	recipes.addShaped(<tcomplement:manyullyn_chestplate>, [[<ore:ingotManyullyn>, <minecraft:diamond_chestplate>.anyDamage(), <ore:ingotManyullyn>], [<ore:ingotManyullyn>, <ore:ingotManyullyn>, <ore:ingotManyullyn>], [<ore:ingotManyullyn>, <ore:ingotManyullyn>, <ore:ingotManyullyn>]]);
	recipes.addShaped(<tcomplement:manyullyn_helmet>, [[<ore:ingotManyullyn>, <ore:ingotManyullyn>, <ore:ingotManyullyn>], [<ore:ingotManyullyn>, <minecraft:diamond_helmet>.anyDamage(), <ore:ingotManyullyn>]]);
	
	
# *======= Draconic Armor =======*

	recipes.remove(<draconicevolution:wyvern_helm>);
	recipes.remove(<draconicevolution:wyvern_boots>);
	recipes.remove(<draconicevolution:wyvern_legs>);
	recipes.remove(<draconicevolution:wyvern_chest>);

# Wyvern
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_helm>, 1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [<twilightforest:arctic_helmet>.anyDamage(), <twilightforest:yeti_helmet>.anyDamage(),<twilightforest:knightmetal_helmet>.anyDamage(),<twilightforest:steeleaf_helmet>.anyDamage(),<twilightforest:fiery_helmet>.anyDamage(),<twilightforest:ironwood_helmet>.anyDamage(),<minecraft:chainmail_helmet>.anyDamage(),<nuclearcraft:helm_boron_nitride>.anyDamage(),<botania:terrasteelhelm>.anyDamage(),<mysticalagriculture:supremium_helmet>.anyDamage(),<tcomplement:manyullyn_helmet>.anyDamage(),<draconicevolution:wyvern_core>,<ic2:quantum_helmet:*>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_chest>, 1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [<twilightforest:arctic_chestplate>.anyDamage(),<twilightforest:yeti_chestplate>.anyDamage(),<twilightforest:knightmetal_chestplate>.anyDamage(),<twilightforest:steeleaf_chestplate>.anyDamage(),<twilightforest:fiery_chestplate>.anyDamage(),<twilightforest:ironwood_chestplate>.anyDamage(),<minecraft:chainmail_chestplate>.anyDamage(),<nuclearcraft:chest_boron_nitride>.anyDamage(),<botania:terrasteelchest>.anyDamage(),<mysticalagriculture:supremium_chestplate>.anyDamage(),<tcomplement:manyullyn_chestplate>.anyDamage(),<draconicevolution:wyvern_core>,<ic2:quantum_chestplate:*>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_legs>, 1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [<twilightforest:arctic_leggings>.anyDamage(),<twilightforest:yeti_leggings>.anyDamage(),<twilightforest:knightmetal_leggings>.anyDamage(),<twilightforest:steeleaf_leggings>.anyDamage(),<twilightforest:fiery_leggings>.anyDamage(),<twilightforest:ironwood_leggings>.anyDamage(),<minecraft:chainmail_leggings>.anyDamage(),<nuclearcraft:legs_boron_nitride>.anyDamage(),<botania:terrasteellegs>.anyDamage(),<mysticalagriculture:supremium_leggings>.anyDamage(),<tcomplement:manyullyn_leggings>.anyDamage(),<draconicevolution:wyvern_core>,<ic2:quantum_leggings:*>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_boots>, 1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [<twilightforest:arctic_boots>.anyDamage(),<twilightforest:yeti_boots>.anyDamage(),<twilightforest:knightmetal_boots>.anyDamage(),<twilightforest:steeleaf_boots>.anyDamage(),<twilightforest:fiery_boots>.anyDamage(),<twilightforest:ironwood_boots>.anyDamage(),<minecraft:chainmail_boots>.anyDamage(),<nuclearcraft:boots_boron_nitride>.anyDamage(),<botania:terrasteelboots>.anyDamage(),<mysticalagriculture:supremium_boots>.anyDamage(),<tcomplement:manyullyn_boots>.anyDamage(),<draconicevolution:wyvern_core>,<ic2:quantum_boots:*>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>,<draconicevolution:draconium_block:1>]);

# Draconic
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_helm>, 2147483647, 1000000, <avaritia:block_resource:2>, [<draconicevolution:wyvern_helm>.anyDamage(), <extrautils2:angelring>.anyDamage(), <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:draconic_block>, <draconicevolution:draconic_block>, <draconicevolution:draconic_energy_core>, <draconicevolution:draconic_energy_core>, <thermalexpansion:frame:148>, <extendedcrafting:material:32>, <astralsorcery:itemcape>.anyDamage()]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_chest>, 2147483647, 1000000, <avaritia:block_resource:2>, [<draconicevolution:wyvern_chest>.anyDamage(), <extrautils2:angelring>.anyDamage(), <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:draconic_block>, <draconicevolution:draconic_block>, <draconicevolution:draconic_energy_core>, <draconicevolution:draconic_energy_core>, <thermalexpansion:frame:148>, <extendedcrafting:material:32>, <astralsorcery:itemcape>.anyDamage()]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_legs>, 2147483647, 1000000, <avaritia:block_resource:2>, [<draconicevolution:wyvern_legs>.anyDamage(), <extrautils2:angelring>.anyDamage(), <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:draconic_block>, <draconicevolution:draconic_block>, <draconicevolution:draconic_energy_core>, <draconicevolution:draconic_energy_core>, <thermalexpansion:frame:148>, <extendedcrafting:material:32>, <astralsorcery:itemcape>.anyDamage()]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_boots>, 2147483647, 1000000, <avaritia:block_resource:2>, [<draconicevolution:wyvern_boots>.anyDamage(), <extrautils2:angelring>.anyDamage(), <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:draconic_block>, <draconicevolution:draconic_block>, <draconicevolution:draconic_energy_core>, <draconicevolution:draconic_energy_core>, <thermalexpansion:frame:148>, <extendedcrafting:material:32>, <astralsorcery:itemcape>.anyDamage()]);

# *======= Slime Boots =======*

	recipes.remove(<tconstruct:slime_boots>);
	recipes.addShaped("Slime Boots Green",
	<tconstruct:slime_boots>, 
	[[null, null, null],
	[<ore:slimeballGreen>, <minecraft:wool:*>, <ore:slimeballGreen>], 
	[<tconstruct:slime_congealed>, <minecraft:leather_boots>.anyDamage(), <tconstruct:slime_congealed>]]);

	recipes.remove(<tconstruct:slime_boots:1>);
	recipes.addShaped("Slime Boots Blue",
	<tconstruct:slime_boots:1>, 
	[[null, null, null],
	[<ore:slimeballBlue>, <minecraft:wool:*>, <ore:slimeballBlue>], 
	[<tconstruct:slime_congealed:1>, <minecraft:leather_boots>.anyDamage(), <tconstruct:slime_congealed:1>]]);

	recipes.remove(<tconstruct:slime_boots:2>);
	recipes.addShaped("Slime Boots Purple",
	<tconstruct:slime_boots:2>, 
	[[null, null, null],
	[<ore:slimeballPurple>, <minecraft:wool:*>, <ore:slimeballPurple>], 
	[<tconstruct:slime_congealed:2>, <minecraft:leather_boots>.anyDamage(), <tconstruct:slime_congealed:2>]]);

	recipes.remove(<tconstruct:slime_boots:3>);
	recipes.addShaped("Slime Boots Red",
	<tconstruct:slime_boots:3>, 
	[[null, null, null],
	[<ore:slimeballBlood>, <minecraft:wool:*>, <ore:slimeballBlood>], 
	[<tconstruct:slime_congealed:3>, <minecraft:leather_boots>.anyDamage(), <tconstruct:slime_congealed:3>]]);

	recipes.remove(<tconstruct:slime_boots:4>);
	recipes.addShaped("Slime Boots Orange",
	<tconstruct:slime_boots:4>, 
	[[null, null, null],
	[<ore:slimeballMagma>, <minecraft:wool:*>, <ore:slimeballMagma>], 
	[<tconstruct:slime_congealed:4>, <minecraft:leather_boots>.anyDamage(), <tconstruct:slime_congealed:4>]]);

# *======= Armor -> Original mats conversion=======*

	recipes.addShapeless("ArmorToMats1", <twilightforest:arctic_fur> * 4, [<twilightforest:arctic_boots>]);
	recipes.addShapeless("ArmorToMats2", <twilightforest:arctic_fur> * 7, [<twilightforest:arctic_leggings>]);
	recipes.addShapeless("ArmorToMats3", <twilightforest:arctic_fur> * 8, [<twilightforest:arctic_chestplate>]);
	recipes.addShapeless("ArmorToMats4", <twilightforest:arctic_fur> * 5, [<twilightforest:arctic_helmet>]);
	recipes.addShapeless("ArmorToMats5", <twilightforest:alpha_fur> * 4, [<twilightforest:yeti_boots>]);
	recipes.addShapeless("ArmorToMats6", <twilightforest:alpha_fur> * 7, [<twilightforest:yeti_leggings>]);
	recipes.addShapeless("ArmorToMats7", <twilightforest:alpha_fur> * 8, [<twilightforest:yeti_chestplate>]);
	recipes.addShapeless("ArmorToMats8", <twilightforest:alpha_fur> * 5, [<twilightforest:yeti_helmet>]);
	recipes.addShapeless("ArmorToMats9", <twilightforest:knightmetal_ingot> * 4, [<twilightforest:knightmetal_boots>]);
	recipes.addShapeless("ArmorToMats10", <twilightforest:knightmetal_ingot> * 7, [<twilightforest:knightmetal_leggings>]);
	recipes.addShapeless("ArmorToMats11", <twilightforest:knightmetal_ingot> * 8, [<twilightforest:knightmetal_chestplate>]);
	recipes.addShapeless("ArmorToMats12", <twilightforest:knightmetal_ingot> * 5, [<twilightforest:knightmetal_helmet>]);
	recipes.addShapeless("ArmorToMats13", <twilightforest:steeleaf_ingot> * 4, [<twilightforest:steeleaf_boots>]);
	recipes.addShapeless("ArmorToMats14", <twilightforest:steeleaf_ingot> * 7, [<twilightforest:steeleaf_leggings>]);
	recipes.addShapeless("ArmorToMats15", <twilightforest:steeleaf_ingot> * 8, [<twilightforest:steeleaf_chestplate>]);
	recipes.addShapeless("ArmorToMats16", <twilightforest:steeleaf_ingot> * 5, [<twilightforest:steeleaf_helmet>]);
	recipes.addShapeless("ArmorToMats17", <twilightforest:fiery_ingot> * 4, [<twilightforest:fiery_boots>]);
	recipes.addShapeless("ArmorToMats18", <twilightforest:fiery_ingot> * 7, [<twilightforest:fiery_leggings>]);
	recipes.addShapeless("ArmorToMats19", <twilightforest:fiery_ingot> * 8, [<twilightforest:fiery_chestplate>]);
	recipes.addShapeless("ArmorToMats20", <twilightforest:fiery_ingot> * 5, [<twilightforest:fiery_helmet>]);
	recipes.addShapeless("ArmorToMats21", <twilightforest:ironwood_ingot> * 4, [<twilightforest:ironwood_boots>]);
	recipes.addShapeless("ArmorToMats22", <twilightforest:ironwood_ingot> * 7, [<twilightforest:ironwood_leggings>]);
	recipes.addShapeless("ArmorToMats23", <twilightforest:ironwood_ingot> * 8, [<twilightforest:ironwood_chestplate>]);
	recipes.addShapeless("ArmorToMats24", <twilightforest:ironwood_ingot> * 5, [<twilightforest:ironwood_helmet>]);
	recipes.addShapeless("ArmorToMats25", <twilightforest:naga_scale> * 7, [<twilightforest:naga_leggings>]);
	recipes.addShapeless("ArmorToMats26", <twilightforest:naga_scale> * 8, [<twilightforest:naga_chestplate>]);