#priority 950
#modloaded thaumtweaks
#ignoreBracketErrors

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.AssemblyRecipe;
import mods.ctintegration.data.DataUtil.parse as sNBT;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:pech_trades>;
x.addJEICatalyst(Soul('thaumcraft:pech'));
x.setJEIItemSlot(3, 0, 'input0');

// Diamonds
for _y in 0 .. 5 {
  x.setJEIItemSlot(0, _y+1, 'input1'~_y, scripts.jei.requious.getVisSlots(0,1));
}

// Main outputs
var k = 0;
for _y in 0 .. 5 {
  for _x in 0 .. 6 {
    x.setJEIItemSlot(_x+1, _y+1, 'output'~_x~_y);
    k += 1;
  }
}

val pechTrades = {
/*Inject_js(
loadText('config/thaumtweaks_pech_trades.txt')
  .replace(/#[\s\S\n]+/gm, '') // Remove custom comment
  .replace(/\s*\/\/.*$/gm, '') // Remove inline comment
  .trim()
  .replace(/\n\s*\d+:/gm, '\n  ], [')
  .replace(/^\s+(\w+:[^\s]+)/gm, '    <$1>') // Item
  .replace(/\s+(\{.*\})/gm, ".withTag(sNBT('$1'))") // Tag
  .replace(/\s+(\d+)$/gm, ' * $1') // Weight
  .replace(/^(\s{4}.*)/gm, '$1,') // Commas
  .replace(/^(\w+:)\n\s+\], /gm, '  ]],\n$1 [') // Excess brackets
  .replace(/\s+\]\],\n/, '') + // Excess at start
'\n]]'
)*/
MINER: [[
    <extrautils2:compressedcobblestone:2>,
    <jaopca:item_clustertungsten>,
    <thaumcraft:cluster:4>,
    <jaopca:item_clusterdraconium>,
    <jaopca:item_clustertitanium>,
    <jaopca:item_clusterruby>,
  ], [
    <extrautils2:compresseddirt:2>,
    <jaopca:item_clusteriridium>,
    <jaopca:item_clusterastralstarmetal>,
    <thaumcraft:thaumium_pick>,
    <thaumcraft:thaumium_shovel>,
    <thaumcraft:thaumium_axe>,
  ], [
    <extrautils2:compressednetherrack:2>,
    <jaopca:item_clustermithril>,
    <jaopca:item_clustertanzanite>,
    <astralsorcery:blockcelestialcrystals:4>,
    <thaumcraft:turret:2>,
    <twilightforest:ore_magnet>,
  ], [
    <astralsorcery:blockcustomore>,
    <thaumicwonders:transmuter_stone>,
    <twilightforest:twilight_sapling:7>,
    <cyclicmagic:storage_bag>,
    <thaumcraft:elemental_pick>.withTag(sNBT('{infench:[{lvl:1s,id:4s},{lvl:2s,id:3s}]}')),
    <actuallyadditions:quartz_paxel>,
  ], [
    <bloodmagic:demon_crystal>,
    <thaumicwonders:eldritch_cluster:4>,
    <thaumicwonders:eldritch_cluster:6>,
    <astralsorcery:blockgemcrystals:2>,
    <astralsorcery:blockgemcrystals:3>,
    <astralsorcery:blockgemcrystals:4>,
  ]],
MAGE: [[
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "aer"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "terra"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "ignis"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "aqua"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "perditio"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "ordo"}]}')),
  ], [
    <thaumcraft:cloth_chest>,
    <thaumcraft:cloth_legs>,
    <thaumcraft:cloth_boots>,
    <thaumcraft:thaumometer>,
    <darkutils:charm_null>,
    <darkutils:charm_portal>,
  ], [
    <thaumcraft:goggles>,
    <thaumcraft:baubles:3>,
    <conarm:travel_soul>,
    <cyclicmagic:charm_antidote>,
    <cyclicmagic:charm_boat>,
    <cyclicmagic:charm_fire>,
  ], [
    <thaumcraft:lamp_arcane>,
    <twilightforest:charm_of_life_2>,
    <twilightforest:charm_of_keeping_3>,
    <iceandfire:pixie_dust>,
    <extrautils2:ingredients:12>,
    <thaumicwonders:panacea:1>,
  ], [
    <thaumcraft:pech_wand>,
    <thaumcraft:amulet_vis>,
    <thaumcraft:charm_undying>,
    <botania:overgrowthseed>,
    <randomthings:beans:2>,
    <mysticalagriculture:growth_accelerator>,
  ]],
ARCHER: [[
    <forestry:hunter_bag>,
    <cyclicmagic:water_candle>,
    <rats:rat_arrow>,
    <forestry:hunter_bag_t2>,
    <thaumcraft:candle_white>,
    <cyclicmagic:sleeping_mat>,
  ], [
    <cyclicmagic:sack_ender>,
    <rustic:silver_lantern>,
    <cyclicmagic:glove_climb>,
    <cyclicmagic:wand_missile>,
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 1s, id: 51}]}')),
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 1s, id: 78}]}')),
  ], [
    <tconstruct:bow_string>.withTag(sNBT('{Material: "soularium"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "ghostwood"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "ionite"}')),
    <cyclicmagic:ender_lightning>,
    <tconstruct:bow_string>.withTag(sNBT('{Material: "fluxed_string"}')),
    <endreborn:item_ender_string>,
  ], [
    <conarm:travel_sack>,
    <tconstruct:bow_string>.withTag(sNBT('{Material: "spectre_string"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "aethium"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "gelid_gem"}')),
    <cyclicmagic:wand_hypno>,
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 1s, id: 70}]}')),
  ], [
    <minecraft:dragon_breath>,
    <cyclicmagic:storage_bag>,
    <thaumicwonders:bone_bow>,
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 10s, id: 48}]}')),
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 4s, id: 49}]}')),
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 6s, id: 65}]}')),
  ]],
COMMON: [[
    <mysticalagriculture:inferium_apple> * 2,
    <extrautils2:magicapple> * 4,
    <thaumcraft:curio:1> * 4,
    <rustic:fluid_bottle>.withTag(sNBT('{Fluid: {FluidName: "ironwine", Amount: 1000, Tag: {Quality: 1.0f}}}')),
    <rustic:fluid_bottle>.withTag(sNBT('{Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1.0f}}}')),
    <rustic:fluid_bottle>.withTag(sNBT('{Fluid: {FluidName: "mead", Amount: 1000, Tag: {Quality: 1.0f}}}')),
  ], [
    <mysticalagriculture:prudentium_apple>,
    <bhc:relic_apple> * 4,
    <thaumcraft:curio:5> * 4,
    <scalingfeast:exhaustingapple> * 5,
    <cyclicmagic:apple>,
    <thaumcraft:lamp_arcane>,
  ], [
    <mysticalagriculture:intermedium_apple>,
    <minecraft:golden_apple> * 4,
    <thaumcraft:curio> * 4,
    <thaumcraft:curio:2> * 4,
    <thaumadditions:dawn_totem>,
    <thaumadditions:twilight_totem>,
  ], [
    <mysticalagriculture:superium_apple>,
    <minecraft:golden_apple:1>,
    <thaumcraft:curio:4> * 5,
    <thaumcraft:sanity_soap>,
    <thaumcraft:mechanism_complex>,
    <bloodmagic:soul_snare>,
  ], [
    <mysticalagriculture:supremium_apple>,
    <scalingfeast:enchantedironapple>,
    <thaumcraft:curio:3> * 6,
    <thaumadditions:zeith_fur> * 3,
    <minecraft:totem_of_undying> * 3,
    <thaumadditions:jar_eldritch>,
]]
/**/
} as IItemStack[][][string];

val pechOrder = [
  "MINER",
  "MAGE",
  "ARCHER",
  "COMMON",
] as string[];

val pechRepresentation = {
  MINER: <minecraft:stone_pickaxe>,
  MAGE: <betterbuilderswands:wandstone>,
  ARCHER: <minecraft:bow>,
  COMMON: <thaumcraft:stone_arcane>,
} as IItemStack[string];

val pechDiamonds = [
  <rats:rat_diamond>,
  <minecraft:diamond>,
  <actuallyadditions:item_crystal:2>,
  <minecraft:diamond_block>,
  <additionalcompression:gemdiamond_compressed:1>,
] as IItemStack[];

for i, kind in pechOrder {
  val assRec = AssemblyRecipe.create(function(container) {
    for y, arr1d in pechTrades[kind] {
      for x, output in arr1d {
        if(isNull(output)) continue;
        container.addItemOutput("output" ~ x ~ y, output);
      }
    }
  });
  assRec.requireItem("input0", pechRepresentation[kind]);
  for j in 0 .. 5 { assRec.requireItem("input1"~j, pechDiamonds[j]); }
  x.addJEIRecipe(assRec);
}
