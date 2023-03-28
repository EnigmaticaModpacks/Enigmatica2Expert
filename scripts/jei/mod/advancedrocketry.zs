#priority 950
#modloaded advancedrocketry

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:asteroids>;
x.addJEICatalyst(<advancedrocketry:asteroidchip>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(3,1));
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0],[3,0],[4,0]]);

function addAsteroid(name as string, values as double[], output as IItemStack[]) as void {
  addRecipe(<assembly:asteroids>, {[<advancedrocketry:asteroidchip>.withLore([
    "§8Distance: §b" ~ values[0],
    "§8Mass: §b" ~ values[1],
    "§8Mass variability: §b" ~ values[2],
    "§8Probability: §b" ~ values[3],
    "§8Richness: §b" ~ values[4],
    "§8Richness variability: §b" ~ values[5],
    ]).withDisplayName("§6" + name)] as IIngredient[] :
    output
  });
}

/*Inject_js(
xml_to_js(loadText('config/advRocketry/asteroidConfig.xml')).elements[0].elements.map(
  (asteroid) => [`addAsteroid("${asteroid.attributes.name}"`, `, [${
      Object.entries(asteroid.attributes)
      .filter(([key]) => key !== 'name')
      .sort(([a],[b])=>a.length-b.length)
      .map(([,val]) => val)
      .join(', ')}]`, `, [${
      asteroid.elements
      .map((item) => `<${
        String(item.attributes.itemStack).replace(' ', ':')
      }>.withLore(["§8Chance: §b${item.attributes.chance}"])`)
      .join(', ')}]);`]
))*/
addAsteroid("Iridium Enriched asteroid"     , [25, 100, 0.8, 3, 10, 0.2], [<minecraft:iron_ore>.withLore(["§8Chance: §b25"]), <thermalfoundation:ore:7>.withLore(["§8Chance: §b25"])]);
addAsteroid("Draconium asteroid"            , [64, 75, 0.7, 5, 1, 0.5]  , [<draconicevolution:draconium_ore>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Prosperity asteroid"           , [64, 75, 0.7, 5, 1, 0.5]  , [<mysticalagriculture:prosperity_ore>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Dimensional Shard asteroid"    , [64, 75, 0.7, 5, 1, 0.5]  , [<rftools:dimensional_shard_ore>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Mana Infused asteroid"         , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore:8>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Destabilized Redstone asteroid", [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:2>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Energized Netherrack asteroid" , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:3>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Resonant End Stone asteroid"   , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:4>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Dilithium asteroid"            , [64, 75, 0.7, 5, 1, 0.5]  , [<netherendingores:ore_end_modded_1:14>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Titanium asteroid"             , [64, 75, 0.7, 5, 1, 0.5]  , [<libvulpes:ore0:8>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Starmetal asteroid"            , [64, 75, 0.7, 5, 1, 0.5]  , [<astralsorcery:blockcustomore:1>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Rock Crystal asteroid"         , [64, 75, 0.7, 5, 1, 0.5]  , [<astralsorcery:blockcustomore>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
addAsteroid("Steel asteroid"                , [64, 75, 0.3, 7, 1, 0.2]  , [<thermalfoundation:storage_alloy>.withLore(["§8Chance: §b100"]), <advancedrocketry:hotturf>.withLore(["§8Chance: §b25"])]);
/**/
