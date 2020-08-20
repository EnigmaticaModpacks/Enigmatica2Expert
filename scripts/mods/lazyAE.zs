


recipes.remove(<threng:big_assembler:3>);
recipes.addShaped(<threng:big_assembler:3>, [
  [<threng:big_assembler>, <appliedenergistics2:material:38>, <threng:big_assembler>],
  [<appliedenergistics2:part:76>, <forestry:chipsets:3>.withTag({T:3 as short}, false), <appliedenergistics2:part:76>],
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
