import crafttweaker.item.IItemStack;
#modloaded bloodmagic

// Blood Magic Guide
recipes.addShapeless('Blood Magic Guide',
  <guideapi:bloodmagic-guide>,
  [<minecraft:book>, <bloodmagic:soul_snare>]);

# Rune of Speed
  recipes.remove(<bloodmagic:blood_rune:1>);
  recipes.addShaped("Rune of Speed", <bloodmagic:blood_rune:1>, 
  [[<extrautils2:decorativesolid:3>, <bloodmagic:slate>, <extrautils2:decorativesolid:3>], 
  [<bloodmagic:blood_rune>, <ore:foodCake>, <bloodmagic:blood_rune>], 
  [<extrautils2:decorativesolid:3>, <bloodmagic:slate>, <extrautils2:decorativesolid:3>]]);

# [Rune of Capacity] from [Blank Rune][+3]
craft.remake(<bloodmagic:blood_rune:6>, ["pretty",
  "M F M",
  "F B F",
  "M I M"], {
  "M": <ore:stoneMetamorphic>,  # Metamorphic Forest Stone
  "F": <flopper:flopper>,       # Flopper
  "B": <bloodmagic:blood_rune>, # Blank Rune
  "I": <bloodmagic:slate:2>,    # Imbued Slate
});

# Rune of Sacrifice
  recipes.remove(<bloodmagic:blood_rune:3>);
  recipes.addShaped("Rune of Sacrifice", <bloodmagic:blood_rune:3> * 3, 
  [[<extrautils2:decorativesolid:3>, <bloodmagic:slate:1>, <extrautils2:decorativesolid:3>], 
  [<bloodmagic:slate:1>, <ore:orbTier2>.reuse(), <bloodmagic:slate:1>],
  [<extrautils2:decorativesolid:3>, <astralsorcery:itemcrystalsword:*>.withTag({astralsorcery:{}}), <extrautils2:decorativesolid:3>]]);

# Rune of the orb
  recipes.remove(<bloodmagic:blood_rune:8>);
  recipes.addShaped("Rune of the Orb", <bloodmagic:blood_rune:8>, 
  [[<bloodmagic:slate:1>, <ore:orbTier1>.reuse(), <bloodmagic:slate:1>], 
  [<bloodmagic:slate:2>, <ore:orbTier4>.reuse(), <bloodmagic:slate:2>], 
  [<bloodmagic:slate:3>, <ore:orbTier1>.reuse(), <bloodmagic:slate:3>]]);

# Rune of acceleration
  recipes.remove(<bloodmagic:blood_rune:9>);
  recipes.addShaped("Rune of Acceleration", <bloodmagic:blood_rune:9>, 
  [[<bloodmagic:blood_tank>, <bloodmagic:slate:3>, <bloodmagic:blood_tank>], 
  [<ore:ingotGold>, <actuallyadditions:item_drill_upgrade_speed_ii>, <minecraft:gold_ingot>], 
  [<bloodmagic:blood_tank>, <ore:orbTier4>.reuse(), <bloodmagic:blood_tank>]]);

# Imperfect Ritual Stone
  recipes.remove(<bloodmagic:ritual_controller:1>);
  recipes.addShaped("Imperfect Ritual Stone", <bloodmagic:ritual_controller:1>, 
  [[<ore:obsidian>, <extrautils2:decorativesolid:3>, <ore:obsidian>], 
  [<extrautils2:decorativesolid:3>, <ore:orbTier1>.reuse(), <extrautils2:decorativesolid:3>], 
  [<ore:obsidian>, <extrautils2:decorativesolid:3>, <ore:obsidian>]]);

# Ritual Stone 
  recipes.remove(<bloodmagic:ritual_stone>);
  recipes.addShaped("Ritual Stone", <bloodmagic:ritual_stone> * 4, 
  [[<thaumcraft:salis_mundus>, <bloodmagic:slate:1>, <thaumcraft:salis_mundus>], 
  [<bloodmagic:slate:1>, <ore:orbTier2>.reuse(), <bloodmagic:slate:1>], 
  [<ore:obsidian>, <bloodmagic:slate:1>, <ore:obsidian>]]);

# Hellfire Forge
  recipes.remove(<bloodmagic:soul_forge>);
  recipes.addShaped("Hellfire Forge", <bloodmagic:soul_forge>, 
  [[<ore:nuggetQuartz>, <ore:dustAstralStarmetal>, <ore:nuggetQuartz>], 
  [<thaumcraft:stone_arcane>, <ore:ingotBrass>, <thaumcraft:stone_arcane>], 
  [<thaumcraft:stone_arcane>, <botania:storage>, <thaumcraft:stone_arcane>]]);

# Blood Altar
  recipes.remove(<bloodmagic:altar>);
  recipes.addShaped("Blood Altar", <bloodmagic:altar>,
  [[<ore:livingrock>, <astralsorcery:itemcraftingcomponent:3>, <ore:livingrock>], 
  [<ore:plateBrass>, <minecraft:furnace>, <ore:plateBrass>], 
  [<thaumcraft:stone_arcane>, <bloodmagic:monster_soul>, <thaumcraft:stone_arcane>]]);

# Blood Letter's Pack
  recipes.remove(<bloodmagic:pack_self_sacrifice>);
  recipes.addShaped("Blood Letter's Pack", <bloodmagic:pack_self_sacrifice>, 
  [[<botania:managlass>, <botania:bloodpendant>, <botania:managlass>], 
  [<minecraft:flint>, <minecraft:leather_chestplate>.anyDamage(), <minecraft:flint>], 
  [<botania:managlass>, <bloodmagic:slate>, <botania:managlass>]]);

# Coat of Arms
  recipes.remove(<bloodmagic:pack_sacrifice>);
  recipes.addShaped("Coat of Arms", <bloodmagic:pack_sacrifice>, 
  [[<botania:managlass>, <minecraft:bucket>, <botania:managlass>], 
  [<thermalfoundation:tool.sword_invar>.anyDamage(), <minecraft:leather_chestplate>, <thermalfoundation:tool.sword_invar>.anyDamage()], 
  [<botania:managlass>, <bloodmagic:slate>, <botania:managlass>]]);
  
# Sacrificial Dagger
  recipes.remove(<bloodmagic:sacrificial_dagger>);
  recipes.addShaped("Sacrificial Dagger", <bloodmagic:sacrificial_dagger>, 
  [[<botania:managlass>, <botania:managlass>, <botania:managlass>], 
  [null, <thaumcraft:ingot:2>, <botania:managlass>], 
  [<botania:enderdagger>.anyDamage(), null, <botania:managlass>]]);

# Rudimentary Snare
  recipes.remove(<bloodmagic:soul_snare>);
  recipes.addShaped("Rudimentary Snare", <bloodmagic:soul_snare> * 8, 
  [[<thaumcraft:fabric>, <ore:ingotManasteel>, <thaumcraft:fabric>], 
  [<ore:ingotManasteel>, <ore:redstoneRoot>, <ore:ingotManasteel>], 
  [<thaumcraft:fabric>, <ore:ingotManasteel>, <thaumcraft:fabric>]]);

# Blank Slate
  mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:stone>);
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>, <botania:livingrock>, 0, 1000, 10, 10);

# Orb tier 1
  mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:diamond>);
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), 
  <botania:manaresource:2>, 0, 2000, 12, 12);

# Orb tier 2
  mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:redstone_block>);
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), 
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "victus"}]}), 1, 5000, 25, 25);

# Orb tier 3
  mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:gold_block>);
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), 
  <thaumcraft:metal_thaumium>, 2, 25000, 50, 50);

# Orb tier 5
  mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:nether_star>);
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}), 
  <botania:manaresource:5>, 4, 80000, 200, 200);

# Dagger of Sacrifice
  mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:iron_sword>);
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:dagger_of_sacrifice>, 
  <thaumcraft:thaumium_sword>, 1, 3000, 12, 12);

# Blood Orb Oredicts
  <ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}));
  <ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}));
  <ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}));
  <ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
  <ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
  <ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));
  
  <ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}));
  <ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}));
  <ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
  <ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
  <ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

  <ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}));
  <ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
  <ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
  <ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

  <ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}));
  <ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
  <ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

  <ore:orbTier5>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}));
  <ore:orbTier5>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));

  <ore:orbTier6>.add(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}));
  
# Remake recipe of blood tanks

# [Blood Tank Tier 1] from [Glass][+2]
craft.remake(<bloodmagic:blood_tank>, ["B","■","A"], {
  "B": <bloodmagic:slate>,        # Blank Slate
  "■": <ore:blockGlass>, # Glass
  "A": <thaumcraft:stone_arcane>, # Arcane Stone
});

recipes.addShapeless("Clearing Blood Tank 0", <bloodmagic:blood_tank>, [<bloodmagic:blood_tank>]);
for i in 1 to 16 {
  val tank = itemUtils.getItem("bloodmagic:blood_tank", i);
  val prevTank = itemUtils.getItem("bloodmagic:blood_tank", i - 1);

  val t16cost = 2000000.0d; # Change only this number

  val t16powr = pow(1.5d, 15);
  val t16mult = t16cost / t16powr;
  val t1resde = (15 - i) * (t16cost / 6000);

  val cost = (((pow(1.5d, i as double) * t16mult) as int - t1resde) / 500) * 500;

  recipes.remove(tank);
  mods.bloodmagic.BloodAltar.addRecipe(tank, prevTank, max(0, min(4, i / 2)), cost, 10 + 10 * i, 10 + 10 * i);
  recipes.addShapeless("Clearing Blood Tank " ~ i, tank, [tank]);
}

# Creative Dagger
val crDgr = <bloodmagic:sacrificial_dagger:1>.withTag({HideFlags:1} + <enchantment:enderio:shimmer>.makeEnchantment(1).makeTag());
mods.jei.JEI.addItem(crDgr);

val capRune = <bloodmagic:blood_rune:7>;
val sprIng = <randomthings:ingredient:3>;
val bldTnk = <bloodmagic:blood_tank:7>.withTag({Fluid: {FluidName: "lifeessence", Amount: 2048000}});
val antBck = Bucket("blockfluidantimatter");
mods.extendedcrafting.TableCrafting.addShaped(0, crDgr, [
  [null, null, null, null, null, <ore:nuggetDraconicMetal>, sprIng], 
  [null, null, null, null, <ore:nuggetDraconicMetal>, sprIng, <ore:nuggetDraconicMetal>], 
  [null, capRune, null, <ore:nuggetDraconicMetal>, sprIng, <ore:nuggetDraconicMetal>, null], 
  [null, capRune, <bloodmagic:slate:4>, <bloodmagic:sacrificial_dagger>, <ore:nuggetDraconicMetal>, null, null], 
  [null, capRune, bldTnk, <bloodmagic:slate:4>, null, null, null], 
  [antBck, <animus:sigil_consumption>, capRune, capRune, capRune, null, null], 
  [<ore:gemBenitoite>, antBck, null, null, null, null, null]
]);

# Remove weak saltpater recipe
mods.bloodmagic.AlchemyTable.removeRecipe([<bloodmagic:component:22>, <bloodmagic:component:22>, <thermalfoundation:material:768>]);

# Remove coal dupe recipe
mods.bloodmagic.AlchemyTable.removeRecipe([<minecraft:coal>, <minecraft:coal>, <minecraft:flint>]);

# Remove unused recipes
val alcTableOres = [
  <actuallyadditions:block_misc:3>,
  <appliedenergistics2:charged_quartz_ore>,
  <appliedenergistics2:quartz_ore>,
  <astralsorcery:blockcustomore:1>,
  <astralsorcery:blockcustomsandore>,
  <biomesoplenty:gem_ore:1>,
  <biomesoplenty:gem_ore:2>,
  <biomesoplenty:gem_ore:3>,
  <biomesoplenty:gem_ore:4>,
  <biomesoplenty:gem_ore:5>,
  <biomesoplenty:gem_ore:6>,
  <biomesoplenty:gem_ore>,
  <draconicevolution:draconium_ore>,
  <forestry:resources>,
  <immersiveengineering:ore:5>,
  <libvulpes:ore0:8>,
  <libvulpes:ore0>,
  <mekanism:oreblock>,
  <minecraft:diamond_ore>,
  <minecraft:emerald_ore>,
  <minecraft:gold_ore>,
  <minecraft:iron_ore>,
  <minecraft:lapis_ore>,
  <minecraft:redstone_ore>,
  <nuclearcraft:ore:3>,
  <nuclearcraft:ore:5>,
  <nuclearcraft:ore:6>,
  <nuclearcraft:ore:7>,
  <rftools:dimensional_shard_ore>,
  <tconstruct:ore:1>,
  <tconstruct:ore>,
  <thaumcraft:ore_amber>,
  <thermalfoundation:ore:1>,
  <thermalfoundation:ore:2>,
  <thermalfoundation:ore:3>,
  <thermalfoundation:ore:4>,
  <thermalfoundation:ore:5>,
  <thermalfoundation:ore:6>,
  <thermalfoundation:ore:7>,
  <thermalfoundation:ore:8>,
  <thermalfoundation:ore>,
] as IItemStack[];

for item in alcTableOres {
  mods.bloodmagic.AlchemyTable.removeRecipe([item, <bloodmagic:cutting_fluid>]);
}

# [Blood Wood] from [Spectre Wood]*2
mods.bloodmagic.BloodAltar.addRecipe(<animus:blockbloodwood>, <randomthings:spectrelog>, 0, 2000, 12, 12);

# [Crystal Cluster]*64 from [Benitoite][+3]
# mods.bloodmagic.AlchemyTable.addRecipe(IItemStack output, IItemStack[] inputs, int syphon, int ticks, int minTier);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:decorative_brick:2> * 64, [
<draconicevolution:infused_obsidian>,   # Draconium Infused Obsidian
<thaumicaugmentation:research_notes>,
<thaumcraft:banner_crimson_cult>,     # Crimson Cult Banner
<bloodmagic:item_demon_crystal:*>,    # Demon Will Crystal
<bloodmagic:item_demon_crystal:*>,    # Demon Will Crystal
<bloodmagic:item_demon_crystal:*>,    # Demon Will Crystal
], 100000, 300, 4);

# [Crystal Cluster Brick]*4 from [Crystal Cluster]
craft.shapeless(<bloodmagic:decorative_brick:3> * 4, "****", {
  "*": <bloodmagic:decorative_brick:2>, # Crystal Cluster
});

# [Sigil of the whirlwind]
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:sigil_whirlwind>, <minecraft:shield>, <bloodmagic:slate>);
