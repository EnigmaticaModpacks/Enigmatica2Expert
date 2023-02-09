#priority 950
#modloaded astralsorcery

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import scripts.jei.requious.add as addRecipe;


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:everflow_chalice>;
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(0,6));
scripts.jei.requious.addInsOuts(x, [[0,0],[2,0]], [[1,1], [0,2], [2,2]]);

function add_everflow_chalice(input1 as IIngredient, input2 as IIngredient, out as IItemStack[]) {
  addRecipe(<assembly:everflow_chalice>, {[input1, input2] : out});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:neromantic_prime>;
x.addJEICatalyst(<astralsorcery:blockbore>);
x.addJEICatalyst(<astralsorcery:blockborehead>);
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIFluidSlot(0, 0, 'fluid_out');

static neromantic_prime_fluids as ILiquidStack[] = [
/*Inject_js(
config('config/astralsorcery/fluid_rarities.cfg').data.data
.slice(0, 9*5)
.map(l=>l.split(';'))
.map(l=>[
  parseInt(l[3]),
  [`  <fluid:${(l[0]+'>')}`,` * ${l[3]},`]
])
.sort(([a], [b]) => b - a)
.map(([,l])=>l)
)*/
  <fluid:mana>              * 1500,
  <fluid:amber>             * 800,
  <fluid:xpjuice>           * 500,
  <fluid:pyrotheum>         * 200,
  <fluid:cryotheum>         * 200,
  <fluid:hydrofluoric_acid> * 120,
  <fluid:mutagen>           * 100,
  <fluid:vibrant_alloy>     * 40,
  <fluid:ic2uu_matter>      * 1,
/**/
];

for i, output in neromantic_prime_fluids {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput("fluid_out", output);
  }));
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:mineralis>;
x.addJEICatalyst(<astralsorcery:blockritualpedestal>);
x.addJEICatalyst(<astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", crystalProperties: {collectiveCapability: 100, size: 900, fract: 0, purity: 100, sizeOverride: -1}}}));
x.addJEICatalyst(<astralsorcery:itemtunedrockcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", crystalProperties: {collectiveCapability: 100, size: 400, fract: 0, purity: 100, sizeOverride: -1}}}));

val mineralisList = [
/*Inject_js{
  const list = config('config/astralsorcery/mineralis_ritual.cfg').data.data
  .map(o=>((a,b)=>[a, parseInt(b)])(...o.split(';')))
  .filter(([od])=>isODExist(od))
  .sort(([,a],[,b])=>b-a)
  let max = _.max(list.map(([,a])=>a))
  return list.map(([od,w])=>`  ${$('ore', od, 0, Math.max(1,(w/max*64)|0), null, '.firstItem')},`)
}*/
  <ore:oreCoal>.firstItem * 64,
  <ore:oreIron>.firstItem * 30,
  <ore:oreTin>.firstItem * 18,
  <ore:oreCopper>.firstItem * 13,
  <ore:oreLead>.firstItem * 12,
  <ore:oreOsmium>.firstItem * 11,
  <ore:oreRedstone>.firstItem * 8,
  <ore:oreAluminum>.firstItem * 7,
  <ore:oreBoron>.firstItem * 7,
  <ore:oreLithium>.firstItem * 7,
  <ore:oreMagnesium>.firstItem * 7,
  <ore:oreThorium>.firstItem * 7,
  <ore:oreGold>.firstItem * 6,
  <ore:oreUranium>.firstItem * 6,
  <ore:oreCertusQuartz>.firstItem * 6,
  <ore:oreNickel>.firstItem * 3,
  <ore:oreDiamond>.firstItem * 2,
  <ore:oreSilver>.firstItem * 2,
  <ore:oreLapis>.firstItem,
  <ore:oreEmerald>.firstItem,
  <ore:oreMithril>.firstItem,
  <ore:orePlatinum>.firstItem,
/**/
] as IItemStack[];

var k = 0;
for _y in 0 .. (mineralisList.length / 9 + 1) as int {
  for _x in 0 .. 9 {
    x.setJEIItemSlot(_x, _y, 'output'~k);
    k += 1;
  }
}

addRecipe(x, {[] : mineralisList});


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------

// Taken from https://github.com/Filostorm/Multiblock-Madness/blob/19659008c64234f96d5607df3f9ca6df7adee778/scripts/Non%20Mod%20Scripts/jei_requious.zs

// // --== Stellar Refraction Table ==-- //
// // TODO Can consider replacing books with items representing enchants for better readability?
// var refraction_table = <assembly:refraction_table>;
// refraction_table.addJEICatalyst(<astralsorcery:blockmapdrawingtable>);
// refraction_table.addJEICatalyst(<astralsorcery:iteminfusedglass>);
// refraction_table.setJEIItemSlot(0, 0, "constellation");
// refraction_table.setJEIDurationSlot(1, 0, "duration", getVisSlots(1,7));
// refraction_table.setJEIItemSlot(2, 0, "enchantment");
// refraction_table.setJEIItemSlot(3, 0, "potion");


// // Doesn't work because CT can't cast IData[] to IData
// // function enchantedBook(enchantments as int[][]) as IItemStack {
// //   var enchantmentList = [] as IData[];
// //   for enchantment in enchantments {
// //     var enchantment_nbt = {
// //       lvl: enchantment[1],
// //       id: enchantment[0]
// //     } as IData;
// //     enchantmentList += enchantment_nbt;
// //   }
// //   return <minecraft:enchanted_book>.withTag({StoredEnchantments: enchantmentList});
// // }

// // Returns an enchanted book given a 2D array of enchantment ids to levels. Can only accept up to 4 enchants

// function enchantedBook(enchantments as IEnchantment[]) as IItemStack {
//   var enchant_count = enchantments.length;

//   if (enchant_count == 1) {
//     return <minecraft:enchanted_book>.withTag({StoredEnchantments: enchantments[0].makeTag().ench});
//   }
//   else if (enchant_count == 2) {
//     return <minecraft:enchanted_book>.withTag({StoredEnchantments: [enchantments[0].makeTag().ench[0], 
//     enchantments[1].makeTag().ench[0]]});
//   }
//   else if (enchant_count == 3) {
//     return <minecraft:enchanted_book>.withTag({StoredEnchantments: [enchantments[0].makeTag().ench[0], 
//     enchantments[1].makeTag().ench[0], enchantments[2].makeTag().ench[0]]});
//   }
//   else if (enchant_count == 4) {
//     return <minecraft:enchanted_book>.withTag({StoredEnchantments: [enchantments[0].makeTag().ench[0], 
//     enchantments[1].makeTag().ench[0], enchantments[2].makeTag().ench[0], enchantments[3].makeTag().ench[0]]});    
//   }
// }

// // Adds Refraction Table outputs to the RQ JEI Page.

// function addRefractionRecipe(info as string, enchantments as IEnchantment[], potions as IPotionEffect[]) {
//     val assRec = AssemblyRecipe.create(function(container) {
//       container.addItemOutput("enchantment", enchantedBook(enchantments));
//       container.addItemOutput("potion", itemUtils.createPotion(potions).withDisplayName("§fStardew"));
//     });
//     assRec.requireItem("constellation", <astralsorcery:itemconstellationpaper>.withTag(
//       {astralsorcery: {constellationName: "astralsorcery.constellation." ~ info}}
//       ).withDisplayName("§f" ~ info));
//     <assembly:refraction_table>.addJEIRecipe(assRec);
// }

// addRefractionRecipe("discidia", [<enchantment:minecraft:sharpness> * 7, <enchantment:minecraft:power> * 7], [<potion:minecraft:strength>.makePotionEffect(7200, 3)]);
// addRefractionRecipe("armara", [<enchantment:minecraft:protection> * 5], [<potion:minecraft:resistance>.makePotionEffect(7200, 2)]);
// addRefractionRecipe("vicio", [<enchantment:minecraft:feather_falling> * 5], [<potion:minecraft:speed>.makePotionEffect(7200, 3)]);
// addRefractionRecipe("aevitas", [<enchantment:minecraft:mending> * 3], [<potion:minecraft:regeneration>.makePotionEffect(7200, 3)]);
// addRefractionRecipe("evorsio", [<enchantment:minecraft:efficiency> * 5], [<potion:minecraft:haste>.makePotionEffect(7200, 3)]);
// addRefractionRecipe("lucerna", [<enchantment:astralsorcery:enchantment.as.nightvision> * 1], [<potion:minecraft:night_vision>.makePotionEffect(7200, 2)]);
// addRefractionRecipe("mineralis", [<enchantment:minecraft:fortune> * 3], [<potion:minecraft:haste>.makePotionEffect(7200, 3)]);
// addRefractionRecipe("horologium", [<enchantment:minecraft:fortune> * 6, <enchantment:minecraft:looting> * 6], 
// [<potion:minecraft:speed>.makePotionEffect(7200, 4), <potion:minecraft:haste>.makePotionEffect(7200, 8)]);
// addRefractionRecipe("octans", [<enchantment:minecraft:respiration> * 4], [<potion:minecraft:water_breathing>.makePotionEffect(7200, 4)]);
// addRefractionRecipe("bootes", [<enchantment:minecraft:silk_touch> * 1], [<potion:minecraft:saturation>.makePotionEffect(7200, 5)]);
// addRefractionRecipe("fornax", [<enchantment:minecraft:fire_aspect> * 3, <enchantment:minecraft:flame> * 2, 
// <enchantment:astralsorcery:enchantment.as.smelting> * 1], [<potion:minecraft:fire_resistance>.makePotionEffect(7200, 0)]);
// addRefractionRecipe("pelotrio", [<enchantment:minecraft:infinity> * 1, <enchantment:minecraft:lure> * 6], 
// [<potion:minecraft:regeneration>.makePotionEffect(7200, 4), <potion:minecraft:absorption>.makePotionEffect(7200, 4)]);
// addRefractionRecipe("gelu", [<enchantment:minecraft:frost_walker> * 2, <enchantment:minecraft:feather_falling> * 4, <enchantment:minecraft:unbreaking> * 4], 
// [<potion:minecraft:resistance>.makePotionEffect(7200, 2), <potion:minecraft:fire_resistance>.makePotionEffect(7200, 0), <potion:minecraft:slowness>.makePotionEffect(7200, 1)]);
// addRefractionRecipe("ulteria", [<enchantment:minecraft:unbreaking> * 3, <enchantment:minecraft:fire_protection> * 6, 
// <enchantment:minecraft:blast_protection> * 6, <enchantment:minecraft:projectile_protection> * 6], 
// [<potion:minecraft:absorption>.makePotionEffect(7200, 2), <potion:minecraft:regeneration>.makePotionEffect(7200, 1), <potion:minecraft:weakness>.makePotionEffect(7200, 2)]);
// addRefractionRecipe("alcara", [<enchantment:minecraft:sweeping> * 7, <enchantment:minecraft:lure> * 5, <enchantment:minecraft:luck_of_the_sea> * 6], 
// [<potion:minecraft:luck>.makePotionEffect(7200, 4), <potion:minecraft:invisibility>.makePotionEffect(7200, 1),<potion:minecraft:hunger>.makePotionEffect(7200, 2)]);
// addRefractionRecipe("vorux", [<enchantment:minecraft:smite> * 7, <enchantment:minecraft:bane_of_arthropods> * 7, 
// <enchantment:minecraft:sharpness> * 4, <enchantment:minecraft:power> * 4], 
// [<potion:minecraft:strength>.makePotionEffect(7200, 3), <potion:minecraft:resistance>.makePotionEffect(7200, 1),<potion:minecraft:mining_fatigue>.makePotionEffect(7200, 3)]);
