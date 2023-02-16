#modloaded thaumictinkerer
import mods.jei.JEI.removeAndHide as rh;

# Fix conflict
# [Black Quartz Block] from [Smokey Quartz]
recipes.removeByRecipeName("thaumictinkerer:black_quartz_block");
craft.make(<thaumictinkerer:black_quartz_block>, ["pretty",
  "⌃   ⌃",
  "     ",
  "⌃   ⌃"], {
  "⌃": <ore:quartzDark>, # Smokey Quartz
});

# [Osmotic Enchanter] from [Shadow Enchanter][+7]
mods.thaumcraft.Infusion.removeRecipe(<thaumictinkerer:osmotic_enchanter>);
mods.thaumcraft.Infusion.registerRecipe(
  "osmotic_enchanter", # Name
  "INFUSION", # Research
  <thaumictinkerer:osmotic_enchanter>, # Output
  8, # Instability
  [<aspect:praecantatio> * 100, <aspect:cognitio> * 100, <aspect:alienis> * 100],
  <thaumadditions:shadow_enchanter>, # Central Item
  Grid(["pretty",
  "▬ S ▬",
  "p   p",
  "▬ S ▬"], {
  "▬": <ore:ingotDraconium>,              # Draconium Ingot
  "S": <randomthings:spectreilluminator>, # Spectre Illuminator
  "p": <thaumictinkerer:spellbinding_cloth>.anyDamage(), # Spellbinding Cloth
}).spiral(1));

// Conversion recipe between Thaumic Tinkerer Black Quartz Block & Botania Block of Smokey Quartz
recipes.addShapeless(<botania:quartztypedark>, [<thaumictinkerer:black_quartz_block>]);
recipes.addShapeless(<thaumictinkerer:black_quartz_block>, [<botania:quartztypedark>]);

rh(<thaumictinkerer:share_book>);