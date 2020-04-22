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
# <spartanshields:shield_basic_wood>       , <conarm:armor_plate>.withTag({Material: "wood"})             , null,
<spartanshields:shield_basic_stone>        , <conarm:armor_plate>.withTag({Material: "stone"})            , null,
<spartanshields:shield_basic_iron>         , <conarm:armor_plate>.withTag({Material: "iron"})             , <minecraft:iron_ingot>,
<spartanshields:shield_basic_gold>         , <ic2:plate:11>                                               , <minecraft:gold_ingot>,
<spartanshields:shield_basic_diamond>      , <minecraft:diamond_block>                                    , null,
<spartanshields:shield_basic_obsidian>     , <conarm:armor_plate>.withTag({Material: "obsidian"})         , null,
# <spartanshields:shield_tower_wood>       , <conarm:armor_plate>.withTag({Material: "wood"})             , null,
<spartanshields:shield_tower_stone>        , <conarm:armor_plate>.withTag({Material: "stone"})            , null,
<spartanshields:shield_tower_iron>         , <conarm:armor_plate>.withTag({Material: "iron"})             , <minecraft:iron_ingot>,
<spartanshields:shield_tower_gold>         , <ic2:plate:11>                                               , <minecraft:gold_ingot>,
<spartanshields:shield_tower_diamond>      , <minecraft:diamond_block>                                    , null,
<spartanshields:shield_tower_obsidian>     , <conarm:armor_plate>.withTag({Material: "obsidian"})         , null,
<spartanshields:shield_basic_bronze>       , <conarm:armor_plate>.withTag({Material: "bronze"})           , <thermalfoundation:material:163>,
<spartanshields:shield_tower_bronze>       , <conarm:armor_plate>.withTag({Material: "bronze"})           , <thermalfoundation:material:163>,
<spartanshields:shield_basic_steel>        , <conarm:armor_plate>.withTag({Material: "steel"})            , <thermalfoundation:material:160>,
<spartanshields:shield_tower_steel>        , <conarm:armor_plate>.withTag({Material: "steel"})            , <thermalfoundation:material:160>,
<spartanshields:shield_basic_copper>       , <conarm:armor_plate>.withTag({Material: "copper"})           , <thermalfoundation:material:128>,
<spartanshields:shield_tower_copper>       , <conarm:armor_plate>.withTag({Material: "copper"})           , <thermalfoundation:material:128>,
<spartanshields:shield_basic_tin>          , <ic2:plate:17>                                               , <thermalfoundation:material:129>,
<spartanshields:shield_tower_tin>          , <ic2:plate:17>                                               , <thermalfoundation:material:129>,
<spartanshields:shield_basic_silver>       , <conarm:armor_plate>.withTag({Material: "silver"})           , <thermalfoundation:material:130>,
<spartanshields:shield_tower_silver>       , <conarm:armor_plate>.withTag({Material: "silver"})           , <thermalfoundation:material:130>,
<spartanshields:shield_basic_enderium>     , <conarm:armor_plate>.withTag({Material: "enderium_plustic"}) , <thermalfoundation:material:167>,
<spartanshields:shield_basic_invar>        , <conarm:armor_plate>.withTag({Material: "invar"})            , <thermalfoundation:material:162>,
<spartanshields:shield_tower_invar>        , <conarm:armor_plate>.withTag({Material: "invar"})            , <thermalfoundation:material:162>,
<spartanshields:shield_basic_platinum>     , <conarm:armor_plate>.withTag({Material: "platinum_plustic"}) , <thermalfoundation:material:134>,
<spartanshields:shield_tower_platinum>     , <conarm:armor_plate>.withTag({Material: "platinum_plustic"}) , <thermalfoundation:material:134>,
<spartanshields:shield_basic_electrum>     , <conarm:armor_plate>.withTag({Material: "electrum"})         , <thermalfoundation:material:161>,
<spartanshields:shield_tower_electrum>     , <conarm:armor_plate>.withTag({Material: "electrum"})         , <thermalfoundation:material:161>,
<spartanshields:shield_basic_nickel>       , <conarm:armor_plate>.withTag({Material: "nickel"})           , <thermalfoundation:material:133>,
<spartanshields:shield_tower_nickel>       , <conarm:armor_plate>.withTag({Material: "nickel"})           , <thermalfoundation:material:133>,
<spartanshields:shield_basic_lead>         , <conarm:armor_plate>.withTag({Material: "lead"})             , <thermalfoundation:material:131>,
<spartanshields:shield_tower_lead>         , <conarm:armor_plate>.withTag({Material: "lead"})             , <thermalfoundation:material:131>,
<spartanshields:shield_basic_signalum>     , <conarm:armor_plate>.withTag({Material: "signalum_plustic"}) , <thermalfoundation:material:165>,
<spartanshields:shield_basic_lumium>       , <conarm:armor_plate>.withTag({Material: "lumium_plustic"})   , <thermalfoundation:material:166>,
<spartanshields:shield_botania_manasteel>  , <conarm:armor_plate>.withTag({Material: "manasteel"})        , <botania:manaresource>,
<spartanshields:shield_botania_terrasteel> , <conarm:armor_plate>.withTag({Material: "terrasteel"})       , <botania:manaresource:4>,
<spartanshields:shield_botania_elementium> , <conarm:armor_plate>.withTag({Material: "elementium"})       , <botania:manaresource:7>,
<spartanshields:shield_basic_constantan>   , <conarm:armor_plate>.withTag({Material: "constantan"})       , <thermalfoundation:material:164>,
<spartanshields:shield_tower_constantan>   , <conarm:armor_plate>.withTag({Material: "constantan"})       , <thermalfoundation:material:164>,
<spartanshields:shield_tc_thaumium>        , <conarm:armor_plate>.withTag({Material: "thaumium"})         , <thaumcraft:ingot>,
<spartanshields:shield_tc_void>            , <thaumcraft:metal_void>                                      , <thaumcraft:ingot:1>,
] as IItemStack[];


var k as int = 0;
while (k < listShield.length) {
  var shield  = listShield[k];
  var plate   = listShield[k+1];
  var recycle = listShield[k+2];

  # Special case for botania
  if (shield.name.indexOf("botania") > -1){
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

  # All other cases
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

  # Recycling
  if(!isNull(recycle)) {
    mods.immersiveengineering.ArcFurnace.addRecipe(recycle * 8, shield, <immersiveengineering:material:7>, 800, 2048);
  }

  k += 3;
}

# Additional Recycling
mods.immersiveengineering.ArcFurnace.addRecipe(<enderio:item_alloy_ingot:6> * 6, <spartanshields:shield_riot_enderio>, <immersiveengineering:material:7>, 800, 2048);
mods.immersiveengineering.ArcFurnace.addRecipe(<redstonearsenal:material:32> * 8, <spartanshields:shield_flux_ra>, <immersiveengineering:material:7>, 800, 2048);
