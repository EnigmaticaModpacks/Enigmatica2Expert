import crafttweaker.item.IItemStack;


// // Get the villager loot table and store it for later use
// val villager = mods.ltt.LootTable.getTable("minecraft:entities/villager");
// // Add a pool called delivery to the villager loot table, then store it for later use
// val delivery = villager.addPool("delivery", 1, 1, 0, 0);
// // Add an apple to "delivery"
// delivery.addItemEntry(<delivery:store_book>, 1);


//Set default store item
mods.Delivery.Store.setStoreIcon("_store", <bq_standard:loot_chest:0>);    // "_store" is the name of the default store

val loot as IItemStack[] = [
  <bq_standard:loot_chest:0>,
  <bq_standard:loot_chest:25>,
  <bq_standard:loot_chest:50>,
  <bq_standard:loot_chest:75>,
  <bq_standard:loot_chest:100>,
  <bq_standard:loot_chest:101>
  ] as IItemStack[];

mods.Delivery.Store.addTrade(loot[3]).addItem(loot[5], loot[5], loot[5], loot[5]);
mods.Delivery.Store.addTrade(loot[3]).addItem(loot[4], loot[4], loot[4], loot[4]);
mods.Delivery.Store.addTrade(loot[2]).addItem(loot[3], loot[3], loot[3], loot[3]);
mods.Delivery.Store.addTrade(loot[1]).addItem(loot[2], loot[2], loot[2], loot[2]);
mods.Delivery.Store.addTrade(loot[0]).addItem(loot[1], loot[1], loot[1], loot[1]);

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