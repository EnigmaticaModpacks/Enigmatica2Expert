recipes.remove(<cookingforblockheads:fruit_basket>);
recipes.addShaped("cookingforblockheads_fruit_basket_oredict_fix", 
<cookingforblockheads:fruit_basket>, 
[[<ore:slabWood>, <ore:pressurePlateWood>, <ore:slabWood>]]);

recipes.remove(<cookingforblockheads:sink>);
recipes.addShapedMirrored("cookingforblockheads_sink_harder_recipe", 
<cookingforblockheads:sink>, 
[[<ore:plateDenseIron>, <ore:plateDenseIron>, <ore:plateDenseIron>],
[<mekanism:transmitter:1>.withTag({tier: 3}), <mysticalagriculture:crafting:48>, <mekanism:transmitter:1>.withTag({tier: 3})], 
[<ore:hardenedClay>, <nuclearcraft:water_source_dense>, <ore:hardenedClay>]]);
