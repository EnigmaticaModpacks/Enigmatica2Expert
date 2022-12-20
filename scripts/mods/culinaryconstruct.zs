#modloaded culinaryconstruct

// [Sandwich_Station] from [Cooking_Table][+3]
recipes.remove(<culinaryconstruct:sandwich_station>);
mods.extendedcrafting.TableCrafting.addShaped(0,
  <culinaryconstruct:sandwich_station>, 
  Grid(['pretty',
    '  T  ',
    'F C F',
    'K K K'], {
    C: <cookingforblockheads:cooking_table>, // Cooking Table
    T: <rats:tiny_coin>,                     // Tiny Coin
    F: <nuclearcraft:foursmore>,             // FourS'more QuadS'mingot
    K: <cookingforblockheads:counter>,        // Kitchen Counter
  }).shaped());