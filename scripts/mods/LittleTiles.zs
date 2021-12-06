import crafttweaker.item.IIngredient;

#modloaded littletiles

scripts.category.tooltip_utils.desc.jei(<littletiles:recipeadvanced>, 'dont_put_into_ae');

# Storage tiles
recipes.remove(<littletiles:ltstorageblocktile>);
recipes.addShaped(<littletiles:ltstorageblocktile>, [
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>], 
	[<chisel:factory:6>, <ore:chest>, <chisel:factory:6>], 
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>]]);

# Tools
val ingrs = {
  "▬": <randomthings:ingredient:3>,       # Spectre Ingot
  "#": <randomthings:spectreplank>,       # Spectre Planks
  "`": <ore:nuggetPlatinum>,
  "╱": <ore:stickIron>,                   # Iron Rod
  "P": <computercraft:printout>,          # Printed Page
  "w": <ore:woolPrime>,                   # Prime wool
  "M": <appliedenergistics2:material:39>, # ME Storage Housing
} as IIngredient[string];

craft.remake(<littletiles:hammer>,             [" ` ", " ▬O", "▬  "], ingrs);
craft.remake(<littletiles:recipeadvanced> * 4, ["P P", " M ", "P P"], ingrs);
craft.remake(<littletiles:saw>,                ["  #", " #╱", "▬╱ "], ingrs);
craft.remake(<littletiles:container>,          [" ` ", "w w", " w "], ingrs);
craft.remake(<littletiles:wrench>,             ["  `", " # ", "▬  "], ingrs);
craft.remake(<littletiles:chisel>,             ["  `", " ▬ ", "▬  "], ingrs);
craft.remake(<littletiles:colortube>,          [" w ", " #w", "▬  "], ingrs);
craft.remake(<littletiles:grabber>,            [" w ", "wOw", " # "], ingrs);

# Melt Water blocks
scripts.process.melt(<littletiles:lttransparentcoloredblock:5>, <liquid:water> * 1000);