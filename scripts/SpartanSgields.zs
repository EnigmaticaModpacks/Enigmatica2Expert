import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

# ########################
# Spartan Shield
# ########################
// getItemsByRegexRegistryName(String Regex)
// <spartanshields:shield_basic_diamond>
// for shield in itemUtils.getItemsByRegexRegistryName("spartanshields:shield.+_") {
//   var recList = recipes.getRecipesFor(shield);

//   # Iterate each recipe
//   for rec in recList {
//     for ingr1d in rec.ingredients2D {
//       for ingr in ingr1d{
//         for item in ingr.items{
//           val oreEntry = jaopcaGetEntry(item);
//           oreEntry.oreName.toLowerCase();
//         }
//       }
//     }
//   }

//   recipes.remove(shield);
//   var shielding = <tconstruct:large_plate>.withTag({Material: "bone"});
//   recipes.addShapedMirrored(shield, [
//       [demonPlate, shielding, demonPlate],
//       [shielding, null, shielding], 
//       [demonPlate, shielding, demonPlate]
// 		]);
// }

var listShield = [
# <spartanshields:shield_basic_wood>        , <conarm:armor_plate>.withTag({Material: "wood"}),
<spartanshields:shield_basic_stone>       , <conarm:armor_plate>.withTag({Material: "stone"}),
<spartanshields:shield_basic_iron>        , <conarm:armor_plate>.withTag({Material: "iron"}),
<spartanshields:shield_basic_gold>        , <ic2:plate:11>,
<spartanshields:shield_basic_diamond>     , <minecraft:diamond_block>,
<spartanshields:shield_basic_obsidian>    , <conarm:armor_plate>.withTag({Material: "obsidian"}),
# <spartanshields:shield_tower_wood>        , <conarm:armor_plate>.withTag({Material: "wood"}),
<spartanshields:shield_tower_stone>       , <conarm:armor_plate>.withTag({Material: "stone"}),
<spartanshields:shield_tower_iron>        , <conarm:armor_plate>.withTag({Material: "iron"}),
<spartanshields:shield_tower_gold>        , <ic2:plate:11>,
<spartanshields:shield_tower_diamond>     , <minecraft:diamond_block>,
<spartanshields:shield_tower_obsidian>    , <conarm:armor_plate>.withTag({Material: "obsidian"}),
<spartanshields:shield_basic_bronze>      , <conarm:armor_plate>.withTag({Material: "bronze"}),
<spartanshields:shield_tower_bronze>      , <conarm:armor_plate>.withTag({Material: "bronze"}),
<spartanshields:shield_basic_steel>       , <conarm:armor_plate>.withTag({Material: "steel"}),
<spartanshields:shield_tower_steel>       , <conarm:armor_plate>.withTag({Material: "steel"}),
<spartanshields:shield_basic_copper>      , <conarm:armor_plate>.withTag({Material: "copper"}),
<spartanshields:shield_tower_copper>      , <conarm:armor_plate>.withTag({Material: "copper"}),
<spartanshields:shield_basic_tin>         , <ic2:plate:17>,
<spartanshields:shield_tower_tin>         , <ic2:plate:17>,
<spartanshields:shield_basic_silver>      , <conarm:armor_plate>.withTag({Material: "silver"}),
<spartanshields:shield_tower_silver>      , <conarm:armor_plate>.withTag({Material: "silver"}),
<spartanshields:shield_basic_enderium>    , <conarm:armor_plate>.withTag({Material: "enderium_plustic"}),
<spartanshields:shield_basic_invar>       , <conarm:armor_plate>.withTag({Material: "invar"}),
<spartanshields:shield_tower_invar>       , <conarm:armor_plate>.withTag({Material: "invar"}),
<spartanshields:shield_basic_platinum>    , <conarm:armor_plate>.withTag({Material: "platinum_plustic"}),
<spartanshields:shield_tower_platinum>    , <conarm:armor_plate>.withTag({Material: "platinum_plustic"}),
<spartanshields:shield_basic_electrum>    , <conarm:armor_plate>.withTag({Material: "electrum"}),
<spartanshields:shield_tower_electrum>    , <conarm:armor_plate>.withTag({Material: "electrum"}),
<spartanshields:shield_basic_nickel>      , <conarm:armor_plate>.withTag({Material: "nickel"}),
<spartanshields:shield_tower_nickel>      , <conarm:armor_plate>.withTag({Material: "nickel"}),
<spartanshields:shield_basic_lead>        , <conarm:armor_plate>.withTag({Material: "lead"}),
<spartanshields:shield_tower_lead>        , <conarm:armor_plate>.withTag({Material: "lead"}),
<spartanshields:shield_basic_signalum>    , <conarm:armor_plate>.withTag({Material: "signalum_plustic"}),
<spartanshields:shield_basic_lumium>      , <conarm:armor_plate>.withTag({Material: "lumium_plustic"}),
<spartanshields:shield_botania_manasteel> , <conarm:armor_plate>.withTag({Material: "manasteel"}),
<spartanshields:shield_botania_terrasteel>, <conarm:armor_plate>.withTag({Material: "terrasteel"}),
<spartanshields:shield_botania_elementium>, <conarm:armor_plate>.withTag({Material: "elementium"}),
<spartanshields:shield_basic_constantan>  , <conarm:armor_plate>.withTag({Material: "constantan"}),
<spartanshields:shield_tower_constantan>  , <conarm:armor_plate>.withTag({Material: "constantan"}),
<spartanshields:shield_tc_thaumium>       , <conarm:armor_plate>.withTag({Material: "thaumium"}),
<spartanshields:shield_tc_void>           , <thaumcraft:metal_void>
] as IItemStack[];


var k as int = 0;
while (k < listShield.length) {
  var shield = listShield[k];
  var plate = listShield[k+1];
  if (shield.name.indexOf("botania") > -1){
    # Special case for botania
    var recList = recipes.getRecipesFor(shield);

    recipes.remove(shield);
    # Iterate each recipe
    for rec in recList {
      var listIngr = rec.ingredients2D;
      listIngr[0][0] = plate;
      listIngr[0][2] = plate;
      listIngr[1][0] = plate;
      listIngr[1][2] = plate;

      recipes.addShaped(shield, listIngr);
    }
  }else{
    var bind = (shield.name.indexOf("tower") > -1) ?
      <spartanshields:shield_tower_wood> :
      <spartanshields:shield_basic_wood>;
    
    recipes.remove(shield);
    recipes.addShaped(shield, [
      [null, plate, <harvestcraft:hardenedleatheritem>],
      [plate, bind , plate], 
      [<harvestcraft:hardenedleatheritem>, plate, null]]);
  }
  k += 2;
}
