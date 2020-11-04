/* 

This file exist only for developing purposes.
Should be removed on publish or all its functions should be commented.

*/

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.event.CommandEvent;
import crafttweaker.player.IPlayer;


#priority -1

# ######################################################################
#
# Command Listener
#
# ######################################################################

// events.onCommand(function(event as CommandEvent) {
// 	print("Entering [events.onCommand]...");
// 	val command = event.command;
// 	if(isNull(command)) { return; }
	
// 	if (command.name == "secretelexirtest") {
// 		val elexir = <rustic:elixir>.withTag({ElixirEffects:[
// 			{Effect:"minecraft:speed",Duration:1800000,Amplifier:8},
// 			{Effect:"rustic:ironskin",Duration:9600000,Amplifier:8}],
// 			ench:[{id:0,lvl:0}],HideFlags:1});

// 		val sndr = event.commandSender;
// 		val entItem = elexir.createEntityItem(sndr.world,
// 			sndr.position.getX(), sndr.position.getY(), sndr.position.getZ());
// 		val spawnSucces = sndr.world.spawnEntity(entItem);
// 	}
	
// 	return;
// });


// events.onPlayerTick(function(event as PlayerTickEvent) {
//     val player as IPlayer = event.player;
//     val world as IWorld = player.world;

//     if (isInvalid && world.remote) {
//         if (world.time % 100 == 0) {
//             player.sendStatusMessage(format.red("!"), true);
//         }
//         if (world.time % 100 == 50) {
//             player.sendStatusMessage(format.red("!"), true);
//         }
//     }
// });