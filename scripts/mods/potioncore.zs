import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#modloaded potioncore

//! Using brewing.removeRecipe() causing make all recipes with gunpowder turn into Splash Potion Of Doom
// # Remove erroring recipes
// brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "potioncore:extension"}), <minecraft:redstone>);

# Potioncore gives ability to jump incredeble hight
# by holding jump key after eating [Ironberries].
# "Controllable Jump Boost" config option wont help,
# so we just remove potion effect on use
events.onEntityLivingUseItemFinish(function(e as crafttweaker.event.EntityLivingUseItemEvent.Finish){
  if(
    isNull(e)
    || !e.isPlayer
    || isNull(e.player.world)
    || e.player.world.remote
    || isNull(e.item)
    || e.item.definition.id != "rustic:ironberries"
  ) return;
  e.player.removePotionEffect(<potion:minecraft:jump_boost>);
});

val fermentedSpiderEye as IItemStack = <minecraft:fermented_spider_eye>;
val awkward = "minecraft:awkward";
val mundane = "minecraft:mundane";

# add a weakness recipe that makes more sense (original recipe still works)
addBrew("minecraft:strength", fermentedSpiderEye, "minecraft:weakness");

# add a recipe for luck potions
val clownfish = <minecraft:fish:2>;
addBrewWithConversions(awkward, clownfish, "minecraft:luck");

# add potion core brewing recipes
addBrewWithUpgradesFromBase(
  "minecraft:leaping", fermentedSpiderEye, "potioncore:weight",
  "potioncore:strong_weight", "potioncore:long_weight",
  "minecraft:strong_leaping", "minecraft:long_leaping"
);
addBrewWithUpgradesFromBase(
  mundane, <minecraft:feather>, "potioncore:levitation",
  "potioncore:strong_levitation", "potioncore:long_levitation",
  "potioncore:strong_weight", "potioncore:long_weight"
);
addBrewWithUpgradesFromBase(
  "minecraft:poison", <minecraft:red_flower:8>, "potioncore:antidote",
  null, "potioncore:long_antidote",
  null, "minecraft:long_poison"
);
addBrewWithUpgrades(
  mundane, <minecraft:prismarine_crystals>, "potioncore:haste",
  "potioncore:strong_haste", "potioncore:long_haste"
);
addBrewWithUpgradesFromBase(
  "potioncore:haste", fermentedSpiderEye, "potioncore:mining_fatigue",
  "potioncore:strong_mining_fatigue", "potioncore:long_mining_fatigue",
  "potioncore:strong_haste", "potioncore:long_haste"
);
addBrewWithUpgrades(
  mundane, <minecraft:rotten_flesh>, "potioncore:hunger",
  "potioncore:strong_hunger", "potioncore:long_hunger"
);
addBrewWithUpgradesFromBase(
  "potioncore:hunger", fermentedSpiderEye, "potioncore:saturation",
  "potioncore:strong_saturation", null,
  "potioncore:strong_hunger", null
);
val ink = <minecraft:dye:0>;
addBrewWithUpgrades(
  awkward, ink, "potioncore:blindness",
  "potioncore:strong_blindness", "potioncore:long_blindness"
);
addBrewWithUpgradesFromBase(
  "potioncore:blindness", fermentedSpiderEye, "potioncore:glowing",
  null, "potioncore:long_glowing",
  null, "potioncore:long_blindness"
);
addBrewWithConversions(
  "minecraft:luck", fermentedSpiderEye, "potioncore:unluck"
);
addBrewWithUpgrades(
  awkward, <minecraft:flint>, "potioncore:archery",
  "potioncore:strong_archery", "potioncore:long_archery"
);
addBrewWithUpgradesFromBase(
  "potioncore:archery", fermentedSpiderEye, "potioncore:klutz",
  "potioncore:strong_klutz", "potioncore:long_klutz",
  "potioncore:strong_archery", "potioncore:long_archery"
);
addBrewWithUpgrades(
  awkward, <ore:nuggetLapis>, "potioncore:magic_focus",
  "potioncore:strong_magic_focus", "potioncore:long_magic_focus"
);
addBrewWithUpgradesFromBase(
  "potioncore:magic_focus", fermentedSpiderEye, "potioncore:magic_inhibition",
  "potioncore:strong_magic_inhibition", "potioncore:long_magic_inhibition",
  "potioncore:strong_magic_focus", "potioncore:long_magic_focus"
);
addBrewWithUpgradesFromBase(
  "potioncore:magic_focus", <minecraft:iron_ingot>, "potioncore:magic_shield",
  "potioncore:strong_magic_shield", "potioncore:long_magic_shield",
  "potioncore:strong_magic_focus", "potioncore:long_magic_focus"
);
addBrewWithUpgrades(
  awkward, <minecraft:cactus>, "potioncore:recoil",
  "potioncore:strong_recoil", "potioncore:long_recoil"
);
addBrewWithUpgrades(
  awkward, <minecraft:redstone_torch>, "potioncore:explode",
  "potioncore:strong_explode", null
);
addBrewWithUpgradesFromBase(
  "potioncore:explode", fermentedSpiderEye, "potioncore:burst",
  "potioncore:strong_burst", null,
  "potioncore:strong_explode", null
);
addBrewWithUpgrades(
  awkward, <minecraft:torch>, "potioncore:fire",
  "potioncore:strong_fire", null
);
addBrewWithConversions(
  awkward, <minecraft:iron_bars>, "potioncore:lightning"
);
addBrewWithUpgrades(
  awkward, <minecraft:soul_sand>, "potioncore:launch",
  "potioncore:strong_launch", null
);
addBrewWithUpgrades(
  awkward, <minecraft:deadbush>, "potioncore:vulnerable",
  "potioncore:strong_vulnerable", "potioncore:long_vulnerable"
);
addBrewWithUpgrades(
  mundane, <minecraft:iron_ingot>, "potioncore:iron_skin",
  "potioncore:strong_iron_skin", "potioncore:long_iron_skin"
);
addBrewWithUpgradesFromBase(
  "potioncore:iron_skin", fermentedSpiderEye, "potioncore:broken_armor",
  "potioncore:strong_broken_armor", "potioncore:long_broken_armor",
  "potioncore:strong_iron_skin", "potioncore:long_iron_skin"
);
addBrewWithUpgrades(
  awkward, <minecraft:diamond>, "potioncore:diamond_skin",
  "potioncore:strong_diamond_skin", "potioncore:long_diamond_skin"
);
addBrewWithUpgrades(
  awkward, <minecraft:brick>, "potioncore:solid_core",
  null, "potioncore:long_solid_core"
);
addBrewWithUpgrades(
  awkward, utils.tryCatch("animania:honey_bottle", <forestry:honeyed_slice>), "potioncore:revival",
  "potioncore:strong_revival", "potioncore:long_revival"
);
addBrewWithUpgrades(
  awkward, <ore:peacockFeathers>, "potioncore:slow_fall",
  "potioncore:strong_slow_fall", "potioncore:long_slow_fall"
);
addBrewWithUpgradesFromBase(
  "potioncore:slow_fall", <forestry:butterfly_ge:*>, "potioncore:flight",
  null, "potioncore:long_flight",
  null, "potioncore:long_slow_fall"
);
val grassBlock = <minecraft:grass>;
addBrewWithUpgrades(
  awkward, grassBlock, "potioncore:step_up",
  "potioncore:strong_step_up", "potioncore:long_step_up"
);
addBrewWithUpgrades(
  awkward, <minecraft:vine>, "potioncore:reach",
  "potioncore:strong_reach", "potioncore:long_reach"
);
addBrewWithUpgrades(
  awkward, <ic2:misc_resource:4>, "potioncore:climb",
  null, "potioncore:long_climb"
);
addBrewWithUpgrades(
  awkward, <randomthings:imbue:2>, "potioncore:repair",
  "potioncore:strong_repair", "potioncore:long_repair"
);
addBrewWithUpgradesFromBase(
  "potioncore:repair", fermentedSpiderEye, "potioncore:rust",
  "potioncore:strong_rust", "potioncore:long_rust",
  "potioncore:strong_repair", "potioncore:long_repair"
);
# additional recipe for flight potions (reverse order of ingredients)
# addBrew("minecraft:swiftness", <minecraft:feather>, "potioncore:flight");
addBrewWithUpgrades(
  awkward, <minecraft:chorus_fruit>, "potioncore:teleport",
  "potioncore:strong_teleport", null
);
addBrewWithConversions(
  "potioncore:teleport", grassBlock, "potioncore:teleport_surface"
);
addBrewWithConversions(
  "potioncore:teleport", <randomthings:flootoken>, "potioncore:teleport_spawn"
);
addBrewWithConversions(
  "potioncore:teleport", <minecraft:chest>, "potioncore:disorganization"
);
val roseRed = <minecraft:dye:1>;
addBrewWithConversions(
  awkward, roseRed, "potioncore:love"
);
val witherSkull = <minecraft:skull:1>;
addBrewWithUpgrades(
  awkward, witherSkull, "potioncore:wither",
  "potioncore:strong_wither", "potioncore:long_wither"
);
addBrewWithUpgradesFromBase(
  "potioncore:wither", fermentedSpiderEye, "potioncore:purity",
  null, "potioncore:long_purity",
  null, "potioncore:long_wither"
);
val rawRegularFish = <minecraft:fish:0>;
addBrewWithUpgrades(
  awkward, rawRegularFish, "potioncore:drown",
  null, "potioncore:long_drown"
);
addBrewWithUpgrades(
  awkward, <minecraft:brown_mushroom>, "potioncore:perplexity",
  null, "potioncore:long_perplexity"
);
// addBrewWithUpgrades(
//   awkward, <biomesoplenty:fleshchunk>, "potioncore:extension",
//   "potioncore:strong_extension", "potioncore:long_extension"
// );
addBrewWithUpgrades(
  awkward, <iceandfire:pixie_dust>, "potioncore:bless",
  "potioncore:strong_bless", null
);
addBrewWithUpgradesFromBase(
  "potioncore:bless", fermentedSpiderEye, "potioncore:curse",
  "potioncore:strong_curse", null,
  "potioncore:strong_bless", null
);
addBrewWithUpgrades(
  awkward, <minecraft:chorus_fruit_popped>, "potioncore:chance",
  "potioncore:strong_chance", null
);
addBrewWithConversions(
  awkward, <minecraft:cake>, "potioncore:cure"
);
addBrewWithConversions(
  "potioncore:cure", fermentedSpiderEye, "potioncore:dispel"
);
addBrewWithConversions(
  awkward, <minecraft:ender_eye>, "potioncore:invert"
);
addBrewWithUpgrades(
  awkward, <minecraft:red_mushroom>, "potioncore:nausea",
  null, "potioncore:long_nausea"
);
addBrewWithUpgrades(
  awkward, <minecraft:gold_ingot>, "potioncore:absorption",
  "potioncore:strong_absorption", "potioncore:long_absorption"
);
addBrewWithUpgradesFromBase(
  "potioncore:absorption", <harvestcraft:honeyitem>, "potioncore:health_boost",
  "potioncore:strong_health_boost", "potioncore:long_health_boost",
  "potioncore:strong_absorption", "potioncore:long_absorption"
);
addBrewWithUpgrades(
  mundane, <minecraft:obsidian>, "potioncore:resistance",
  "potioncore:strong_resistance", "potioncore:long_resistance"
);

# add a recipe for a potion, splash potion and lingering potion
function addBrew(basePotionName as string,
                 ingredient as IIngredient,
                 potionName as string) {
  # brewing.addBrew(IIngredient input, IIngredient ingredient, IItemStack output, @Optional boolean hidden);
  brewing.addBrew(asPotion(basePotionName), ingredient, asPotion(potionName));
  brewing.addBrew(asSplashPotion(basePotionName), ingredient, asSplashPotion(potionName));
  brewing.addBrew(asLingeringPotion(basePotionName), ingredient, asLingeringPotion(potionName));
}

# add a recipe for a potion, splash potion and lingering potion
# and recipes to convert them
function addBrewWithConversions(basePotionName as string,
                                ingredient as IIngredient,
                                potionName as string) {
  addBrew(basePotionName, ingredient, potionName);
  
  brewing.addBrew(asPotion(potionName), <minecraft:gunpowder>, asSplashPotion(potionName));
  brewing.addBrew(asSplashPotion(potionName), <minecraft:dragon_breath>, asLingeringPotion(potionName));
}

# adds all recipes for a potion, splash potion and lingering potion
# adds recipes to convert them and to upgrade them
function addBrewWithUpgrades(basePotionName as string,
                             ingredient as IIngredient,
                             potionName as string,
                             strongPotionName as string,
                             longPotionName as string) {

  # add base potion recipes
  addBrewWithConversions(basePotionName, ingredient, potionName);

  # add strengthened recipes
  if (!isNull(strongPotionName)) {
    addBrewWithConversions(potionName, <minecraft:glowstone_dust>, strongPotionName);
  }

  # add lengthened recipes
  if (!isNull(longPotionName)) {
    addBrewWithConversions(potionName, <jaopca:item_dusttinyredstone>, longPotionName);
  }
}

# adds all recipes for a potion, splash potion and lingering potion
# adds recipes to convert them and to upgrade them
# also adds conversion from upgraded base potions
function addBrewWithUpgradesFromBase(basePotionName as string,
                                     ingredient as IIngredient,
                                     potionName as string,
                                     strongPotionName as string,
                                     longPotionName as string,
                                     strongBasePotionName as string,
                                     longBasePotionName as string) {

  addBrewWithUpgrades(basePotionName, ingredient, potionName, strongPotionName, longPotionName);

  if (!isNull(strongBasePotionName)) {
    addBrew(strongBasePotionName, ingredient, strongPotionName);
  }

  if (!isNull(longBasePotionName)) {
    addBrew(longBasePotionName, ingredient, longPotionName);
  }
}

function asPotion(potionName as string) as IItemStack {
  return <minecraft:potion>.withTag({Potion: potionName});
}

function asSplashPotion(potionName as string) as IItemStack {
  return <minecraft:splash_potion>.withTag({Potion: potionName});
}

function asLingeringPotion(potionName as string) as IItemStack {
  return <minecraft:lingering_potion>.withTag({Potion: potionName});
}
