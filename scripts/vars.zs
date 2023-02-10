import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#priority 3000

#ignoreBracketErrors

static meltingExceptions as IData = ['Amber', 'Redstone', 'Coal', 'Diamond'] as IData;

static dimBlocks as IItemStack[int] = {
  0          : <quark:turf>,
  1          : <minecraft:end_stone>,
  -1         : <minecraft:netherrack>,
  144        : <compactmachines3:wallbreakable>,
  14676      : <thaumicaugmentation:stone>,
  -11325     : <minecraft:cobblestone>,
  -343800852 : <randomthings:spectreblock>,
  -8         : <rats:marbled_cheese_raw>,
  7          : <twilightforest:twilight_log>,
  -2         : <advancedrocketry:circlelight>,
  2          : <appliedenergistics2:spatial_pylon>,
  100        : <advancedrocketry:moonturf>,
  101        : <biomesoplenty:white_sand>,
  102        : <biomesoplenty:ash_block>,
  103        : <advancedrocketry:hotturf>,
  105        : <advancedrocketry:basalt>,
  106        : <minecraft:ice>,
  108        : <nuclearcraft:wasteland_earth>,
  109        : <minecraft:packed_ice>,
  110        : <biomesoplenty:hard_ice>,
  111        : <nuclearcraft:supercold_ice>,
  112        : <nuclearcraft:fertile_isotope:2>,
  113        : <nuclearcraft:ingot_block:8>,
  114        : <biomesoplenty:leaves_3:11>,
  115        : <advancedrocketry:charcoallog>,
  118        : <littletiles:lttransparentcoloredblock:5>,
  119        : <minecraft:stone:1>,
  120        : <minecraft:snow>,
  121        : <advancedrocketry:alienwood>,
  122        : <astralsorcery:blockblackmarble>,
  123        : <minecraft:stone:5>,
} as IItemStack[int];

static oreDye as IIngredient[] = [
  <ore:dyeWhite>,
  <ore:dyeOrange>,
  <ore:dyeMagenta>,
  <ore:dyeLightBlue>,
  <ore:dyeYellow>,
  <ore:dyeLime>,
  <ore:dyePink>,
  <ore:dyeGray>,
  <ore:dyeLightGray>,
  <ore:dyeCyan>,
  <ore:dyePurple>,
  <ore:dyeBlue>,
  <ore:dyeBrown>,
  <ore:dyeGreen>,
  <ore:dyeRed>,
  <ore:dyeBlack>,
] as IIngredient[];
