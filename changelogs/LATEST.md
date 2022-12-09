# v0.83.0


## 🟡 Updated Mods

- **Tweaked Petroleum: Gas Addon** - should fix recent crashes


## ⚡ **Performance**
  - Remove ~40000 pointless recipes from ![](https://is.gd/JDMtEF "Fluid Tank")
    > <img src="https://i.imgur.com/EdpJ3qa.png" width=25% align=right>
    >
    > Now, only 81 actual tank recipes shown. This saves 2-6 seconds of modpack loading time.  
    > 
    > This is performed by just fixing avoiding registering JEI tab if both of this options disabled:  
    > `enableTankFluidInOutJEIRecipes`
    > `enableTankMendingJEIRecipes`
  - Remove two OC JEI categories
    > This would save 3-5 seconds of MC load time.
    > This categories have mostly no usage.
  - Do not load some JEI tabs at all instead hiding them
    > Remove load of tabs:
    > - ![](https://is.gd/AePAuQ "Factorizer")
    > - ![](https://is.gd/1ejOSQ "Steam Dynamo (Basic)")
    > - ![](https://is.gd/TIVt2r "Market")
  - Prevent loading of JER `enchantment` and `plant` tabs
    > Enchantment tab was already hidden but still consumed load time.
    >
    > Plant tab just tells obivious stuff, like "if you plant potator you will get more potatoes".

## ✏️ **Recipes**
  - Fix missed ingredient for ![](https://is.gd/AvUpEX "Basic Energy Relay Crystal") in ![](https://is.gd/Zs04ZM "Precision Laser Etcher")
  - Remove 3x3 packing ![](https://is.gd/RVqGU0 "Compressor") recipes
    > They was useless since you can easily use ![](https://is.gd/mgkdAs "Crafting Table") for this

## 🔄 **Misc Changes**

  - ### 🧩 **Configs**: **Timberwolf** disable attacking Skeletons

  - ### 📖 **Quests**: Move E2E-E guide book, less levels in "Spawn Changes" quest task






