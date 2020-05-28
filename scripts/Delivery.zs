import crafttweaker.item.IItemStack;


// // Get the villager loot table and store it for later use
// val villager = mods.ltt.LootTable.getTable("minecraft:entities/villager");
// // Add a pool called delivery to the villager loot table, then store it for later use
// val delivery = villager.addPool("delivery", 1, 1, 0, 0);
// // Add an apple to "delivery"
// delivery.addItemEntry(<delivery:store_book>, 1);

# TODO: Market purchases

//Set default store item
mods.Delivery.Store.setStoreIcon("_store", <bq_standard:loot_chest:0>);    // "_store" is the name of the default store

# List of outputs <- inputs for market
val loot as IItemStack[IItemStack] = {
<enderio:block_enhanced_alloy_smelter> : <bq_standard:loot_chest:0>,
<enderio:block_enhanced_combustion_generator> : <bq_standard:loot_chest:0>,
<enderio:block_enhanced_sag_mill> : <bq_standard:loot_chest:0>,
<enderio:block_enhanced_vat> : <bq_standard:loot_chest:0>,
<enderio:block_enhanced_wired_charger> : <bq_standard:loot_chest:0>,
<advancedrocketry:basiclasergun> : <bq_standard:loot_chest:0>,
};

for output, input in loot{
  mods.Delivery.Store.addTrade(output).addItem(input);
}


//Notes
/*
    * Stores are automatically created when they are first referenced.
    * If a store icon is not set, it will default to an emerald
    * The default store can be referenced with the id "_store"
    * The default store display name can be edited in the delivery config file
    * You can NOT create an ore dictionary entry with <ore:X>, this is a limitation with CraftTweaker and MC, use .addOre()
*/

//Method Reference
/*
     ~~Add Trade Methods~~
     //Methods adding to default store
     mods.Delivery.Store.addTrade(IItemStack result, IIngredient... inputs)
     mods.Delivery.Store.addTrade(String gamestage, IItemStack result, IIngredient... inputs)
     mods.Delivery.Store.addTrade(IItemStack result)
     mods.Delivery.Store.addTrade(String gamestage, IItemStack result)

    //Methods adding to custom store
     mods.Delivery.Store.addTrade(IItemStack result, String store, IIngredient... inputs)
     mods.Delivery.Store.addTrade(String gamestage, IItemStack result, String store, IIngredient... inputs)
     mods.Delivery.Store.addTrade(IItemStack result, String store)
     mods.Delivery.Store.addTrade(String gamestage, IItemStack result, String store)

     ~~ALL "addTrade" methods return a "Trade", which can be chained with the following methods~~
     addOre(String dict, int size)
     addItem(IItemStack... stacks)
     addIngredient(Ingredient ingredient)

     ~~ALL of those addX methods also return a "Trade", this allows method chaining EG:
     mods.Delivery.Store.addTrade(IItemStack result, String store).addOre(String dict, int size).addItem(IItemStack... stacks)

    ~~Other Methods~~
     mods.Delivery.Store.setStoreIcon(String storeName, IItemStack storeIcon)       //Doesn't return anything
*/