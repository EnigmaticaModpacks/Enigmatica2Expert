import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import mods.thaumcraft.SmeltingBonus.removeSmeltingBonus;
import mods.thaumcraft.SmeltingBonus.addSmeltingBonus;
#modloaded thaumcraft
print("--- loading Thaumcraft.zs ---");

# Crimson Rites
mods.thaumcraft.Infusion.registerRecipe("crimson_rites", "INFUSION", 
<thaumcraft:curio:6>, 15, 
[<aspect:vitium> * 30, <aspect:mortuus> * 15, <aspect:praecantatio> * 30, <aspect:auram> * 10], 
<thaumcraft:thaumonomicon>, 
[<thaumcraft:ingot>, <thaumcraft:void_seed>, <thaumcraft:salis_mundus>, <thaumcraft:void_seed>, <thaumcraft:salis_mundus>, <thaumcraft:void_seed>, <thaumcraft:ingot>, <thaumcraft:void_seed>]);

# Cultist Portal
mods.thaumcraft.Infusion.registerRecipe("spawn_lesser_crimson_portal", "INFUSION", 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumcraft:cultistportallesser"}}), 15, 
[<aspect:vitium> * 90, <aspect:mortuus> * 45, <aspect:praecantatio> * 90, <aspect:auram> * 30], 
<openblocks:golden_egg>, 
[<thaumcraft:metal_thaumium>, <thaumcraft:void_seed>, <thaumcraft:salis_mundus>, <thaumcraft:void_seed>, <minecraft:skull:1>, <thaumcraft:void_seed>, <extrautils2:teleporter:1>, <thaumcraft:void_seed>]);

# Unification for the Smelting Bonus
// IIngredient input, IItemStack stack
removeSmeltingBonus(<ore:oreCopper>, <thaumcraft:nugget:1>);
removeSmeltingBonus(<ore:oreTin>, <thaumcraft:nugget:2>);
removeSmeltingBonus(<ore:oreSilver>, <thaumcraft:nugget:3>);
removeSmeltingBonus(<ore:oreLead>, <thaumcraft:nugget:4>);

removeSmeltingBonus(<thaumcraft:cluster:2>, <thaumcraft:nugget:1>);
removeSmeltingBonus(<thaumcraft:cluster:3>, <thaumcraft:nugget:2>);
removeSmeltingBonus(<thaumcraft:cluster:4>, <thaumcraft:nugget:3>);
removeSmeltingBonus(<thaumcraft:cluster:5>, <thaumcraft:nugget:4>);

// IIngredient input, WeightedItemStack stack
addSmeltingBonus(<ore:oreCopper>, <thermalfoundation:material:192> % 33);
addSmeltingBonus(<ore:oreTin>, <thermalfoundation:material:193> % 33);
addSmeltingBonus(<ore:oreSilver>, <thermalfoundation:material:194> % 33);
addSmeltingBonus(<ore:oreLead>, <thermalfoundation:material:195> % 33);

# Removing wrong aspects from stuff
	<chiselsandbits:chiseled_iron>.setAspects(<aspect:desiderium> * 1);
	<ic2:dust:21>.setAspects(<aspect:metallum> * 1);
	
# Temp Recipes
	recipes.addShapedMirrored("Temporary Void Seed Recipe", <thaumcraft:void_seed> * 4, [[<ore:mycelium>, <ore:crystalLonsdaleite>, <ore:mycelium>],[<ore:crystalLonsdaleite>, <mysticalagriculture:crafting:21>, <ore:crystalLonsdaleite>], [<ore:mycelium>, <ore:crystalLonsdaleite>, <ore:mycelium>]]);

# Wood Table
	recipes.remove(<thaumcraft:table_wood>);
	recipes.addShapedMirrored("Wood Table", 
	<thaumcraft:table_wood>, 
	[[null, null, null],
	[<ore:slabTreatedWood>, <ore:slabTreatedWood>, <ore:slabTreatedWood>],
	[<ore:plankTreatedWood>, null, <ore:plankTreatedWood>]]);

# Amber Bricks
	recipes.remove(<thaumcraft:amber_brick>);
	recipes.addShapeless("Thaumcraft Amber Brick", 
	<thaumcraft:amber_brick> * 4, 
	[<thaumcraft:amber_block>,<thaumcraft:amber_block>,<thaumcraft:amber_block>,<thaumcraft:amber_block>]);

# Mundane Amulet
	recipes.remove(<thaumcraft:baubles>);
	recipes.addShaped(<thaumcraft:baubles>, 
	[[null, <ore:bRedString>, null], 
	[<ore:bRedString>, null, <ore:bRedString>], 
	[null, <ore:ingotBrass>, null]]);

# Mundane Ring
	recipes.remove(<thaumcraft:baubles:1>);
	recipes.addShaped(<thaumcraft:baubles:1>, 
	[[<ore:ingotGold>, <ore:ingotBrass>, <ore:ingotGold>], 
	[<ore:ingotBrass>, <ore:clusterGold>, <ore:ingotBrass>], 
	[<ore:ingotGold>, <ore:ingotBrass>, <ore:ingotGold>]]);

# Fancy Amulet
	recipes.remove(<thaumcraft:baubles:4>);
	recipes.addShaped(<thaumcraft:baubles:4>, 
	[[null, <botania:spellcloth>, null], 
	[<botania:spellcloth>, <ore:clusterGold>, <botania:spellcloth>], 
	[<ore:gemEmerald>, <thaumcraft:baubles>, <ore:gemEmerald>]]);

# Fancy Ring
	recipes.remove(<thaumcraft:baubles:5>);
	recipes.addShaped(<thaumcraft:baubles:5>, 
	[[<ore:ingotGold>, <ore:gemEmerald>, <ore:ingotGold>], 
	[<ore:ingotGold>, <thaumcraft:baubles:1>, <ore:ingotGold>], 
	[<ore:ingotGold>, <ore:blockGold>, <ore:ingotGold>]]);

# Fancy Belt
	recipes.remove(<thaumcraft:baubles:6>);
	recipes.addShaped(<thaumcraft:baubles:6>,
	[[<ore:leather>, <ore:leather>, <ore:leather>], 
	[<ore:leather>, <ore:clusterCopper>, <ore:leather>], 
	[<ore:gemEmerald>, <thaumcraft:baubles:2>, <ore:gemEmerald>]]);

# TC Logs -> Planks
	recipes.addShapeless(<thaumcraft:plank_greatwood> * 2, [<thaumcraft:log_greatwood>]);
	recipes.addShapeless(<thaumcraft:plank_silverwood> * 2, [<thaumcraft:log_silverwood>]);

# Golemancer's Bell
	recipes.remove(<thaumcraft:golem_bell>);
	recipes.addShapedMirrored(<thaumcraft:golem_bell>, 
	[[null, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <astralsorcery:itemrockcrystalsimple>.anyDamage()],
	[null, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <astralsorcery:itemrockcrystalsimple>.anyDamage()], 
	[<ore:stickTreatedWood>, null, null]]);

//===============================================//

	print("--- Thaumcraft.zs initialized ---");