#modloaded deepmoblearning

val ing = <deepmoblearning:glitch_infused_ingot>;

recipes.remove(<deepmoblearning:glitch_infused_sword>);
recipes.addShaped(<deepmoblearning:glitch_infused_sword>, [
  [null, null, ing],
  [null, ing, null],
  [<endreborn:sword_shard>, null, null]]);

recipes.remove(<deepmoblearning:soot_covered_plate> * 8);
recipes.addShaped(<deepmoblearning:soot_covered_plate> * 4, [
  [null, <deepmoblearning:soot_covered_redstone>, null],
  [<biomesoplenty:crystal>, <tconstruct:large_plate>.withTag({Material: "black_quartz"}), <biomesoplenty:crystal>],
  [null, <deepmoblearning:soot_covered_redstone>, null]]);

remakeEx(<deepmoblearning:extraction_chamber>, [
  [<ore:sheetTitaniumIridium>, <mekanism:glowpanel:11>, <ore:sheetTitaniumIridium>],
  [<extrautils2:decorativesolid:7>, <deepmoblearning:machine_casing>, <extrautils2:decorativesolid:7>]]);

remakeEx(<deepmoblearning:simulation_chamber>, [
  [<ore:gearEmerald>, <mekanism:glowpanel:6>, <ore:gearEmerald>],
  [<extrautils2:decorativesolid:7>, <deepmoblearning:machine_casing>, <extrautils2:decorativesolid:7>]]);

remakeEx(<deepmoblearning:machine_casing>, [
  [<deepmoblearning:soot_covered_plate>, <deepmoblearning:soot_covered_redstone>, <deepmoblearning:soot_covered_plate>],
  [<tconstruct:fancy_frame:2>, <extendedcrafting:trimmed:2>, <tconstruct:fancy_frame:2>],
  [<deepmoblearning:soot_covered_plate>, <deepmoblearning:soot_covered_redstone>, <deepmoblearning:soot_covered_plate>]]);

recipes.remove(<deepmoblearning:polymer_clay> * 16);
recipes.addShapeless(<deepmoblearning:polymer_clay> * 16, [<fluid:concrete> * 1000, <ore:dustClay>, <ore:dustClay>, <ore:dustClay>, <ore:dustGold>, <ore:dustLapis>]);

# Remove level-to-level conversions
recipes.remove(<deepmoblearning:living_matter_hellish>);
recipes.remove(<deepmoblearning:living_matter_extraterrestrial>);

# Add mass crafting recipes for iron
val matterOver = <deepmoblearning:living_matter_overworldian>;
recipes.addShapeless("Over matter to Iron Blocks", <minecraft:iron_block> * 2, [
  matterOver, matterOver, matterOver, matterOver, <thaumcraft:flesh_block>, matterOver, matterOver, matterOver, matterOver]);

# Add mass crafting recipes for gold
val matterHell = <deepmoblearning:living_matter_hellish>;
recipes.addShaped("Hellish matter to Gold Blocks", <minecraft:gold_block> * 4, [
  [<ore:glowstone>, matterHell, <ore:glowstone>],
  [matterHell, <ore:blockFakeIron>, matterHell],
  [matterHell, matterHell, matterHell]]);

# [Trial Keystone] from [Soot-covered Plate][+3]
craft.remake(<deepmoblearning:trial_keystone>, ["pretty",
  "◊ § ◊",
  "□ п □",
  "□ □ □"], {
  "□": <ore:plateSilicon>,                   # Silicon Plate
  "§": <deepmoblearning:trial_key>,          # Trial Key
  "◊": <ore:gemDiamond>,                     # Diamond
  "п": <deepmoblearning:soot_covered_plate>, # Soot-covered Plate
});

# [Blank Data Model] from [Soot-covered Redstone][+2]
craft.remake(<deepmoblearning:data_model_blank>, ["pretty",
  "* M *",
  "M ♥ M",
  "* M *"], {
  "♥": <deepmoblearning:soot_covered_redstone>, # Soot-covered Redstone
  "*": <ore:itemPulsatingCrystal>,              # Pulsating Crystal
  "M": <endreborn:food_ender_flesh>,            # Mysical Flesh
});

# Redstone from Sool-covered version
mods.tconstruct.Drying.addRecipe(<minecraft:redstone>, <deepmoblearning:soot_covered_redstone>, 100);
mods.thermalexpansion.Transposer.addFillRecipe(<minecraft:redstone>, <deepmoblearning:soot_covered_redstone>, <fluid:water> * 10, 1000);

# [Ender Air Bottle] from [End Stone][+2]
craft.shapeless(<botania:manaresource:15> * 16, "EeG", {
  "E": <deepmoblearning:living_matter_extraterrestrial>, # Extraterrestrial Matter
  "e": <ore:endstone> | <ore:oc:stoneEndstone>, # End Stone
  "G": <minecraft:glass_bottle>,                # Glass Bottle
});

# [Dragon's Breath] from [Dragon Scale][+2]
craft.shapeless(<minecraft:dragon_breath>, "EDG", {
  "E": <deepmoblearning:living_matter_extraterrestrial>, # Extraterrestrial Matter
  "D": <mysticalagradditions:stuff:3>, # Dragon Scale
  "G": <minecraft:glass_bottle>,       # Glass Bottle
});

# [Unstable Glitch Fragment] from [Gelid Enderium Dust][+3]
craft.remake(<deepmoblearning:glitch_fragment>, ["pretty",
  "◊ P ◊",
  "e ▲ e",
  "◊ P ◊"], {
  "◊": <ore:gemXorcite>,           # Xorcite Shard
  "P": <endreborn:item_end_shard>, # Purpur Shards
  "e": <ore:essence>,              # Essence
  "▲": <ore:dustGelidEnderium>,    # Gelid Enderium Dust
});

val dataModels = {
  blaze            : 'minecraft:blaze',
  creeper          : 'minecraft:creeper',
  // dragon           : 'minecraft:ender_dragon',
  enderman         : 'minecraft:enderman',
  ghast            : 'minecraft:ghast',
  guardian         : 'minecraft:elder_guardian',
  shulker          : 'minecraft:shulker',
  skeleton         : 'minecraft:stray',
  slime            : 'minecraft:slime',
  spider           : 'minecraft:spider',
  thermal_elemental: 'thermalfoundation:blizz',
  tinker_slime     : 'tconstruct:blueslime',
  twilight_darkwood: 'twilightforest:kobold',
  twilight_forest  : 'twilightforest:swarm_spider',
  twilight_glacier : 'twilightforest:penguin',
  twilight_swamp   : 'twilightforest:minotaur',
  witch            : 'minecraft:witch',
  // wither           : 'minecraft:wither',
  wither_skeleton  : 'minecraft:wither_skeleton',
  zombie           : 'minecraft:husk',
} as string[string];


for model, mob in dataModels {
  val data_model = itemUtils.getItem('deepmoblearning:data_model_'~model);
  if(isNull(data_model)) {
    print("ERROR: no data model for "~model);
    continue;
  }
  recipes.addShapeless('Data upgrade '~model,
    data_model.withTag({tier: 1}), [
      <enderio:item_broken_spawner>.withTag({entityId: mob}), 
      data_model
    ]
  );
}

# Peaceful Alt
# [Ender Dragon Data Model] from [Ender Dragon Data Model][+7]
mods.thaumcraft.Infusion.registerRecipe(
  "data_model_dragon", # Name
  "INFUSION", # Research
  <deepmoblearning:data_model_dragon>.withTag({tier: 1}), # Output
  10, # Instability
  [<aspect:draco> * 100, <aspect:caeles> * 100, <aspect:victus> * 100],
  <deepmoblearning:data_model_dragon>, # Central Item
  Grid(["pretty",
  "E ▬ E",
  "-   -",
  "E ▬ E"], {
  "E": <ore:dragonEgg>,   # Dragon Egg
  "▬": <ore:ingotGlitch>, # Glitch Infused Ingot
  "-": <ore:dragonsteelIngot>, # Ice Dragonsteel Ingot
}).spiral(1));

# [Ender Dragon Data Model] from [Ender Dragon Data Model][+7]
mods.thaumcraft.Infusion.registerRecipe(
  "data_model_wither", # Name
  "INFUSION", # Research
  <deepmoblearning:data_model_wither>.withTag({tier: 1}), # Output
  10, # Instability
  [<aspect:alienis> * 100, <aspect:caeles> * 100, <aspect:victus> * 100],
  <deepmoblearning:data_model_wither>, # Central Item
  Grid(["pretty",
  "E ▬ E",
  "-   -",
  "E ▬ E"], {
  "E": <draconicevolution:ender_energy_manipulator>,
  "▬": <ore:ingotGlitch>, # Glitch Infused Ingot
  "-": <ore:itemInfinityGoop>,
}).spiral(1));
