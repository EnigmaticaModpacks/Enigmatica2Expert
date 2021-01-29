import crafttweaker.item.IIngredient;

# Storage tiles
recipes.remove(<littletiles:ltstorageblocktile>);
recipes.addShaped(<littletiles:ltstorageblocktile>, [
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>], 
	[<chisel:factory:6>, <ore:chest>, <chisel:factory:6>], 
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>]]);

# Tools
val ingrs = {
  "P": <computercraft:printout>,          # Printed Page
  "╱": <ore:stickIron>,                   # Iron Rod
  "#": <randomthings:spectreplank>,
  "w": <ore:woolPrime>,
  "▬": <randomthings:ingredient:3>,       # Spectre Ingot
  "M": <appliedenergistics2:material:39>, # ME Storage Housing
  "O": <ore:nuggetOsmiridium>             # Osmiridium Nugget
} as IIngredient[string];

craft.remake(<littletiles:hammer>,             [" O ", " ▬O", "▬  "], ingrs);
craft.remake(<littletiles:recipeadvanced> * 4, ["  P", " M ", "P P"], ingrs);
craft.remake(<littletiles:saw>,                ["  #", " #╱", "▬╱ "], ingrs);
craft.remake(<littletiles:container>,          [" O ", "w w", " w "], ingrs);
craft.remake(<littletiles:wrench>,             ["  O", " # ", "▬  "], ingrs);
craft.remake(<littletiles:chisel>,             ["  O", " ▬ ", "▬  "], ingrs);
craft.remake(<littletiles:colortube>,          [" w ", " #w", "▬  "], ingrs);
craft.remake(<littletiles:grabber>,            [" w ", "wOw", " # "], ingrs);