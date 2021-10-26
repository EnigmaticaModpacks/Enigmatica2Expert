#modloaded endreborn

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# Remove excess items
for item in [
  <endreborn:tool_pickaxe_endorium>,
  <endreborn:tool_sword_endorium>,
  <endreborn:tool_hoe_endorium>,
  <endreborn:tool_axe_endorium>,
  <endreborn:tool_shovel_endorium>,
  <endreborn:tool_hammer_iron>,
  <endreborn:ender_bow>,
  <endreborn:tool_pickaxe_wolframium>,
  <endreborn:tool_sword_wolframium>,
  <endreborn:tool_hoe_wolframium>,
  <endreborn:tool_axe_wolframium>,
  <endreborn:tool_shovel_wolframium>,
  <endreborn:entropy_wand>,
  <endreborn:block_end_forge>,
  <endreborn:armour_chestplate_obsidian>,
  <endreborn:armour_leggings_obsidian>,
  <endreborn:armour_boots_obsidian>,
  <endreborn:armour_helmet_helmet>,
  <endreborn:ingot_infused>,
  <endreborn:item_shard_obsidian>,
] as IItemStack[] {
  utils.rh(item);
}

# Remove hammer recipes
for recipeName in [
  "unidict:dustobsidian_x3_size.3",
  "endreborn:items/item_shard_obsidian",
  "endreborn:items/prismarine_2",
  "endreborn:items/item_raw_endorium",
  "endreborn:items/purpur_block",
  "endreborn:items/dragon_scales",
  "endreborn:items/item_lormyte_crystal",
  "endreborn:items/brick",
  "endreborn:items/prismarine",
  "endreborn:items/glowstone_dust",
  "endreborn:items/quartz_block",
  "endreborn:items/netherbrick",
  "endreborn:blocks/cobblestone",
  "endreborn:items/catalyst",
] as string[] {
  recipes.removeByRecipeName(recipeName);
}

mods.rustic.EvaporatingBasin.addRecipe(<endreborn:catalyst>, <liquid:crystal> * 1000);

# Add dust because materializer can work only with this one
mods.jei.JEI.addItem(<endreborn:catalyst>);

# Remake [Fluix-Plated Iron Ingot]
mods.appliedenergistics2.Inscriber.removeRecipe(<threng:material:2>);
scripts.wrap.appliedenergistics2.Inscriber.addRecipe(<threng:material:2>, <endreborn:item_ingot_wolframium>, true, <threng:material:1>, <appliedenergistics2:material:45>);
mods.threng.Aggregator.removeRecipe(<threng:material>);
mods.threng.Aggregator.addRecipe(<threng:material>, <endreborn:item_ingot_wolframium>, <threng:material:1>, <ore:dustSkyStone>);

# Lormite rework
recipes.remove(<endreborn:block_lormyte_crystal>);
recipes.remove(<endreborn:block_decorative_lormyte>);
val LS = <endreborn:item_lormyte_crystal>;
recipes.addShapeless(LS * 9, [<endreborn:block_decorative_lormyte>]);
recipes.addShapeless(<endreborn:block_decorative_lormyte>, [LS,LS,LS,LS,LS,LS,LS,LS,LS]);

# Fix automatic recipe
mods.actuallyadditions.Crusher.removeRecipe(<endreborn:death_essence>);

# Skyblock Alternative
# [Essence Ore] from [Molten Obsidian Bucket][+1]
scripts.wrap.tconstruct.Casting.addBasinRecipe(<endreborn:block_essence_ore>, <endreborn:block_decorative_lormyte>, <liquid:obsidian>, 144, true);

# [Simple Machine Chassis] from [Hardened Cell Frame][+3]
craft.remake(<enderio:item_material>, ["pretty",
  "□ ¤ □",
  "D ◘ D",
  "□ ¤ □"], {
  "□": <ore:plateTitaniumAluminide>,         # Titanium Aluminide Plate
  "¤": <ore:gearIronInfinity>,               # Infinity Bimetal Gear
  "D": <endreborn:block_decorative_lormyte>, # Decorative Lormyte Stone
  "◘": <thermalexpansion:frame:129>,         # Hardened Cell Frame
});

# [Angel Feather] from [Blue Peacock Feather][+2]
craft.remake(<endreborn:item_angel_feather>, ["pretty",
  "  D  ",
  "M f M",
  "  D  "], {
  "D": <minecraft:dragon_breath>,         # Dragon's Breath
  "f": <ore:peacockFeathers>,             # Blue Peacock Feather
  "M": <mysticalagriculture:crafting:24>, # Mystical Feather
});

# [Purpur Shards] from [End Essence]
craft.remake(<endreborn:item_end_shard>, ["pretty",
  "T   T",
  "  T  ",
  "T   T"], {
  "T": <mysticalagriculture:end_essence>, # End Essence
});

# [String of Life] from [Mystical String][+2]
craft.remake(<endreborn:item_ender_string>, ["pretty",
  "▬ K K",
  "K M K",
  "K K ▬"], {
  "K": <biomesoplenty:seaweed>,           # Kelp
  "▬": <ore:ingotEndorium>,               # Endorium Ingot
  "M": <mysticalagriculture:crafting:23>, # Mystical String
});

# [Ender Chest] from [Eye of Ender][+2]
craft.remake(<minecraft:ender_chest>, ["pretty",
  "o e o",
  "e E e",
  "o e o"], {
  "e": <ore:essence>,       # Essence
  "E": <ore:pearlEnderEye>, # Eye of Ender
  "o": <ore:obsidian>,      # Obsidian
});

# [Enchantment Table] from [Book][+3]
craft.remake(<minecraft:enchanting_table>, ["pretty",
  "  B  ",
  "◊ e ◊",
  "e o e"], {
  "B": <minecraft:book>,    # Book
  "e": <ore:essence>,       # Essence
  "◊": <ore:gemDiamondRat>, # Diamond
  "o": <ore:obsidian>,      # Obsidian
});

# [Beacon] from [Nether Star][+3]
craft.remake(<minecraft:beacon>, ["pretty",
  "■ e ■",
  "■ S ■",
  "o o o"], {
  "■": <ore:blockGlass>, # Glass
  "S": <ore:netherStar>, # Nether Star
  "e": <ore:essence>,    # Essence
  "o": <ore:obsidian>,   # Obsidian
});

# [Basic Card]*2 from [Calculation Processor][+3]
craft.remake(<appliedenergistics2:material:25> * 2, ["pretty",
  "- ▬  ",
  "♥ C ▬",
  "- ▬  "], {
  "C": <appliedenergistics2:material:23>, # Calculation Processor
  "♥": <ore:dustRedstone>, # Redstone
  "▬": <ore:ingotTungsten>, # Tungsten Ingot
  "-": <ore:ingotGold>, # Gold Ingot
});

# [ME Interface] from [Annihilation Core][+3]
craft.remake(<appliedenergistics2:interface>, ["pretty",
  "▬ ■ ▬",
  "A   F",
  "▬ ■ ▬"], {
  "A": <appliedenergistics2:material:44>, # Annihilation Core
  "F": <appliedenergistics2:material:43>, # Formation Core
  "■": <ore:blockGlass>, # Glass
  "▬": <ore:ingotTungsten>, # Tungsten Ingot
});

# [ME Fluid Interface] from [Annihilation Core][+3]
craft.remake(<appliedenergistics2:fluid_interface>, ["pretty",
  "▬ d ▬",
  "A   F",
  "▬ d ▬"], {
  "A": <appliedenergistics2:material:44>, # Annihilation Core
  "F": <appliedenergistics2:material:43>, # Formation Core
  "d": <ore:dyeBlue>, # Blue Pigment
  "▬": <ore:ingotTungsten>, # Tungsten Ingot
});

# [ME Gas Interface] from [Annihilation Core][+3]
craft.remake(<aeadditions:gas_interface>, ["pretty",
  "▬ d ▬",
  "A   F",
  "▬ d ▬"], {
  "A": <appliedenergistics2:material:44>, # Annihilation Core
  "F": <appliedenergistics2:material:43>, # Formation Core
  "d": <ore:dyeYellow>, # Dandelion Yellow
  "▬": <ore:ingotTungsten>, # Tungsten Ingot
});

# [End-Mage Barclay Sword] from [String of Life][+2]
craft.remake(<endreborn:ender_sword>, ["pretty",
  "  ▬ ▬",
  "▬ S ▬",
  "B ▬  "], {
  "B": <endreborn:sword_shard>,       # Broken Sword Part
  "S": <endreborn:item_ender_string>, # String of Life
  "▬": <ore:ingotEndorium>,           # Endorium Ingot
});

# [Xorcite Cluster]*64 from [Broken Sword Part][+1]
craft.remake(<endreborn:dragon_essence> * 64, ["pretty",
  "1 1 1",
  "1 B 1",
  "1 1 1"], {
  "1": <ore:compressed1xEndStone>, # Compressed End Stone
  "B": <endreborn:sword_shard>,    # Broken Sword Part
});

# [Materializer] from [Broken Sword Part][+3]
craft.remake(<endreborn:entropy_user>, ["pretty",
  "§ ▬ §",
  "▬ B ▬",
  "§ ■ §"], {
  "■": <endreborn:block_decorative_lormyte>, # Lormyte Block
  "B": <endreborn:sword_shard>,              # Broken Sword Part
  "§": <endreborn:catalyst>,                 # Obsidian Catalyst
  "▬": <ore:ingotEndSteel>,                  # End Steel Ingot
});

# [Smooth End Stone]*8 from [End Stone]
craft.remake(<endreborn:block_end_stone_smooth> * 8, ["pretty",
  "e e e",
  "e   e",
  "e e e"], {
  "e": <ore:endstone>, # End Stone
});

# Purpur guards are disables, so make Purpur Shards craftable
mods.rustic.EvaporatingBasin.addRecipe(<endreborn:item_end_shard>, <liquid:liquidchorus> * 1000, 20*20);

# [Endorium Nugget]*6 from [Ender Lilly][+1]
scripts.category.expire_in_block.set(<extrautils2:enderlilly>, {"cyclicmagic:fire_dark" : <endreborn:item_raw_endorium> * 6});