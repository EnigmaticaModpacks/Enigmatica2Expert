import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import crafttweaker.data.IData;


/* 
Taken from: EnthusiastiCraft
https://github.com/katubug/EnthusiastiCraft/blob/f5bb11cf55a0055d8e4187f63cef0bd6a3f89756/overrides/scripts/animal_drops.zs#L1
*/

//Remove Venison Drops from BetterAnimalsPlus
val bapDeer = LootTables.getTable("betteranimalsplus:deer");
val bapDeerMain = bapDeer.getPool("deer-venison");
bapDeerMain.removeEntry("betteranimalsplus:venisonraw");

//Add Pam's Venison to BetterAnimalsPlus
bapDeerMain.addItemEntry(<harvestcraft:venisonrawitem>, 5);

//Remove Venison Drops from Twilight Forest
val tfDeer = LootTables.getTable("twilightforest:entities/deer");
val tfDeerMain = tfDeer.getPool("meat");
tfDeerMain.removeEntry("twilightforest:raw_venison");

//Add Pam's Venison to Twilight Forest
tfDeerMain.addItemEntry(<harvestcraft:venisonrawitem>, 5);