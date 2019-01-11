import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
print("--- loading MetalSticks.zs ---");
	
# See the configs/advRocketry/SmallPlatePresser for additional stick recipes
# Metal Sticks
	rh(<libvulpes:productrod:1>);
	rh(<libvulpes:productrod:6>);
	rh(<tconstruct:stone_stick>);
	
	recipes.remove(<immersiveengineering:material:1>);
	recipes.remove(<immersiveengineering:material:2>);
	recipes.remove(<immersiveengineering:material:3>);

	// IE Rods can be made in the Lathe, see AR config for details
	recipes.addShapedMirrored("IE Iron Stick", 
	<immersiveengineering:material:1>, 
	[[null, <ore:blockRedstone>, null],
	[null, <ore:craftingPiston>, null], 
	[null, <ore:plateIron>, null]]);

	recipes.addShapedMirrored("IE Aluminium Stick", 
	<immersiveengineering:material:3>, 
	[[null, <ore:blockRedstone>, null],
	[null, <ore:craftingPiston>, null], 
	[null, <ore:plateAluminium>, null]]);
	
	recipes.addShapedMirrored("IE Steel Stick", 
	<immersiveengineering:material:2>, 
	[[null, <ore:blockRedstone>, null],
	[null, <ore:craftingPiston>, null], 
	[null, <ore:plateSteel>, null]]);
	
	print("--- MetalSticks.zs initialized ---");