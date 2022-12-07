/*

Grinding trait is a way to obtain tech-only items with non-tech way.

Ideas:
- Jump on Ore to obtain dusts (depends on hardness and mining level)
- Jump om metal blocks to obtain plates
- Kick from under to ...

There is synergy with:

- Heavy trait give more chance to succes
- Weight potion effect give more output
- Luck give more output

*/

/* Patchouli_js('Items/Grinding Trait', {
  item: 'mechanics:heavy_ingot',
  title: 'Grinding Trait',
  _text: `
    When wearing armor:
    $(li)$(l)Jump on ore/$ to crush it into dust.
    $(li)$(l)Must sneak/$ to work.
    $(li)$(l)More armor parts/$ output more dust. Max is 12.
    $(li)$(l)Height/$ of fall increase chance.
    $(li)$(l)Durability/$ of armor consumed depends on hardness.
    $(li)$(l)Wooden Tool Rod/$ in main hand would show trait info.
  `,
})*/

#loader contenttweaker

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot as entEqSlot;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.EntityLivingFallEvent;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.world.IFacing;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.floor;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.sqrt;
import mods.ctutils.utils.Math.log;

import scripts.cot.utils_tcon_cot.getItemMatAmount;
import scripts.cot.utils_tcon_cot.getArmorMatsAmount;

static HARDNESS_MULT as float = 1.0 as float;

function getRequiredDurab(
  player as IPlayer,
  world as IWorld,
  blockState as IBlockState,
  pos as IBlockPos
) as float {
  return max(1.0d, pow(
    HARDNESS_MULT / blockState.getPlayerRelativeBlockHardness(player, world, pos)
  , 0.25d)) as float;
}

# -------------------------------
# Recipes
# -------------------------------
static recipesJumpOnBlock as IItemStack[IItemStack] = {
/*Inject_js{
const toCot = (tm) => tm.replace('<', '<item:')
const result = getOreBases_byKinds(['ore', 'dust'])
  .filter((b) => b !== 'Aluminum')
  .flatMap((base) => {
    const dustStack = getByOredict_first('dust' + base).commandString
    return getByOredict('ore' + base).map((tm) =>
      [tm.commandString, dustStack].concat(
        countBaseOutput(base, 4) + ''
      )
    )
  })
  .concat(
    ['dirt', 'grass']
      .flatMap(getByOredict)
      .map((tm) => [tm.commandString, '<biomesoplenty:mudball>', '4'])
  )
  .concat(
    ['stone', 'cobblestone']
      .flatMap(getByOredict)
      .map((tm) => [tm.commandString, '<ic2:dust:15>', '4'])
  )

return result.map((line) => {
  line[0] = toCot(line[0])
  line[1] = toCot(line[1])
  line.splice(2, 0, ' * ')
  line.splice(1, 0, ' : ')
  line.push(',')
  return line
})
}*/
<item:appliedenergistics2:charged_quartz_ore> : <item:appliedenergistics2:material:2>        * 12,
<item:appliedenergistics2:quartz_ore>         : <item:appliedenergistics2:material:2>        * 12,
<item:appliedenergistics2:charged_quartz_ore> : <item:jaopca:item_dustchargedcertusquartz>   * 8 ,
<item:actuallyadditions:block_misc:3>         : <item:actuallyadditions:item_dust:7>         * 8 ,
<item:astralsorcery:blockcustomore:1>         : <item:astralsorcery:itemcraftingcomponent:2> * 4 ,
<item:astralsorcery:blockcustomsandore>       : <item:jaopca:item_dustaquamarine>            * 16,
<item:biomesoplenty:gem_ore>                  : <item:jaopca:item_dustamethyst>              * 8 ,
<item:biomesoplenty:gem_ore:1>                : <item:jaopca:item_dustruby>                  * 8 ,
<item:biomesoplenty:gem_ore:2>                : <item:jaopca:item_dustperidot>               * 8 ,
<item:biomesoplenty:gem_ore:3>                : <item:jaopca:item_dusttopaz>                 * 8 ,
<item:biomesoplenty:gem_ore:4>                : <item:jaopca:item_dusttanzanite>             * 8 ,
<item:biomesoplenty:gem_ore:5>                : <item:jaopca:item_dustmalachite>             * 8 ,
<item:biomesoplenty:gem_ore:6>                : <item:jaopca:item_dustsapphire>              * 8 ,
<item:biomesoplenty:gem_ore:7>                : <item:jaopca:item_dustamber>                 * 8 ,
<item:thaumcraft:ore_amber>                   : <item:jaopca:item_dustamber>                 * 8 ,
<item:draconicevolution:draconium_ore>        : <item:draconicevolution:draconium_dust>      * 4 ,
<item:draconicevolution:draconium_ore:1>      : <item:draconicevolution:draconium_dust>      * 4 ,
<item:draconicevolution:draconium_ore:2>      : <item:draconicevolution:draconium_dust>      * 4 ,
<item:endreborn:block_wolframium_ore>         : <item:contenttweaker:item_ore_tungsten:2>    * 4 ,
<item:bigreactors:oreyellorite>               : <item:bigreactors:dustyellorium>             * 4 ,
<item:forestry:resources>                     : <item:jaopca:item_dustapatite>               * 40,
<item:immersiveengineering:ore:1>             : <item:thermalfoundation:material:68>         * 4 ,
<item:thermalfoundation:ore:4>                : <item:thermalfoundation:material:68>         * 4 ,
<item:immersiveengineering:ore:5>             : <item:immersiveengineering:metal:14>         * 4 ,
<item:mekanism:oreblock>                      : <item:mekanism:dust:2>                       * 4 ,
<item:minecraft:coal_ore>                     : <item:thermalfoundation:material:768>        * 20,
<item:minecraft:diamond_ore>                  : <item:ic2:dust:5>                            * 8 ,
<item:minecraft:emerald_ore>                  : <item:actuallyadditions:item_dust:3>         * 8 ,
<item:minecraft:gold_ore>                     : <item:thermalfoundation:material:1>          * 4 ,
<item:minecraft:iron_ore>                     : <item:thermalfoundation:material>            * 4 ,
<item:minecraft:lapis_ore>                    : <item:ic2:dust:9>                            * 40,
<item:minecraft:quartz_ore>                   : <item:appliedenergistics2:material:3>        * 12,
<item:netherendingores:ore_other_1>           : <item:appliedenergistics2:material:3>        * 12,
<item:thaumcraft:ore_quartz>                  : <item:appliedenergistics2:material:3>        * 12,
<item:minecraft:redstone_ore>                 : <item:minecraft:redstone>                    * 40,
<item:netherendingores:ore_other_1:2>         : <item:enderio:item_material:30>              * 4 ,
<item:tconstruct:ore:1>                       : <item:enderio:item_material:30>              * 4 ,
<item:netherendingores:ore_other_1:4>         : <item:enderio:item_material:31>              * 4 ,
<item:tconstruct:ore>                         : <item:enderio:item_material:31>              * 4 ,
<item:nuclearcraft:ore:3>                     : <item:nuclearcraft:dust:3>                   * 4 ,
<item:nuclearcraft:ore:5>                     : <item:nuclearcraft:dust:5>                   * 4 ,
<item:nuclearcraft:ore:6>                     : <item:ic2:dust:11>                           * 4 ,
<item:nuclearcraft:ore:7>                     : <item:nuclearcraft:dust:7>                   * 4 ,
<item:rftools:dimensional_shard_ore>          : <item:jaopca:item_dustdimensionalshard>      * 12,
<item:rftools:dimensional_shard_ore:1>        : <item:jaopca:item_dustdimensionalshard>      * 12,
<item:rftools:dimensional_shard_ore:2>        : <item:jaopca:item_dustdimensionalshard>      * 12,
<item:thermalfoundation:ore>                  : <item:thermalfoundation:material:64>         * 4 ,
<item:thermalfoundation:ore:1>                : <item:thermalfoundation:material:65>         * 4 ,
<item:thermalfoundation:ore:2>                : <item:thermalfoundation:material:66>         * 4 ,
<item:thermalfoundation:ore:3>                : <item:thermalfoundation:material:67>         * 4 ,
<item:thermalfoundation:ore:5>                : <item:thermalfoundation:material:69>         * 4 ,
<item:thermalfoundation:ore:6>                : <item:thermalfoundation:material:70>         * 4 ,
<item:thermalfoundation:ore:7>                : <item:thermalfoundation:material:71>         * 4 ,
<item:thermalfoundation:ore:8>                : <item:thermalfoundation:material:72>         * 4 ,
<item:libvulpes:ore0>                         : <item:libvulpes:productdust>                 * 4 ,
<item:libvulpes:ore0:8>                       : <item:libvulpes:productdust:7>               * 4 ,
<item:biomesoplenty:dirt>                     : <item:biomesoplenty:mudball>                 * 4 ,
<item:biomesoplenty:dirt:1>                   : <item:biomesoplenty:mudball>                 * 4 ,
<item:biomesoplenty:dirt:2>                   : <item:biomesoplenty:mudball>                 * 4 ,
<item:biomesoplenty:dirt:8>                   : <item:biomesoplenty:mudball>                 * 4 ,
<item:biomesoplenty:dirt:9>                   : <item:biomesoplenty:mudball>                 * 4 ,
<item:biomesoplenty:dirt:10>                  : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt>                            : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:1>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:2>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:3>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:4>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:5>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:6>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:7>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:8>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:9>                          : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:10>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:11>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:12>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:13>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:14>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:dirt:15>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:minecraft:dirt>                         : <item:biomesoplenty:mudball>                 * 4 ,
<item:minecraft:dirt:1>                       : <item:biomesoplenty:mudball>                 * 4 ,
<item:minecraft:dirt:2>                       : <item:biomesoplenty:mudball>                 * 4 ,
<item:biomesoplenty:grass>                    : <item:biomesoplenty:mudball>                 * 4 ,
<item:minecraft:grass>                        : <item:biomesoplenty:mudball>                 * 4 ,
<item:chisel:stonebrick>                      : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:1>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:2>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:3>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:4>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:5>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:6>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:7>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:8>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:9>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:10>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:11>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:12>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:13>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:14>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick:15>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1>                     : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:1>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:2>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:3>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:4>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:5>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:6>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:7>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:8>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick1:9>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2>                     : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:1>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:2>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:3>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:4>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:5>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:6>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:7>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:8>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:stonebrick2:9>                   : <item:ic2:dust:15>                           * 4 ,
<item:minecraft:stone>                        : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone>                     : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:1>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:2>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:3>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:4>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:5>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:6>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:7>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:8>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:9>                   : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:10>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:11>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:12>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:13>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:14>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone:15>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:1>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:2>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:3>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:4>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:5>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:6>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:7>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:8>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone1:9>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2>                    : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:1>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:2>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:3>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:4>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:5>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:6>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:7>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:8>                  : <item:ic2:dust:15>                           * 4 ,
<item:chisel:cobblestone2:9>                  : <item:ic2:dust:15>                           * 4 ,
<item:minecraft:cobblestone>                  : <item:ic2:dust:15>                           * 4 ,
/**/
} as IItemStack[IItemStack];

function getOutputForBlock(block as IBlock) as IItemStack {
  for inputStack, output in recipesJumpOnBlock {
    if(inputStack.asBlock() in block) return output;
  }
  return null;
}

# -------------------------------
# Spawning
# -------------------------------
function spawnDust(
  dust as IItemStack,
  world as IWorld,
  pos as IBlockPos,
  amount as double
) as void {
  if (amount < 1.0f && world.getRandom().nextDouble() > amount) return;

  val count = max(1, amount as int);
  val entItem = (dust * count).createEntityItem(world, pos.x as float + 0.5f, pos.y as float + 0.5f, pos.z as float + 0.5f);
  world.spawnEntity(entItem);
}

# -------------------------------
# Event
# -------------------------------
function attemptDamage(armor as IItemStack, player as IPlayer, dmg as int) as bool {
  if(armor.maxDamage - armor.damage < dmg) return false;
  armor.mutable().attemptDamageItem(dmg, player);
  return true;
}

static prevTickMotion as double[][][string] = {} as double[][][string];

function onAbility(
  trait as mods.contenttweaker.conarm.ArmorTrait,
  level as int,
  world as IWorld,
  player as IPlayer
) as void {
  if(isNull(player)) return;

  // Update previous tick motion
  var playerMots = prevTickMotion[player.uuid];
  if(isNull(playerMots)) {
    playerMots = [
      [player.motionX, player.motionY, player.motionZ],
      [player.motionX, player.motionY, player.motionZ]
    ] as double[][];
    prevTickMotion[player.uuid] = playerMots;
  } else {
    playerMots[0] = playerMots[1];
    playerMots[1] = [player.motionX, player.motionY, player.motionZ] as double[];
  }
}

function getPrevTickMotionY(player as IPlayer) as double {
  val playerMots = prevTickMotion[player.uuid];
  if(!isNull(playerMots)) return prevTickMotion[player.uuid][0][1];
  return player.motionY;
}

function onFalling(armor as IItemStack, player as IPlayer) as void {
  val world = player.world;
  if(!player.isSneaking) return;

  var isVerbose = !isNull(player.currentItem)
    && <item:tconstruct:tool_rod>.withTag({Material: "wood"}) has player.currentItem;
  if(isVerbose) player.sendMessage("§8-- Grinding --");

  // Player motion detected as AFTER it touches the ground
  // So we need to use prev. tick motion
  val motionY = getPrevTickMotionY(player);
  val verticalSpeedChance = 1.0d - 1.0d / (abs(motionY) + 1.0d);
  if(isVerbose) player.sendMessage("§8Chance to break:§7 " ~ (verticalSpeedChance * 100.0d) as int ~ "%");
  if(world.getRandom().nextDouble() > verticalSpeedChance) {
    player.sendPlaySoundPacket("minecraft:block.anvil.hit", "ambient", player.position, 0.5f, 1.5f);
    // server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "
    //   ~(player.position.x as float + 0.5f)~" "
    //   ~(player.position.y as float + 1.0f)~" "
    //   ~(player.position.z as float + 0.5f)~" 0 0.1 0 0.1 2");
    if(isVerbose) player.sendMessage("§8Unlucky!");
    return;
  }

  val blockUnderPos = player.position.getOffset(IFacing.down(), 1);
  val blockState = world.getBlockState(blockUnderPos);
  if(isNull(blockState) || blockState == <blockstate:minecraft:air>) {
    if(isVerbose) player.sendMessage("§8No block under player!");
    return;
  }

  val outStack = getOutputForBlock(blockState.block);
  if(isNull(outStack)) {
    if(isVerbose) player.sendMessage("§8This block cant be grinded!");
    return;
  }

  val durabRequired = getRequiredDurab(player, world, blockState, blockUnderPos);
  if(isVerbose) player.sendMessage("§8Consume durability:§7 " ~ durabRequired as int);

  val isDamageSuccess = attemptDamage(armor, player, durabRequired);
  if(!isDamageSuccess) {
    if(isVerbose) player.sendMessage("§8Not enough armor durability!");
    return;
  }

  val power = getArmorMatsAmount(player, 'heavy', durabRequired);
  val amount = max(1.0d, (power as double / 12.0d) * outStack.amount as double) as int;
  if(isVerbose) player.sendMessage("§8Power of armor / dust amount:§7 " ~ power ~ " / " ~ amount);

  world.destroyBlock(blockUnderPos, false);
  spawnDust(outStack, world, blockUnderPos, power);
  if(isVerbose) player.sendMessage("§8Success!");
}

// val horisontalSpeed as double = sqrt(entity.motionX * entity.motionX + entity.motionZ * entity.motionZ);
