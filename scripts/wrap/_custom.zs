import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#priority 2900

zenClass Class_Agglomeration { zenConstructor() {}

	function addRecipe(input as IIngredient[], output as IItemStack[], catalyst as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.botaniatweaks.Agglomeration.addRecipe'~
			serialize.args([serialize.IIngredient__(input), serialize.IItemStack__(output), serialize.IIngredient__(catalyst)]));
	}

}
static Agglomeration as Class_Agglomeration = Class_Agglomeration();
