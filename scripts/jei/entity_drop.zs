#modloaded requious

#priority 975
#ignoreBracketErrors

import crafttweaker.entity.IEntityDefinition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:entity_drop>;
x.addJEICatalyst(<minecraft:wooden_sword>);
scripts.jei.requious.addInsOuts(x, [[0,0]], [
  [2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],
  [2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],
]);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());

function add(entity as IEntityDefinition, dropList as IItemStack[]) as void {
  // utils.log(['Trying to add drop for:', entity]);
  // if (isNull(game.getEntity(entity))) return;
  var fixedList = [] as IItemStack[];
  for item in dropList {
    if(isNull(item)) continue;
    fixedList += item.amount >= 100
      ? item * (item.amount / 100)
      : item.anyAmount().withLore(["§fChance: §b" ~ item.amount ~ "%"]);
  }
  utils.log(['  ~~ adding:', fixedList.length]);
  scripts.jei.requious.add(<assembly:entity_drop>, {[Soul(entity.id)] as IIngredient[] : fixedList});
  utils.log(['  ~~ finished']);
}

/*Inject_js{
const list = [...getCrtLogBlock(
  '################## Mob Drops #####################',
  '##################################################'
).replace(/\[SERVER_STARTED\]\[SERVER\]\[INFO\] /g, '')
.matchAll(/\d+ ID: (?<id>.+) DISPLAY: (?<display>.+)(?<items>(\n<.+)*)/gm)]

if(!list.length) return cmd.block

return list.map(({ groups: { id, display, items } }) => {
    const filteredMatches = [
      /StatsOriginal: \{/,
      /^<bhc:.+_heart>/,
      /^<minecraft:\w+_(helmet|chestplate|boots|leggins)>/,
      /^<scalinghealth:crystalshard>/,
      /^<openblocks:trophy>/,
      /^<immersiveengineering:shader_bag>/,
    ]
    items = items.trim().split('\n').map(s => s.trim())
      .filter(Boolean)
      .filter(s => !filteredMatches.some(f => s.match(f)))
      .sort(naturalSort)
    return [items.length ? '  ' : '# ', `add(<entity:${id}>`, items, display]
  })
  .sort(([,a, c], [,b, d]) => naturalSort(a, b) || c.length - d.length)
  .map(r => (r[2] = `, [${r[2].join(', ')}]); // ${r.pop()}`, r))
}*/
# add(<entity:astralsorcery:entityflare>              , []); // Flare
# add(<entity:astralsorcery:entityliquidspark>        , []); // Liquid Spark
  add(<entity:betteranimalsplus:badger>               , [<randomthings:fertilizeddirt> * 157, <rats:garbage_pile> * 188, <twilightforest:uberous_soil> * 250]); // Badger
  add(<entity:betteranimalsplus:blackbear>            , [utils.get('betteranimalsplus:bear_skin_black', 0, 90), utils.get('betteranimalsplus:bear_skin_kermode', 0, 9), utils.get('betteranimalsplus:bearhead_2', 0, 9), utils.get('betteranimalsplus:bearhead_3', 0, 1), <minecraft:fish:1> * 102]); // Black Bear
  add(<entity:betteranimalsplus:boar>                 , [utils.get('betteranimalsplus:boarhead_1', 0, 1), utils.get('betteranimalsplus:boarhead_2', 0, 1), utils.get('betteranimalsplus:boarhead_3', 0, 2), utils.get('betteranimalsplus:boarhead_4', 0, 2), <minecraft:porkchop> * 213]); // Boar
  add(<entity:betteranimalsplus:bobbit_worm>          , [<iceandfire:sea_serpent_scales_bronze> * 21]); // Bobbit Worm
  add(<entity:betteranimalsplus:brownbear>            , [utils.get('betteranimalsplus:bear_skin_brown', 0, 93), utils.get('betteranimalsplus:bearhead_1', 0, 8), <minecraft:fish:1> * 107]); // Brown Bear
  add(<entity:betteranimalsplus:coyote>               , [utils.get('betteranimalsplus:coyotehead_1', 0, 6)]); // Coyote
  add(<entity:betteranimalsplus:crab>                 , [<harvestcraft:crabrawitem> * 95, <minecraft:dye:15> * 73]); // Crab
  add(<entity:betteranimalsplus:deer>                 , [utils.get('betteranimalsplus:antler', 0, 200), utils.get('betteranimalsplus:deerhead_1', 0, 3), utils.get('betteranimalsplus:deerhead_2', 0, 5), utils.get('betteranimalsplus:deerhead_4', 0, 2), utils.get('betteranimalsplus:venisonraw', 0, 200)]); // Deer
  add(<entity:betteranimalsplus:eel_freshwater>       , [utils.get('betteranimalsplus:eel_meat_raw', 0, 143)]); // Freshwater Eel
  add(<entity:betteranimalsplus:eel_saltwater>        , [utils.get('betteranimalsplus:eel_meat_raw', 0, 158)]); // Saltwater Eel
  add(<entity:betteranimalsplus:feralwolf>            , [utils.get('betteranimalsplus:wolf_pelt_arctic', 0, 20), utils.get('betteranimalsplus:wolf_pelt_black', 0, 14), utils.get('betteranimalsplus:wolf_pelt_brown', 0, 15), utils.get('betteranimalsplus:wolf_pelt_red', 0, 16), utils.get('betteranimalsplus:wolf_pelt_snowy', 0, 10), utils.get('betteranimalsplus:wolf_pelt_timber', 0, 222), utils.get('betteranimalsplus:wolfhead_1', 0, 1), utils.get('betteranimalsplus:wolfhead_3', 0, 2), utils.get('betteranimalsplus:wolfhead_4', 0, 1), utils.get('betteranimalsplus:wolfhead_5', 0, 1), utils.get('betteranimalsplus:wolfhead_6', 0, 1)]); // Feral Wolf
  add(<entity:betteranimalsplus:fox>                  , [utils.get('betteranimalsplus:foxhead_1', 0, 2), utils.get('betteranimalsplus:foxhead_2', 0, 3), utils.get('betteranimalsplus:foxhead_3', 0, 2), utils.get('betteranimalsplus:foxhead_4', 0, 6), <mysticalagriculture:chunk:8> * 200]); // Fox
  add(<entity:betteranimalsplus:goat>                 , [<minecraft:leather> * 222, <minecraft:mutton> * 204]); // Goat
  add(<entity:betteranimalsplus:goose>                , [<bibliocraft:bell> * 5]); // Goose
  add(<entity:betteranimalsplus:horseshoecrab>        , [<iceandfire:sea_serpent_scales_bronze> * 55]); // Horseshoe Crab
  add(<entity:betteranimalsplus:lammergeier>          , [<minecraft:bone> * 159, <minecraft:feather> * 143]); // Lammergeier
  add(<entity:betteranimalsplus:lamprey>              , [utils.get('betteranimalsplus:eel_meat_raw', 0, 152)]); // Lamprey
  add(<entity:betteranimalsplus:moose>                , [utils.get('betteranimalsplus:antler', 0, 200), utils.get('betteranimalsplus:moosehead_1', 0, 7), utils.get('betteranimalsplus:moosehead_2', 0, 4), utils.get('betteranimalsplus:moosehead_3', 0, 1), utils.get('betteranimalsplus:venisonraw', 0, 652)]); // Moose
  add(<entity:betteranimalsplus:nautilus>             , [<harvestcraft:oysterrawitem> * 202]); // Nautilus
  add(<entity:betteranimalsplus:pheasant>             , [utils.get('betteranimalsplus:pheasantraw', 0, 199)]); // Pheasant
  add(<entity:betteranimalsplus:reindeer>             , [utils.get('betteranimalsplus:antler', 0, 98), utils.get('betteranimalsplus:reindeerhead_1', 0, 2), utils.get('betteranimalsplus:reindeerhead_2', 0, 1), utils.get('betteranimalsplus:reindeerhead_3', 0, 4), utils.get('betteranimalsplus:reindeerhead_4', 0, 1), utils.get('betteranimalsplus:venisonraw', 0, 188), <minecraft:leather> * 109]); // Reindeer
  add(<entity:betteranimalsplus:shark>                , [<minecraft:bone> * 105, <minecraft:fish> * 201, <minecraft:iron_ingot> * 11, <minecraft:prismarine_shard> * 103]); // Shark
  add(<entity:betteranimalsplus:songbird>             , [<minecraft:feather> * 101, <twilightforest:raven_feather> * 207]); // Songbird
  add(<entity:betteranimalsplus:tarantula>            , [<minecraft:arrow> * 2, <minecraft:bone> * 1, <minecraft:bow> * 1, <minecraft:spider_eye> * 27, <minecraft:string> * 105, <randomthings:ingredient:1> * 49]); // Tarantula
  add(<entity:betteranimalsplus:turkey>               , [utils.get('betteranimalsplus:turkey_leg_raw', 0, 126), utils.get('betteranimalsplus:turkey_raw', 0, 16), <minecraft:feather> * 151]); // Turkey
  add(<entity:betteranimalsplus:walrus>               , [utils.get('betteranimalsplus:blubber', 0, 202), <minecraft:leather> * 147]); // Walrus
  add(<entity:betteranimalsplus:whale>                , [utils.get('betteranimalsplus:blubber', 0, 725)]); // Whale
  add(<entity:betteranimalsplus:zotzpyre>             , [<harvestcraft:hardenedleatheritem> * 131, <harvestcraft:netherwingsitem> * 196]); // Zotzpyre
  add(<entity:biomesoplenty:wasp>                     , [<extrautils2:spike_gold> * 50]); // Nether Wasp
  add(<entity:botania:pink_wither>                    , [<enderio:item_alloy_endergy_ingot:4> * 389, <industrialforegoing:pink_slime_ingot> * 585, <mysticalagradditions:stuff:1> * 38, <mysticalagriculture:crafting:4> * 100, <quark:black_ash> * 1606, <thermalfoundation:material:771> * 16]); // Pink Wither
# add(<entity:botania:pixie>                          , []); // Pixie
  add(<entity:deepmoblearning:glitch>                 , [<deepmoblearning:glitch_heart> * 100]); // System Glitch
  add(<entity:deepmoblearning:trial_cave_spider>      , [<minecraft:spider_eye> * 30, <minecraft:string> * 96]); // Trial Cave Spider
  add(<entity:deepmoblearning:trial_enderman>         , [<enderio:block_enderman_skull> * 1, <endreborn:food_ender_flesh> * 100, <minecraft:ender_pearl> * 100]); // Trial Enderman
  add(<entity:deepmoblearning:trial_slime>            , [<minecraft:slime_ball> * 34]); // Trial Slime
  add(<entity:deepmoblearning:trial_spider>           , [<minecraft:spider_eye> * 30, <minecraft:string> * 98]); // Trial Spider
  add(<entity:emberroot:creeper>                      , [<minecraft:gunpowder> * 311, <minecraft:skull:4> * 8]); // Cursed Creeper
# add(<entity:emberroot:deers>                        , []); // Wild Deer
  add(<entity:emberroot:dire_wolf>                    , [<minecraft:bone> * 47, <minecraft:rotten_flesh> * 48]); // Dire Wolf
  add(<entity:emberroot:enderminy>                    , [<minecraft:ender_eye> * 21, <minecraft:ender_pearl> * 19]); // Mini Enderman
  add(<entity:emberroot:fallenmount>                  , [<minecraft:bone> * 46, <minecraft:rotten_flesh> * 52, <minecraft:saddle> * 4]); // Fallen Mount
  add(<entity:emberroot:hero>                         , [<actuallyadditions:item_void_bag> * 12, <cyclicmagic:charm_void> * 8, <cyclicmagic:sack_ender> * 11, <cyclicmagic:storage_bag> * 10, <minecraft:dye> * 25, <minecraft:golden_axe> * 4, <minecraft:golden_sword> * 6, <minecraft:shield> * 2, <minecraft:stone_sword> * 6, <thermalexpansion:satchel:100> * 9]); // Fallen Hero
  add(<entity:emberroot:knight_fallen>                , [<minecraft:arrow> * 121, <minecraft:bone> * 136, <minecraft:iron_sword> * 6, <minecraft:rotten_flesh> * 141, <minecraft:skull:2> * 1, <minecraft:skull> * 3, <minecraft:stone_sword> * 2]); // Fallen Knight
  add(<entity:emberroot:owl>                          , [<emberroot:owl_egg> * 48, <minecraft:feather> * 167]); // Wild Owl
  add(<entity:emberroot:rainbow_golem>                , [<extrautils2:unstableingots:1> * 200, <mysticalagriculture:crafting:39> * 300, <mekanism:nugget:3> * 550, <mechanics:heavy_nugget> * 950, <enderio:item_alloy_nugget:4> * 150, <thermalfoundation:material:228> * 500]); // Nature Golem
  add(<entity:emberroot:rainbowslime>                 , [<minecraft:dye> * 158, <minecraft:slime_ball> * 150]); // entity.rainbowslime.grey.name
  add(<entity:emberroot:rootsonesprite>               , [<minecraft:glowstone_dust> * 101, <mysticalagriculture:dye_essence> * 456]); // Sprite
  add(<entity:emberroot:rootsonespritegreater>        , [<minecraft:emerald> * 61, <minecraft:glowstone> * 71, <mysticalagriculture:platinum_essence> * 135]); // Greater Sprite
  add(<entity:emberroot:rootsonespriteling>           , [<minecraft:glowstone_dust> * 55, <mysticalagriculture:nature_essence> * 196]); // Spriteling
  add(<entity:emberroot:skeleton_frozen>              , [<mctsmelteryio:iceball> * 112, <minecraft:arrow> * 175, <minecraft:bone> * 163, <minecraft:iron_sword> * 5, <minecraft:shield> * 7, <minecraft:skull:2> * 1, <minecraft:skull> * 4, <minecraft:stone_sword> * 3, <minecraft:wooden_sword> * 2]); // Frozen Skeleton
  add(<entity:emberroot:slime>                        , [<minecraft:clay_ball> * 209, <minecraft:dirt> * 62, <thermalfoundation:material:771> * 6]); // Block Slime
  add(<entity:emberroot:sprouts>                      , [<minecraft:beetroot> * 58, <minecraft:dye:1> * 90]); // Rainbow Sprout
  add(<entity:emberroot:timberwolf>                   , [<minecraft:bone> * 42, <minecraft:rotten_flesh> * 44]); // Timberwolf
  add(<entity:emberroot:withercat>                    , [<extrautils2:ingredients:11> * 200, <minecraft:bone> * 37, <minecraft:rotten_flesh> * 29, <minecraft:string> * 32]); // Demon Cat
  add(<entity:emberroot:witherwitch>                  , [<minecraft:bone> * 32, <minecraft:glowstone> * 4, <minecraft:gunpowder> * 75, <minecraft:rotten_flesh> * 38, <minecraft:spider_eye> * 55, <minecraft:string> * 44, <minecraft:sugar> * 66]); // Toxic Witch
  add(<entity:endreborn:chronologist>                 , [<deepmoblearning:living_matter_extraterrestrial> * 149, <minecraft:ender_pearl> * 100]); // Chronologist
  add(<entity:endreborn:endguard>                     , [<endreborn:item_end_shard> * 79, <thermalfoundation:material:771> * 14]); // Purpur Guard
  add(<entity:endreborn:endlord>                      , [<endreborn:sword_shard> * 1, <thermalfoundation:material:771> * 1]); // End-Mage Barclay
  add(<entity:endreborn:watcher>                      , [<endreborn:food_ender_flesh> * 100, <minecraft:ender_eye> * 100]); // Watcher
  add(<entity:excompressum:angry_chicken>             , [<excompressum:chicken_stick>.withTag({IsAngry: 1 as byte}) * 100, <minecraft:chicken> * 100, <minecraft:feather> * 103]); // Angry Chicken
  add(<entity:iceandfire:amphithere>                  , [<iceandfire:amphithere_feather> * 373, <iceandfire:amphithere_skull> * 2]); // Amphithere
  add(<entity:iceandfire:cyclops>                     , [<iceandfire:cyclops_eye> * 50, <iceandfire:cyclops_skull> * 3, <minecraft:leather> * 568, <minecraft:mutton> * 515, <minecraft:wool> * 268]); // Cyclops
  add(<entity:iceandfire:deathworm>                   , [<iceandfire:deathworm_chitin:1> * 91, <iceandfire:deathworm_chitin:2> * 100, <iceandfire:deathworm_chitin> * 79, <iceandfire:deathworm_tounge> * 2, <iceandfire:iceandfire.deathworm_egg:1> * 6, <iceandfire:iceandfire.deathworm_egg> * 12, <minecraft:rotten_flesh> * 214]); // Death Worm
  add(<entity:iceandfire:dread_beast>                 , [<iceandfire:dread_shard> * 72, <minecraft:bone> * 66, <minecraft:rotten_flesh> * 61]); // Dread Beast
  add(<entity:iceandfire:dread_ghoul>                 , [<iceandfire:dread_shard> * 63, <minecraft:bone> * 72, <minecraft:rotten_flesh> * 72]); // Dread Ghoul
  add(<entity:iceandfire:dread_horse>                 , [<minecraft:bone> * 96]); // Dread Knight Horse
  add(<entity:iceandfire:dread_knight>                , [<iceandfire:dread_knight_sword> * 12, <iceandfire:dread_shard> * 72, <minecraft:bone> * 70, <minecraft:iron_ingot> * 28, <minecraft:shield>.withTag({BlockEntityTag: {Patterns: [{Pattern: "iceandfire.dread", Color: 15}]}}) * 3]); // Dread Knight
  add(<entity:iceandfire:dread_lich>                  , [<iceandfire:dread_key> * 10, <iceandfire:dread_shard> * 98, <iceandfire:lich_staff> * 10, <minecraft:bone> * 89]); // Dread Lich
  add(<entity:iceandfire:dread_scuttler>              , [<minecraft:rotten_flesh> * 48, <minecraft:spider_eye> * 52]); // Dread Scuttler
  add(<entity:iceandfire:dread_thrall>                , [<iceandfire:dread_shard> * 109, <iceandfire:dread_sword> * 5, <minecraft:bone> * 100, <minecraft:chainmail_leggings> * 4]); // Dread Thrall
  add(<entity:iceandfire:firedragon>                  , [<thermalfoundation:material:771> * 16]); // Fire Dragon
  add(<entity:iceandfire:gorgon>                      , [<iceandfire:gorgon_head> * 100]); // Gorgon
  add(<entity:iceandfire:hippocampus>                 , [<iceandfire:hippocampus_fin> * 3, <iceandfire:shiny_scales> * 239]); // Hippocampus
  add(<entity:iceandfire:hippogryph>                  , [<iceandfire:hippogryph_skull> * 2, <iceandfire:hippogryph_talon> * 4, <minecraft:feather> * 233, <minecraft:leather> * 244]); // Hippogryph
# add(<entity:iceandfire:icedragon>                   , []); // Ice Dragon
  add(<entity:iceandfire:if_cockatrice>               , [<iceandfire:cockatrice_eye> * 4, <iceandfire:cockatrice_skull> * 2, <iceandfire:witherbone> * 99, <minecraft:chicken> * 204, <minecraft:feather> * 151]); // Cockatrice
# add(<entity:iceandfire:if_hydra>                    , []); // Hydra
  add(<entity:iceandfire:if_pixie>                    , [<iceandfire:pixie_dust> * 103, <iceandfire:pixie_wings> * 4]); // Pixie
  add(<entity:iceandfire:if_troll>                    , [<iceandfire:troll_leather_forest> * 221, <iceandfire:troll_skull> * 3, <iceandfire:troll_tusk> * 58, <minecraft:brown_mushroom> * 113, <minecraft:red_mushroom> * 100]); // Troll
  add(<entity:iceandfire:myrmex_egg>                  , [<iceandfire:myrmex_desert_egg> * 100, <thermalfoundation:material:771> * 19]); // Myrmex Egg
# add(<entity:iceandfire:myrmex_queen>                , []); // Myrmex Queen
# add(<entity:iceandfire:myrmex_royal>                , []); // Myrmex Royal
# add(<entity:iceandfire:myrmex_sentinel>             , []); // Myrmex Sentinel
# add(<entity:iceandfire:myrmex_soldier>              , []); // Myrmex Soldier
# add(<entity:iceandfire:myrmex_swarmer>              , []); // Myrmex Swarmer
# add(<entity:iceandfire:myrmex_worker>               , []); // Myrmex Worker
  add(<entity:iceandfire:seaserpent>                  , [<iceandfire:sea_serpent_fang> * 520, <iceandfire:sea_serpent_scales_blue> * 122, <iceandfire:sea_serpent_scales_bronze> * 119, <iceandfire:sea_serpent_scales_deepblue> * 79, <iceandfire:sea_serpent_scales_green> * 136, <iceandfire:sea_serpent_scales_purple> * 99, <iceandfire:sea_serpent_scales_red> * 105, <iceandfire:sea_serpent_scales_teal> * 87, <iceandfire:seaserpent_skull> * 3]); // Sea Serpent
  add(<entity:iceandfire:siren>                       , [<iceandfire:shiny_scales> * 292, <iceandfire:siren_tear> * 2, <minecraft:prismarine_crystals> * 294, <minecraft:prismarine_shard> * 147]); // Siren
# add(<entity:iceandfire:snowvillager>                , []); // Shaman
# add(<entity:iceandfire:stymphalianbird>             , []); // Stymphalian Bird
  add(<entity:industrialforegoing:pink_slime>         , [<industrialforegoing:pink_slime> * 100]); // Pink Slime
  add(<entity:mekanism:babyskeleton>                  , [<minecraft:arrow> * 103, <minecraft:bone> * 104, <minecraft:bow> * 13, <minecraft:skull> * 3]); // Baby Skeleton
  add(<entity:minecraft:bat>                          , [<actuallyadditions:item_misc:15> * 7, <minecraft:leather> * 79]); // Bat
  add(<entity:minecraft:blaze>                        , [<minecraft:blaze_rod> * 53, <thermalfoundation:material:771> * 17]); // Blaze
  add(<entity:minecraft:cave_spider>                  , [<minecraft:spider_eye> * 37, <minecraft:string> * 108]); // Cave Spider
  add(<entity:minecraft:chicken>                      , [<minecraft:chicken> * 100, <minecraft:feather> * 134]); // Chicken
  add(<entity:minecraft:cow>                          , [<minecraft:beef> * 202, <minecraft:leather> * 101]); // Cow
  add(<entity:minecraft:creeper>                      , [<minecraft:gunpowder> * 99, <minecraft:skull:4> * 2]); // Creeper
  add(<entity:minecraft:donkey>                       , [<minecraft:leather> * 93]); // Donkey
  add(<entity:minecraft:elder_guardian>               , [<enderio:item_material:56> * 100, <minecraft:fish> * 48, <minecraft:prismarine_crystals> * 34, <minecraft:prismarine_shard> * 92, <minecraft:sponge:1> * 100]); // Elder Guardian
  add(<entity:minecraft:enderman>                     , [<enderio:block_enderman_skull> * 4, <endreborn:food_ender_flesh> * 100, <minecraft:ender_pearl> * 100]); // Enderman
  add(<entity:minecraft:endermite>                    , [<appliedenergistics2:material:46> * 208, <endreborn:wolframium_nugget> * 364]); // Endermite
  add(<entity:minecraft:evocation_illager>            , [<minecraft:emerald> * 50, <minecraft:totem_of_undying> * 100]); // Evoker
  add(<entity:minecraft:ghast>                        , [<minecraft:ghast_tear> * 46, <minecraft:gunpowder> * 111, <thermalfoundation:material:771> * 16]); // Ghast
  add(<entity:minecraft:guardian>                     , [<harvestcraft:carprawitem> * 1, <harvestcraft:snapperrawitem> * 1, <harvestcraft:walleyerawitem> * 1, <minecraft:fish:1> * 1, <minecraft:fish> * 43, <minecraft:prismarine_crystals> * 39, <minecraft:prismarine_shard> * 100]); // Guardian
  add(<entity:minecraft:horse>                        , [<minecraft:leather> * 78]); // Horse
  add(<entity:minecraft:husk>                         , [<minecraft:carrot> * 1, <minecraft:chicken> * 2, <minecraft:feather> * 3, <minecraft:iron_ingot> * 2, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 97, <rats:archeologist_hat> * 8, <thaumcraft:brain> * 9]); // Husk
  add(<entity:minecraft:illusion_illager>             , [<minecraft:bow> * 10]); // Illusioner
  add(<entity:minecraft:llama>                        , [<minecraft:leather> * 77]); // Llama
  add(<entity:minecraft:magma_cube>                   , [<minecraft:magma_cream> * 50, <thermalfoundation:material:771> * 9]); // Magma Cube
  add(<entity:minecraft:mooshroom>                    , [<minecraft:beef> * 205, <minecraft:leather> * 105]); // Mooshroom
  add(<entity:minecraft:mule>                         , [<minecraft:leather> * 76]); // Mule
# add(<entity:minecraft:ocelot>                       , []); // Ocelot
  add(<entity:minecraft:parrot>                       , [<minecraft:feather> * 158]); // Parrot
  add(<entity:minecraft:pig>                          , [<minecraft:porkchop> * 199, <quark:tallow> * 192]); // Pig
  add(<entity:minecraft:polar_bear>                   , [<minecraft:fish:1> * 30, <minecraft:fish> * 75]); // Polar Bear
  add(<entity:minecraft:rabbit>                       , [<minecraft:rabbit_foot> * 12, <minecraft:rabbit_hide> * 50, <minecraft:rabbit> * 52]); // Rabbit
  add(<entity:minecraft:sheep>                        , [<minecraft:mutton> * 151, <minecraft:wool:7> * 5, <minecraft:wool:8> * 5, <minecraft:wool:12> * 4, <minecraft:wool:15> * 5, <minecraft:wool> * 82]); // Sheep
  add(<entity:minecraft:shulker>                      , [<darkutils:shulker_pearl> * 60, <minecraft:shulker_shell> * 27, <thermalfoundation:material:771> * 13]); // Shulker
# add(<entity:minecraft:silverfish>                   , []); // Silverfish
  add(<entity:minecraft:skeleton_horse>               , [<minecraft:bone> * 74]); // Skeleton Horse
  add(<entity:minecraft:skeleton>                     , [<minecraft:arrow> * 96, <minecraft:bone> * 91, <minecraft:bow> * 9, <minecraft:skull> * 3]); // Skeleton
  add(<entity:minecraft:slime>                        , [<minecraft:slime_ball> * 81]); // Slime
  add(<entity:minecraft:snowman>                      , [<minecraft:snowball> * 721]); // Snow Golem
  add(<entity:minecraft:spider>                       , [<minecraft:arrow> * 3, <minecraft:bone> * 3, <minecraft:spider_eye> * 31, <minecraft:string> * 107]); // Spider
  add(<entity:minecraft:squid>                        , [<harvestcraft:calamarirawitem> * 238, <minecraft:dye> * 190]); // Squid
  add(<entity:minecraft:stray>                        , [<minecraft:arrow> * 88, <minecraft:bone> * 98, <minecraft:bow> * 9, <minecraft:tipped_arrow>.withTag({Potion: "minecraft:slowness"}) * 54]); // Stray
  add(<entity:minecraft:vex>                          , [<deepmoblearning:living_matter_overworldian> * 383, <thermalfoundation:material:771> * 14]); // Vex
  add(<entity:minecraft:villager_golem>               , [<minecraft:iron_ingot> * 390, <minecraft:red_flower> * 95]); // Iron Golem
# add(<entity:minecraft:villager>                     , []); // Farmer
  add(<entity:minecraft:vindication_illager>          , [<minecraft:emerald> * 51, <minecraft:iron_axe> * 10]); // Vindicator
  add(<entity:minecraft:witch>                        , [<minecraft:glass_bottle> * 20, <minecraft:glowstone_dust> * 24, <minecraft:gunpowder> * 23, <minecraft:redstone> * 29, <minecraft:spider_eye> * 19, <minecraft:stick> * 53, <minecraft:sugar> * 23, <quark:witch_hat> * 2]); // Witch
  add(<entity:minecraft:wither_skeleton>              , [<extrautils2:ingredients:10> * 12, <iceandfire:witherbone> * 45, <minecraft:bone> * 93, <minecraft:skull:1> * 3, <minecraft:stone_sword> * 9, <quark:black_ash> * 155, <tconstruct:materials:17> * 9, <thermalfoundation:material:771> * 16]); // Wither Skeleton
  add(<entity:minecraft:wither>                       , [<minecraft:nether_star> * 100, <mysticalagradditions:stuff:1> * 33, <mysticalagriculture:crafting:4> * 100, <quark:black_ash> * 1600, <thermalfoundation:material:771> * 37]); // Wither
  add(<entity:minecraft:wolf>                         , [utils.get('betteranimalsplus:wolf_pelt_snowy', 0, 108)]); // Wolf
  add(<entity:minecraft:zombie_horse>                 , [<minecraft:rotten_flesh> * 85]); // Zombie Horse
  add(<entity:minecraft:zombie_pigman>                , [<minecraft:gold_ingot> * 52, <minecraft:gold_nugget> * 53, <minecraft:golden_sword> * 8, <minecraft:rotten_flesh> * 24, <thaumcraft:brain> * 9, <thermalfoundation:material:771> * 17]); // Zombie Pigman
  add(<entity:minecraft:zombie_villager>              , [<minecraft:carrot> * 1, <minecraft:potato> * 2, <minecraft:rotten_flesh> * 95, <thaumcraft:brain> * 11]); // Zombie Villager
  add(<entity:minecraft:zombie>                       , [<minecraft:carrot> * 2, <minecraft:iron_ingot> * 2, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 92, <minecraft:skull:2> * 3, <thaumcraft:brain> * 12]); // Zombie
  add(<entity:netherendingores:netherfish>            , [<forestry:ash> * 736, <thermalfoundation:material:771> * 17]); // Netherfish
# add(<entity:openblocks:mini_me>                     , []); // Mini Me
  add(<entity:plustic:blindbandit>                    , [<randomthings:ingredient:13> * 1954, <thermalfoundation:material:771> * 22]); // Blind Bandit
  add(<entity:plustic:supremeleader>                  , [<mechanics:bursting_powder> * 1938]); // Supreme Leader
  add(<entity:quark:archaeologist>                    , [<quark:archaeologist_hat> * 7]); // Archaeologist
  add(<entity:quark:ashen>                            , [<minecraft:arrow> * 99, <minecraft:bone> * 100, <minecraft:skull> * 2]); // Ashen
  add(<entity:quark:crab>                             , [<harvestcraft:crabrawitem> * 199, <quark:crab_shell> * 20]); // Crab
  add(<entity:quark:dweller>                          , [<minecraft:carrot> * 1, <minecraft:iron_ingot> * 1, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 94, <minecraft:skull:2> * 3, <thaumcraft:brain> * 11]); // Dweller
  add(<entity:quark:foxhound>                         , [<minecraft:blaze_powder> * 148, <minecraft:leather> * 141, <thermalfoundation:material:771> * 20]); // Foxhound
  add(<entity:quark:frog>                             , [<quark:cooked_frog_leg> * 100]); // Frog
  add(<entity:quark:pirate>                           , [<minecraft:arrow> * 106, <minecraft:bone> * 105, <minecraft:iron_sword> * 9, <minecraft:skull> * 3, <quark:pirate_hat> * 10]); // Pirate
  add(<entity:quark:stoneling>                        , [<minecraft:coal> * 324, <minecraft:diamond_horse_armor> * 2, <minecraft:diamond> * 3, <minecraft:dye:4> * 54, <minecraft:emerald> * 14, <minecraft:ender_pearl> * 8, <minecraft:gold_ingot> * 38, <minecraft:golden_apple> * 2, <minecraft:golden_horse_armor> * 1, <minecraft:iron_ingot> * 71, <minecraft:redstone> * 113, <minecraft:saddle> * 2, <minecraft:skull:2> * 10, <minecraft:skull:4> * 13, <quark:cooked_frog_leg> * 1, <quark:diamond_heart> * 21]); // Stoneling
  add(<entity:quark:wraith>                           , [<minecraft:skull:2> * 2, <quark:soul_bead> * 100, <thaumcraft:brain> * 11, <thermalfoundation:material:771> * 18]); // Wraith
  add(<entity:randomthings:goldenchicken>             , [<minecraft:chicken> * 100, <minecraft:feather> * 86]); // Golden Chicken
  add(<entity:randomthings:spirit>                    , [<randomthings:ingredient:2> * 116]); // Spirit
  add(<entity:rats:black_death>                       , [<rats:black_death_mask> * 100, <rats:herb_bundle> * 300, <rats:plague_scythe> * 100, <rats:rat_pelt> * 50, <rats:rat_upgrade_fragment> * 1, <rats:raw_rat> * 100, <rats:token_piece> * 195]); // Black Death
  add(<entity:rats:feral_ratlantean>                  , [<rats:feral_rat_claw> * 33, <rats:marbled_cheese_rat_head> * 4, <rats:rat_pelt> * 114, <rats:rat_toga> * 31]); // Feral Ratlantean
  add(<entity:rats:illager_piper>                     , [<minecraft:dye:4> * 229, <minecraft:feather> * 100, <minecraft:gold_nugget> * 241, <rats:piper_hat> * 8, <rats:rat_flute> * 10, <rats:rat_pelt> * 251, <rats:rat_upgrade_fragment> * 2, <rats:raw_rat> * 250, <rats:token_fragment> * 6]); // Pied Piper
  add(<entity:rats:marbled_cheese_golem>              , [<rats:ancient_sawblade> * 100, <rats:arcane_technology> * 100, <thermalfoundation:material:771> * 18]); // Ratlantean Automaton
  add(<entity:rats:neo_ratlantean>                    , [<rats:psionic_rat_brain> * 100]); // Neo-Ratlantean
# add(<entity:rats:pirat_boat>                        , []); // Pirat Boat
  add(<entity:rats:pirat>                             , [<actuallyadditions:block_misc:4> * 196, <rats:pirat_cutlass> * 22, <rats:pirat_hat> * 19, <rats:rat_pelt> * 50, <rats:rat_upgrade_fragment> * 1, <rats:raw_rat> * 100]); // Pirat
  add(<entity:rats:plague_beast>                      , [<rats:feral_rat_claw> * 31, <rats:plague_leech> * 27, <rats:rat_pelt> * 107]); // Plague Beast
  add(<entity:rats:plague_cloud>                      , [<quark:soul_bead> * 189]); // Plague Cloud
  add(<entity:rats:plague_doctor>                     , [<minecraft:rotten_flesh> * 45, <rats:contaminated_food> * 53, <rats:herb_bundle> * 70, <rats:plague_leech> * 28]); // Plague Doctor
  add(<entity:rats:rat>                               , [<rats:rat_pelt> * 50, <rats:raw_rat> * 100]); // Rat
  add(<entity:rats:ratlantean_spirit>                 , [<rats:marbled_cheese_rat_head> * 7, <rats:ratlantean_flame> * 50]); // Ratlantean Spirit
  add(<entity:tconstruct:blueslime>                   , [<tconstruct:edible:1> * 88]); // Blue Slime
  add(<entity:thaumadditions:blue_wolf>               , [<thaumadditions:zeith_fur> * 241]); // Blue Wolf
# add(<entity:thaumcraft:arcanebore>                  , []); // Arcane Bore
  add(<entity:thaumcraft:brainyzombie>                , [<minecraft:carrot> * 3, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 95, <minecraft:skull:2> * 3, <thaumcraft:brain> * 48]); // Angry Zombie
  add(<entity:thaumcraft:cultistcleric>               , [<minecraft:gold_nugget> * 103, <thaumcraft:crimson_boots> * 2, <thaumcraft:crimson_robe_chest> * 3, <thaumcraft:crimson_robe_helm> * 7, <thaumcraft:crimson_robe_legs> * 6, <thaumcraft:curio:6> * 27]); // Crimson Cleric
  add(<entity:thaumcraft:cultistknight>               , [<minecraft:gold_nugget> * 115, <minecraft:iron_sword> * 7, <thaumcraft:crimson_boots> * 5, <thaumcraft:crimson_plate_chest> * 7, <thaumcraft:crimson_plate_helm> * 4, <thaumcraft:crimson_plate_legs> * 6, <thaumcraft:curio:6> * 26]); // Crimson Knight
# add(<entity:thaumcraft:cultistleader>               , []); // Crimson Praetor
  add(<entity:thaumcraft:cultistportalgreater>        , [<thaumcraft:primordial_pearl> * 100]); // Greater Crimson Portal
  add(<entity:thaumcraft:cultistportallesser>         , [<thermalfoundation:material:771> * 17]); // Lesser Crimson Portal
  add(<entity:thaumcraft:eldritchcrab>                , [<minecraft:ender_pearl> * 41]); // Eldritch Crab
# add(<entity:thaumcraft:eldritchguardian>            , []); // Eldritch Guardian
  add(<entity:thaumcraft:firebat>                     , [<minecraft:gunpowder> * 100, <randomthings:flootoken> * 205, <thermalfoundation:material:771> * 17]); // Firebat
  add(<entity:thaumcraft:giantbrainyzombie>           , [<minecraft:chicken> * 1, <minecraft:feather> * 1, <minecraft:iron_ingot> * 1, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 93, <minecraft:skull:2> * 2, <thaumcraft:brain> * 40]); // Furious Zombie
# add(<entity:thaumcraft:golem>                       , []); // Golem
  add(<entity:thaumcraft:inhabitedzombie>             , [<minecraft:chicken> * 1, <minecraft:feather> * 1]); // Shambling Husk
# add(<entity:thaumcraft:mindspider>                  , []); // Mind Spider
  add(<entity:thaumcraft:pech>                        , [<minecraft:bow> * 4, <minecraft:gold_nugget> * 102, <minecraft:iron_pickaxe> * 1, <minecraft:iron_sword> * 1, <minecraft:stone_axe> * 2, <minecraft:stone_pickaxe> * 3, <minecraft:stone_sword> * 1, <thaumcraft:curio:4> * 1, <thaumcraft:pech_wand> * 1]); // Pech Forager
  add(<entity:thaumcraft:taintacle>                   , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 100]); // Taintacle
# add(<entity:thaumcraft:taintaclegiant>              , []); // Giant Taintacle
  add(<entity:thaumcraft:taintacletiny>               , [<thaumcraft:curio:5> * 1]); // Taint Tendril
  add(<entity:thaumcraft:taintcrawler>                , [<minecraft:slime_ball> * 97, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 14]); // Tainted Crawler
  add(<entity:thaumcraft:taintseed>                   , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 100, <thaumcraft:curio:5> * 101]); // Taint Seed
  add(<entity:thaumcraft:taintseedprime>              , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 197]); // Giant Taint Seed
  add(<entity:thaumcraft:taintswarm>                  , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 41, <thaumcraft:curio:5> * 1]); // Taint Swarm
  add(<entity:thaumcraft:thaumslime>                  , [<minecraft:slime_ball> * 139, <thaumcraft:curio:5> * 1, <thermalexpansion:florb>.withTag({Fluid: "liquiddna"}) * 70]); // Thaumic Slime
# add(<entity:thaumcraft:turretadvanced>              , []); // Advanced Automated Crossbow
# add(<entity:thaumcraft:turretbasic>                 , []); // Automated Crossbow
  add(<entity:thaumcraft:wisp>                        , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alienis"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "auram"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "bestia"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "cognitio"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "exanimis"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 18, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "imperium"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "infernum"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "lux"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "metallum"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "mythus"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "permutatio"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "potentia"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "praemunio"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "rattus"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "sonus"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 13, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vinculum"}]}) * 1]); // Wisp
# add(<entity:thaumicaugmentation:autocaster_eldritch>, []); // Eldritch Autocaster
  add(<entity:thaumicaugmentation:autocaster>         , [<thaumicaugmentation:autocaster_placer> * 100]); // Autocaster
# add(<entity:thaumicaugmentation:celestial_observer> , []); // Celestial Observer
  add(<entity:thaumicaugmentation:eldritch_guardian>  , [<thaumcraft:curio:3> * 1, <thaumcraft:loot_bag:1> * 2, <thaumcraft:loot_bag> * 2]); // Eldritch Guardian
  add(<entity:thaumicaugmentation:primal_wisp>        , [<thaumcraft:loot_bag:1> * 100, <thaumcraft:primordial_pearl> * 100, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "amogus"}]}) * 2000, <randomthings:ingredient:2> * 1200, <rftools:infused_enderpearl> * 2]); // Primordial Wisp
# add(<entity:thaumicwonders:corruption_avatar>       , []); // Avatar of Corruption
  add(<entity:thermalfoundation:basalz>               , [<thermalfoundation:material:770> * 108, <thermalfoundation:material:2052> * 45]); // Basalz
  add(<entity:thermalfoundation:blitz>                , [<thermalfoundation:material:772> * 105, <thermalfoundation:material:2050> * 55]); // Blitz
  add(<entity:thermalfoundation:blizz>                , [<minecraft:snowball> * 188, <thermalfoundation:material:2048> * 46]); // Blizz
# add(<entity:twilightforest:adherent>                , []); // Adherent [NYI]
  add(<entity:twilightforest:armored_giant>           , [<twilightforest:giant_sword> * 100]); // Armored Giant
  add(<entity:twilightforest:bighorn_sheep>           , [<minecraft:mutton> * 159, <minecraft:wool:1> * 3, <minecraft:wool:2> * 3, <minecraft:wool:3> * 3, <minecraft:wool:4> * 5, <minecraft:wool:5> * 3, <minecraft:wool:6> * 5, <minecraft:wool:7> * 2, <minecraft:wool:8> * 5, <minecraft:wool:9> * 2, <minecraft:wool:10> * 4, <minecraft:wool:11> * 1, <minecraft:wool:12> * 56, <minecraft:wool:13> * 3, <minecraft:wool:14> * 3, <minecraft:wool:15> * 3, <minecraft:wool> * 3]); // Bighorn Sheep
  add(<entity:twilightforest:blockchain_goblin>       , [<twilightforest:armor_shard> * 104]); // Block and Chain Goblin
  add(<entity:twilightforest:boggard>                 , [<twilightforest:maze_map_focus> * 27]); // Boggard [NYI]
  add(<entity:twilightforest:bunny>                   , [<minecraft:rabbit_foot> * 6, <minecraft:rabbit_hide> * 58, <minecraft:rabbit> * 47]); // Dwarf Rabbit
# add(<entity:twilightforest:castle_guardian>         , []); // Castle Guardian [NYI]
  add(<entity:twilightforest:death_tome>              , [<minecraft:book> * 90, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 16}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 19}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 32}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 2}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 32}, {lvl: 1 as short, id: 57}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 34}]}) * 1, <minecraft:paper> * 352, <minecraft:writable_book> * 8, <twilightforest:magic_map_focus> * 2]); // Death Tome
  add(<entity:twilightforest:deer>                    , [<harvestcraft:venisonrawitem> * 194, <minecraft:leather> * 106]); // Wild Deer
  add(<entity:twilightforest:fire_beetle>             , [<minecraft:gunpowder> * 99, <thermalfoundation:material:771> * 18]); // Fire Beetle
# add(<entity:twilightforest:firefly>                 , []); // Firefly
  add(<entity:twilightforest:giant_miner>             , [<twilightforest:giant_pickaxe> * 100]); // Giant Miner
# add(<entity:twilightforest:goblin_knight_lower>     , []); // Lower Goblin Knight
  add(<entity:twilightforest:goblin_knight_upper>     , [<twilightforest:armor_shard> * 89]); // Upper Goblin Knight
  add(<entity:twilightforest:hedge_spider>            , [<minecraft:arrow> * 2, <minecraft:bone> * 1, <minecraft:spider_eye> * 39, <minecraft:string> * 93]); // Hedge Spider
  add(<entity:twilightforest:helmet_crab>             , [<harvestcraft:crabrawitem> * 94, <twilightforest:armor_shard> * 97]); // Helmet Crab
  add(<entity:twilightforest:hostile_wolf>            , [utils.get('betteranimalsplus:wolf_pelt_snowy', 0, 94)]); // Hostile Wolf
  add(<entity:twilightforest:ice_crystal>             , [<iceandfire:dragon_ice> * 209, <minecraft:snowball> * 98]); // Ice Crystal
  add(<entity:twilightforest:king_spider>             , [<minecraft:arrow> * 2, <minecraft:bone> * 101, <minecraft:golden_hoe> * 9, <minecraft:skull> * 2, <minecraft:spider_eye> * 37, <minecraft:string> * 101, <twilightforest:torchberries> * 98]); // King Spider
  add(<entity:twilightforest:knight_phantom>          , [<thermalfoundation:material:771> * 25, <twilightforest:knightmetal_sword> * 10, <twilightforest:phantom_chestplate> * 6, <twilightforest:phantom_helmet> * 10]); // Knight Phantom
  add(<entity:twilightforest:kobold>                  , [<minecraft:gold_nugget> * 52, <minecraft:wheat> * 104]); // Kobold
  add(<entity:twilightforest:lich_minion>             , [<minecraft:chicken> * 1, <minecraft:feather> * 1]); // Lich Minion
# add(<entity:twilightforest:loyal_zombie>            , []); // Loyal Zombie
  add(<entity:twilightforest:maze_slime>              , [<minecraft:slime_ball> * 220, <twilightforest:charm_of_keeping_1> * 7]); // Maze Slime
  add(<entity:twilightforest:mini_ghast>              , [<minecraft:ghast_tear> * 50, <minecraft:gunpowder> * 98, <thermalfoundation:material:771> * 19]); // Carminite Ghastling
  add(<entity:twilightforest:minoshroom>              , [<twilightforest:meef_stroganoff> * 354, <twilightforest:minotaur_axe> * 100, <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) * 100, <twilightforest:shader>.withTag({shader_type: "Minoshroom"}) * 100, <twilightforest:trophy:6> * 100]); // Minoshroom
  add(<entity:twilightforest:minotaur>                , [<minecraft:golden_axe> * 9, <twilightforest:maze_map_focus> * 6, <twilightforest:minotaur_axe_gold> * 2, <twilightforest:raw_meef> * 44]); // Minotaur
  add(<entity:twilightforest:mist_wolf>               , [utils.get('betteranimalsplus:wolf_pelt_snowy', 0, 93), <twilightforest:charm_of_keeping_1> * 3]); // Mist Wolf
# add(<entity:twilightforest:mosquito_swarm>          , []); // Mosquito Swarm
  add(<entity:twilightforest:naga>                    , [<twilightforest:naga_scale> * 856, <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) * 100, <twilightforest:shader>.withTag({shader_type: "Naga"}) * 100, <twilightforest:trophy> * 100]); // Naga
  add(<entity:twilightforest:penguin>                 , [<minecraft:feather> * 101]); // Penguin
  add(<entity:twilightforest:pinch_beetle>            , [<thermalfoundation:material:2051> * 201]); // Pinch Beetle
# add(<entity:twilightforest:quest_ram>               , []); // Questing Ram
  add(<entity:twilightforest:raven>                   , [<twilightforest:raven_feather> * 89]); // Forest Raven
  add(<entity:twilightforest:redcap_sapper>           , [<minecraft:coal> * 110, <tconevo:material> * 73, <twilightforest:ironwood_boots> * 24, <twilightforest:ironwood_pickaxe> * 24]); // Redcap Sapper
  add(<entity:twilightforest:redcap>                  , [<minecraft:coal> * 101, <minecraft:iron_pickaxe> * 23, <tconevo:material> * 78]); // Redcap Goblin
  add(<entity:twilightforest:rising_zombie>           , [<minecraft:potato> * 1, <minecraft:rotten_flesh> * 106, <minecraft:skull:2> * 3, <thaumcraft:brain> * 11]); // Zombie
  add(<entity:twilightforest:skeleton_druid>          , [<minecraft:bone> * 104, <minecraft:golden_hoe> * 7, <minecraft:skull> * 2, <twilightforest:torchberries> * 94]); // Skeleton Druid
  add(<entity:twilightforest:slime_beetle>            , [<minecraft:slime_ball> * 98, <tconstruct:materials:9> * 195]); // Slime Beetle
  add(<entity:twilightforest:squirrel>                , [<harvestcraft:chestnutitem> * 28, <harvestcraft:hazelnutitem> * 30, <harvestcraft:nutmegitem> * 28, <harvestcraft:peanutitem> * 30, <harvestcraft:waterchestnutitem> * 32]); // Forest Squirrel
  add(<entity:twilightforest:stable_ice_core>         , [<minecraft:snowball> * 98, <mysticalagriculture:ice_essence> * 800]); // Stable Ice Core
  add(<entity:twilightforest:swarm_spider>            , [<minecraft:arrow> * 1, <minecraft:spider_eye> * 32, <minecraft:string> * 92]); // Swarm Spider
  add(<entity:twilightforest:tiny_bird>               , [<minecraft:feather> * 95]); // Tiny Bird
  add(<entity:twilightforest:tower_broodling>         , [<minecraft:spider_eye> * 32, <minecraft:string> * 100, <plustic:osgloglasnugget> * 150]); // Carminite Broodling
  add(<entity:twilightforest:tower_ghast>             , [<minecraft:ghast_tear> * 50, <minecraft:gunpowder> * 102, <thermalfoundation:material:771> * 18]); // Carminite Ghastguard
  add(<entity:twilightforest:tower_golem>             , [<minecraft:iron_ingot> * 101, <twilightforest:tower_wood> * 99]); // Carminite Golem
  add(<entity:twilightforest:tower_termite>           , [<twilightforest:borer_essence> * 87]); // Towerwood Borer
  add(<entity:twilightforest:troll>                   , [<twilightforest:magic_beans> * 4]); // Cave Troll
  add(<entity:twilightforest:unstable_ice_core>       , [<forestry:crafting_material:5> * 591, <minecraft:snowball> * 96]); // Unstable Ice Core
  add(<entity:twilightforest:ur_ghast>                , [<minecraft:ghast_tear> * 51, <minecraft:gunpowder> * 101, <thermalfoundation:material:771> * 16]); // Ur-Ghast
  add(<entity:twilightforest:wild_boar>               , [<minecraft:porkchop> * 203, <minecraft:porkchop>.withTag({display: {Name: "Boarkchop"}}) * 1, <quark:tallow> * 204]); // Wild Boar
  add(<entity:twilightforest:winter_wolf>             , [<twilightforest:arctic_fur> * 106]); // Winter Wolf
  add(<entity:twilightforest:wraith>                  , [<enderio:block_holier_fog> * 2430, <minecraft:glowstone_dust> * 97]); // Twilight Wraith
  add(<entity:twilightforest:yeti_alpha>              , [<twilightforest:alpha_fur> * 600, <twilightforest:ice_bomb> * 600, <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) * 100, <twilightforest:shader>.withTag({shader_type: "Alpha Yeti"}) * 100]); // Alpha Yeti
  add(<entity:twilightforest:yeti>                    , [<twilightforest:arctic_fur> * 104]); // Yeti
/**/

// Manual added drops
add(<entity:emberroot:rootsonespriteboss>, [<minecraft:totem_of_undying> * 100, <mysticalagriculture:crafting:3> * 2000]); // Guardian of Sprites
add(<entity:betteranimalsplus:hirschgeist>, [<mysticalagriculture:crafting:2> * 400, <randomthings:ingredient:2> * 400, utils.get('betteranimalsplus:hirschgeistskull_1', 0, 25)]);
add(<entity:thaumcraft:cultistleader>, [ <thaumcraft:crimson_praetor_helm>.withLore(["§4Need to be stripped"]) * 100, <thaumcraft:crimson_praetor_chest>.withLore(["§6Need to be stripped"]) * 100, <thaumcraft:crimson_praetor_legs>.withLore(["§6Need to be stripped"]) * 100, <thaumcraft:crimson_blade>.withLore(["§6Need to be stripped"]) * 100]);
add(<entity:botania:pixie>, [<jaopca:item_dusttinytitanium> * 150]);

