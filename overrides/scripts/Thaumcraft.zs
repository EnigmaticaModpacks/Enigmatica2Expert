import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded thaumcraft


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
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:oreCopper>, <thaumcraft:nugget:1>);
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:oreTin>, <thaumcraft:nugget:2>);
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:oreSilver>, <thaumcraft:nugget:3>);
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:oreLead>, <thaumcraft:nugget:4>);

mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:clusterCopper>, <thaumcraft:nugget:1>);
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:clusterTin>, <thaumcraft:nugget:2>);
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:clusterSilver>, <thaumcraft:nugget:3>);
mods.thaumcraft.SmeltingBonus.removeSmeltingBonus(<ore:clusterLead>, <thaumcraft:nugget:4>);

// IIngredient input, WeightedItemStack stack
mods.thaumcraft.SmeltingBonus.addSmeltingBonus(<ore:oreCopper>, <thermalfoundation:material:192> % 33);
mods.thaumcraft.SmeltingBonus.addSmeltingBonus(<ore:oreTin>, <thermalfoundation:material:193> % 33);
mods.thaumcraft.SmeltingBonus.addSmeltingBonus(<ore:oreSilver>, <thermalfoundation:material:194> % 33);
mods.thaumcraft.SmeltingBonus.addSmeltingBonus(<ore:oreLead>, <thermalfoundation:material:195> % 33);

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
	[[null, <botania:spellcloth>.anyDamage(), null], 
	[<botania:spellcloth>.anyDamage(), <ore:clusterGold>, <botania:spellcloth>.anyDamage()], 
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

# Golemancer's Bell
	recipes.remove(<thaumcraft:golem_bell>);
	recipes.addShapedMirrored(<thaumcraft:golem_bell>, 
	[[null, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <astralsorcery:itemrockcrystalsimple>.anyDamage()],
	[null, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <astralsorcery:itemrockcrystalsimple>.anyDamage()], 
	[<ore:stickTreatedWood>, null, null]]);

# Salis Mundis visible recipe (original is hidden in JEI)
craft.make(<thaumcraft:salis_mundus>, ["DEFCAB"], {
	A: <ore:itemFlint>.reuse(),
	B: <minecraft:bowl>.reuse(),
	C: <ore:dustRedstone>,
	D: <thaumcraft:crystal_essence:*>.marked("g0"),
	E: <thaumcraft:crystal_essence:*>.marked("g1"),
	F: <thaumcraft:crystal_essence:*>.marked("g2"),
	}, function(out, ins, cInfo) {
    for i in 0 to 2 {
      for j in (i+1) to 3 {
        if (ins["g"~i] has ins["g"~j]) {
          return null; # We found duplicate, return nothing
        }
      }
    }
    return out;
  }, true /* True for shapeless */);


# Add/Override aspects
<forestry:candle>.setAspects(<aspect:lux>*20, <aspect:herba>*5, <aspect:aer>*5);
<forestry:stump>.setAspects(<aspect:lux>*20, <aspect:herba>*5, <aspect:aer>*5);
<forestry:beeswax>.setAspects(<aspect:lux>*5, <aspect:aer>*2);
	