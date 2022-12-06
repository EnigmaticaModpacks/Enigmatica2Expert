

furnace.setFuel(<contenttweaker:conglomerate_of_coal>, 60000);
furnace.setFuel(<contenttweaker:blasted_coal>, 120000);
furnace.setFuel(<contenttweaker:empowered_phosphor>, 180000);
furnace.setFuel(<contenttweaker:saturated_phosphor>, 450000);

// Tallow into biomass
scripts.process.compress(<ore:tallow> * 64, <contenttweaker:compressed_tallow>, 'except: compressor');
scripts.process.melt(<ore:tallow>, <liquid:biomass> * 20);
scripts.process.melt(<contenttweaker:compressed_tallow>, <liquid:biomass> * 1280);

// Remove Tungsten from other places
mods.immersiveengineering.ArcFurnace.removeRecipe(<contenttweaker:item_ore_tungsten:3>);
mods.nuclearcraft.ingot_former.removeRecipeWithOutput([<contenttweaker:item_ore_tungsten:3>]);

# Add missed furnace recipe
furnace.addRecipe(<endreborn:item_ingot_wolframium>, <contenttweaker:item_ore_tungsten:2>, 4.0d);

// Remake usage of new dusts
utils.compact(<contenttweaker:dust_tiny_gold>  , <thermalfoundation:material:1>);
utils.compact(<contenttweaker:dust_tiny_silver>, <thermalfoundation:material:66>);

// Molten Cheese
scripts.process.melt(<ore:cheeseWheels> | <ore:blockCheese>, <liquid:cheese> * 1000);
scripts.process.melt(<ore:foodCheese>, <liquid:cheese> * 250);
mods.tconstruct.Casting.addBasinRecipe(<rats:block_of_cheese>, null, <liquid:cheese>, 1000);

// Sunshine from Sun conglomerate
mods.mechanics.addTubeRecipe([<contenttweaker:conglomerate_of_sun>], <liquid:liquid_sunshine> * 1000);

// Life Essence from Sun conglomerate
mods.mechanics.addTubeRecipe([<contenttweaker:conglomerate_of_life>], <liquid:lifeessence> * 1000);

// Silicon Block
craft.shapeless(<contenttweaker:silicon_block>, 'AAAAAAAAA', { A: <ore:ingotSilicon> });
craft.shapeless(<libvulpes:productingot:3> * 9,   'A', { A: <contenttweaker:silicon_block> });

// [Conglomerate Of Life]*2 from [Cheese Wheel][+4]
craft.make(<contenttweaker:conglomerate_of_life> * 2, ['pretty',
  '▲ B ▲',
  'D W D',
  '▲ C ▲'], {
  '▲': <scalinghealth:heartdust>,           // Heart Dust
  'B': <randomthings:rezstone>,             // Blood Stone
  'D': <iceandfire:dragon_meal>,            // Dragon Meal
  'W': <ore:cheeseWheels>,                  // Cheese Wheel
  'C': <cyclicmagic:crystallized_obsidian>, // Crystallized Obsidian
});

// [Conglomerate_Of_Sun*8] from [Totem_of_Undying][+3]
craft.make(<contenttweaker:conglomerate_of_sun> * 8, ['pretty',
  'R o R',
  'C T C',
  'R o R'], {
  R: <ore:myrmexResin>,                // Desert Myrmex Resin Chunk
  C: <cyclicmagic:crystallized_amber>, // Crystallized Amber
  T: <minecraft:totem_of_undying>,     // Totem of Undying
  o: <ore:dropRoyalJelly>,              // Royal Jelly
});

// Saturate Phosphor
scripts.process.fill(<contenttweaker:empowered_phosphor>, <fluid:syngas> * 200, <contenttweaker:saturated_phosphor>, 'only: MechanicalDryingBasin NCInfuser Transposer');

// [Empowered Phosphor] from [Phosphor][+1]
scripts.process.alloy([<contenttweaker:blasted_coal>, <forestry:phosphor>], <contenttweaker:empowered_phosphor>, 'Only: Kiln Induction');

// Conglomerate Of Coal
mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(<contenttweaker:blasted_coal> * 2, <contenttweaker:conglomerate_of_coal>);
craft.make(<contenttweaker:conglomerate_of_coal>, ['pretty',
  'L B L',
  '▲ i ▲',
  'L B L'], {
  '▲': <mechanics:fuel_dust_tiny>,      // Tiny Pile of Heavy Fuel Dust
  'B': <randomthings:ingredient:13>,    // Blackout Powder
  'i': <forestry:bituminous_peat>,      // Bituminous Peat
  'L': <rats:little_black_squash_balls>, // Little Black Squash Balls
});

// Molten Electronics casts
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:7>, <tconstruct:cast>.withTag({ PartType: 'tconstruct:shard' }), <liquid:electronics>, 8);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:6>, <tconstruct:cast_custom:1>, <liquid:electronics>, 16);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:storage>, null, <liquid:electronics>, 144);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:8>, <tconstruct:cast_custom>, <liquid:electronics>, 144);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:10>, <tconstruct:cast_custom:3>, <liquid:electronics>, 144);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:9>, <tconstruct:cast>.withTag({ PartType: 'tconstruct:sign_head' }), <liquid:electronics>, 144 * 3);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:5>, <tconstruct:cast_custom:4>, <liquid:electronics>, 144 * 4);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:11>, <tconstruct:cast>.withTag({ PartType: 'tconstruct:hammer_head' }), <liquid:electronics>, 144 * 8);
mods.tconstruct.Casting.addBasinRecipe(<opencomputers:case1>, null, <liquid:electronics>, 144 * 9);

/*
# Knowledge absorber craft
# [Golden eye] from [Ender Orb Translocator][+3]
craft.make(<contenttweaker:knowledge_absorber>, ["pretty",
  "  *  ",
  "L E L",
  "  R  "], {
  "*": <extrautils2:suncrystal>,  # Sun Crystal
  "L": <ore:shardLormyte>,        # Lormyte Crystal
  "E": <cyclicmagic:ender_pearl_mounted>.anyDamage(), # Ender Orb Translocator
  "R": <ore:itemResin>, # Sticky Resin
});

# Oh my gold, this hack!
# I cant use random() function, because it would return different values
# on client and server, that would result ingredient being
# dissapearing on one side and persist on another.
# This code not perfect any way - it would give different values
# when playing on server. But it would be happen stable amount of times.
static absorber_crafts_count as long[crafttweaker.world.IWorld] = {} as long[crafttweaker.world.IWorld];

val transformedAbsorber = <contenttweaker:knowledge_absorber>.anyDamage().transform(function(item, player) {
  absorber_crafts_count[player.world] =
    !isNull(absorber_crafts_count[player.world]) ? absorber_crafts_count[player.world] as long + 1 : 1;

  val damaged = (item.damage) < item.maxDamage
    ? item.withDamage(item.damage + 1)
    : null;

  if(!item.isEnchanted || item.enchantments.length < 1) return damaged;

  for ench in item.enchantments {
    if(ench.definition != <enchantment:minecraft:unbreaking>) continue;
    return (
      (player.world.time + absorber_crafts_count[player.world] as long) % ((ench.level + 1) as long) != 0
    ) ? item : damaged;
  }
  return damaged;
});

# Create "Void Miner" recipes by animals
for mobName, arr in {
  Cow     : [<ore:endstone>, <netherendingores:ore_end_modded_1:11>],
  Pig     : [<ore:endstone>, <netherendingores:ore_end_vanilla:3>],
  Cat     : [<ore:endstone>, <endreborn:block_wolframium_ore>],
  Enderman: [<ore:endstone>, <endreborn:dragon_essence>],
  Chicken : [<ore:endstone>, <netherendingores:ore_end_vanilla:6>],
  Dog     : [<ore:stone>,    <actuallyadditions:block_misc:3>],
  Sheep   : [<ore:stone>,    <forestry:resources>],
  Creeper : [<ore:endstone>, <netherendingores:ore_end_vanilla:1>],
  Zombie  : [<ore:endstone>, <netherendingores:ore_end_modded_1:12>],
} as IIngredient[][string] {
  val book = scripts.mods.bibliocraft_books.bookWrittenBy_ingr[mobName];
  if(arr.length < 2 || isNull(arr[0]) || isNull(arr[1]) || isNull(book)) continue;
  val input = arr[0];
  val output = arr[1].itemArray[0];
  recipes.addShapeless("knowledge_absorber_"~mobName, output * 7, [
    input, book, input,
    input, transformedAbsorber, input,
    input, input, input,
  ]);
}
*/
