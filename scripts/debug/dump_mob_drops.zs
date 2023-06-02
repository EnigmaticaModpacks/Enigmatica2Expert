#modloaded zenutils

#reloadable

#priority 3999

import crafttweaker.block.IBlockState;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IWorld;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.command.ZenCommand;
import mods.zenutils.I18n;
import mods.zenutils.StringList;
import crafttweaker.player.IPlayer;
import crafttweaker.damage.IDamageSource;


// ###############################################################################
// ###############################################################################

static TOTAL_SPAWNING as int = 100 as int;

static blacklistedIDs as string[] = [
  'astralsorcery:entityspectraltool',
  'betteranimalsplus:hirschgeist',
  'betteranimalsplus:jellyfish',
  'betteranimalsplus:kermodebear',
  'betteranimalsplus:squirrel',
  'bloodmagic:corrupted_chicken',
  'bloodmagic:corrupted_sheep',
  'bloodmagic:corrupted_spider',
  'bloodmagic:corrupted_zombie',
  'bloodmagic:mimic',
  'bloodmagic:sentient_specter',
  'botania:doppleganger',
  'computercraft:turtle_player',
  'cyclicmagic:robot',
  'draconicevolution:chaosguardian',
  'draconicevolution:enderenergymanipulator',
  'draconicevolution:guardiancrystal',
  'emberroot:rootsonespriteprojectile',
  'farmingforblockheads:merchant',
  'iceandfire:dragonegg',
  'iceandfire:dragonskull',
  'iceandfire:if_mob_skull',
  'iceandfire:stonestatue',
  'mekanism:robit',
  'minecraft:armor_stand',
  'minecraft:ender_dragon',
  'minecraft:giant',
  'openblocks:luggage',
  'plethora:fakeplayer',
  'quark:leash_knot',
  'testdummy:dummy',
  'thaumadditions:chester',
  'thaumcraft:eldritchgolem',
  'thaumcraft:eldritchwarden',
  'thaumcraft:spellbat',
  'thaumicaugmentation:eldritch_golem',
  'thaumicaugmentation:eldritch_warden',
  'thaumicaugmentation:shield_focus',
  'twilightforest:harbinger_cube',
  'twilightforest:hydra_head',
  'twilightforest:hydra',
  'twilightforest:lich',
  'twilightforest:roving_cube',
  'twilightforest:snow_guardian',
  'twilightforest:snow_queen',
  'emberroot:rootsonespriteboss',
] as string[];

events.onEntityLivingAttacked(function(e as crafttweaker.event.EntityLivingAttackedEvent){
  if(isNull(e.entity) || e.entity.world.remote) return;
  if(!e.damageSource.trueSource instanceof IPlayer) return;
  if(!e.damageSource.creativePlayer) return;

  val player as IPlayer = e.damageSource.trueSource;

  if(
    isNull(e.entity.definition) ||
    isNull(e.entity.definition.id) ||
    e.entity.definition.id != 'minecraft:giant'
  ) return;

  dumpMobDrops(player, e.damageSource);
});


function dumpMobDrops(player as IPlayer, damageSource as IDamageSource) as void {
  val world = player.world;
  val x = player.x;
  val z = player.z;
  val size = 10;
  val repeat = 2;
  val period = 10 * repeat;
  val sleep = period / (5 * repeat);
  val y = createBox(world, x, z, size);

  print('################## Mob Drops #####################');

  var total = 0;
  for entityDef in game.entities {
    val entity = entityDef.createEntity(world);
    if(!entity instanceof crafttweaker.entity.IEntityLivingBase) continue;
    if(blacklistedIDs has entity.definition.id) continue;

    total += 1;

    val accumulator = {} as int[string];
    val cat = world.catenation();

    cat.sleep(total * period).run(function(world, context) {
      player.sendMessage('§7'~total~" §e"~entity.displayName);
      print(total~' ID: '~entityDef.id~' DISPLAY: '~entity.displayName);
    });

    for i in 0 .. repeat {
      cat.run(function(world, context) {    spawnMobs(entity, x, y, z, size);              }).sleep(sleep)
         .run(function(world, context) {    grindMobs(player, damageSource, x, y, z, size);}).sleep(sleep)
         .run(function(world, context) { collectDrops(world, accumulator, x, y, z, size);  }).sleep(sleep);
    }

    // Output
    cat.run(function(world, context) {
      for k,v in accumulator {
        print(k ~ ' * ' ~ (v as double / repeat as double + 0.5d) as int);
      }
    }).start();
  }

  world.catenation().sleep((total + 1) * period).run(function(world, context) {
    print('##################################################');
  }).start();
}

// Create hollow bedrock box
function createBox(world as IWorld, x as int, z as int, size as int) as int {
  var centerY = 250 - size;
  var w = size;

  // Bedrock core
  fill(world, <blockstate:minecraft:bedrock>, x - w, centerY - w, z - w, x + w, centerY + w, z + w);

  // Air
  w -= 1;
  fill(world, <blockstate:minecraft:air>, x - w, centerY - w, z - w, x + w, centerY + w, z + w);
  return centerY;
}

// Fill region with blocks
function fill(world as IWorld, blockState as IBlockState, x1 as int, y1 as int, z1 as int, x2 as int, y2 as int, z2 as int) as void {
  for x in x1 .. x2 {
    for y in y1 .. y2 {
      for z in z1 .. z2 {
        world.setBlockState(blockState, crafttweaker.util.Position3f.create(x, y, z).asBlockPos());
      }
    }
  }
}

function spawnMobs(origEntity as IEntity, x as int, y as int, z as int, size as int) as void {

  // Clear all entities
  server.commandManager.executeCommandSilent(server, "/cofh killall *");

  // How many mobs on one side
  val cube = (pow(TOTAL_SPAWNING as double, 0.33333333d) + 1.0d) as int;

  // Side size of empty space
  val bound = 3;
  val sideStep = (size*2 - bound*2) as double / cube;

  var i = 0;
  for yy in 0 .. cube + 1 {
    for xx in 0 .. cube {
      for zz in 0 .. cube {
        val pos = 
            ' ' ~ (x as double - size + bound + sideStep * xx) as float
          ~ ' ' ~ (y as double - size + bound + sideStep * yy) as float
          ~ ' ' ~ (z as double - size + bound + sideStep * zz) as float;
        server.commandManager.executeCommandSilent(origEntity, "/summon " ~ origEntity.definition.id ~ pos);

        i += 1;
        if(i >= TOTAL_SPAWNING) return;
      }
    }
  }
}

function grindMobs(player as IPlayer, damageSource as IDamageSource, x as int, y as int, z as int, size as int) as void {
  for entity in player.world.getEntities() {
    if(!(entity instanceof crafttweaker.entity.IEntityLivingBase)) continue;
    if(!isInside(entity,x,y,z, size)) continue;
    val living as crafttweaker.entity.IEntityLivingBase = entity;

    if(living.health <= 0.0f || !entity.alive || entity instanceof IPlayer) continue;

    val attackResult = entity.attackEntityFrom(damageSource, 10000.0f);
    // val attackResult = entity.attackEntityFrom(IDamageSource.createPlayerDamage(player), 10000.0f);
    if(!attackResult) print("Cant damage "~entity.displayName~' '~living.health);
  }
}

function collectDrops(world as IWorld, accumulator as int[string], x as float, y as float, z as float, size as float) {
  for item in world.getEntityItems() {
    if(!isInside(item,x,y,z,size)) continue;

    val key = (item.item.isDamageable ? item.item.withDamage(0) : item.item)
      .anyAmount().commandString;


    if(isNull(accumulator[key])) accumulator[key] = 0;
    accumulator[key] = accumulator[key] + item.item.amount;
    item.world.removeEntity(item);
  }
}

function isInside(entity as IEntity, x as float, y as float, z as float, size as float) as bool {
  return
    entity.x > x - size && entity.x < x + size &&
    entity.y > y - size && entity.y < y + size &&
    entity.z > z - size && entity.z < z + size;
}
