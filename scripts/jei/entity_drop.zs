#modloaded requious

#priority 975
#ignoreBracketErrors

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
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

function add(entity as string, dropList as IItemStack[]) as void {
  var fixedList = [] as IItemStack[];
  for item in dropList {
    if(isNull(item)) continue;
    fixedList += item.amount >= 100
      ? item * (item.amount / 100)
      : item.anyAmount().withLore(["§fChance: §b" ~ item.amount ~ "%"]);
  }
  scripts.jei.requious.add(<assembly:entity_drop>, {[Soul(entity)] as IIngredient[] : fixedList});
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
    return [items.length ? '  ' : '# ', `add('${id}'`, items, display]
  })
  .sort(([,a, c], [,b, d]) => naturalSort(a, b) || c.length - d.length)
  .map(r => (r[2] = `, [${r[2].join(', ')}]); // ${r.pop()}`, r))
}*/
  add('animania:buck_alpine'                   , [<animania:raw_prime_chevon> * 146]); // Alpine Buck
  add('animania:buck_angora'                   , [<animania:raw_chevon> * 151]); // Angora Buck
  add('animania:buck_chinchilla'               , [<animania:raw_prime_rabbit> * 52, <minecraft:rabbit_foot> * 263, <minecraft:rabbit_hide> * 49]); // Chinchilla Buck
  add('animania:buck_cottontail'               , [<minecraft:rabbit_foot> * 260, <minecraft:rabbit_hide> * 55, <minecraft:rabbit> * 48]); // Cottontail Buck
  add('animania:buck_dutch'                    , [<minecraft:rabbit_foot> * 264, <minecraft:rabbit_hide> * 48, <minecraft:rabbit> * 50]); // Dutch Buck
  add('animania:buck_fainting'                 , [<animania:raw_chevon> * 146]); // Fainting Buck
  add('animania:buck_havana'                   , [<minecraft:rabbit_foot> * 254, <minecraft:rabbit_hide> * 50, <minecraft:rabbit> * 56]); // Havana Buck
  add('animania:buck_jack'                     , [<minecraft:rabbit_foot> * 263, <minecraft:rabbit_hide> * 51, <minecraft:rabbit> * 47]); // Jack Buck
  add('animania:buck_kiko'                     , [<animania:raw_prime_chevon> * 149]); // Kiko Buck
  add('animania:buck_kinder'                   , [<animania:raw_chevon> * 147]); // Kinder Buck
  add('animania:buck_lop'                      , [<minecraft:rabbit_foot> * 258, <minecraft:rabbit_hide> * 54, <minecraft:rabbit> * 50]); // Lop Buck
  add('animania:buck_new_zealand'              , [<animania:raw_prime_rabbit> * 50, <minecraft:rabbit_foot> * 261, <minecraft:rabbit_hide> * 54]); // New Zealand Buck
  add('animania:buck_nigerian_dwarf'           , [<animania:raw_chevon> * 154]); // Nigerian Dwarf Buck
  add('animania:buck_pygmy'                    , [<animania:raw_prime_chevon> * 148]); // Pygmy Buck
  add('animania:buck_rex'                      , [<animania:raw_prime_rabbit> * 56, <minecraft:rabbit_foot> * 254, <minecraft:rabbit_hide> * 47]); // Rex Buck
  add('animania:bull_angus'                    , [<animania:raw_prime_beef> * 152, <minecraft:leather> * 55]); // Angus Bull
  add('animania:bull_friesian'                 , [<minecraft:beef> * 146, <minecraft:leather> * 53]); // Friesian Bull
  add('animania:bull_hereford'                 , [<animania:raw_prime_beef> * 155, <minecraft:leather> * 58]); // Hereford Bull
  add('animania:bull_highland'                 , [<animania:raw_prime_beef> * 151, <minecraft:leather> * 51]); // Highland Bull
  add('animania:bull_holstein'                 , [<minecraft:beef> * 150, <minecraft:leather> * 46]); // Holstein Bull
  add('animania:bull_jersey'                   , [<animania:raw_prime_beef> * 152, <minecraft:leather> * 50]); // Jersey Bull
  add('animania:bull_longhorn'                 , [<animania:raw_prime_beef> * 154, <minecraft:leather> * 53]); // Longhorn Bull
  add('animania:bull_mooshroom'                , [<nuclearcraft:glowing_mushroom> * 671, <thaumicwonders:vishroom_spore> * 399]); // Mooshroom Bull
# add('animania:calf_angus'                    , []); // Angus Calf
# add('animania:calf_friesian'                 , []); // Friesian Calf
# add('animania:calf_hereford'                 , []); // Hereford Calf
# add('animania:calf_highland'                 , []); // Highland Calf
# add('animania:calf_holstein'                 , []); // Holstein Calf
# add('animania:calf_jersey'                   , []); // Jersey Calf
# add('animania:calf_longhorn'                 , []); // Longhorn Calf
  add('animania:calf_mooshroom'                , [<thaumicwonders:vishroom_spore> * 412, <toolprogression:magic_mushroom> * 100]); // Mooshroom Calf
  add('animania:chick_leghorn'                 , [<minecraft:feather> * 100]); // Leghorn Chick
  add('animania:chick_orpington'               , [<minecraft:feather> * 100]); // Orpington Chick
  add('animania:chick_plymouth_rock'           , [<minecraft:feather> * 100]); // Plymouth Rock Chick
  add('animania:chick_rhode_island_red'        , [<minecraft:feather> * 100]); // Rhode Island Red Chick
  add('animania:chick_wyandotte'               , [<minecraft:feather> * 100]); // Wyandotte Chick
  add('animania:cow_angus'                     , [<animania:raw_prime_beef> * 148, <minecraft:leather> * 52]); // Angus Cow
  add('animania:cow_friesian'                  , [<minecraft:beef> * 148, <minecraft:leather> * 47]); // Friesian Cow
  add('animania:cow_hereford'                  , [<animania:raw_prime_beef> * 150, <minecraft:leather> * 52]); // Hereford Cow
  add('animania:cow_highland'                  , [<animania:raw_prime_beef> * 154, <minecraft:leather> * 47]); // Highland Cow
  add('animania:cow_holstein'                  , [<minecraft:beef> * 154, <minecraft:leather> * 52]); // Holstein Cow
  add('animania:cow_jersey'                    , [<animania:raw_prime_beef> * 145, <minecraft:leather> * 57]); // Jersey Cow
  add('animania:cow_longhorn'                  , [<animania:raw_prime_beef> * 145, <minecraft:leather> * 44]); // Longhorn Cow
  add('animania:cow_mooshroom'                 , [<ic2:crop_seed_bag>.withTag({owner: "ic2", scan: 4 as byte, growth: 20 as byte, id: "red_mushroom", resistance: 20 as byte, gain: 20 as byte}) * 100, <thaumicwonders:vishroom_spore> * 392]); // Mooshroom Cow
  add('animania:dartfrog'                      , [<animania:raw_frog_legs> * 100]); // Dart Frog
  add('animania:doe_alpine'                    , [<animania:raw_prime_chevon> * 148]); // Alpine Doe
  add('animania:doe_angora'                    , [<animania:raw_chevon> * 152]); // Angora Doe
  add('animania:doe_chinchilla'                , [<animania:raw_prime_rabbit> * 51, <minecraft:rabbit_foot> * 265, <minecraft:rabbit_hide> * 57]); // Chinchilla Doe
  add('animania:doe_cottontail'                , [<minecraft:rabbit_foot> * 257, <minecraft:rabbit_hide> * 54, <minecraft:rabbit> * 45]); // Cottontail Doe
  add('animania:doe_dutch'                     , [<minecraft:rabbit_foot> * 259, <minecraft:rabbit_hide> * 48, <minecraft:rabbit> * 53]); // Dutch Doe
  add('animania:doe_fainting'                  , [<animania:raw_chevon> * 147]); // Fainting Doe
  add('animania:doe_havana'                    , [<minecraft:rabbit_foot> * 267, <minecraft:rabbit_hide> * 51, <minecraft:rabbit> * 52]); // Havana Doe
  add('animania:doe_jack'                      , [<minecraft:rabbit_foot> * 266, <minecraft:rabbit_hide> * 45, <minecraft:rabbit> * 48]); // Jack Doe
  add('animania:doe_kiko'                      , [<animania:raw_prime_chevon> * 154]); // Kiko Doe
  add('animania:doe_kinder'                    , [<animania:raw_chevon> * 148]); // Kinder Doe
  add('animania:doe_lop'                       , [<minecraft:rabbit_foot> * 258, <minecraft:rabbit_hide> * 52, <minecraft:rabbit> * 46]); // Lop Doe
  add('animania:doe_new_zealand'               , [<animania:raw_prime_rabbit> * 51, <minecraft:rabbit_foot> * 262, <minecraft:rabbit_hide> * 46]); // New Zealand Doe
  add('animania:doe_nigerian_dwarf'            , [<animania:raw_chevon> * 158]); // Nigerian Dwarf Doe
  add('animania:doe_pygmy'                     , [<animania:raw_prime_chevon> * 148]); // Pygmy Doe
  add('animania:doe_rex'                       , [<animania:raw_prime_rabbit> * 51, <minecraft:rabbit_foot> * 262, <minecraft:rabbit_hide> * 49]); // Rex Doe
  add('animania:ewe_dorper'                    , [<animania:raw_prime_mutton> * 148, <minecraft:wool> * 100]); // Dorper Ewe
  add('animania:ewe_dorset'                    , [<animania:raw_prime_mutton> * 152, <minecraft:wool> * 100]); // Dorset Ewe
  add('animania:ewe_friesian'                  , [<animania:wool:1> * 100, <minecraft:mutton> * 145]); // Friesian Ewe
  add('animania:ewe_jacob'                     , [<animania:wool:3> * 100, <minecraft:mutton> * 150]); // Jacob Ewe
  add('animania:ewe_merino'                    , [<animania:wool:5> * 100, <minecraft:mutton> * 152]); // Merino Ewe
  add('animania:ewe_suffolk'                   , [<animania:raw_prime_mutton> * 148, <minecraft:wool> * 100]); // Suffolk Ewe
  add('animania:ferret_grey'                   , [<actuallyadditions:item_hairy_ball> * 302]); // Grey Ferret
  add('animania:ferret_white'                  , [<actuallyadditions:item_hairy_ball> * 309]); // White Ferret
# add('animania:foal_draft'                    , []); // Draft Horse Foal
  add('animania:frog'                          , [<animania:raw_frog_legs> * 100]); // Frog
  add('animania:hamster'                       , [<actuallyadditions:item_hairy_ball> * 246]); // Hamster
  add('animania:hedgehog_albino'               , [<actuallyadditions:item_worm> * 204, <exnihilocreatio:item_material:2> * 202]); // Albino Hedgehog
  add('animania:hedgehog'                      , [<actuallyadditions:item_worm> * 197, <exnihilocreatio:item_material:2> * 199]); // Hedgehog
  add('animania:hen_leghorn'                   , [<minecraft:chicken> * 100, <minecraft:feather> * 100]); // Leghorn Hen
  add('animania:hen_orpington'                 , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Orpington Hen
  add('animania:hen_plymouth_rock'             , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Plymouth Rock Hen
  add('animania:hen_rhode_island_red'          , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Rhode Island Red Hen
  add('animania:hen_wyandotte'                 , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Wyandotte Hen
  add('animania:hog_duroc'                     , [<animania:raw_prime_pork> * 147, <quark:tallow> * 208]); // Duroc Hog
  add('animania:hog_hampshire'                 , [<animania:raw_prime_pork> * 154, <quark:tallow> * 193]); // Hampshire Hog
  add('animania:hog_large_black'               , [<animania:raw_prime_pork> * 150, <quark:tallow> * 196]); // Large Black Hog
  add('animania:hog_large_white'               , [<minecraft:porkchop> * 150, <quark:tallow> * 211]); // Large White Hog
  add('animania:hog_old_spot'                  , [<animania:raw_prime_pork> * 148, <quark:tallow> * 208]); // Old Spot Hog
  add('animania:hog_yorkshire'                 , [<minecraft:porkchop> * 148, <quark:tallow> * 193]); // American Yorkshire Hog
# add('animania:kid_alpine'                    , []); // Alpine Kid
# add('animania:kid_angora'                    , []); // Angora Kid
# add('animania:kid_fainting'                  , []); // Fainting Kid
# add('animania:kid_kiko'                      , []); // Kiko Kid
# add('animania:kid_kinder'                    , []); // Kinder Kid
# add('animania:kid_nigerian_dwarf'            , []); // Nigerian Dwarf Kid
# add('animania:kid_pygmy'                     , []); // Pygmy Kid
  add('animania:kit_chinchilla'                , [<minecraft:rabbit_foot> * 252]); // Chinchilla Kit
  add('animania:kit_cottontail'                , [<minecraft:rabbit_foot> * 251]); // Cottontail Kit
  add('animania:kit_dutch'                     , [<minecraft:rabbit_foot> * 243]); // Dutch Kit
  add('animania:kit_havana'                    , [<minecraft:rabbit_foot> * 250]); // Havana Kit
  add('animania:kit_jack'                      , [<minecraft:rabbit_foot> * 252]); // Jack Kit
  add('animania:kit_lop'                       , [<minecraft:rabbit_foot> * 251]); // Lop Kit
  add('animania:kit_new_zealand'               , [<minecraft:rabbit_foot> * 244]); // New Zealand Kit
  add('animania:kit_rex'                       , [<minecraft:rabbit_foot> * 249]); // Rex Kit
# add('animania:lamb_dorper'                   , []); // Dorper Lamb
# add('animania:lamb_dorset'                   , []); // Dorset Lamb
# add('animania:lamb_friesian'                 , []); // Friesian Lamb
# add('animania:lamb_jacob'                    , []); // Jacob Lamb
# add('animania:lamb_merino'                   , []); // Merino Lamb
# add('animania:lamb_suffolk'                  , []); // Suffolk Lamb
  add('animania:mare_draft'                    , [<animania:raw_horse> * 154, <minecraft:leather> * 54]); // Draft Horse Mare
# add('animania:peachick_blue'                 , []); // India Blue Peachick
# add('animania:peachick_charcoal'             , []); // Charcoal Peachick
# add('animania:peachick_opal'                 , []); // Opal Peachick
# add('animania:peachick_peach'                , []); // Peach Peachick
# add('animania:peachick_purple'               , []); // Purple Peachick
# add('animania:peachick_taupe'                , []); // Taupe Peachick
# add('animania:peachick_white'                , []); // White Peachick
  add('animania:peacock_blue'                  , [<animania:blue_peacock_feather> * 53, <animania:raw_prime_peacock> * 100]); // India Blue Peacock
  add('animania:peacock_charcoal'              , [<animania:charcoal_peacock_feather> * 56, <animania:raw_peacock> * 100]); // Charcoal Peacock
  add('animania:peacock_opal'                  , [<animania:opal_peacock_feather> * 55, <animania:raw_peacock> * 100]); // Opal Peacock
  add('animania:peacock_peach'                 , [<animania:peach_peacock_feather> * 48, <animania:raw_prime_peacock> * 100]); // Peach Peacock
  add('animania:peacock_purple'                , [<animania:purple_peacock_feather> * 56, <animania:raw_prime_peacock> * 100]); // Purple Peacock
  add('animania:peacock_taupe'                 , [<animania:raw_peacock> * 100, <animania:taupe_peacock_feather> * 49]); // Taupe Peacock
  add('animania:peacock_white'                 , [<animania:raw_prime_peacock> * 100, <animania:white_peacock_feather> * 51]); // White Peacock
  add('animania:peahen_blue'                   , [<animania:raw_prime_peacock> * 100]); // India Blue Peahen
  add('animania:peahen_charcoal'               , [<animania:raw_peacock> * 100]); // Charcoal Peahen
  add('animania:peahen_opal'                   , [<animania:raw_peacock> * 100]); // Opal Peahen
  add('animania:peahen_peach'                  , [<animania:raw_prime_peacock> * 100]); // Peach Peahen
  add('animania:peahen_purple'                 , [<animania:raw_prime_peacock> * 100]); // Purple Peahen
  add('animania:peahen_taupe'                  , [<animania:raw_peacock> * 100]); // Taupe Peahen
  add('animania:peahen_white'                  , [<animania:raw_prime_peacock> * 100]); // White Peahen
  add('animania:piglet_duroc'                  , [<quark:tallow> * 192]); // Duroc Piglet
  add('animania:piglet_hampshire'              , [<quark:tallow> * 211]); // Hampshire Piglet
  add('animania:piglet_large_black'            , [<quark:tallow> * 203]); // Large Black Piglet
  add('animania:piglet_large_white'            , [<quark:tallow> * 197]); // Large White Piglet
  add('animania:piglet_old_spot'               , [<quark:tallow> * 192]); // Old Spot Piglet
  add('animania:piglet_yorkshire'              , [<quark:tallow> * 205]); // American Yorkshire Piglet
  add('animania:ram_dorper'                    , [<animania:raw_prime_mutton> * 145, <minecraft:wool> * 100]); // Dorper Ram
  add('animania:ram_dorset'                    , [<animania:raw_prime_mutton> * 152, <minecraft:wool> * 100]); // Dorset Ram
  add('animania:ram_friesian'                  , [<animania:wool:1> * 100, <minecraft:mutton> * 145]); // Friesian Ram
  add('animania:ram_jacob'                     , [<animania:wool:3> * 100, <minecraft:mutton> * 147]); // Jacob Ram
  add('animania:ram_merino'                    , [<animania:wool:5> * 100, <minecraft:mutton> * 153]); // Merino Ram
  add('animania:ram_suffolk'                   , [<animania:raw_prime_mutton> * 152, <minecraft:wool> * 100]); // Suffolk Ram
  add('animania:rooster_leghorn'               , [<minecraft:chicken> * 100, <minecraft:feather> * 100]); // Leghorn Rooster
  add('animania:rooster_orpington'             , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Orpington Rooster
  add('animania:rooster_plymouth_rock'         , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Plymouth Rock Rooster
  add('animania:rooster_rhode_island_red'      , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 101]); // Rhode Island Red Rooster
  add('animania:rooster_wyandotte'             , [<animania:raw_prime_chicken> * 100, <minecraft:feather> * 100]); // Wyandotte Rooster
  add('animania:sow_duroc'                     , [<animania:raw_prime_pork> * 157, <quark:tallow> * 194]); // Duroc Sow
  add('animania:sow_hampshire'                 , [<animania:raw_prime_pork> * 151, <quark:tallow> * 202]); // Hampshire Sow
  add('animania:sow_large_black'               , [<animania:raw_prime_pork> * 154, <quark:tallow> * 197]); // Large Black Sow
  add('animania:sow_large_white'               , [<minecraft:porkchop> * 153, <quark:tallow> * 201]); // Large White Sow
  add('animania:sow_old_spot'                  , [<animania:raw_prime_pork> * 147, <quark:tallow> * 196]); // Old Spot Sow
  add('animania:sow_yorkshire'                 , [<minecraft:porkchop> * 154, <quark:tallow> * 194]); // American Yorkshire Sow
  add('animania:stallion_draft'                , [<animania:raw_horse> * 117, <minecraft:leather> * 42]); // Draft Horse Stallion
  add('animania:toad'                          , [<animania:raw_frog_legs> * 100]); // Toad
# add('astralsorcery:entityflare'              , []); // Flare
# add('astralsorcery:entityliquidspark'        , []); // Liquid Spark
  add('betteranimalsplus:badger'               , [<randomthings:fertilizeddirt> * 157, <rats:garbage_pile> * 188, <twilightforest:uberous_soil> * 250]); // Badger
  add('betteranimalsplus:blackbear'            , [<betteranimalsplus:bear_skin_black> * 90, <betteranimalsplus:bear_skin_kermode> * 9, <betteranimalsplus:bearhead_2> * 9, <betteranimalsplus:bearhead_3> * 1, <minecraft:fish:1> * 102]); // Black Bear
  add('betteranimalsplus:boar'                 , [<betteranimalsplus:boarhead_1> * 1, <betteranimalsplus:boarhead_2> * 1, <betteranimalsplus:boarhead_3> * 2, <betteranimalsplus:boarhead_4> * 2, <minecraft:porkchop> * 213]); // Boar
  add('betteranimalsplus:bobbit_worm'          , [<iceandfire:sea_serpent_scales_bronze> * 21]); // Bobbit Worm
  add('betteranimalsplus:brownbear'            , [<betteranimalsplus:bear_skin_brown> * 93, <betteranimalsplus:bearhead_1> * 8, <minecraft:fish:1> * 107]); // Brown Bear
  add('betteranimalsplus:coyote'               , [<betteranimalsplus:coyotehead_1> * 6]); // Coyote
  add('betteranimalsplus:crab'                 , [<harvestcraft:crabrawitem> * 95, <minecraft:dye:15> * 73]); // Crab
  add('betteranimalsplus:deer'                 , [<betteranimalsplus:antler> * 200, <betteranimalsplus:deerhead_1> * 3, <betteranimalsplus:deerhead_2> * 5, <betteranimalsplus:deerhead_4> * 2, <betteranimalsplus:venisonraw> * 200]); // Deer
  add('betteranimalsplus:eel_freshwater'       , [<betteranimalsplus:eel_meat_raw> * 143]); // Freshwater Eel
  add('betteranimalsplus:eel_saltwater'        , [<betteranimalsplus:eel_meat_raw> * 158]); // Saltwater Eel
  add('betteranimalsplus:feralwolf'            , [<betteranimalsplus:wolf_pelt_arctic> * 20, <betteranimalsplus:wolf_pelt_black> * 14, <betteranimalsplus:wolf_pelt_brown> * 15, <betteranimalsplus:wolf_pelt_red> * 16, <betteranimalsplus:wolf_pelt_snowy> * 10, <betteranimalsplus:wolf_pelt_timber> * 222, <betteranimalsplus:wolfhead_1> * 1, <betteranimalsplus:wolfhead_3> * 2, <betteranimalsplus:wolfhead_4> * 1, <betteranimalsplus:wolfhead_5> * 1, <betteranimalsplus:wolfhead_6> * 1]); // Feral Wolf
  add('betteranimalsplus:fox'                  , [<betteranimalsplus:foxhead_1> * 2, <betteranimalsplus:foxhead_2> * 3, <betteranimalsplus:foxhead_3> * 2, <betteranimalsplus:foxhead_4> * 6, <mysticalagriculture:chunk:8> * 200]); // Fox
  add('betteranimalsplus:goat'                 , [<minecraft:leather> * 222, <minecraft:mutton> * 204]); // Goat
  add('betteranimalsplus:goose'                , [<bibliocraft:bell> * 5]); // Goose
  add('betteranimalsplus:horseshoecrab'        , [<iceandfire:sea_serpent_scales_bronze> * 55]); // Horseshoe Crab
  add('betteranimalsplus:lammergeier'          , [<minecraft:bone> * 159, <minecraft:feather> * 143]); // Lammergeier
  add('betteranimalsplus:lamprey'              , [<betteranimalsplus:eel_meat_raw> * 152]); // Lamprey
  add('betteranimalsplus:moose'                , [<betteranimalsplus:antler> * 200, <betteranimalsplus:moosehead_1> * 7, <betteranimalsplus:moosehead_2> * 4, <betteranimalsplus:moosehead_3> * 1, <betteranimalsplus:venisonraw> * 652]); // Moose
  add('betteranimalsplus:nautilus'             , [<harvestcraft:oysterrawitem> * 202]); // Nautilus
  add('betteranimalsplus:pheasant'             , [<betteranimalsplus:pheasantraw> * 199]); // Pheasant
  add('betteranimalsplus:reindeer'             , [<betteranimalsplus:antler> * 98, <betteranimalsplus:reindeerhead_1> * 2, <betteranimalsplus:reindeerhead_2> * 1, <betteranimalsplus:reindeerhead_3> * 4, <betteranimalsplus:reindeerhead_4> * 1, <betteranimalsplus:venisonraw> * 188, <minecraft:leather> * 109]); // Reindeer
  add('betteranimalsplus:shark'                , [<minecraft:bone> * 105, <minecraft:fish> * 201, <minecraft:iron_ingot> * 11, <minecraft:prismarine_shard> * 103]); // Shark
  add('betteranimalsplus:songbird'             , [<minecraft:feather> * 101, <twilightforest:raven_feather> * 207]); // Songbird
  add('betteranimalsplus:tarantula'            , [<minecraft:arrow> * 2, <minecraft:bone> * 1, <minecraft:bow> * 1, <minecraft:spider_eye> * 27, <minecraft:string> * 105, <randomthings:ingredient:1> * 49]); // Tarantula
  add('betteranimalsplus:turkey'               , [<betteranimalsplus:turkey_leg_raw> * 126, <betteranimalsplus:turkey_raw> * 16, <minecraft:feather> * 151]); // Turkey
  add('betteranimalsplus:walrus'               , [<betteranimalsplus:blubber> * 202, <minecraft:leather> * 147]); // Walrus
  add('betteranimalsplus:whale'                , [<betteranimalsplus:blubber> * 725]); // Whale
  add('betteranimalsplus:zotzpyre'             , [<harvestcraft:hardenedleatheritem> * 131, <harvestcraft:netherwingsitem> * 196]); // Zotzpyre
  add('biomesoplenty:wasp'                     , [<extrautils2:spike_gold> * 35]); // Nether Wasp
  add('botania:pink_wither'                    , [<enderio:item_alloy_endergy_ingot:4> * 389, <industrialforegoing:pink_slime_ingot> * 585, <mysticalagradditions:stuff:1> * 38, <mysticalagriculture:crafting:4> * 100, <quark:black_ash> * 1606, <thermalfoundation:material:771> * 16]); // Pink Wither
# add('botania:pixie'                          , []); // Pixie
  add('deepmoblearning:glitch'                 , [<deepmoblearning:glitch_heart> * 100]); // System Glitch
  add('deepmoblearning:trial_cave_spider'      , [<minecraft:spider_eye> * 30, <minecraft:string> * 96]); // Trial Cave Spider
  add('deepmoblearning:trial_enderman'         , [<enderio:block_enderman_skull> * 1, <endreborn:food_ender_flesh> * 100, <minecraft:ender_pearl> * 100, <rftoolsdim:dimlet_parcel> * 3]); // Trial Enderman
  add('deepmoblearning:trial_slime'            , [<minecraft:slime_ball> * 34]); // Trial Slime
  add('deepmoblearning:trial_spider'           , [<minecraft:spider_eye> * 30, <minecraft:string> * 98]); // Trial Spider
  add('emberroot:creeper'                      , [<minecraft:gunpowder> * 311, <minecraft:skull:4> * 8]); // Cursed Creeper
# add('emberroot:deers'                        , []); // Wild Deer
  add('emberroot:dire_wolf'                    , [<minecraft:bone> * 47, <minecraft:rotten_flesh> * 48]); // Dire Wolf
  add('emberroot:enderminy'                    , [<minecraft:ender_eye> * 21, <minecraft:ender_pearl> * 19]); // Mini Enderman
  add('emberroot:fairies'                      , [<astralsorcery:itemusabledust> * 344, <minecraft:dye:10> * 93, <minecraft:glowstone_dust> * 86]); // Rainbow Fairy
  add('emberroot:fallenmount'                  , [<minecraft:bone> * 46, <minecraft:rotten_flesh> * 52, <minecraft:saddle> * 4]); // Fallen Mount
  add('emberroot:hero'                         , [<actuallyadditions:item_void_bag> * 12, <cyclicmagic:charm_void> * 8, <cyclicmagic:sack_ender> * 11, <cyclicmagic:storage_bag> * 10, <minecraft:dye> * 25, <minecraft:golden_axe> * 4, <minecraft:golden_sword> * 6, <minecraft:shield> * 2, <minecraft:stone_sword> * 6, <thermalexpansion:satchel:100> * 9]); // Fallen Hero
  add('emberroot:knight_fallen'                , [<minecraft:arrow> * 121, <minecraft:bone> * 136, <minecraft:iron_sword> * 6, <minecraft:rotten_flesh> * 141, <minecraft:skull:2> * 1, <minecraft:skull> * 3, <minecraft:stone_sword> * 2]); // Fallen Knight
  add('emberroot:owl'                          , [<emberroot:owl_egg> * 48, <minecraft:feather> * 167]); // Wild Owl
  add('emberroot:rainbow_golem'                , [<mysticalagriculture:diamond_essence> * 150, <mysticalagriculture:crafting:39> * 300, <mekanism:nugget:3> * 550, <mechanics:heavy_nugget> * 950, <mysticalagriculture:redstone_essence> * 150, <thermalfoundation:material:228> * 500]); // Nature Golem
  add('emberroot:rainbowslime'                 , [<minecraft:dye> * 158, <minecraft:slime_ball> * 150]); // entity.rainbowslime.grey.name
  add('emberroot:rootsonesprite'               , [<minecraft:glowstone_dust> * 101, <mysticalagriculture:dye_essence> * 456]); // Sprite
  add('emberroot:rootsonespritegreater'        , [<minecraft:emerald> * 61, <minecraft:glowstone> * 71, <mysticalagriculture:platinum_essence> * 135]); // Greater Sprite
  add('emberroot:rootsonespriteling'           , [<minecraft:glowstone_dust> * 55, <mysticalagriculture:nature_essence> * 196]); // Spriteling
  add('emberroot:skeleton_frozen'              , [<mctsmelteryio:iceball> * 112, <minecraft:arrow> * 175, <minecraft:bone> * 163, <minecraft:iron_sword> * 5, <minecraft:shield> * 7, <minecraft:skull:2> * 1, <minecraft:skull> * 4, <minecraft:stone_sword> * 3, <minecraft:wooden_sword> * 2]); // Frozen Skeleton
  add('emberroot:slime'                        , [<minecraft:clay_ball> * 209, <minecraft:dirt> * 62, <thermalfoundation:material:771> * 6]); // Block Slime
  add('emberroot:sprouts'                      , [<minecraft:beetroot> * 58, <minecraft:dye:1> * 90]); // Rainbow Sprout
  add('emberroot:timberwolf'                   , [<minecraft:bone> * 42, <minecraft:rotten_flesh> * 44]); // Timberwolf
  add('emberroot:withercat'                    , [<extrautils2:ingredients:11> * 200, <minecraft:bone> * 37, <minecraft:rotten_flesh> * 29, <minecraft:string> * 32]); // Demon Cat
  add('emberroot:witherwitch'                  , [<minecraft:bone> * 32, <minecraft:glowstone> * 4, <minecraft:gunpowder> * 75, <minecraft:rotten_flesh> * 38, <minecraft:spider_eye> * 55, <minecraft:string> * 44, <minecraft:sugar> * 66]); // Toxic Witch
  add('endreborn:chronologist'                 , [<deepmoblearning:living_matter_extraterrestrial> * 149, <minecraft:ender_pearl> * 100]); // Chronologist
  add('endreborn:endguard'                     , [<endreborn:item_end_shard> * 79, <thermalfoundation:material:771> * 14]); // Purpur Guard
  add('endreborn:endlord'                      , [<endreborn:sword_shard> * 1, <thermalfoundation:material:771> * 1]); // End-Mage Barclay
  add('endreborn:watcher'                      , [<endreborn:food_ender_flesh> * 100, <minecraft:ender_eye> * 100]); // Watcher
  add('excompressum:angry_chicken'             , [<excompressum:chicken_stick>.withTag({IsAngry: 1 as byte}) * 100, <minecraft:chicken> * 100, <minecraft:feather> * 103]); // Angry Chicken
  add('iceandfire:amphithere'                  , [<iceandfire:amphithere_feather> * 373, <iceandfire:amphithere_skull> * 2]); // Amphithere
  add('iceandfire:cyclops'                     , [<iceandfire:cyclops_eye> * 50, <iceandfire:cyclops_skull> * 3, <minecraft:leather> * 568, <minecraft:mutton> * 515, <minecraft:wool> * 268]); // Cyclops
  add('iceandfire:deathworm'                   , [<iceandfire:deathworm_chitin:1> * 91, <iceandfire:deathworm_chitin:2> * 100, <iceandfire:deathworm_chitin> * 79, <iceandfire:deathworm_tounge> * 2, <iceandfire:iceandfire.deathworm_egg:1> * 6, <iceandfire:iceandfire.deathworm_egg> * 12, <minecraft:rotten_flesh> * 214]); // Death Worm
  add('iceandfire:dread_beast'                 , [<iceandfire:dread_shard> * 72, <minecraft:bone> * 66, <minecraft:rotten_flesh> * 61]); // Dread Beast
  add('iceandfire:dread_ghoul'                 , [<iceandfire:dread_shard> * 63, <minecraft:bone> * 72, <minecraft:rotten_flesh> * 72]); // Dread Ghoul
  add('iceandfire:dread_horse'                 , [<minecraft:bone> * 96]); // Dread Knight Horse
  add('iceandfire:dread_knight'                , [<iceandfire:dread_knight_sword> * 12, <iceandfire:dread_shard> * 72, <minecraft:bone> * 70, <minecraft:iron_ingot> * 28, <minecraft:shield>.withTag({BlockEntityTag: {Patterns: [{Pattern: "iceandfire.dread", Color: 15}]}}) * 3]); // Dread Knight
  add('iceandfire:dread_lich'                  , [<iceandfire:dread_key> * 10, <iceandfire:dread_shard> * 98, <iceandfire:lich_staff> * 10, <minecraft:bone> * 89]); // Dread Lich
  add('iceandfire:dread_scuttler'              , [<minecraft:rotten_flesh> * 48, <minecraft:spider_eye> * 52]); // Dread Scuttler
  add('iceandfire:dread_thrall'                , [<iceandfire:dread_shard> * 109, <iceandfire:dread_sword> * 5, <minecraft:bone> * 100, <minecraft:chainmail_leggings> * 4]); // Dread Thrall
  add('iceandfire:firedragon'                  , [<thermalfoundation:material:771> * 16]); // Fire Dragon
  add('iceandfire:gorgon'                      , [<iceandfire:gorgon_head> * 100]); // Gorgon
  add('iceandfire:hippocampus'                 , [<iceandfire:hippocampus_fin> * 3, <iceandfire:shiny_scales> * 239]); // Hippocampus
  add('iceandfire:hippogryph'                  , [<iceandfire:hippogryph_skull> * 2, <iceandfire:hippogryph_talon> * 4, <minecraft:feather> * 233, <minecraft:leather> * 244]); // Hippogryph
# add('iceandfire:icedragon'                   , []); // Ice Dragon
  add('iceandfire:if_cockatrice'               , [<iceandfire:cockatrice_eye> * 4, <iceandfire:cockatrice_skull> * 2, <iceandfire:witherbone> * 99, <minecraft:chicken> * 204, <minecraft:feather> * 151]); // Cockatrice
# add('iceandfire:if_hydra'                    , []); // Hydra
  add('iceandfire:if_pixie'                    , [<iceandfire:pixie_dust> * 103, <iceandfire:pixie_wings> * 4]); // Pixie
  add('iceandfire:if_troll'                    , [<iceandfire:troll_leather_forest> * 221, <iceandfire:troll_skull> * 3, <iceandfire:troll_tusk> * 58, <minecraft:brown_mushroom> * 113, <minecraft:red_mushroom> * 100]); // Troll
  add('iceandfire:myrmex_egg'                  , [<iceandfire:myrmex_desert_egg> * 100, <thermalfoundation:material:771> * 19]); // Myrmex Egg
# add('iceandfire:myrmex_queen'                , []); // Myrmex Queen
# add('iceandfire:myrmex_royal'                , []); // Myrmex Royal
# add('iceandfire:myrmex_sentinel'             , []); // Myrmex Sentinel
# add('iceandfire:myrmex_soldier'              , []); // Myrmex Soldier
# add('iceandfire:myrmex_swarmer'              , []); // Myrmex Swarmer
# add('iceandfire:myrmex_worker'               , []); // Myrmex Worker
  add('iceandfire:seaserpent'                  , [<iceandfire:sea_serpent_fang> * 520, <iceandfire:sea_serpent_scales_blue> * 122, <iceandfire:sea_serpent_scales_bronze> * 119, <iceandfire:sea_serpent_scales_deepblue> * 79, <iceandfire:sea_serpent_scales_green> * 136, <iceandfire:sea_serpent_scales_purple> * 99, <iceandfire:sea_serpent_scales_red> * 105, <iceandfire:sea_serpent_scales_teal> * 87, <iceandfire:seaserpent_skull> * 3]); // Sea Serpent
  add('iceandfire:siren'                       , [<iceandfire:shiny_scales> * 292, <iceandfire:siren_tear> * 2, <minecraft:prismarine_crystals> * 294, <minecraft:prismarine_shard> * 147]); // Siren
# add('iceandfire:snowvillager'                , []); // Shaman
# add('iceandfire:stymphalianbird'             , []); // Stymphalian Bird
  add('industrialforegoing:pink_slime'         , [<industrialforegoing:pink_slime> * 100]); // Pink Slime
  add('mekanism:babyskeleton'                  , [<minecraft:arrow> * 103, <minecraft:bone> * 104, <minecraft:bow> * 13, <minecraft:skull> * 3]); // Baby Skeleton
  add('minecraft:bat'                          , [<actuallyadditions:item_misc:15> * 7, <minecraft:leather> * 79]); // Bat
  add('minecraft:blaze'                        , [<minecraft:blaze_rod> * 53, <thermalfoundation:material:771> * 17]); // Blaze
  add('minecraft:cave_spider'                  , [<minecraft:spider_eye> * 37, <minecraft:string> * 108]); // Cave Spider
  add('minecraft:chicken'                      , [<minecraft:chicken> * 100, <minecraft:feather> * 134]); // Chicken
  add('minecraft:cow'                          , [<minecraft:beef> * 202, <minecraft:leather> * 101]); // Cow
  add('minecraft:creeper'                      , [<minecraft:gunpowder> * 99, <minecraft:skull:4> * 2]); // Creeper
  add('minecraft:donkey'                       , [<minecraft:leather> * 93]); // Donkey
  add('minecraft:elder_guardian'               , [<enderio:item_material:56> * 100, <minecraft:fish> * 48, <minecraft:prismarine_crystals> * 34, <minecraft:prismarine_shard> * 92, <minecraft:sponge:1> * 100]); // Elder Guardian
  add('minecraft:enderman'                     , [<enderio:block_enderman_skull> * 4, <endreborn:food_ender_flesh> * 100, <minecraft:ender_pearl> * 100, <rftoolsdim:dimlet_parcel> * 4]); // Enderman
  add('minecraft:endermite'                    , [<appliedenergistics2:material:46> * 208, <endreborn:wolframium_nugget> * 364]); // Endermite
  add('minecraft:evocation_illager'            , [<minecraft:emerald> * 50, <minecraft:totem_of_undying> * 100]); // Evoker
  add('minecraft:ghast'                        , [<minecraft:ghast_tear> * 46, <minecraft:gunpowder> * 111, <thermalfoundation:material:771> * 16]); // Ghast
  add('minecraft:guardian'                     , [<harvestcraft:carprawitem> * 1, <harvestcraft:snapperrawitem> * 1, <harvestcraft:walleyerawitem> * 1, <minecraft:fish:1> * 1, <minecraft:fish> * 43, <minecraft:prismarine_crystals> * 39, <minecraft:prismarine_shard> * 100]); // Guardian
  add('minecraft:horse'                        , [<minecraft:leather> * 78]); // Horse
  add('minecraft:husk'                         , [<minecraft:carrot> * 1, <minecraft:chicken> * 2, <minecraft:feather> * 3, <minecraft:iron_ingot> * 2, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 97, <rats:archeologist_hat> * 8, <thaumcraft:brain> * 9]); // Husk
  add('minecraft:illusion_illager'             , [<minecraft:bow> * 10]); // Illusioner
  add('minecraft:llama'                        , [<minecraft:leather> * 77]); // Llama
  add('minecraft:magma_cube'                   , [<minecraft:magma_cream> * 50, <thermalfoundation:material:771> * 9]); // Magma Cube
  add('minecraft:mooshroom'                    , [<minecraft:beef> * 205, <minecraft:leather> * 105]); // Mooshroom
  add('minecraft:mule'                         , [<minecraft:leather> * 76]); // Mule
# add('minecraft:ocelot'                       , []); // Ocelot
  add('minecraft:parrot'                       , [<minecraft:feather> * 158]); // Parrot
  add('minecraft:pig'                          , [<minecraft:porkchop> * 199, <quark:tallow> * 192]); // Pig
  add('minecraft:polar_bear'                   , [<minecraft:fish:1> * 30, <minecraft:fish> * 75]); // Polar Bear
  add('minecraft:rabbit'                       , [<minecraft:rabbit_foot> * 12, <minecraft:rabbit_hide> * 50, <minecraft:rabbit> * 52]); // Rabbit
  add('minecraft:sheep'                        , [<minecraft:mutton> * 151, <minecraft:wool:7> * 5, <minecraft:wool:8> * 5, <minecraft:wool:12> * 4, <minecraft:wool:15> * 5, <minecraft:wool> * 82]); // Sheep
  add('minecraft:shulker'                      , [<darkutils:shulker_pearl> * 60, <minecraft:shulker_shell> * 27, <thermalfoundation:material:771> * 13]); // Shulker
# add('minecraft:silverfish'                   , []); // Silverfish
  add('minecraft:skeleton_horse'               , [<minecraft:bone> * 74]); // Skeleton Horse
  add('minecraft:skeleton'                     , [<minecraft:arrow> * 96, <minecraft:bone> * 91, <minecraft:bow> * 9, <minecraft:skull> * 3]); // Skeleton
  add('minecraft:slime'                        , [<minecraft:slime_ball> * 81]); // Slime
  add('minecraft:snowman'                      , [<minecraft:snowball> * 721]); // Snow Golem
  add('minecraft:spider'                       , [<minecraft:arrow> * 3, <minecraft:bone> * 3, <minecraft:spider_eye> * 31, <minecraft:string> * 107]); // Spider
  add('minecraft:squid'                        , [<harvestcraft:calamarirawitem> * 238, <minecraft:dye> * 190]); // Squid
  add('minecraft:stray'                        , [<minecraft:arrow> * 88, <minecraft:bone> * 98, <minecraft:bow> * 9, <minecraft:tipped_arrow>.withTag({Potion: "minecraft:slowness"}) * 54]); // Stray
  add('minecraft:vex'                          , [<deepmoblearning:living_matter_overworldian> * 383, <thermalfoundation:material:771> * 14]); // Vex
  add('minecraft:villager_golem'               , [<minecraft:iron_ingot> * 390, <minecraft:red_flower> * 95]); // Iron Golem
# add('minecraft:villager'                     , []); // Farmer
  add('minecraft:vindication_illager'          , [<minecraft:emerald> * 51, <minecraft:iron_axe> * 10]); // Vindicator
  add('minecraft:witch'                        , [<minecraft:glass_bottle> * 20, <minecraft:glowstone_dust> * 24, <minecraft:gunpowder> * 23, <minecraft:redstone> * 29, <minecraft:spider_eye> * 19, <minecraft:stick> * 53, <minecraft:sugar> * 23, <quark:witch_hat> * 2]); // Witch
  add('minecraft:wither_skeleton'              , [<extrautils2:ingredients:10> * 12, <iceandfire:witherbone> * 45, <minecraft:bone> * 93, <minecraft:skull:1> * 3, <minecraft:stone_sword> * 9, <quark:black_ash> * 155, <tconstruct:materials:17> * 9, <thermalfoundation:material:771> * 16]); // Wither Skeleton
  add('minecraft:wither'                       , [<minecraft:nether_star> * 100, <mysticalagradditions:stuff:1> * 33, <mysticalagriculture:crafting:4> * 100, <quark:black_ash> * 1600, <thermalfoundation:material:771> * 37]); // Wither
  add('minecraft:wolf'                         , [<betteranimalsplus:wolf_pelt_snowy> * 108]); // Wolf
  add('minecraft:zombie_horse'                 , [<minecraft:rotten_flesh> * 85]); // Zombie Horse
  add('minecraft:zombie_pigman'                , [<minecraft:gold_ingot> * 52, <minecraft:gold_nugget> * 53, <minecraft:golden_sword> * 8, <minecraft:rotten_flesh> * 24, <thaumcraft:brain> * 9, <thermalfoundation:material:771> * 17]); // Zombie Pigman
  add('minecraft:zombie_villager'              , [<minecraft:carrot> * 1, <minecraft:potato> * 2, <minecraft:rotten_flesh> * 95, <thaumcraft:brain> * 11]); // Zombie Villager
  add('minecraft:zombie'                       , [<minecraft:carrot> * 2, <minecraft:iron_ingot> * 2, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 92, <minecraft:skull:2> * 3, <thaumcraft:brain> * 12]); // Zombie
  add('netherendingores:netherfish'            , [<forestry:ash> * 736, <thermalfoundation:material:771> * 17]); // Netherfish
# add('openblocks:mini_me'                     , []); // Mini Me
  add('plustic:blindbandit'                    , [<randomthings:ingredient:13> * 1954, <thermalfoundation:material:771> * 22]); // Blind Bandit
  add('plustic:supremeleader'                  , [<mechanics:bursting_powder> * 1938]); // Supreme Leader
  add('quark:archaeologist'                    , [<quark:archaeologist_hat> * 7]); // Archaeologist
  add('quark:ashen'                            , [<minecraft:arrow> * 99, <minecraft:bone> * 100, <minecraft:skull> * 2]); // Ashen
  add('quark:crab'                             , [<harvestcraft:crabrawitem> * 199, <quark:crab_shell> * 20]); // Crab
  add('quark:dweller'                          , [<minecraft:carrot> * 1, <minecraft:iron_ingot> * 1, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 94, <minecraft:skull:2> * 3, <thaumcraft:brain> * 11]); // Dweller
  add('quark:foxhound'                         , [<minecraft:blaze_powder> * 148, <minecraft:leather> * 141, <thermalfoundation:material:771> * 20]); // Foxhound
  add('quark:frog'                             , [<quark:cooked_frog_leg> * 100]); // Frog
  add('quark:pirate'                           , [<minecraft:arrow> * 106, <minecraft:bone> * 105, <minecraft:iron_sword> * 9, <minecraft:skull> * 3, <quark:pirate_hat> * 10]); // Pirate
  add('quark:stoneling'                        , [<minecraft:coal> * 324, <minecraft:diamond_horse_armor> * 2, <minecraft:diamond> * 3, <minecraft:dye:4> * 54, <minecraft:emerald> * 14, <minecraft:ender_pearl> * 8, <minecraft:gold_ingot> * 38, <minecraft:golden_apple> * 2, <minecraft:golden_horse_armor> * 1, <minecraft:iron_ingot> * 71, <minecraft:redstone> * 113, <minecraft:saddle> * 2, <minecraft:skull:2> * 10, <minecraft:skull:4> * 13, <quark:cooked_frog_leg> * 1, <quark:diamond_heart> * 21]); // Stoneling
  add('quark:wraith'                           , [<minecraft:skull:2> * 2, <quark:soul_bead> * 100, <thaumcraft:brain> * 11, <thermalfoundation:material:771> * 18]); // Wraith
  add('randomthings:goldenchicken'             , [<minecraft:chicken> * 100, <minecraft:feather> * 86]); // Golden Chicken
  add('randomthings:spirit'                    , [<randomthings:ingredient:2> * 116]); // Spirit
  add('rats:black_death'                       , [<rats:black_death_mask> * 100, <rats:herb_bundle> * 300, <rats:plague_scythe> * 100, <rats:rat_pelt> * 50, <rats:rat_upgrade_fragment> * 1, <rats:raw_rat> * 100, <rats:token_piece> * 195]); // Black Death
  add('rats:feral_ratlantean'                  , [<rats:feral_rat_claw> * 33, <rats:marbled_cheese_rat_head> * 4, <rats:rat_pelt> * 114, <rats:rat_toga> * 31]); // Feral Ratlantean
  add('rats:illager_piper'                     , [<minecraft:dye:4> * 229, <minecraft:feather> * 100, <minecraft:gold_nugget> * 241, <rats:piper_hat> * 8, <rats:rat_flute> * 10, <rats:rat_pelt> * 251, <rats:rat_upgrade_fragment> * 2, <rats:raw_rat> * 250, <rats:token_fragment> * 6]); // Pied Piper
  add('rats:marbled_cheese_golem'              , [<rats:ancient_sawblade> * 100, <rats:arcane_technology> * 100, <thermalfoundation:material:771> * 18]); // Ratlantean Automaton
  add('rats:neo_ratlantean'                    , [<rats:psionic_rat_brain> * 100]); // Neo-Ratlantean
# add('rats:pirat_boat'                        , []); // Pirat Boat
  add('rats:pirat'                             , [<actuallyadditions:block_misc:4> * 196, <rats:pirat_cutlass> * 22, <rats:pirat_hat> * 19, <rats:rat_pelt> * 50, <rats:rat_upgrade_fragment> * 1, <rats:raw_rat> * 100]); // Pirat
  add('rats:plague_beast'                      , [<rats:feral_rat_claw> * 31, <rats:plague_leech> * 27, <rats:rat_pelt> * 107]); // Plague Beast
  add('rats:plague_cloud'                      , [<quark:soul_bead> * 189]); // Plague Cloud
  add('rats:plague_doctor'                     , [<minecraft:rotten_flesh> * 45, <rats:contaminated_food> * 53, <rats:herb_bundle> * 70, <rats:plague_leech> * 28]); // Plague Doctor
  add('rats:rat'                               , [<rats:rat_pelt> * 50, <rats:raw_rat> * 100]); // Rat
  add('rats:ratlantean_spirit'                 , [<rats:marbled_cheese_rat_head> * 7, <rats:ratlantean_flame> * 50]); // Ratlantean Spirit
  add('tconstruct:blueslime'                   , [<tconstruct:edible:1> * 88]); // Blue Slime
  add('thaumadditions:blue_wolf'               , [<thaumadditions:zeith_fur> * 241]); // Blue Wolf
# add('thaumcraft:arcanebore'                  , []); // Arcane Bore
  add('thaumcraft:brainyzombie'                , [<minecraft:carrot> * 3, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 95, <minecraft:skull:2> * 3, <thaumcraft:brain> * 48]); // Angry Zombie
  add('thaumcraft:cultistcleric'               , [<minecraft:gold_nugget> * 103, <thaumcraft:crimson_boots> * 2, <thaumcraft:crimson_robe_chest> * 3, <thaumcraft:crimson_robe_helm> * 7, <thaumcraft:crimson_robe_legs> * 6, <thaumcraft:curio:6> * 27]); // Crimson Cleric
  add('thaumcraft:cultistknight'               , [<minecraft:gold_nugget> * 115, <minecraft:iron_sword> * 7, <thaumcraft:crimson_boots> * 5, <thaumcraft:crimson_plate_chest> * 7, <thaumcraft:crimson_plate_helm> * 4, <thaumcraft:crimson_plate_legs> * 6, <thaumcraft:curio:6> * 26]); // Crimson Knight
# add('thaumcraft:cultistleader'               , []); // Crimson Praetor
  add('thaumcraft:cultistportalgreater'        , [<thaumcraft:primordial_pearl> * 100]); // Greater Crimson Portal
  add('thaumcraft:cultistportallesser'         , [<thermalfoundation:material:771> * 17]); // Lesser Crimson Portal
  add('thaumcraft:eldritchcrab'                , [<minecraft:ender_pearl> * 41]); // Eldritch Crab
# add('thaumcraft:eldritchguardian'            , []); // Eldritch Guardian
  add('thaumcraft:firebat'                     , [<minecraft:gunpowder> * 100, <randomthings:flootoken> * 205, <thermalfoundation:material:771> * 17]); // Firebat
  add('thaumcraft:giantbrainyzombie'           , [<minecraft:chicken> * 1, <minecraft:feather> * 1, <minecraft:iron_ingot> * 1, <minecraft:potato> * 1, <minecraft:rotten_flesh> * 93, <minecraft:skull:2> * 2, <thaumcraft:brain> * 40]); // Furious Zombie
# add('thaumcraft:golem'                       , []); // Golem
  add('thaumcraft:inhabitedzombie'             , [<minecraft:chicken> * 1, <minecraft:feather> * 1]); // Shambling Husk
# add('thaumcraft:mindspider'                  , []); // Mind Spider
  add('thaumcraft:pech'                        , [<minecraft:bow> * 4, <minecraft:gold_nugget> * 102, <minecraft:iron_pickaxe> * 1, <minecraft:iron_sword> * 1, <minecraft:stone_axe> * 2, <minecraft:stone_pickaxe> * 3, <minecraft:stone_sword> * 1, <thaumcraft:curio:4> * 1, <thaumcraft:pech_wand> * 1]); // Pech Forager
  add('thaumcraft:taintacle'                   , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 100]); // Taintacle
# add('thaumcraft:taintaclegiant'              , []); // Giant Taintacle
  add('thaumcraft:taintacletiny'               , [<thaumcraft:curio:5> * 1]); // Taint Tendril
  add('thaumcraft:taintcrawler'                , [<minecraft:slime_ball> * 97, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 14]); // Tainted Crawler
  add('thaumcraft:taintseed'                   , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 100, <thaumcraft:curio:5> * 101]); // Taint Seed
  add('thaumcraft:taintseedprime'              , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 197]); // Giant Taint Seed
  add('thaumcraft:taintswarm'                  , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 41, <thaumcraft:curio:5> * 1]); // Taint Swarm
  add('thaumcraft:thaumslime'                  , [<minecraft:slime_ball> * 139, <thaumcraft:curio:5> * 1, <thermalexpansion:florb>.withTag({Fluid: "liquiddna"}) * 70]); // Thaumic Slime
# add('thaumcraft:turretadvanced'              , []); // Advanced Automated Crossbow
# add('thaumcraft:turretbasic'                 , []); // Automated Crossbow
  add('thaumcraft:wisp'                        , [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alienis"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "auram"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "bestia"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "cognitio"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "exanimis"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 18, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "imperium"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "infernum"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "lux"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "metallum"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "mythus"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) * 15, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "permutatio"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "potentia"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "praemunio"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "rattus"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "sonus"}]}) * 1, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 13, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vinculum"}]}) * 1]); // Wisp
# add('thaumicaugmentation:autocaster_eldritch', []); // Eldritch Autocaster
  add('thaumicaugmentation:autocaster'         , [<thaumicaugmentation:autocaster_placer> * 100]); // Autocaster
# add('thaumicaugmentation:celestial_observer' , []); // Celestial Observer
  add('thaumicaugmentation:eldritch_guardian'  , [<thaumcraft:curio:3> * 1, <thaumcraft:loot_bag:1> * 2, <thaumcraft:loot_bag> * 2]); // Eldritch Guardian
  add('thaumicaugmentation:primal_wisp'        , [<thaumcraft:loot_bag:1> * 100, <thaumcraft:primordial_pearl> * 100]); // Primordial Wisp
# add('thaumicwonders:corruption_avatar'       , []); // Avatar of Corruption
  add('thermalfoundation:basalz'               , [<thermalfoundation:material:770> * 108, <thermalfoundation:material:2052> * 45]); // Basalz
  add('thermalfoundation:blitz'                , [<thermalfoundation:material:772> * 105, <thermalfoundation:material:2050> * 55]); // Blitz
  add('thermalfoundation:blizz'                , [<minecraft:snowball> * 188, <thermalfoundation:material:2048> * 46]); // Blizz
# add('twilightforest:adherent'                , []); // Adherent [NYI]
  add('twilightforest:armored_giant'           , [<twilightforest:giant_sword> * 100]); // Armored Giant
  add('twilightforest:bighorn_sheep'           , [<minecraft:mutton> * 159, <minecraft:wool:1> * 3, <minecraft:wool:2> * 3, <minecraft:wool:3> * 3, <minecraft:wool:4> * 5, <minecraft:wool:5> * 3, <minecraft:wool:6> * 5, <minecraft:wool:7> * 2, <minecraft:wool:8> * 5, <minecraft:wool:9> * 2, <minecraft:wool:10> * 4, <minecraft:wool:11> * 1, <minecraft:wool:12> * 56, <minecraft:wool:13> * 3, <minecraft:wool:14> * 3, <minecraft:wool:15> * 3, <minecraft:wool> * 3]); // Bighorn Sheep
  add('twilightforest:blockchain_goblin'       , [<twilightforest:armor_shard> * 104]); // Block and Chain Goblin
  add('twilightforest:boggard'                 , [<twilightforest:maze_map_focus> * 27]); // Boggard [NYI]
  add('twilightforest:bunny'                   , [<minecraft:rabbit_foot> * 6, <minecraft:rabbit_hide> * 58, <minecraft:rabbit> * 47]); // Dwarf Rabbit
# add('twilightforest:castle_guardian'         , []); // Castle Guardian [NYI]
  add('twilightforest:death_tome'              , [<minecraft:book> * 90, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 16}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 19}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 32}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 2}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 32}, {lvl: 1 as short, id: 57}]}) * 1, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 34}]}) * 1, <minecraft:paper> * 352, <minecraft:writable_book> * 8, <twilightforest:magic_map_focus> * 2]); // Death Tome
  add('twilightforest:deer'                    , [<harvestcraft:venisonrawitem> * 194, <minecraft:leather> * 106]); // Wild Deer
  add('twilightforest:fire_beetle'             , [<minecraft:gunpowder> * 99, <thermalfoundation:material:771> * 18]); // Fire Beetle
# add('twilightforest:firefly'                 , []); // Firefly
  add('twilightforest:giant_miner'             , [<twilightforest:giant_pickaxe> * 100]); // Giant Miner
# add('twilightforest:goblin_knight_lower'     , []); // Lower Goblin Knight
  add('twilightforest:goblin_knight_upper'     , [<twilightforest:armor_shard> * 89]); // Upper Goblin Knight
  add('twilightforest:hedge_spider'            , [<minecraft:arrow> * 2, <minecraft:bone> * 1, <minecraft:spider_eye> * 39, <minecraft:string> * 93]); // Hedge Spider
  add('twilightforest:helmet_crab'             , [<harvestcraft:crabrawitem> * 94, <twilightforest:armor_shard> * 97]); // Helmet Crab
  add('twilightforest:hostile_wolf'            , [<betteranimalsplus:wolf_pelt_snowy> * 94]); // Hostile Wolf
  add('twilightforest:ice_crystal'             , [<iceandfire:dragon_ice> * 209, <minecraft:snowball> * 98]); // Ice Crystal
  add('twilightforest:king_spider'             , [<minecraft:arrow> * 2, <minecraft:bone> * 101, <minecraft:golden_hoe> * 9, <minecraft:skull> * 2, <minecraft:spider_eye> * 37, <minecraft:string> * 101, <twilightforest:torchberries> * 98]); // King Spider
  add('twilightforest:knight_phantom'          , [<thermalfoundation:material:771> * 25, <twilightforest:knightmetal_sword> * 10, <twilightforest:phantom_chestplate> * 6, <twilightforest:phantom_helmet> * 10]); // Knight Phantom
  add('twilightforest:kobold'                  , [<minecraft:gold_nugget> * 52, <minecraft:wheat> * 104]); // Kobold
  add('twilightforest:lich_minion'             , [<minecraft:chicken> * 1, <minecraft:feather> * 1]); // Lich Minion
# add('twilightforest:loyal_zombie'            , []); // Loyal Zombie
  add('twilightforest:maze_slime'              , [<minecraft:slime_ball> * 220, <twilightforest:charm_of_keeping_1> * 7]); // Maze Slime
  add('twilightforest:mini_ghast'              , [<minecraft:ghast_tear> * 50, <minecraft:gunpowder> * 98, <thermalfoundation:material:771> * 19]); // Carminite Ghastling
  add('twilightforest:minoshroom'              , [<twilightforest:meef_stroganoff> * 354, <twilightforest:minotaur_axe> * 100, <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) * 100, <twilightforest:shader>.withTag({shader_type: "Minoshroom"}) * 100, <twilightforest:trophy:6> * 100]); // Minoshroom
  add('twilightforest:minotaur'                , [<minecraft:golden_axe> * 9, <twilightforest:maze_map_focus> * 6, <twilightforest:minotaur_axe_gold> * 2, <twilightforest:raw_meef> * 44]); // Minotaur
  add('twilightforest:mist_wolf'               , [<betteranimalsplus:wolf_pelt_snowy> * 93, <twilightforest:charm_of_keeping_1> * 3]); // Mist Wolf
# add('twilightforest:mosquito_swarm'          , []); // Mosquito Swarm
  add('twilightforest:naga'                    , [<twilightforest:naga_scale> * 856, <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) * 100, <twilightforest:shader>.withTag({shader_type: "Naga"}) * 100, <twilightforest:trophy> * 100]); // Naga
  add('twilightforest:penguin'                 , [<minecraft:feather> * 101]); // Penguin
  add('twilightforest:pinch_beetle'            , [<thermalfoundation:material:2051> * 201]); // Pinch Beetle
# add('twilightforest:quest_ram'               , []); // Questing Ram
  add('twilightforest:raven'                   , [<twilightforest:raven_feather> * 89]); // Forest Raven
  add('twilightforest:redcap_sapper'           , [<minecraft:coal> * 110, <tconevo:material> * 73, <twilightforest:ironwood_boots> * 24, <twilightforest:ironwood_pickaxe> * 24]); // Redcap Sapper
  add('twilightforest:redcap'                  , [<minecraft:coal> * 101, <minecraft:iron_pickaxe> * 23, <tconevo:material> * 78]); // Redcap Goblin
  add('twilightforest:rising_zombie'           , [<minecraft:potato> * 1, <minecraft:rotten_flesh> * 106, <minecraft:skull:2> * 3, <thaumcraft:brain> * 11]); // Zombie
  add('twilightforest:skeleton_druid'          , [<minecraft:bone> * 104, <minecraft:golden_hoe> * 7, <minecraft:skull> * 2, <twilightforest:torchberries> * 94]); // Skeleton Druid
  add('twilightforest:slime_beetle'            , [<minecraft:slime_ball> * 98, <tconstruct:materials:9> * 195]); // Slime Beetle
  add('twilightforest:squirrel'                , [<harvestcraft:chestnutitem> * 28, <harvestcraft:hazelnutitem> * 30, <harvestcraft:nutmegitem> * 28, <harvestcraft:peanutitem> * 30, <harvestcraft:waterchestnutitem> * 32]); // Forest Squirrel
  add('twilightforest:stable_ice_core'         , [<minecraft:snowball> * 98, <mysticalagriculture:ice_essence> * 800]); // Stable Ice Core
  add('twilightforest:swarm_spider'            , [<minecraft:arrow> * 1, <minecraft:spider_eye> * 32, <minecraft:string> * 92]); // Swarm Spider
  add('twilightforest:tiny_bird'               , [<minecraft:feather> * 95]); // Tiny Bird
  add('twilightforest:tower_broodling'         , [<minecraft:arrow> * 1, <minecraft:bone> * 1, <minecraft:spider_eye> * 32, <minecraft:string> * 100]); // Carminite Broodling
  add('twilightforest:tower_ghast'             , [<minecraft:ghast_tear> * 50, <minecraft:gunpowder> * 102, <thermalfoundation:material:771> * 18]); // Carminite Ghastguard
  add('twilightforest:tower_golem'             , [<minecraft:iron_ingot> * 101, <twilightforest:tower_wood> * 99]); // Carminite Golem
  add('twilightforest:tower_termite'           , [<twilightforest:borer_essence> * 87]); // Towerwood Borer
  add('twilightforest:troll'                   , [<twilightforest:magic_beans> * 4]); // Cave Troll
  add('twilightforest:unstable_ice_core'       , [<forestry:crafting_material:5> * 591, <minecraft:snowball> * 96]); // Unstable Ice Core
  add('twilightforest:ur_ghast'                , [<minecraft:ghast_tear> * 51, <minecraft:gunpowder> * 101, <thermalfoundation:material:771> * 16]); // Ur-Ghast
  add('twilightforest:wild_boar'               , [<minecraft:porkchop> * 203, <minecraft:porkchop>.withTag({display: {Name: "Boarkchop"}}) * 1, <quark:tallow> * 204]); // Wild Boar
  add('twilightforest:winter_wolf'             , [<twilightforest:arctic_fur> * 106]); // Winter Wolf
  add('twilightforest:wraith'                  , [<enderio:block_holier_fog> * 2430, <minecraft:glowstone_dust> * 97]); // Twilight Wraith
  add('twilightforest:yeti_alpha'              , [<twilightforest:alpha_fur> * 600, <twilightforest:ice_bomb> * 600, <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) * 100, <twilightforest:shader>.withTag({shader_type: "Alpha Yeti"}) * 100]); // Alpha Yeti
  add('twilightforest:yeti'                    , [<twilightforest:arctic_fur> * 104]); // Yeti
/**/

// Manual added drops
add('emberroot:rootsonespriteboss', [<minecraft:totem_of_undying> * 100, <mysticalagriculture:crafting:3> * 2000]); // Guardian of Sprites
add('betteranimalsplus:hirschgeist', [<mysticalagriculture:crafting:2> * 400, <randomthings:ingredient:2> * 400, <betteranimalsplus:hirschgeistskull_1> * 25]);

