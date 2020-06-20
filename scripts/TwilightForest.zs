
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

val rockRecycleTable as IItemStack[][IIngredient] = {
<twilightforest:castle_brick:3>      |
<twilightforest:castle_pillar>       |
<twilightforest:castle_pillar:1>     : [<harvestcraft:saltitem>, <appliedenergistics2:material:3>, <astralsorcery:itemusabledust:1>],
<twilightforest:deadrock>            |
<twilightforest:deadrock:1>          |
<twilightforest:deadrock:2>          : [<ic2:dust:1>, <nuclearcraft:dust:8>, <jaopca:item_dustdimensionalshard>],
<twilightforest:castle_brick>        |
<twilightforest:castle_brick:1>      |
<twilightforest:castle_brick:2>      |
<twilightforest:castle_brick:4>      |
<twilightforest:castle_brick:5>      |
<twilightforest:castle_pillar:3>     |
<twilightforest:castle_pillar:2>     : [<harvestcraft:saltitem>, <appliedenergistics2:material:3>, <thermalfoundation:material:69>],
<twilightforest:maze_stone>          |
<twilightforest:maze_stone:1>        |
<twilightforest:maze_stone:2>        |
<twilightforest:maze_stone:3>        |
<twilightforest:maze_stone:4>        |
<twilightforest:maze_stone:5>        |
<twilightforest:maze_stone:6>        |
<twilightforest:maze_stone:7>        : [<mekanism:dust:2>, <nuclearcraft:dust_oxide:1>, <mekanism:otherdust:5>],
<twilightforest:underbrick>          |
<twilightforest:underbrick:1>        |
<twilightforest:underbrick:2>        |
<twilightforest:underbrick:3>        : [<ic2:dust:1>, <thermalfoundation:material:772>, <enderio:item_material:74>],
<twilightforest:castle_rune_brick>   : [<randomthings:runedust:6>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:3> : [<randomthings:runedust:10>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:1> : [<randomthings:runedust:11>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:2> : [<randomthings:runedust:4>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:aurora_block>        : [<nuclearcraft:compound:7>, <botania:manaresource:23>, <bigreactors:dustcyanite>],
<twilightforest:aurora_pillar>       : [<nuclearcraft:compound:7>, <ic2:dust:5>, <bigreactors:dustcyanite>],
};

for input, output in rockRecycleTable{
  scripts.process.crushRock(input, output, "No exceptions");
}

// onEntityLivingUseItem	crafttweaker.event.EntityLivingUseItemEvent.All
// onEntityLivingUseItemFinish	crafttweaker.event.EntityLivingUseItemEvent.Finish
// onEntityLivingUseItemStart	crafttweaker.event.EntityLivingUseItemEvent.Start
// onEntityLivingUseItemStop	crafttweaker.event.EntityLivingUseItemEvent.Stop
// onEntityLivingUseItemTick	crafttweaker.event.EntityLivingUseItemEvent.Tick
// <enderio:item_dark_steel_pickaxe>.withTag({"enderio.darksteel.upgrade.travel": {level: 0}, "enderio.darksteel.upgrade.direct": {level: 0}, "enderio.darksteel.upgrade.energyUpgrade": {level: 3, energy: 991988}, "enderio.darksteel.upgrade.spoon": {level: 0}, "enderio.darksteel.upgrade.tnt": {level: 0}})

# Forbid using teleportation (cheat way for mazes)
// events.onEntityLivingUseItem(function(e as crafttweaker.event.EntityLivingUseItemEvent.All) {
//   if(e.isPlayer && !e.canceled && !isNull(e.item) &&
//     e.entityLivingBase.world.getDimension() == 7
//   ){
//     print("--> first conditions");
//     val itemId = e.item.definition.id;

//     if(e.entityLivingBase.isSneaking && ((
//         # EnderIO teleportation staff
//         itemId == "enderio:item_travel_staff"
//       ) || (
//         # Items with travel upgrade
//         itemId.matches("^enderio:.*") && 
//         !isNull(e.item.tag) &&
//         !isNull(e.item.tag["enderio.darksteel.upgrade.travel"])
//     ))){
//       print("--> last conditions");
//       e.canceled = true;
//       e.player.sendChat("Blinking is forbidden is Twilight Forest");
//     }
//   }
// });

# Gold minotaur axe
scripts.process.recycleMetal(<twilightforest:minotaur_axe_gold>, <minecraft:gold_ingot> * 6,   <liquid:gold> * (144*6), null);

# Diamond minotaur axe
scripts.process.crush(<twilightforest:minotaur_axe>, <minecraft:diamond> * 11,
  "No Exceptions", [<ic2:dust:5> * 5] as IItemStack[], [0.25f] as float[]);