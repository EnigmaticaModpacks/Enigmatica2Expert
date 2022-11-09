#loader crafttweaker reloadableevents

import crafttweaker.player.IPlayer;

static health_require as float = 30.0f;

# Check health and add game stage allowing to enter nether
function checkAndGrant(player as IPlayer) as void {
  if(
    !player.hasGameStage("skyblock") &&
    !player.hasGameStage("healthy") &&
    (player.maxHealth >= health_require || player.health >= health_require)
  ) {
    player.addGameStage("healthy");

    val message = crafttweaker.text.ITextComponent.fromTranslation(
      "tooltips.dim_stages.healthy_grant",
      health_require as int,
      (health_require / 2.0f + 0.5f) as int
    );
    player.sendRichTextMessage(message);
  }
}

events.onPlayerTick(function(e as crafttweaker.event.PlayerTickEvent){
  if(e.player.world.isRemote()) return;
  if (e.player.world.getWorldTime() % 10 != 0) return;

  checkAndGrant(e.player);
});


function isForbidTravel(player as IPlayer, dimension as int) as bool {
  checkAndGrant(player);
  if(player.creative) return false;

  val isNether = dimension == -1;
  if(player.hasGameStage("skyblock")) {
    # Show message that player playing skyblock and cant visit any dims
    if(isNether || !(allowedDims has dimension)) {
      player.world.catenation().sleep(1).then(function(world, ctx) {
        player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation("tooltips.dim_stages.restricted"));
      }).start();
      return true;
    }
  }
  else {
    if(isNether && !player.hasGameStage("healthy")) {
      # Show message that player not healthy anough
      player.world.catenation().sleep(1).then(function(world, ctx) {
        player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(
          "tooltips.dim_stages.healthy",
          health_require as int,
          (health_require / 2.0f + 0.5f) as int
        ));
      }).start();
      return true;
    }
  }

  return false;
}

events.onEntityTravelToDimension(function(e as crafttweaker.event.EntityTravelToDimensionEvent){
  if(e.entity.world.isRemote()) return;
  if(!e.entity instanceof IPlayer) return;
  val player as IPlayer = e.entity;
  if(isForbidTravel(player, e.dimension)) e.cancel();
});

// Additional level of protection against unsanctioned traveling methods (like deep dark portal)
events.onPlayerChangedDimension(function(e as crafttweaker.event.PlayerChangedDimensionEvent){
  if(e.entity.world.isRemote()) return;
  if(!e.player.creative && isForbidTravel(e.player, e.to)) {
    e.player.world.catenation().sleep(20).then(function(world, ctx) {
      server.commandManager.executeCommand(server, '/tpx '~e.player.name~' 0');
    }).start();
  }
});


static allowedDims as int[] = [0, -1, 144, -343800852, 2, -2] as int[];