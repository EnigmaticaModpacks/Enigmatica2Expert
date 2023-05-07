/*

Wrapper for recipes that will allow to hook
on those recipes to add their copies in another machines

*/

#modloaded forestry
#priority 10

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

function addAltRecipe(
  output as IItemStack,
  ingredients as IIngredient[][],
  fluidInput as ILiquidStack = null,
  box as IItemStack = null,
  altMaxMult as int = 64
) as void {
  scripts.processUtils.avdRockXmlRecipeFlatten("PrecisionAssembler", output, ingredients, fluidInput, box, altMaxMult);
}

function addCast(
  output as IItemStack,
  ingredients as IIngredient[][],
  fluidInput as ILiquidStack = null,
  box as IItemStack = null,
  altMaxMult as int = 64
) as void {
  //mods.forestry.ThermionicFabricator.addCast(IItemStack output, IIngredient[][] ingredients, ILiquidStack liquidStack, @Optional IItemStack plan);
  mods.forestry.ThermionicFabricator.addCast(output, ingredients, fluidInput, box);
  if (!utils.DEBUG) return;
  addAltRecipe(output, ingredients, fluidInput, box, altMaxMult);
}

# [Ender Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:12> * 4, Grid(["pretty",
  "  :  ",
  "E : E",
  ": : :"], {
  ":": <ore:oc:stoneEndstone>, # End Stone
  "E": <ore:pearlEnderEye>,    # Eye of Ender
}).shaped(), <fluid:glass> * 500);

# [Tin Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:1> * 4, Grid(["pretty",
  "  ▬  ",
  "♥ ▬ ♥",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotTin>,     # Tin Ingot
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Apatine Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:10> * 4, Grid(["pretty",
  "  ◊  ",
  "♥ ◊ ♥",
  "◊ ◊ ◊"], {
  "◊": <ore:gemApatite>,   # Apatite
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Orchid Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:13> * 4, Grid(["pretty",
  "  ♥  ",
  "▼ ♥ ▼",
  "♥ ♥ ♥"], {
  "♥": <ore:oreRedstone>,    # Redstone Ore
  "▼": <minecraft:repeater>, # Redstone Repeater
}).shaped(), <fluid:glass> * 500);

# [Iron Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:3> * 4, Grid(["pretty",
  "  ▬  ",
  "♥ ▬ ♥",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotFakeIron>, # Iron Ingot
  "♥": <ore:dustRedstone>,                    # Redstone
}).shaped(), <fluid:glass> * 500);

# [Diamantine Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:5> * 4, Grid(["pretty",
  "  ◊  ",
  "♥ ◊ ♥",
  "◊ ◊ ◊"], {
  "◊": <ore:gemDiamondRat>, # Rat Diamond
  "♥": <ore:dustRedstone>,  # Redstone
}).shaped(), <fluid:glass> * 500);

# [Obsidian Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:6> * 4, Grid(["pretty",
  "  o  ",
  "♥ o ♥",
  "o o o"], {
  "o": <ore:obsidian>,     # Obsidian
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Emerald Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:9> * 4, Grid(["pretty",
  "  ◊  ",
  "♥ ◊ ♥",
  "◊ ◊ ◊"], {
  "◊": <ore:gemEmerald>,   # Emerald
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Lapis Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:11> * 4, Grid(["pretty",
  "  ◊  ",
  "♥ ◊ ♥",
  "◊ ◊ ◊"], {
  "◊": <ore:gemLapis>, # Lapis Lazuli
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Blazing Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:7> * 4, Grid(["pretty",
  "  ▲  ",
  "♥ ▲ ♥",
  "▲ ▲ ▲"], {
  "▲": <ore:dustBlaze>, # Blaze Powder
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Bronze Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:2> * 4, Grid(["pretty",
  "  ▬  ",
  "♥ ▬ ♥",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotBronze>,  # Bronze Ingot
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Rubberised Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:8> * 4, Grid(["pretty",
  "  R  ",
  "♥ R ♥",
  "R R R"], {
  "R": <ore:itemRubber>,   # Plastic
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Copper Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes> * 4, Grid(["pretty",
  "  ▬  ",
  "♥ ▬ ♥",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotCopper>,  # Copper Ingot
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Golden Electron Tube]*4 from [Pipette][+2]
addAltRecipe(<forestry:thermionic_tubes:4> * 4, Grid(["pretty",
  "  ▬  ",
  "♥ ▬ ♥",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotGold>,    # Gold Ingot
  "♥": <ore:dustRedstone>, # Redstone
}).shaped(), <fluid:glass> * 500);

# [Flexible Casing] from [Pipette][+3]
addAltRecipe(<forestry:flexible_casing>, Grid(["pretty",
  "▬ ◊ ▬",
  "s   s",
  "▬ ◊ ▬"], {
  "▬": <ore:ingotBronze>, # Bronze Ingot
  "◊": <ore:gemEmerald>,  # Emerald
  "s": <ore:slimeball>,   # Slimeball
}).shaped(), <fluid:glass> * 500);
