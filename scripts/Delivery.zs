val store_Default = "_store"; //The default store is ALWAYS called _store
val store_Wheat = "Baker";
val store_Diamond = "Diamond Trader";

//Set default store item
mods.Delivery.Store.setStoreIcon(store_Default, <minecraft:redstone>);    // "_store" is the name of the default store

//Add Some trades
//These will go into the default tab as there is no store specified
mods.Delivery.Store.addTrade(<minecraft:diamond> * 2).addOre("record", 5).addItem(<minecraft:apple>, <minecraft:golden_carrot> * 3);
mods.Delivery.Store.addTrade(<minecraft:diamond> * 2).addOre("plankWood", 52);
mods.Delivery.Store.addTrade(<minecraft:emerald> * 10, store_Default, <minecraft:stick> * 5, <minecraft:brick>).addOre("plankWood", 3).addItem(<minecraft:paper> * 2);
mods.Delivery.Store.addTrade(<minecraft:brick> * 35, <minecraft:obsidian> * 5).addOre("plankWood", 1).addOre("ingotIron", 2);
mods.Delivery.Store.addTrade(<minecraft:diamond> * 20, <minecraft:emerald>);
mods.Delivery.Store.addTrade(<minecraft:diamond_pickaxe>).addOre("ingotGold", 5);
mods.Delivery.Store.addTrade(<minecraft:wheat> * 20, <minecraft:diamond> * 5);

//Add some trades to the baker store
mods.Delivery.Store.addTrade(<minecraft:wheat> * 20, store_Wheat, <minecraft:diamond> * 5);
mods.Delivery.Store.addTrade(<minecraft:bread> * 4, store_Wheat).addOre("netherStar", 4).addItem(<minecraft:sugar>);
mods.Delivery.Store.addTrade(<minecraft:emerald> * 2, store_Wheat, <minecraft:wheat> * 10);

//Add some trades to the diamond trader
//Some of these require a gamestage
mods.Delivery.Store.addTrade("gs_buydiamond_1", <minecraft:diamond> * 20, store_Diamond, <minecraft:emerald> * 5);
mods.Delivery.Store.addTrade("gs_buydiamond_2", <minecraft:diamond> * 25, store_Diamond, <minecraft:stick> * 45);
mods.Delivery.Store.addTrade(<minecraft:diamond>, store_Diamond, <minecraft:stick> * 64);
mods.Delivery.Store.addTrade(<minecraft:emerald>, store_Diamond).addOre("gemDiamond", 4);

//You can set the store iron at any time
//The order that the store is first accessed is the order they will appear in the tabs
//The exception to this is the default tab, which will always be first.
mods.Delivery.Store.setStoreIcon(store_Wheat, <minecraft:wheat>);
mods.Delivery.Store.setStoreIcon(store_Diamond, <minecraft:diamond>);

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