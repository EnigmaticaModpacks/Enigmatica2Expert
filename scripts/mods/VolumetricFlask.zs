import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.ctutils.utils.Math.sqrt;
import mods.ctutils.utils.Math.ceil;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;

#modloaded volumetricflask

#<volumetricflask:volumetric_flask_1000>.withTag({})

for item in loadedMods["volumetricflask"].items {
  val id = item.definition.id;
  if(id.contains("volumetric_flask_")){

    val fRecipes = recipes.getRecipesFor(item);
    if (fRecipes.length > 0 && !isNull(fRecipes[0])){
      var recipeArray as IIngredient[][] = fRecipes[0].ingredients2D;

      var nullCount = 0;
      for y in 0 to recipeArray.length {
        var yArr = recipeArray[y];
        for x in 0 to yArr.length {
          if (!isNull(yArr[x]) && yArr[x] has <minecraft:glass_bottle>){
            yArr[x] = <thermalfoundation:glass:*>;
          }else if (isNull(yArr[x])) {
            if (nullCount > 0) {
              yArr[x] = <thermalfoundation:glass:*>;
            }
            nullCount = nullCount + 1;
          }
        }
      }

      val flaskSize = id.substring(33) as double;
      recipes.remove(item);
      mods.forestry.ThermionicFabricator.addCast(item * 
        max(1, min(64, ceil(sqrt(64000.0d / flaskSize))) as int), 
        recipeArray, <liquid:glass> * 4000);
    }
  }
}