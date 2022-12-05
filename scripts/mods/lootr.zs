#modloaded lootr

import mods.dropt.Dropt;
import crafttweaker.item.IItemStack;


// events.onBlockHarvestDrops(function(e as crafttweaker.event.onBlockHarvestDrops){
//   if(e.world.remote) return;
//   if(e.block.definition.id != 'lootr:lootr_chest') return;

//   if(e.silkTouch) e.drops = [<lootr:lootr_chest> % 100];
//   else e.drops = [<minecraft:chest> % 100];
// });

// Dropt.list('Lootr_dupe_fix').add(Dropt.rule()
//   .matchBlocks(['lootr:lootr_chest'])
//   .addDrop(Dropt.drop().selector(Dropt.weight(1), "REQUIRED").items([<lootr:lootr_chest>]))
//   .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED").items([<minecraft:chest>]))
// );