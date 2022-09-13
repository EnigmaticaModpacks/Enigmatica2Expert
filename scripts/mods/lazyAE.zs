#modloaded threng

recipes.remove(<threng:big_assembler:3>);
recipes.addShaped(<threng:big_assembler:3>, [
  [<threng:big_assembler>, <appliedenergistics2:material:37>, <threng:big_assembler>],
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

# [Fluix Aggregator] from [Osgloglas Large Plate][+3]
craft.remake(<threng:machine>, ["pretty",
  "F F F",
  "■ □ ■",
  "■ L ■"], {
  "F": <threng:material:4>,               # Fluix Logic Unit
  "■": <mekanism:plasticblock:*>,         # Grey Plastic Block
  "□": <tconstruct:large_plate>.withTag({Material: "osgloglas"}), # Osgloglas Large Plate
  "L": <appliedenergistics2:material:22>, # Logic Processor
});

# [Carbonic Fluix Complex] from [Silicon][+2]
craft.reshapeless(<threng:material:1>, "AABBC", {
  A: <ore:dustFluix>,
  B: <ore:dustQuartzBlack>,
  C: <ore:ingotSilicon>,
});

mods.threng.Aggregator.removeRecipe(<threng:material:1>);
mods.threng.Aggregator.addRecipe(<threng:material:1>, <ore:dustFluix>, <ore:dustQuartzBlack>, <ore:ingotSilicon>);

# Remake [Resonating Crystal] to use harder ingredients
mods.threng.Aggregator.removeRecipe(<threng:material:5>);
mods.threng.Aggregator.addRecipe(<threng:material:5>, <biomesoplenty:terrestrial_artifact>, <ore:gemAmethyst>, <ore:dustSkyStone>);
