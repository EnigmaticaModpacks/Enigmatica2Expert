

# Rustic Evaporating Basin
mods.rustic.EvaporatingBasin.addRecipe(<scalinghealth:heartdust>, <liquid:lifeessence>*100);
mods.rustic.EvaporatingBasin.addRecipe(<scalinghealth:heartdust>, <liquid:blood>*5000);

# Simplified Crushing tub
recipes.remove(<rustic:crushing_tub>);
recipes.addShaped(<rustic:crushing_tub>, [
  [<ore:slabWood>, null, <ore:slabWood>],
  [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>]]);

# Growing olives
scripts.process.grow(<rustic:olives>, <rustic:olives>, null, null, 0);
