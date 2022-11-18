# v0.78.0


## 🟠 Downgraded mod

- **AE2 Unofficial Extended Life**
  > Downgraded to `v0.53.7b`  
  > Latest version have Pattern Terminal bug macking unable to use [+] button.


## 🟡 Updated Mods

- **Had Enough Items**
- **MixinBooter**
- **Cyclic**
- **AE2 Fluid Crafting Rework**
- **CraftTweaker**
- **LittleTiles**
- **OpenComputers**
- **Thaumic Augmentation**
- **Recurrent Complex**
- **IC2 Tweaker**

## 📖 **Quest Book**: Loot boxes rework

This patch introduce huge rework of loot boxes.

### I need feedback!

It was hard to get all the changes in place, and probably a lot of the items are too cheap or, conversely, expensive for their Lootbox tier.  
To balance it out, I need your feedback. Please, join my Discord and write your thoughts about new lootbox mechanic:  
<a title="Join us on Discord!" href="https://discord.gg/VcmyHdNNQP"><img src="https://img.shields.io/discord/911676461050642432?label=E2E-E%20Discord&amp;logo=Discord&amp;style=?flat" alt="Discord"/></a>

### Changes

- Now there is **5** major levels of loot boxes: `Common`, `Uncommon`, `Rare`, `Legendary`, `Mythic`
  > Old names changed:
  > - **Legendary** => **Mythic**
  > - **Epic** => **Legendary**
- Every box from major tier have their **theme** - common functionality or usage:
  > - **Common**: Basic resources
  > 
  > <img src="https://i.imgur.com/Ibs9ps8.png" width=50%>
  > 
  > - **Uncommon**: Tools
  > 
  > <img src="https://i.imgur.com/CYQqdaP.png" width=50%>
  > 
  > - **Rare**: Upgrades
  > 
  > <img src="https://i.imgur.com/05HNauM.png" width=50%>
  > 
  > - **Legendary**: Expensive resources
  > 
  > <img src="https://i.imgur.com/P4vZbSU.png" width=50%>
  > 
  > - **Mythic**: Game changers
  > 
  > <img src="https://i.imgur.com/R7K5Pir.png" width=50%>
  > 
- You can migrate from one tier to another using "compress" recipes
  > <img src="https://i.imgur.com/flY4pLT.png" width=50%>
- Some major boxes have sub-boxes with high chance
  > For example, `Common` would 33% of times give you `Food` box, and another 33% - `Decor` box.
  >
  > You can see whole list in JEI.  
  > Example for T2 sub-box `Storage`:
  > 
  > <img src="https://i.imgur.com/HGKONgw.png" width=50%>
  > 
  > Hover over *sub-chest* in major lootbox list to see its chance
  > 
  > <img src="https://i.imgur.com/TMrM2aP.png" width=50%>
- Some quests would give you sub-loot-chests as rewards, instead of major ones
  > <img src="https://i.imgur.com/96dbKBe.png" width=25%>
- Rewards in most quests remapped. High-tier quests give high-tier boxs.
  > For example, **Draconic Evolution** chapter gives `Rare` or higher tiers.
  > 
  > After updating from older modpack version this may cause some quests give you reward again  
  > <img src="https://i.imgur.com/4WovbSA.png" width=25%>

------------
------------

Other changes:

## ✏️ **Recipes**
  - Remove Pam's Harvestraft redurdant items
    > This items already defined by other mods. Pam's mechanics are too the same, so this would add diversity in game.
    >
    > List of removed items and their crafting methods:
    > - ![](https://is.gd/3AqHYB "Chili Pepper")![](https://is.gd/BNZVUj "Chili Pepper Seed")![](https://is.gd/xFLMSv "Coffee Beans")![](https://is.gd/MEshjE "Coffee Seed")![](https://is.gd/YqnzA9 "Grape")![](https://is.gd/n91oxV "Grape Seed")![](https://is.gd/orjOsa "Olive Sapling")![](https://is.gd/3FkmUj "Olive")![](https://is.gd/Hd20a0 "Olive")![](https://is.gd/6j3zLe "Tomato")![](https://is.gd/FYSlGf "Tomato Seed")
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/1rpoJO "Photovoltaic Plate") in ![](https://is.gd/Os5vFZ "Osmium Compressor")
    - ![](https://is.gd/ajx6c9 "Ground Pork")![](https://is.gd/M4KmgS "Ground Beef")![](https://is.gd/NYq7IJ "Ground Chicken")![](https://is.gd/ngHEvC "Ground Fish") now can be hammered from ![](https://is.gd/tyP67Z "Single Compressed Porkchop")![](https://is.gd/r1HmiE "Single Compressed Beef")![](https://is.gd/9zsf3T "Single Compressed Chicken")![](https://is.gd/7d2pNU "Single Compressed Fish")
    - ![](https://is.gd/2Dr7M9 "Sentient Ingot") in ![](https://is.gd/XMCrOq "Casting Table")

  - ### ✐ **Cheaper**
    - ![](https://is.gd/zW9gDF "Modularium Alloy") recipe now output x24 (was x2)
    - ![](https://is.gd/YRi4GQ "Generator")

  - ### ✎ **Harder**
    - ![](https://is.gd/IrfER3 "Black Hole Generator") now accept only Iron and Iron alloy blocks as fuel. Blocks and working time:
      > - ![](https://is.gd/Ad9Efx "Block of Iron") : 0.5s
      > - ![](https://is.gd/HeyntP "Block of Steel") : 1s
      > - ![](https://is.gd/96bM5Y "Dark Steel Block") : 4s
      > - ![](https://is.gd/mst1Zp "End Steel Block") : 32s
      > - ![](https://is.gd/BtOS3O "Block of Fiery Metal") : 8.5m

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/neEec1 "Oak Door") add chiseling of every door, remove their recycling from ![](https://is.gd/m7QBnA "Sawmill (Basic)")
    - Remove unused ![](https://is.gd/8L0w7D "Oak Door") recipe (duplicate)
    - Remove erroring mob chunks recipes (Mystical Agriculture)
    - ![](https://is.gd/8igEOF "Molten Gelid Enderium Tank") now melting with same temperature as ![](https://is.gd/d60PyI "Molten Enderium Tank")
    - ![](https://is.gd/6EmMuU "Emerald Alchemical Ore Dust") remove from ![](https://is.gd/FcGRWS "Infinity Catalyst") recipe (make whole x7 ore line optional)
    - ![](https://is.gd/1Vitis "Wolf Bait") and any other bait now stackable
    - ![](https://is.gd/FrsEcH "Alumite Ingot") fix wrong output in advanced machines, fix alloying in smeltery, fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/139
    - **Energy Dimlet** (RFToolsDimTweaks) fix uncraftable
    - ![](https://is.gd/rn7KLJ "Double Compressed Gravel") and other double compressed base blocks now hammerable



## 🔵 **Mods updates**
  - ### 🧻 **JEI**
    - ![](https://is.gd/8tQCtq "Garden Cloche") change amount of potatoes to duration tooltip
    - Add 3 vanilla TC ![](https://is.gd/qGsUjc "Salis Mundus") conversions
    - Add ![](https://is.gd/G13jne "Metamorphic Forest Stone") by ![](https://is.gd/l22Y45 "Marimorphosis")
    - BlockDops tab - round chances, add ![](https://is.gd/mdbK8q "Glass Shard")

  - ### 👨‍🏭 **Mekanism**: Buff ![](https://is.gd/FWTPCF "Advanced Gas Tank") and higher
      > - ![](https://is.gd/FWTPCF "Advanced Gas Tank") x2 - 640b now
      > - ![](https://is.gd/n4Xiib "Elite Gas Tank") x4 - 1024b now
      > - ![](https://is.gd/RFq8iA "Ultimate Gas Tank") x16 - 409k b now

  - ### 🦯 **Thaumcraft**: Make vis seeds unplantable again
      > They was being able to be planted on some special soil types or with ![](https://is.gd/piyQdb "Farmer")

  - ### 🧙‍♂️ **Cyclic**: Prevent use ![](https://is.gd/7NUxQ8 "Bone Meal") on ![](https://is.gd/szoVea "Magic Bean")



## 🔄 **Misc Changes**
  - **Compressed Furnaces** Fix textures too bright
    > Color managment of .png was wrong
  - Some compressed blocks harder to break
    > List of changed blocks:
    > - ![](https://is.gd/b2QUkI "Compressed Dirt")![](https://is.gd/bgcuLv "Double Compressed Dirt")![](https://is.gd/NzN3XS "Triple Compressed Dirt")![](https://is.gd/7DXvX3 "Quadruple Compressed Dirt")![](https://is.gd/Yurijq "Compressed Netherrack")![](https://is.gd/1zj4Xe "Compressed Sand")![](https://is.gd/WpGSoZ "Double Compressed Sand")![](https://is.gd/o2bBrF "Compressed Gravel")![](https://is.gd/rn7KLJ "Double Compressed Gravel")
  - ![](https://is.gd/piyQdb "Farmer") add incompat info about Pam's crops
  - fix server unable to create Skyblock world type
    > `defaultworldgenerator-port` property not working
  - Add IC2 error `removal without registration` from log

  - ### 📖 **Quest Book**
    - Nerf Travel Kit, buff Battle Kit
    - ![](https://is.gd/VnIF8A "Luggage") fix NBT match to "content"
    - ![](https://is.gd/5hvdM4 "Manasteel Ingot") as reward for manasteel quest
    - Laser Gun fix quest name and icon
    - Remove ![](https://is.gd/8FXTdH "Pattern Storage") quest as redundant
    - Add ![](https://is.gd/IrfER3 "Black Hole Generator") quest with list of valid fuels
    - Fix IC2 dependencies for generators
    - Fix ![](https://is.gd/TY9CHI "Orechid Vacuam") nbt tag
    - Fix ![](https://is.gd/TVQTnD "Projector") quest nbt tag






