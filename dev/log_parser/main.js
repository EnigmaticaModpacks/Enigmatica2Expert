
/*=============================================
=                Variables                    =
=============================================*/
const utils = require('../utils.js');

/*=============================================
=                  Helpers                    =
=============================================*/

/*=============================================
=               Ignoring errors               =
=============================================*/
var ignore = [
  /Parsing error loading built-in advancement/,
  / \[tconstruct-modifier\]: Cannot load modifier-model /,
  / \[(tconstruct-API|conarm)\]: Could not load multimodel /,
  / \[tconstruct-API\]: Could not load material model /,
  / \[FML\]: MultiModel minecraft:builtin\/missing is empty /,

  // Model loading errors
  /\[FML\]: Exception loading (model|blockstate) for( the)? variant /,
  /\[FML\]: Could not load override model /,

  // FML mod signature errors
  /\[FML\]: The mod .* is expecting signature.*however there is no signature matching that description/,
  /\[FML\]: FML appears to be missing any signature data. This is not a good thing/,

  // Ignore missing textures
  /\[net.minecraft.client.renderer.texture.TextureMap\]: Using missing texture, unable to load /,

  // Not actual error (loading modded info books)
  /\[Client thread\/INFO\].*vazkii.patchouli.* Error while loading entry /,

  // More Patchouli books exceptions
  /\[java.lang.Throwable:printStackTrace:635\]: Caused by: java.lang.RuntimeException: Error while loading entry/,

  // Parsing recipe errors from FML. Probably items just removed but recipe reference is present
  /\[FML\]: Parsing error loading recipe /,

  // jeivillagers is old (2017) mod, causing some errors
  /\[com.buuz135.jeivillagers.Jeivillagers:registerCareer:71\]: Error checking recipes for class/,

  // Advanced generators somehow cant create Vibrant items
  /\[bdlib\]: Error while processing RsRecipe/,

  // Unknown mixin error
  /\[mixin\]: Error cleaning class output directory: .mixin.out\\class:/,
  /\[mixin\]: Added class metadata for java\/lang\/Error to metadata cache/,

  // Immersive Engineering Projector event error. Probably skip
  /\[FML\]: Error registering event handler: FMLMod:immersivepetroleum.*ItemProjector.handleMultiblockComplete/,

  // Waila - Computronix Error
  /\[Waila\]: Error wrapping plugin.*computronics.integration.waila.IntegrationWaila/,

  // Optifine minor error
  /\[Client thread\/WARN\] \[Config\]: \[OptiFine\] Error finding Chunk.hasEntities/,

  // Mechanics error (reported to github but ignored) https://github.com/wolforcept/mechanics/issues/13
  /\[Mechanics\]: Failed to copy .* property from block /,

  // Guide-API error (mod for JSON books documentation for mods)
  /\[Guide-API\]: Cannot get renderer for /,

  // Some epsent slabs
  /\[net.blay09.mods.kleeslabs.KleeSlabs\]: Slab .* could not be found./,

  // EnderIO overwritten recipes
  /\[enderio\]: Cannot add smelting recipe .* because another mod already has registered a recipe /,

  // EnderIO copy default recipe fail
  /\[enderio\]: Copying default recipe file from .* to .* failed. Reason:/,

  // Could not load advancment
  // Most likely happens when recipe changed and recipe name was changed too
  /\[net.minecraft.advancements.AdvancementList\]: Couldn't load advancement /,

  // NOT ERRORS:
  /\[gendustry\]: \(This is not an error, no need to report it to anybody\)/,
  /THIS IS NOT AN OFFICIAL BUILD OF IMMERSIVE ENGINEERING!/,
  /\[mcjtylib_ng\]: Could not read 'userbuilder.json', this is not an error!/,
  /mekanism:etc.error/,

  // TconEvo error. Reported to issues https://github.com/phantamanta44/tinkers-evolution/issues/31
  /\[tconevo\]: Artifacts were looked up before being loaded!/,
  /\[tconevo\]: Encountered exception while loading artifacts!/,

  // Some JEI errors
  /\[jei\]: An interpreter is already registered for this item/,
  /\[jei\]: Failed to register mod plugin/,
  /\[jei\]: A Recipe Handler has already been registered for /,
  /\[jei\]: Could not find any matching ingredients to remove/,
  /\[jei\]: Recipe has no output. Extra Utilities 2 extrautils2:shortcut_hopper/,

  // Journey map ignored errors
  /\[journeymap\]: Couldn't locate icons for .*: /,

  // TiC invalid alloy (dont know what cause exception)
  /\[tconstruct-IMC\]: Invalid alloy fluid in alloy IMC/,

  // Compact machine cant find example recipes
  /\[compactmachines3\]: Could not deserialize recipe from file:/,

  // Wooden Crucible error (they disabled anyway)
  /\[excompressum\]: Duplicate entry for .* in WoodenCrucible, overwriting.../,

  // Some other mod changes pistons, so it cant be changed
  // cfg says: Fixes MC-54026, which causes blocks attached to slime blocks in some circumstances to create ghost blocks if a piston pushes the slime block. 
  /\[randompatches\]: Failed to transform class: net.minecraft.tileentity.TileEntityPiston/,


  /*=============================================
  =               Ignoring Warnings             =
  =============================================*/
  /\[FML\]: Found FMLCorePluginContainsFMLMod marker in /,
  /\[FML\]: Mod .* is missing the required element 'version' and a version.properties file could not be found. Falling back to metadata version/,
  /\[FML\]: The coremod .* is not signed!/,
  /\[FML\]: The coremod .* does not have a MCVersion annotation, it may cause issues with this version of Minecraft/,
  /\[FML\]: Potentially Dangerous alternative prefix /,
  /\[FML\]: \*[ *]{2}/,
  /\[FML\]: \* Registry Item: The object .* has been registered twice for the same name/,
  /\[FML\]: No types have been added to Biome /,
  /\[FML\]: Overriding existing radiation moderator data for /,
  /\[\]: ==/,

  /\[LaunchWrapper\]: Tweak class name .* has already been visited -- skipping/,
  /\[draconicevolution\]: Found empty mod doc folder /,
  /\[MineMenu\]: Menu item in slot .* is /,
  /\[net.minecraft.client.renderer.block.model.ModelBlock\]: Unable to resolve texture due to upward reference:/,
  /\[ic2.(Item|Block)\]: The .* is not initialized./,
  /\[orelib\]: Unable to locate field /,
  /\[FML\]: A mod has attempted to assign Block Block/,
  /\[brandonscore\]: No features were detected for mod: brandonscore./,

  // Known warning, do nothing https://github.com/CD4017BE/CD4017BE_lib/issues/15
  /\[cd4017be_lib\]: Problem occoured adding ImmersiveEngineering handler/,

  /Could not get version info: java.io.FileNotFoundException/,
  /\[CoFH World\]: Using `metadata` .* for blocks is deprecated/,
  /\[dsurround\]: Cannot locate item .* for ItemRegistry/,
  /\[Integrated Dynamics\]: Invalid appendix /,
  /\[EnderCore ASM\]: Ersatz patch applied, things may break!/,

  /\[enderio\]: TConstruct, you fail again, muhaha! The world is mine, mine!/,
  /\[enderio\]: Applied Energistics conduits loaded. Let your networks connect!/,
  /\[enderio\]: OpenComputers conduits loaded. Let your networks connect!/,
  /\[enderio\]: Forestry integration loaded. Let things grow./,
  /\[enderio\]: Not adding supplied recipe as a recipe already exists for the input:/,
  /\[enderio\]: Item used in Smeltery recipe .* doesn't smelt into a fluid/,

  /\[jei\]: Mod added a tree entry after memory optimization!/,
  /\[plethora\]: Cannot inject neural renderer for /,
  /\[TickCentral\]: Unable to get superclass as resource: /, // Known, reported
  /ResourcePack: ignored non-lowercase namespace: META-INF in /,
  /\[net.minecraft.entity.passive.EntityVillager\]: PriceRange.* smaller than/,
  /\[ic2.Uu\]: UU predefined config: Can't find ItemStack for /,

  /*=============================================
  =        Already inspected warnings           =
  =============================================*/
  /\[mixin\]: Static binding violation: PRIVATE @Overwrite method func_76615_h in mixins.phosphor.json:common.MixinChunk cannot reduce visibiliy of PUBLIC target method, visibility will be upgraded./,
  /\[LLibrary Core\]: Failed to fetch hierarchy node for net.minecraft.client.renderer.DestroyBlockProgress. This may cause patch issues/,
  /\[LLibrary Core\]: Failed to fetch hierarchy node for net.minecraft.client.renderer.culling.Frustum. This may cause patch issues/,
  /\[LLibrary Core\]: Failed to fetch hierarchy node for net.minecraft.client.renderer.culling.ICamera. This may cause patch issues/,
  /\[net.minecraft.client.settings.GameSettings\]: Skipping bad option: lastServer:/,
  /\[LLibrary Core\]: Unable to call Core API! It has not been initialized yet!/,
  /\[net.minecraft.client.settings.GameSettings\]: Skipping bad option: lastServer:/,
  /\[solcarrot\]: Invalid Fingerprint!/,
  /\[FTB Library\]: Replacing com.feed_the_beast.ftblib.lib.config.DefaultRankConfigHandler with com.feed_the_beast.ftbutilities.ranks.FTBUtilitiesPermissionHandler/,
  /\[tconstruct-API\]: Itemstack 1xitem.null@17 cannot represent material xu_evil_metal since it is not associated with the material!/,
  /\[tconstruct-API\]: Itemstack 1xitem.null@12 cannot represent material xu_enchanted_metal since it is not associated with the material!/,
  /\[tconstruct-API\]: Itemstack 1xitem.null@11 cannot represent material xu_demonic_metal since it is not associated with the material!/,
  /\[FML\]: Replacing net.minecraftforge.server.permission.DefaultPermissionHandler with com.feed_the_beast.ftbutilities.ranks.FTBUtilitiesPermissionHandler/,
  /\[FML\]: \* OPTIFINE DETECTED! DISABLING TIPTHESCALES!!!/,
  /\[forestry\]: Missing block: sandstone/,
  /\[enderio\]: Farming Station: Forestry integration for farming loaded but could not find Forestry sapling./,
  /\[enderio\]: Farming Station: Forestry integration for fertilizing loaded but could not find Forestry fertilizer./,
  /\[net.minecraft.client.audio.SoundManager\]: Missing sound for event: thaumcraft:runicshieldcharge/,
  /\[FML\]: Unable to find recipe for minecraft:rabbit_stew/,
  /\[FML\]: Unable to find recipe for minecraft:baked_potato/,
  /\[opencomputers\]: Invalid glyph char code detected in font.hex. Expected 0<= charCode <10000, got: 1D300/,
  /\[opencomputers\]: 87 total invalid glyph char codes detected in font.hex/,
  /\[inventorytweaks\]: Failed to check item tree version: null/,
  /\[thermalexpansion\]: Thermal Expansion received an invalid IMC from chisel! Key was addcompactorpressrecipe/,
  /\[thermalexpansion\]: Thermal Expansion received an invalid IMC from chisel! Key was addcompactorpressrecipe/,
  /\[ic2.Recipe\]: Late recipe loading failed./,
  /\[enderio\]: Could not find Build Craft Wrench definition. Wrench integration with other mods may fail/,
  /\[toolprogression\]: Invalid block overwrite entry: /,
  /\[toolprogression\]: Failed to set tool class of item 'redstonearsenal:tool.pickaxe_flux'/,
  /\[toolprogression\]: Failed to set tool class of item 'redstonearsenal:tool.hammer_flux'/,
  /\[toolprogression\]: Failed to set tool class of item 'redstonearsenal:tool.hammer_flux'/,
  /\[forestry\]: Failed to find item for \(iceandfire:jungle_myrmex_coccon\) in the Forge registry./,
  /\[enderio\]: Item used in cast recipe .* doesn't smelt into a fluid/,
  /\[keywizard\]: Controls gui override enabled, this may cause problems with other mods/,
  /\[keywizard\]: Conflicting mod detected, controls gui override may not work/,
  /\[jei\]: Recipe registry plugin is slow, took 14.53 ms. class pl.asie.preston.compat.jei.CompressorRecipeRegistryPlugin/,
  /\[dsurround\]: Cannot find sound that should be registered \[minecraft:\]/,
  /\[net.minecraft.client.settings.GameSettings\]: Skipping bad option: lastServer:/,
  /\[FML\]:   Registry: 242 minecraft:entity.ghast.warn net.minecraft.util.SoundEvent@17ebbf1e/,
  /\[FML\]:   Registry: 859 twilightforest:mob.hydra.warn net.minecraft.util.SoundEvent@28037b9d/,
  /\[FML\]:   Registry: 242 minecraft:entity.ghast.warn net.minecraft.util.SoundEvent@17ebbf1e/,
  /\[FML\]:   Registry: 859 twilightforest:mob.hydra.warn net.minecraft.util.SoundEvent@28037b9d/,
  /\[advancedrocketry\]: Unable to create file C:\\Users\\LD\\Twitch\\Minecraft\\Instances\\Enigmatica2Expert - Extended\\saves\\New World-\\advRocketry\\planetDefs.xml/,
  /\[com.mojang.authlib.yggdrasil.YggdrasilMinecraftSessionService\]: Couldn't look up profile properties for .* Invalid uuid.,legacy=false\]/,

];



/*=============================================
=               Ignoring known                =
=============================================*/
// Known errors that should be fixed but not listed
var known = [

];

/*=============================================
=           Working                           =
=============================================*/

var log = utils.loadText("../logs/debug.log");
var newLog = "";

var o = {
  total: 0,
  unknown: 0,
  resolved: known.length,
  viewed: 0,
}
for (const match of log.matchAll(/^.*\W(error|WARN)\W.*$/gmi)) {
  var isIgnore = false;
  o.total += 1;
  for (let i = 0; i < ignore.length; i++) {
    if (match[0].match(ignore[i])) {
      isIgnore = true;
      break;
    }
  }
  
  if (!isIgnore) {
    for (let i = 0; i < known.length; i++) {
      if (match[0].match(known[i])) {
        isIgnore = true;
        o.resolved -= 1;
        break;
      }
    }
  }

  if (!isIgnore) {
    var line = match[0]
      .replace(/^\[[\d:]+\] /,"");  // Remove timestamp
    newLog += line + "\n";

    if (o.viewed < 100) {
      console.log("=>" + line);
      o.viewed += 1;
    }
    o.unknown += 1;
  }
}
console.log("    Total Errors: ", o.total);
console.log("Untreaten errors: ", o.unknown);
console.log(" Resolved errors: ", o.resolved + "/" + known.length);

utils.saveText(newLog, "unknownErrors.log")