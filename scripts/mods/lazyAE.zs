#modloaded threng

recipes.remove(<threng:big_assembler:3>);
recipes.addShaped(<threng:big_assembler:3>, [
  [<threng:big_assembler>, <appliedenergistics2:material:38>, <threng:big_assembler>],
  [<appliedenergistics2:part:76>, <modularmachinery:blockcasing:5>, <appliedenergistics2:part:76>],
  [<threng:big_assembler>, <appliedenergistics2:interface>, <threng:big_assembler>]
  ]);

recipes.remove(<threng:big_assembler:1>);
recipes.addShaped(<threng:big_assembler:1>, [
  [<ore:fanSteel>, <threng:big_assembler>, <ore:fanSteel>]
  ]);

recipes.remove(<threng:big_assembler> * 4);
recipes.addShaped(<threng:big_assembler> * 6, [
  [<environmentaltech:structure_frame_1>, <ore:ingotFluixSteel>, <environmentaltech:structure_frame_1>],
  [<ore:ingotFluixSteel>, <extendedcrafting:interface>, <ore:ingotFluixSteel>],
  [<environmentaltech:structure_frame_1>, <ore:ingotFluixSteel>, <environmentaltech:structure_frame_1>]
  ]);

# [Carbonic Fluix Complex] from [Silicon][+2]
craft.reshapeless(<threng:material:1>, "AABBC", {
  A: <ore:dustFluix>,
  B: <ore:dustQuartzBlack>,
  C: <ore:ingotSilicon>,
});

mods.threng.Aggregator.removeRecipe(<threng:material:1>);
mods.threng.Aggregator.addRecipe(<threng:material:1>, <ore:dustFluix>, <ore:dustQuartzBlack>, <ore:ingotSilicon>);