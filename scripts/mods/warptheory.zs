#modloaded warptheory
import mods.jei.JEI.removeAndHide as rh;

# Remove [Inpure tear]
mods.thaumcraft.Infusion.removeRecipe(<warptheory:item_cleanser_minor>);
rh(<warptheory:item_cleanser_minor>);

#[Pure tear]
mods.thaumcraft.Infusion.removeRecipe(<warptheory:item_cleanser>);
mods.thaumcraft.Infusion.registerRecipe(
  "pure_tear", # Name
  "PURE_TEAR", # Research
  <warptheory:item_cleanser>, # Output
  3, # Instability
  [<aspect:mana>*50,<aspect:auram>*30,<aspect:cognitio>*100],
  <minecraft:ghast_tear>, # CentralItem
  [<thaumcraft:sanity_soap>,<thaumcraft:sanity_soap>,<botania:manaresource:5>,<thaumcraft:sanity_soap>,<thaumcraft:sanity_soap>]
);

#[Cleansing amulet]
mods.thaumcraft.Infusion.removeRecipe(<warptheory:item_cleansing_amulet>);
mods.thaumcraft.Infusion.registerRecipe(
  "cleansing_amulet", # Name
  "CLEANSING_AMULET", # Research
  <warptheory:item_cleansing_amulet>, # Output
  5, # Instability
  [<aspect:mana>*100,<aspect:cognitio>*200,<aspect:permutatio>*50,<aspect:amogus>*69],
  <thaumadditions:fragnant_pendant>, # CentralItem
  [<thaumcraft:bath_salts>,<warptheory:item_cleanser>,<thaumcraft:bath_salts>,<thaumcraft:sanity_soap>,<thaumcraft:bath_salts>,<thaumicwonders:cleansing_charm>,<thaumcraft:bath_salts>,<thaumcraft:sanity_soap>]
);