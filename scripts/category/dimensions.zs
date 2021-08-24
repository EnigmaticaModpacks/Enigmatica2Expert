
import crafttweaker.player.IPlayer;


# Restriction
mods.DimensionStages.addDimensionStage("healthy", -1);

# Check health and add game stage allowing to enter nether
function checkAndGrant(player as IPlayer) as void {
  if(
    !player.hasGameStage("skyblock") &&
    !player.hasGameStage("healthy") &&
    (player.maxHealth >= 40.0f || player.health >= 40.0f)
  ) {
    player.addGameStage("healthy");
    player.sendMessage(game.localize("tooltips.dim_stages.healthy_grant"));
  }
}

events.onPlayerTick(function(e as crafttweaker.event.PlayerTickEvent){
  if(e.player.world.isRemote()) return;
  if (e.player.world.getWorldTime() % 10 != 0) return;

  checkAndGrant(e.player);
});

events.onEntityTravelToDimension(function(e as crafttweaker.event.EntityTravelToDimensionEvent){
  if(e.entity.world.isRemote()) return;
  if(!e.entity instanceof IPlayer) return;
  val player as IPlayer = e.entity;
  checkAndGrant(player);

  if(player.hasGameStage("skyblock")) {
    # Show message that player playing skyblock and cant visit any dims
    if(e.dimension == -1 || restrictedDims has e.dimension) {
      player.sendMessage(game.localize("tooltips.dim_stages.restricted"));
    }
  }
  else if(
    e.dimension == -1 &&
    !player.hasGameStage("healthy")
  ) {
    # Show message that player not healthy anough
    player.sendMessage(game.localize("tooltips.dim_stages.healthy"));
  }
});


static restrictedDims as int[] = [
/*Inject_js(
getCSV('config/tellme/dimensions-csv.csv')
.filter(l=>![0,-1,144,-343800852,2,-2].includes(parseInt(l.ID)))
.map(l=>`  ${l.ID},`)
)*/
  1,
  14676,
  -11325,
  -8,
  7,
  100,
  101,
  102,
  103,
  105,
  106,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  118,
  119,
  120,
  121,
  122,
  123,
/**/
] as int[];

for dim in restrictedDims {
  mods.DimensionStages.addDimensionStage("normal_world", dim);
}