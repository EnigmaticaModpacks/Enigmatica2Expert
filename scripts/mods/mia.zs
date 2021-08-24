#modloaded mia

# Remove conflicting swap recipes (still can be chiseled)
recipes.removeByRecipeName("mia:mia/packed_paper/packed_paper_swap_3");
recipes.removeByRecipeName("mia:mia/packed_paper/packed_paper_swap_2");
recipes.removeByRecipeName("mia:mia/packed_paper/packed_paper_swap_1");
recipes.removeByRecipeName("mia:mia/packed_paper/packed_paper_swap_0");

# [Armored Glass*4] from [Desert Myrmex Resin Glass][+1]
craft.remake(<mia:armored_glass> * 4, ["pretty",
  "□ R □",
  "R   R",
  "□ R □"], {
  "□": <ore:plateSilicon>,     # Silicon Plate
  "R": <ore:myrmexResinGlass>, # Desert Myrmex Resin Glass
});