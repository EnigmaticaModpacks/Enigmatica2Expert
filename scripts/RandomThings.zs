import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide;
#modloaded randomthings

val itemsToRemove = [

<randomthings:blockbreaker>,
<randomthings:spectreblock>,
<randomthings:spectrelens>,
<randomthings:spectreenergyinjector>,
<randomthings:spectrecoil_normal>,
<randomthings:spectrecoil_redstone>,
<randomthings:spectrecoil_ender>,
<randomthings:spectrecoil_number>,
<randomthings:spectrecoil_genesis>,
<randomthings:spectreplank>,
<randomthings:spectresapling>,
<randomthings:spectrelog>,
<randomthings:spectreleaf>,
<randomthings:ingredient:3>,
<randomthings:ingredient:12>,
<randomthings:spectrekey>,
<randomthings:spectreanchor>,
<randomthings:spectresword>,
<randomthings:spectrepickaxe>,
<randomthings:spectreaxe>,
<randomthings:spectreshovel>

] as IItemStack[];
	
for item in itemsToRemove {
	removeAndHide(item);
}

recipes.remove(<randomthings:idcard>);
recipes.addShapeless("idcard",
	<randomthings:idcard>,
	[<ore:paper>,<ore:dyeBlack>, <ore:dyeRed>]);

# Ender bucket recipe change
recipes.remove(<randomthings:enderbucket>);
recipes.addShaped("ender_bucket1",
	<randomthings:enderbucket>,
	[[<minecraft:ender_pearl>],
	[<minecraft:bucket>]]);

recipes.addShaped("ender_bucket2",
	<randomthings:enderbucket>,
	[[<ore:plateIron>, <minecraft:ender_pearl>, <ore:plateIron>],
	[null, <ore:plateIron>, null]]);

# Harder Igniter (because it doesn't use energy or durability)
recipes.remove(<randomthings:igniter>);
recipes.addShaped("Random Things Igniter", <randomthings:igniter>, [
[<ore:gearSteel>, <ore:gearSteel>, <ore:netherrack>],
[<minecraft:dispenser>, <iceandfire:fire_dragon_blood>, <ore:netherrack>],
[<ore:gearSteel>, <ore:gearSteel>, <ore:netherrack>]]);
