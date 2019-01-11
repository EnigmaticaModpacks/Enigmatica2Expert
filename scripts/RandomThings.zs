import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded randomthings
print("--- loading RandomThings.zs ---");
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
	rh(item);
}
print("--- RandomThings.zs initialized ---");
	
	