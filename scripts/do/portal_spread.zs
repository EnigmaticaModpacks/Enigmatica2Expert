/*

Make portals spread their dimension blocks around

*/

#reloadable

#norun

import crafttweaker.block.IBlockState;
import crafttweaker.data.IData;
import crafttweaker.util.Math.cos;
import crafttweaker.util.Math.sin;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;

////////////////////////////////////////////////////
// Configuration
////////////////////////////////////////////////////
static spreadDelay as double = 0.5;
static curvature as float = 0.2 as float;
static airDecay as double = 0.1 as double;
static maxBlockCheck as int = 200 as int;
static portalStability as double = 0.1 as double;
static portalChaotic as double = 0.2 as double;
////////////////////////////////////////////////////
val PI = 3.1415926535897931;
val PI2 = PI / 2;

events.onPortalSpawn(function(e as crafttweaker.event.PortalSpawnEvent) {
  if(!e.valid || e.world.remote) return;

  // val blockPos = e.position.getOffset(crafttweaker.world.IFacing.up(), 1);
  // val blockState = e.world.getBlockState(blockPos);
  // server.commandManager.executeCommand(server, '/say §8Spawned §6' ~ blockState.block.definition.id);

  e.world.setCustomWorldData(e.world.getCustomWorldData().deepUpdate({portalSpread: {
    '-1': {e.position.x~':'~e.position.y~':'~e.position.z: [
      (e.world.random.nextDouble() * PI * 2) as double,
      (e.world.random.nextDouble() * PI * 2) as double,
    ]}
  }}, mods.zenutils.DataUpdateOperation.MERGE));
});

events.onWorldTick(function(e as crafttweaker.event.WorldTickEvent){
  if(e.world.remote || e.phase != "END") return;
  if(e.world.dimension != 0) return;
  val spreadDelayInt = spreadDelay as int;
  if(spreadDelayInt > 1 && e.world.time % spreadDelayInt != 0) return;

  val data = e.world.getCustomWorldData();
  if(isNull(data)) return;
  var portalSpread = data.portalSpread;
  if(isNull(portalSpread) || isNull(portalSpread.asMap())) return;
  // server.commandManager.executeCommand(server, '/say §8data §6' ~portalSpread.asString());

  for dimIdStr, dimData in portalSpread.asMap() {
    if(isNull(dimData) || isNull(dimData.asMap())) continue;
    var newDimData = dimData;
    var haveData = false;
    for posStr, portalData in dimData.asMap() {
      val p = posStr.split(':');
      val portalPos = Position3f.create(p[0], p[1], p[2]);
      val portalPitch = (isNull(portalData) || portalData.length < 1) ? 0.0 : portalData[0] as double;
      val portalYaw   = (isNull(portalData) || portalData.length < 2) ? 0.0 : portalData[1] as double;

      val player = e.world.getClosestPlayer(portalPos.x, portalPos.y, portalPos.z, 60, false);
      var showParticles = false;
      if(!isNull(player)) {
        val item = player.getItemInSlot(crafttweaker.entity.IEntityEquipmentSlot.mainHand());
        if(!isNull(item) && item.definition.id == 'minecraft:flint_and_steel') showParticles = true;
      }

      val repeats = (1.0 / spreadDelay) as int;
      var power = 0.0;
      for i in 0 .. repeats {
        val newPower = spread(e.world, portalPos, portalPitch, portalYaw, showParticles);
        if(newPower < 0) {
          power = newPower;
          break;
        }
        else {
          power += newPower;
        }
      }

      // Portal is broken
      if(power < 0) {
        newDimData -= posStr;
        continue;
      }

      power /= repeats;

      val success = 1.0 - pow(power, portalStability);
      // server.commandManager.executeCommand(server, '/say §8power §6' ~power);
      // server.commandManager.executeCommand(server, '/say §8success §6' ~success);

      val newPortalPitch = portalPitch + portalChaotic * success * (e.world.random.nextDouble() * PI * 2 - PI);
      val newPortalYaw   = portalYaw   + portalChaotic * success * (e.world.random.nextDouble() * PI * 2 - PI);
      newDimData = newDimData - posStr + {[posStr]: [newPortalPitch, newPortalYaw]} as IData;
      // server.commandManager.executeCommand(server, '/say §8new_pitch_yaw §6' ~newPortalPitch as float~' '~newPortalYaw as float);
      haveData = true;
    }

    portalSpread -= dimIdStr;
    if(haveData) portalSpread += {[dimIdStr]: newDimData} as IData;
  }

  e.world.updateCustomWorldData({portalSpread: portalSpread});
});

function spread(world as IWorld, pos as Position3f, portalPitch as double, portalYaw as double, showParticles as bool) as double {
  var blockPos = pos as IBlockPos;
  val blockState = world.getBlockState(blockPos);
  if (isNull(blockState) || blockState.block.definition.id != "minecraft:portal") {
    return -1.0;
  }

  // <blockstate:minecraft:portal:axis=z>
  // <blockstate:minecraft:portal:axis=x>

  // server.commandManager.executeCommand(server, '/say §8spread §6' ~pos.x~':'~pos.y~':'~pos.z);

  // Current flow direction
  var f = rotate(Position3f.create(0, 0, 1), portalPitch, portalYaw);

  // Current step position
  var p = pos;

  var blocksChecked = 0;
  var power = 0;
  while true {
    // var onBranch = false;

    if (blocksChecked != 0) {
      // TODO: check recipes here
      val blockTo = <blockstate:minecraft:netherrack>;

      val state = world.getBlockState(p);
      val numId = state.block.definition.numericalId;
      if(showParticles) particles(p.x, p.y, p.z);

      val blacklist = {
          blockTo.block.definition.numericalId: true,
          <blockstate:minecraft:air>.block.definition.numericalId: true,
          <blockstate:minecraft:obsidian>.block.definition.numericalId: true,
          <blockstate:minecraft:portal>.block.definition.numericalId: true,
      } as bool[int];

      if (numId == 0) {
        // Got air and decayed
        if(world.random.nextDouble() <= airDecay) {
          power = 0;
          break;
        }
        power -= 1;
        // server.commandManager.executeCommand(server, '/say §8decay');
      } else if (blocksChecked != 0 && state != blockTo) {
        if (isNull(blacklist[numId])) {
          // Replace block
          // server.commandManager.executeCommand(server, '/say §8after §6'~blocksChecked~' '~(p.x as int~':'~p.y as int~':'~p.z as int));
          setBlock(world, p, blockTo, showParticles);
          power += 100;
          break;
        }
        // onBranch = true;
      }
    }

    blocksChecked += 1;
    power += 1;
    if (blocksChecked >= maxBlockCheck) break;

    // val c = onBranch ? curvature / 2 : curvature;
    val c = curvature;
    f = randomRotate(world, f, c);

    var p1 = add(p, f);
    // Make additional step if its first step
    if (p1.x as int == p.x as int && p1.y as int == p.y as int && p1.z as int == p.z as int) p1 = add(p1, f);
    // if (blocksChecked == 1) p = add(p, f);
    p = p1;
  }

  return power as double / maxBlockCheck;
}

function randomRotate(world as IWorld, v as Position3f, amplitude as double) as Position3f {
  val amplitude2 = amplitude / 2;
  val pitch = world.random.nextDouble() * amplitude - amplitude2;
  val yaw = world.random.nextDouble() * amplitude - amplitude2;

  return rotate(v, pitch, yaw);
}

function rotate(v as Position3f, pitch as double, yaw as double) as Position3f {
  // Calculate sine and cosine of pitch and yaw angles
  val sinPitch = sin(pitch);
  val cosPitch = cos(pitch);
  val sinYaw = sin(yaw);
  val cosYaw = cos(yaw);

  // Calculate rotation matrix
  val m = [
    [cosYaw, 0.0, -sinYaw],
    [sinYaw * sinPitch, cosPitch, cosYaw * sinPitch],
    [sinYaw * cosPitch, -sinPitch, cosYaw * cosPitch]
  ] as double[][];

  // Multiply vector by rotation matrix
  return Position3f.create(
    v.x * m[0][0] + v.y * m[0][1] + v.z * m[0][2],
    v.x * m[1][0] + v.y * m[1][1] + v.z * m[1][2],
    v.x * m[2][0] + v.y * m[2][1] + v.z * m[2][2]
  );
}

function particles(x as float,y as float,z as float) as void {
  server.commandManager.executeCommandSilent(server, "/particle witchMagic "~x~" "~y~" "~z~" 0 0 0 0 1");
}

function add(a as Position3f, b as Position3f) as Position3f {
  return Position3f.create(a.x + b.x, a.y + b.y, a.z + b.z);
}

function setBlock(world as IWorld, bpos as IBlockPos, state as IBlockState, fancy as bool) as void {
  if(fancy) world.destroyBlock(bpos, false);
  world.setBlockState(state, bpos);
}
