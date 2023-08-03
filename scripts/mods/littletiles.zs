import crafttweaker.item.IIngredient;

#modloaded littletiles

scripts.lib.tooltip.desc.jei(<littletiles:recipeadvanced>, 'dont_put_into_ae');

# Storage tiles
recipes.remove(<littletiles:ltstorageblocktile>);
recipes.addShaped(<littletiles:ltstorageblocktile>, [
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>], 
	[<chisel:factory:6>, <ore:chest>, <chisel:factory:6>], 
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>]]);

# Tools
val ingrs = {
  "#": <randomthings:spectreplank>,       # Spectre Planks
  "`": <ore:nuggetPlatinum>,
  "╱": <ore:stickIron>,                   # Iron Rod
  "P": <computercraft:printout>,          # Printed Page
  "w": <ore:blockRockwool>,
  "M": <appliedenergistics2:material:39>, # ME Storage Housing
} as IIngredient[string];

craft.remake(<littletiles:hammer>,             [" ` ", " #`", "#  "], ingrs);
craft.remake(<littletiles:recipeadvanced> * 4, ["P P", " M ", "P P"], ingrs);
craft.remake(<littletiles:saw>,                ["  #", " #╱", "#╱ "], ingrs);
craft.remake(<littletiles:container>,          [" ` ", "w w", " w "], ingrs);
craft.remake(<littletiles:wrench>,             ["  `", " # ", "w  "], ingrs);
craft.remake(<littletiles:chisel>,             ["  `", " # ", "#  "], ingrs);
craft.remake(<littletiles:colortube>,          [" w ", " #w", "#  "], ingrs);
craft.remake(<littletiles:grabber>,            [" w ", "wOw", " # "], ingrs);

# Melt Water blocks
scripts.process.melt(<littletiles:lttransparentcoloredblock:5>, <liquid:water> * 1000);

// Add missed Dyable blocks recipes
val unique = scripts.lib.unique.Unique([
  <ore:dyeLightGray>,
  <rustic:clay_wall>,
  <rustic:clay_wall>,
]);

val hasRecipes = [12, 14] as int[];
for i in 0 .. 15 {
  if (hasRecipes has i) continue;
  recipes.addShaped("dyable block #"~i, <littletiles:ltcoloredblock>.definition.makeStack(i) * 4, unique.next());
}

for i in 0 .. 5 {
  recipes.addShaped("dyable block #"~(i+14), <littletiles:ltcoloredblock2>.definition.makeStack(i) * 4, unique.next());
}
