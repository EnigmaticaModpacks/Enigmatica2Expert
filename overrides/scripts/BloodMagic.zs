import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded bloodmagic

# Rune of Speed
	recipes.remove(<bloodmagic:blood_rune:1>);
	recipes.addShaped("Rune of Speed", <bloodmagic:blood_rune:1>, 
	[[<extrautils2:decorativesolid:3>, <bloodmagic:slate>, <extrautils2:decorativesolid:3>], 
	[<bloodmagic:blood_rune>, <ore:foodCake>, <bloodmagic:blood_rune>], 
	[<extrautils2:decorativesolid:3>, <bloodmagic:slate>, <extrautils2:decorativesolid:3>]]);

# Rune of Capacity
	recipes.remove(<bloodmagic:blood_rune:6>);
	recipes.addShaped("Rune of Capacity", <bloodmagic:blood_rune:6>, 
	[[<extrautils2:decorativesolid:3>, <minecraft:bucket>, <extrautils2:decorativesolid:3>], 
	[<minecraft:bucket>, <bloodmagic:blood_rune>, <minecraft:bucket>], 
	[<extrautils2:decorativesolid:3>, <bloodmagic:slate:2>, <extrautils2:decorativesolid:3>]]);

# Rune of Sacrifice
	recipes.remove(<bloodmagic:blood_rune:3>);
	recipes.addShaped("Rune of Sacrifice", <bloodmagic:blood_rune:3> * 3, 
	[[<extrautils2:decorativesolid:3>, <bloodmagic:slate:1>, <extrautils2:decorativesolid:3>], 
	[<bloodmagic:slate:1>, <ore:orbTier2>.reuse(), <bloodmagic:slate:1>],
	[<extrautils2:decorativesolid:3>, <astralsorcery:itemcrystalsword>.onlyDamageAtLeast(0), <extrautils2:decorativesolid:3>]]);

# Rune of the orb
	recipes.remove(<bloodmagic:blood_rune:8>);
	recipes.addShaped("Rune of the Orb", <bloodmagic:blood_rune:8>, 
	[[<bloodmagic:slate:1>, <ore:orbTier1>.reuse(), <bloodmagic:slate:1>], 
	[<bloodmagic:slate:2>, <ore:orbTier4>.reuse(), <bloodmagic:slate:2>], 
	[<bloodmagic:slate:3>, <ore:orbTier1>.reuse(), <bloodmagic:slate:3>]]);

# Rune of acceleration
	recipes.remove(<bloodmagic:blood_rune:9>);
	recipes.addShaped("Rune of Acceleration", <bloodmagic:blood_rune:9>, 
	[[<bloodmagic:blood_tank>, <bloodmagic:slate:3>, <bloodmagic:blood_tank>], 
	[<ore:ingotGold>, <actuallyadditions:item_drill_upgrade_speed_ii>, <minecraft:gold_ingot>], 
	[<bloodmagic:blood_tank>, <ore:orbTier4>.reuse(), <bloodmagic:blood_tank>]]);

# Imperfect Ritual Stone
	recipes.remove(<bloodmagic:ritual_controller:1>);
	recipes.addShaped("Imperfect Ritual Stone", <bloodmagic:ritual_controller:1>, 
	[[<ore:obsidian>, <extrautils2:decorativesolid:3>, <ore:obsidian>], 
	[<extrautils2:decorativesolid:3>, <ore:orbTier1>.reuse(), <extrautils2:decorativesolid:3>], 
	[<ore:obsidian>, <extrautils2:decorativesolid:3>, <ore:obsidian>]]);

# Ritual Stone 
	recipes.remove(<bloodmagic:ritual_stone>);
	recipes.addShaped("Ritual Stone", <bloodmagic:ritual_stone> * 4, 
	[[<thaumcraft:salis_mundus>, <bloodmagic:slate:1>, <thaumcraft:salis_mundus>], 
	[<bloodmagic:slate:1>, <ore:orbTier2>.reuse(), <bloodmagic:slate:1>], 
	[<ore:obsidian>, <bloodmagic:slate:1>, <ore:obsidian>]]);

# Hellfire Forge
	recipes.remove(<bloodmagic:soul_forge>);
	recipes.addShaped("Hellfire Forge", <bloodmagic:soul_forge>, 
	[[<ore:nuggetQuartz>, <ore:dustAstralStarmetal>, <ore:nuggetQuartz>], 
	[<thaumcraft:stone_arcane>, <ore:ingotBrass>, <thaumcraft:stone_arcane>], 
	[<thaumcraft:stone_arcane>, <botania:storage>, <thaumcraft:stone_arcane>]]);

# Blood Altar
	recipes.remove(<bloodmagic:altar>);
	recipes.addShaped("Blood Altar", <bloodmagic:altar>,
	[[<ore:livingrock>, <astralsorcery:itemcraftingcomponent:3>, <ore:livingrock>], 
	[<ore:plateBrass>, <minecraft:furnace>, <ore:plateBrass>], 
	[<thaumcraft:stone_arcane>, <bloodmagic:monster_soul>, <thaumcraft:stone_arcane>]]);

# Blood Letter's Pack
	recipes.remove(<bloodmagic:pack_self_sacrifice>);
	recipes.addShaped("Blood Letter's Pack", <bloodmagic:pack_self_sacrifice>, 
	[[<botania:managlass>, <botania:bloodpendant>, <botania:managlass>], 
	[<minecraft:flint>, <minecraft:leather_chestplate>.onlyDamageAtLeast(0), <minecraft:flint>], 
	[<botania:managlass>, <bloodmagic:slate>, <botania:managlass>]]);

# Coat of Arms
	recipes.remove(<bloodmagic:pack_sacrifice>);
	recipes.addShaped("Coat of Arms", <bloodmagic:pack_sacrifice>, 
	[[<botania:managlass>, <minecraft:bucket>, <botania:managlass>], 
	[<thermalfoundation:tool.sword_invar>.onlyDamageAtLeast(0), <minecraft:leather_chestplate>, <thermalfoundation:tool.sword_invar>.onlyDamageAtLeast(0)], 
	[<botania:managlass>, <bloodmagic:slate>, <botania:managlass>]]);
	
# Sacrificial Dagger
	recipes.remove(<bloodmagic:sacrificial_dagger>);
	recipes.addShaped("Sacrificial Dagger", <bloodmagic:sacrificial_dagger>, 
	[[<botania:managlass>, <botania:managlass>, <botania:managlass>], 
	[null, <thaumcraft:ingot:2>, <botania:managlass>], 
	[<botania:enderdagger>.onlyDamageAtLeast(0), null, <botania:managlass>]]);

# Rudimentary Snare
	recipes.remove(<bloodmagic:soul_snare>);
	recipes.addShaped("Rudimentary Snare", <bloodmagic:soul_snare> * 8, 
	[[<thaumcraft:fabric>, <ore:ingotManasteel>, <thaumcraft:fabric>], 
	[<ore:ingotManasteel>, <ore:redstoneRoot>, <ore:ingotManasteel>], 
	[<thaumcraft:fabric>, <ore:ingotManasteel>, <thaumcraft:fabric>]]);

# Blank Slate
	mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:stone>);
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>, <botania:livingrock>, 0, 1000, 10, 10);

# Orb tier 1
	mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:diamond>);
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), 
	<botania:manaresource:2>, 0, 2000, 12, 12);

# Orb tier 2
	mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:redstone_block>);
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), 
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "victus"}]}), 1, 5000, 25, 25);

# Orb tier 3
	mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:gold_block>);
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), 
	<thaumcraft:metal_thaumium>, 2, 25000, 50, 50);

# Orb tier 5
	mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:nether_star>);
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}), 
	<botania:manaresource:5>, 4, 80000, 200, 200);

# Dagger of Sacrifice
	mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:iron_sword>);
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:dagger_of_sacrifice>, 
	<thaumcraft:thaumium_sword>, 1, 3000, 12, 12);

# Blood Orb Oredicts
	<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}));
	<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}));
	<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}));
	<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
	<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
	<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));
	
	<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}));
	<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}));
	<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
	<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
	<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

	<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}));
	<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
	<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
	<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

	<ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
	<ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
	<ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

	<ore:orbTier5>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
	<ore:orbTier5>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

	<ore:orbTier6>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));
	
# Remake recipe of blood tanks

# [Blood Tank Tier 1] from [Glass][+2]
craft.remake(<bloodmagic:blood_tank>, ["B","■","A"], {
  "B": <bloodmagic:slate>,        # Blank Slate
  "■": <ore:blockGlass>, # Glass
  "A": <thaumcraft:stone_arcane>, # Arcane Stone
});

recipes.addShapeless("Clearing Blood Tank 0", <bloodmagic:blood_tank>, [<bloodmagic:blood_tank>]);
for i in 1 to 16 {
	val tank = itemUtils.getItem("bloodmagic:blood_tank", i);
	val prevTank = itemUtils.getItem("bloodmagic:blood_tank", i - 1);

	val t16cost = 2000000.0d; # Change only this number

	val t16powr = pow(1.5d, 15);
	val t16mult = t16cost / t16powr;
	val t1resde = (15 - i) * (t16cost / 6000);

	val cost = (((pow(1.5d, i as double) * t16mult) as int - t1resde) / 500) * 500;

	recipes.remove(tank);
	mods.bloodmagic.BloodAltar.addRecipe(tank, prevTank, max(0, min(4, i / 2)), cost, 10 + 10 * i, 10 + 10 * i);
	recipes.addShapeless("Clearing Blood Tank " ~ i, tank, [tank]);
}