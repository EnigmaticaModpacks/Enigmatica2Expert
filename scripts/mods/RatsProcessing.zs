import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;



static listRatPoop as IItemStack[] = [
/*Inject_js(
[...loadText('crafttweaker_raw.log')
.match(/^~ Furnace Recipes:(.*)($|\n\n)/ms)[1]
.matchAll(/^(<rats:rat_nugget_ore.*?)~~.*$/gm)
].map(o=>o[1]).sort(naturalSort).join(',\n')
)*/
<rats:rat_nugget_ore:1>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:2>.withTag({OreItem: {id: "forestry:resources", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "forestry:apatite", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:3>.withTag({OreItem: {id: "astralsorcery:blockcustomsandore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 3 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:4>.withTag({OreItem: {id: "tconstruct:ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:5>.withTag({OreItem: {id: "twilightforest:armor_shard_cluster", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "twilightforest:knightmetal_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:6>.withTag({OreItem: {id: "actuallyadditions:block_misc", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "actuallyadditions:item_misc", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:7>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:8>.withTag({OreItem: {id: "thaumcraft:ore_cinnabar", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "thaumcraft:quicksilver", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:9>.withTag({OreItem: {id: "minecraft:coal_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:coal", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:10>.withTag({OreItem: {id: "tconstruct:ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:11>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 128 as short}}),
<rats:rat_nugget_ore:12>.withTag({OreItem: {id: "minecraft:diamond_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:diamond", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:13>.withTag({OreItem: {id: "libvulpes:ore0", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "libvulpes:productdust", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:14>.withTag({OreItem: {id: "draconicevolution:draconium_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "draconicevolution:draconium_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:15>.withTag({OreItem: {id: "minecraft:emerald_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:emerald", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:16>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:17>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 8 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2 as byte, Damage: 9 as short}}),
<rats:rat_nugget_ore:18>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 9 as short}, IngotItem: {id: "appliedenergistics2:quartz_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:19>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 10 as short}, IngotItem: {id: "appliedenergistics2:charged_quartz_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:20>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:coal_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:21>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:22>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "minecraft:diamond_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:23>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 14 as short}, IngotItem: {id: "libvulpes:ore0", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:24>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "minecraft:emerald_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:25>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "minecraft:gold_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:26>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:27>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 9 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2 as byte, Damage: 10 as short}}),
<rats:rat_nugget_ore:28>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:29>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "minecraft:iron_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:30>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "minecraft:lapis_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:31>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 3 as short}}),
<rats:rat_nugget_ore:32>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 8 as short}}),
<rats:rat_nugget_ore:33>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:34>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 11 as short}, IngotItem: {id: "mekanism:oreblock", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:35>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "biomesoplenty:gem_ore", Count: 2 as byte, Damage: 2 as short}}),
<rats:rat_nugget_ore:36>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:37>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "minecraft:redstone_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:38>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "biomesoplenty:gem_ore", Count: 2 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:39>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "biomesoplenty:gem_ore", Count: 2 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:40>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 2 as short}}),
<rats:rat_nugget_ore:41>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:42>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 12 as short}, IngotItem: {id: "immersiveengineering:ore", Count: 2 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:43>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 13 as short}, IngotItem: {id: "bigreactors:oreyellorite", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:44>.withTag({OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2 as byte, Damage: 8 as short}}),
<rats:rat_nugget_ore:45>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:46>.withTag({OreItem: {id: "minecraft:gold_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:gold_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:47>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 135 as short}}),
<rats:rat_nugget_ore:48>.withTag({OreItem: {id: "minecraft:iron_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:iron_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:49>.withTag({OreItem: {id: "minecraft:lapis_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:dye", Count: 1 as byte, Damage: 4 as short}}),
<rats:rat_nugget_ore:50>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 131 as short}}),
<rats:rat_nugget_ore:51>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:52>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:53>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:54>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 136 as short}}),
<rats:rat_nugget_ore:55>.withTag({OreItem: {id: "netherendingores:ore_nether_modded_1", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "immersiveengineering:ore", Count: 2 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:77>.withTag({OreItem: {id: "minecraft:quartz_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:quartz", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:86>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 133 as short}}),
<rats:rat_nugget_ore:87>.withTag({OreItem: {id: "mekanism:oreblock", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "mekanism:ingot", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:88>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 2 as short}}),
<rats:rat_nugget_ore:89>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 134 as short}}),
<rats:rat_nugget_ore:90>.withTag({OreItem: {id: "twilightforest:ironwood_raw", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "twilightforest:ironwood_ingot", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:91>.withTag({OreItem: {id: "minecraft:redstone_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:redstone", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:92>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:93>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:94>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 130 as short}}),
<rats:rat_nugget_ore:95>.withTag({OreItem: {id: "astralsorcery:blockcustomore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:96>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 4 as short}}),
<rats:rat_nugget_ore:97>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 3 as short}}),
<rats:rat_nugget_ore:98>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 129 as short}}),
<rats:rat_nugget_ore:99>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 3 as short}}),
<rats:rat_nugget_ore:100>.withTag({OreItem: {id: "endreborn:block_wolframium_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "endreborn:item_ingot_wolframium", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:101>.withTag({OreItem: {id: "immersiveengineering:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "immersiveengineering:metal", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:102>.withTag({OreItem: {id: "bigreactors:oreyellorite", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "bigreactors:ingotyellorium", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 132 as short}})
/**/
] as IItemStack[];


static jaopcaAllOre as OreEntry[]= mods.jaopca.JAOPCA.getAllOres() as OreEntry[];
static matTypes as string[] = ["ingot", "gem", "dust"] as string[];


function jaopcaGetEntry(item as IItemStack) as OreEntry{
	for testJ in jaopcaAllOre {
    for iType in matTypes {
      var oredictEntryItems = testJ.getOreDictEntry(iType).items;
      
      if (oredictEntryItems.length > 0 && !isNull(oredictEntryItems[0])) {
        var getByType = oredictEntryItems[0];

        if ((getByType has item)||(item has getByType)) {
          return testJ;
        }
        
      }
    }
  }
	return null;
}

for poop in listRatPoop{
  if (!isNull(poop.tag.OreItem) && !isNull(poop.tag.IngotItem)){      
    # Get what resource we got after processing
    var pooResult = itemUtils.getItem(
      poop.tag.IngotItem.id.asString(),
      poop.tag.IngotItem.Damage.asString() as int);

    if(!isNull(pooResult)) {
      # Dust output
      var poopEntry = jaopcaGetEntry(pooResult);
      
      if(!isNull(poopEntry)) { # Check if listed item exist (can happen if mod was removed)
        scripts.process.beneficiate(poop, poopEntry.oreName, 1.5d, {
          exceptions: "manufactory melter", // This machines somehow wont work
          meltingExceptions: ['Amber','Redstone','Coal']
        });
      }
    }
	}
}