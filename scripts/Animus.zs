import mods.jei.JEI.removeAndHide as rh;
#modloaded animus

# Healing Shards
	mods.bloodmagic.BloodAltar.removeRecipe(<animus:fragmenthealing>);
	rh(<animus:fragmenthealing>);

# Removing Khopesh'
	rh(<animus:kama_wood>);
	rh(<animus:kama_stone>);
	rh(<animus:kama_iron>);
	rh(<animus:kama_gold>);
	
# Leech Reagent
	mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:sapling>, <minecraft:leaves>, <minecraft:tallgrass:1>, <minecraft:cooked_porkchop>]);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodPloughmanslunch>,<ore:dropofevil>,<darkutils:charm_gluttony>,<ore:runeGluttonyB>], 500, 100);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodChimichanga>,<ore:dropofevil>,<darkutils:charm_gluttony>,<ore:runeGluttonyB>], 500, 100);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodDelightedmeal>,<ore:dropofevil>,<darkutils:charm_gluttony>,<ore:runeGluttonyB>], 500, 100);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<harvestcraft:randomtacoitem>,<ore:dropofevil>,<darkutils:charm_gluttony>,<ore:runeGluttonyB>], 500, 100);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodDeluxechickencurry>,<ore:dropofevil>,<darkutils:charm_gluttony>,<ore:runeGluttonyB>], 500, 100);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodChickencurry>,<ore:dropofevil>,<darkutils:charm_gluttony>,<ore:runeGluttonyB>], 500, 100);

# Consumption Reagent
	mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:iron_pickaxe>, <minecraft:iron_pickaxe>, <minecraft:iron_pickaxe>, <minecraft:iron_pickaxe>]);
	mods.bloodmagic.TartaricForge.addRecipe(<animus:component:2>, [<bloodmagic:bound_pickaxe>.anyDamage(),<bloodmagic:bound_shovel>.anyDamage(),<immersiveengineering:drillhead:1>,<ore:runeWrathB>], 300, 50);

# Khopesh
recipes.remove(<animus:kama_diamond>);
recipes.addShaped("animus_kama_diamond", <animus:kama_diamond>, [
	[null, <ore:gemDiamond>, null], 
	[<ore:gemDiamond>, null, <ore:blockDiamond>], 
	[null, null, <forestry:oak_stick>]
]);

# Fix bucket of dirt
recipes.removeByRecipeName("animus:dirtbucket");
recipes.addShapeless("animus_dirtbucket", Bucket("blockfluiddirt"), [
	<minecraft:redstone_torch>, <animus:sigil_consumption>.reuse(), <minecraft:bucket>]);