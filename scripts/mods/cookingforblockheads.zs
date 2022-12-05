
#modloaded cookingforblockheads

recipes.remove(<cookingforblockheads:fruit_basket>);
recipes.addShaped("cookingforblockheads_fruit_basket_oredict_fix", 
<cookingforblockheads:fruit_basket>, 
[[<ore:slabWood>, <ore:pressurePlateWood>, <ore:slabWood>]]);

# Kitchen cabinets harder because they have 2x size of chest
# [Kitchen_Cabinet] from [storage_box][+2]
craft.remake(<cookingforblockheads:cabinet>, ["pretty",
  "C c C",
  "C i C"], {
  "C": <ore:hardenedClay>, # Terracotta
  "c": <ore:chest>,        # Oak Chest
  "i": <ic2:te:112>        # storage_box
});

# [Kitchen_Counter] from [Oak_Chest][+3]
craft.remake(<cookingforblockheads:counter>, ["pretty",
  "s s s",
  "C c C",
  "C i C"], {
  "C": <ore:hardenedClay>, # Terracotta
  "s": <ore:stone>,        # Stone
  "c": <ore:chest>,        # Oak Chest
  "i": <ic2:te:112>        # storage_box
});