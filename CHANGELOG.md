### Enigmatica 2: Expert - Extended Changelog


# v0.79.0


## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Not Enough Energistics**
- 🟠 **Recurrent Complex** (downgraded to fix server-side crashes)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**: ![](https://is.gd/oX12Kb "Seared Brick") from ![](https://is.gd/JDTXC0 "Ash")

  - ### ✏ **Misc Changes**: ![](https://is.gd/snpRVj "Cactus") in ![](https://is.gd/Is3WUq "Crushing Tub") provide x1000 ![](https://is.gd/U2BfzE "Water Tank") instead of x100



## 🔵 **Mods updates**
  - ### 🔨 **Tinker's Construct**: ![](https://is.gd/oFzyTS "Cheese") harvest level set to `0`



## 🔄 **Misc Changes**
  - Disable Dragon Roosts in Skyblock overrides files.
  - ### 📖 **Quests**: Book improvments
      > - <img src="https://i.imgur.com/lEdY3L9.png" width=50% align=right> Add back-reference for **Harvest Level** quests. Now previous quests would be automatically unlocked if you open any further one
      > - ![](https://is.gd/kAxKdl "Silver Ingot") disable toasts for each silver type quest
      > - ![](https://is.gd/ZaWmE6 "Seared Bricks") add x16 to Seared Furnace quest reward
      > - ![](https://is.gd/YlGrDS "Weather Egg <Rain>") add as reward for early quest
      > - Hide awkward deps lines in Utils chapter
      > - Fix too OP loot boxes in "Chose Reward" quests






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






# v0.76.1


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/620/865/256/256/638010235966447244.png"         width="50"> | 🟨                           [**Forked Proxy**](https://www.curseforge.com/minecraft/mc-mods/forked-proxy)                  <sup><sub>forkedproxy-1.0.1.jar</sub></sup> <br> A fork of Integrated Proxy for 1.12.2 with a small rewrite and bug fixes | Fork of mod that used to be on `E2E-E` but had [serious crash-causing bug](https://github.com/shBLOCK/IntegratedProxy/issues/29).


Also, fix server version has mismatch of mods with client.



# v0.76.0


## 🟡 Updated Mods

- **Cyclic**
- **Lootr (Forge)**
- **AE2 Fluid Crafting Rework**
- **AE2 Unofficial Extended Life**
- **Thaumic Augmentation**


## ✏️ **Recipes**
  - ### ✏ **Misc Changes**
    - Fix crafttweaker.log error when you removing Nutrition mod
    - <img src="https://i.imgur.com/sbcdql3.png" width=25% align=right> ![](https://is.gd/fUoLXs "Perfect Fuel Tank") in ![](https://is.gd/eSkV26 "Fusion Core") now output 126M rf/t but requre valid temperature
    - ![](https://is.gd/QKfqGF "Hopper") change recipes for **BitHop** mod
    - ![](https://is.gd/a2fadE "Endervoir") fix consume ingredient
    - ![](https://is.gd/zHsoqc "Tome of Sharing") shorten NBT tags (should prevent lost connection when playing on server and use for first time)
    - ![](https://is.gd/b7RsDP "Light Radiation Shielding")![](https://is.gd/cyAwtv "Medium Radiation Shielding")![](https://is.gd/B9xrZO "Heavy Radiation Shielding") now appicable to armor pieces with any damage
    - ![](https://is.gd/uhoAP5 "Fire Dragon Blood")![](https://is.gd/mf1Eml "Ice Dragon Blood") fix Blood Magic craft (now crafting with ![](https://is.gd/40FTXi "Imbued Slate"))



## 🔵 **Mods updates**
  - ### 🏪 **Requious Fracto**: **Replicator** Enchantements
      > - <img src="https://i.imgur.com/zGIHW8c.png" width="50%" align=right> Add ![](https://is.gd/oUPl91 "Overclocker Upgrade") slot with increasing speed and power consumption (same mechanics as in IC2)
      > - Replicator dont require ![](https://is.gd/8FXTdH "Pattern Storage") anymore. It could be barely any container with inventory. Could be ![](https://is.gd/lciYeT "Scanner") or ![](https://is.gd/SnqGe0 "Oak Chest")
      > - Fix power not consumed in rare circumstances

  - ### 🪐 **AdvRocketry**: Enchancements
      > - <img src="https://i.imgur.com/7ejaaCY.png" width=300 align=right> **HD 42176** Star now Black Hole
      > - **HD 63776** Star renamed to `Magnis Vulpes` and got 2 new starts near it
      > - **KELT-3** (Dim 119), **Luna** (Dim 100) and **KELT-3** (Dim 119) now generates Craters
      > - **KELT-3** (Dim 119) huge holes exposed on surface now
      > - **Kepler 0118** (Dim 122) now generates Volcanos, Geodes and Craters
      > - ![](https://is.gd/IrfER3 "Black Hole Generator") Now generates 1M Rf/t
      > <img src="https://i.imgur.com/RwEwHaT.png" width=300 align=right> - ![](https://is.gd/L3fKoZ "Monopropellant Fuel Tank")![](https://is.gd/iZ1W1y "Oxidizer Fuel Tank")![](https://is.gd/jk4I22 "Bipropellant Fuel Tank") buff capacity x4
      > - ![](https://is.gd/ZyFJWr "Fueling station") Fixed a shameful bug that caused more expensive fuel to be spent almost 10 times faster than the cheaper fuel.
      > 
      > Now, the fuel consumption per tick looks like this:
      >
      > - `1` neutron
      > - `1` ic2uu_matter
      > - `2` rocketfuel
      > - `4` rocket_fuel
      > - `5` refined_fuel
      > - `6` pyrotheum
      > - `7` liquidoxygen
      > - `10` astralsorcery.liquidstarlight



## 🔄 **Misc Changes**
  - Update Thaumcraft aspects in JEI.
    > Note: If you ever encountered bug "JEI says <...> aspect on item, but when i put it in [Crucible] there is no such aspect" - do this steps:
    > 1. Remove `caches/` folder 
    > 2. Remove `config/thaumicjei_itemstack_aspects.json`
    > 3. Reload game once, wait until removed `.json` regenerates
    > 4. Reload game second time - now Aspects should be fixed.
    >
    > Problem happen because sometimes mods are changed and two separate mods create their own unsync caches.
  - Spawn configs minor changes
    > Spawn rules was updated with mod names. I changed it for tests how it would change spawning on servers.  
    > Actually, this changes shouldnt change anything, but who knows.
  - Carryon fix blacklist
    > - Remove ![](https://is.gd/tN5mVB "Vacuumulator") from entry blacklist since its actually not working. Sorry for missinformation last patch.
    > - ![](https://is.gd/agmDzq "Item Conduit") add to blacklist (any conduit)
    > - ![](https://is.gd/kX0ptm "Dissimulation Block") add to blacklist to prevent dupe
  - ### 📖 **Quest Book**: Misc Changes
    > - **Builder Kit** now gives infinity Construction Foam and ![](https://is.gd/4FPbpl "CF Sprayer")
    > - ![](https://is.gd/TUN6Wi "Igneous Extruder (Basic)") moved to TE mini-gate
    > - Now Loot Chests can be converted to next-previous tiers by 3x3 craft
  - ### 🔦 Buff ![](https://is.gd/Utwh8k "Torch") light level 10 => 11
  - ### 🥩 Nutrition: remove Death Penalty Loss
    > Before this change, on each death players lost `10` points of each their nutrition.  
    > When i playing, i usually never die, thats why this value was bigger than in E2E. In E2E it is `5`.  
    > But it turned out that in the experience of other players, they die more often, which means they have constant problems with nutrients.  
    > Now, you will not lose any nutrition when die. After die, minimum amount for each nutrient is `20`.  



# v0.75.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/148/522/256/256/636583436552873978.png"         width="50"> | 🟨                                 [**BitHop**](https://www.curseforge.com/minecraft/mc-mods/bithop)                        <sup><sub>BitHop-1.2.jar</sub></sup> <br> Hoppers sans lag, for ModJam 2018.1 | New automation for early game

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/172/553/256/256/636737566894981598.png"         width="50"> | 🟫                   [**Better Animal Models**](https://www.curseforge.com/minecraft/mc-mods/better-animal-models)          <sup><sub>betteranimals-1.12.2-5.5.0.jar</sub></sup> <br> Makes many of the vanilla animals look a bit nicer | Players [voted to remove](https://i.imgur.com/lRYxsQk.png) this mod on [Discord server](https://discord.gg/VcmyHdNNQP).

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Zen Utils**


## ✏️ **Recipes**
  - ### ✏ **Misc Changes**
    - ![](https://is.gd/53rZSk "Advanced Analyzer") fix voiding bees when all input slots occupied (sorry)
    - ![](https://is.gd/15I5le "Item Filter") Remove recipe and from JEI
    - ![](https://is.gd/FOMDfX "Rubber Wood") add to **LogWood** oredict



## 🔵 **Mods updates**
  - ### 🏪 **Requious Fracto**: Requious: ![](https://is.gd/t1EXpG "Replicator") rework
      > **Visual**: <img src="https://i.imgur.com/1yJLbTL.png" width=25% align=right>
      > - IC2 Replicator recipe removed, same recipe used for new Replicator. Old one hidden in JEI
      > - New model and texture for replicator
      > - Change in quest book 📖
      > 
      > **Mechanic changes**: <img src="https://i.imgur.com/WI55rtW.png" width=50% align=right>
      > - Consuming 20k RF/T
      > - Require adjastent ![](https://is.gd/8FXTdH "Pattern Storage") with __written__ ![](https://is.gd/8Slwwo "Crystal Memory") in it
      > - To replicate, require "catalyst" with UU-value higher than target item
      > - Consuming UU cost of __catalyst__, not target item

  - ### 🧻 **JEI**: blacklist updates



## 🔄 **Misc Changes** <img src="https://i.imgur.com/CuUYTyf.png" width=50% align=right>
  - 💍 Buff Ring slots 4 => 6
    > So you can use lot of rings .
  - Add ![](https://is.gd/tN5mVB "Vacuumulator") blacklist to carryon
  - ### 📖 **Quest Book**: Quests changes
      > - Fix Black text in smeltery quest
      > - Add ![](https://is.gd/WgOzYO "Mass Assembler IO Port") + ![](https://is.gd/Q8SeQl "ME Storage Bus") trick quest
  - 🏗️ Merge upstream `E2E` changes up to `1.86`
    > Look for different output on ping to support ipv6.  
    > Properly fix all occurrences of ping executions.



# v0.74.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/620/862/256/256/638010232767145893.png"         width="50"> | 🟩                     [**Tweaked Excavation**](https://www.curseforge.com/minecraft/mc-mods/tweaked-excavation)            <sup><sub>tweakedexcavation-1.0.1.jar</sub></sup> <br> Adding more configuration options to Immersive Engineering | Would be used to add custom deposits and power tiers
<img src="https://media.forgecdn.net/avatars/thumbnails/620/864/256/256/638010234645296939.png"         width="50"> | 🟨                            [**Tweaked Lib**](https://www.curseforge.com/minecraft/mc-mods/tweaked-lib)                   <sup><sub>tweakedlib-1.0.1.jar</sub></sup> <br> A library mod | Lib for previous mod

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/229/973/256/256/637058295576216433.png"         width="50"> | 🟫       [**Random Bone Meal Flowers (Forge)**](https://www.curseforge.com/minecraft/mc-mods/random-bone-meal-flowers)      <sup><sub>rbmf_1.12-1.0.jar</sub></sup> <br> 🎲 Randomizes the flowers spawned by bonemeal, allowing all (modded) types to spawn everywhere. | Caused bug makes unable to grow Botania's flowers

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Tweaked Petroleum**
- **FastWorkbench**
- **LittleTiles**
- **Zen Utils**
- **Tweaked Petroleum: Gas Addon**
- **Harder Branch Mining**
- **AE2 Fluid Crafting Rework**
- **CraftTweaker**


## ✏️ **Recipes**
  - ### ✏ **Misc Changes**: 
    - Remove ![](https://is.gd/XpVrGe "Silicon") recipe with empty input from **Arc Furnace**
    - Add **Tritium** conversion between NC and Mekanism
    - Minor Gas and Fluid reservoirs tweaks
    - ![](https://is.gd/mtuXwW "Impetus Generator") buff x5 - x6 times (up to 100k RF/T)
    - **Mob Spawner** fix recipe in ![](https://is.gd/juDTO7 "Miniaturization Field Projector")



## 🔄 **Misc Changes**
  - Fix ![](https://is.gd/bVkoqM "Thermoelectric Generator") was fluidloggable
  - Remove tip `The Traveler's Backpack disappears if you fall into the Void` since its fixed
  - Remove old **Excavator** JEI tab (replaced with `Tweaked Excavation` mod)
  - Fix Rocket in CarryOn blacklist (was wrong blacklist)
  - ### 📖 **Quest Book**: Quests: fix ![](https://is.gd/sTakGu "Morphing Tool") quest desc (silver gear)






# v0.73.0


### ✏️ **Recipes**
  - ![](https://is.gd/ffSnNM "Magic Bean") remove OP output, add some more
    > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/127
  - ![](https://is.gd/pO00eS "Rattus Vis Seeds")![](https://is.gd/UmHhhn "Mythus Vis Seeds") remove recipes, add note in quest book about unplantable.
    > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/120

### ⛏️ Mining: Harder Branch Mining affect only ![](https://is.gd/vk0Txh "Stone")

  > Before, all blocks slowed down near bedrock.  
  > Now, only stone would be slowed.

### 🛸 EnderIO:

  - ![](https://is.gd/Qf7OAC "Dimensional Transceiver") buff x10 times capacity and transfer rate

    > Now 250M rf/t with T3 capacitor

  - Disable gravity for machines to prevend dupe

    > How dupe looks like:
    > 
    > https://www.youtube.com/watch?v=U_B4LdbqLcQ&t=182s

### 🐝 Forestry: ![](https://is.gd/vXNvAi "Building Backpack") fix ![](https://is.gd/fV9TD8 "Jungle Myrmex Cocoon") unfitable

### 🔄 Misc changes

  - Fix ![](https://is.gd/F3WiW8 "Energy Cell (Basic)") JEI duplicate
  - Misc langs files and text fixes
    > Author: Oddish <andrzejsokolowski>
  - Add Rocket to CarryOn blacklist
  - Another attempts to add ![](https://is.gd/uxW8fm "Water Chest") to Lootr Blacklist (report if water chests still transforming)

### 🏗️ Merge E2E changes

  - Most changes of E2E was already implemented, except:

    > - Changed orbitalDistance of Stella and Terra Nova to 200
    >     https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/f868351c6a3983182d92cd636446db1b30775389
    > - Easier ![](https://is.gd/WXYVPM "Skullfire Sword")
    >     https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/2ec924f6253fa5e85de19797cbf8ae90a03ad22d
    >     (was already partially implemented btw)
    > - Add Solcarrot Blacklist items:
    >    * ![](https://is.gd/FPpx1W "Carrot Cake") which doesn't get added even when eaten (despite other similar cake-like items working just fine)
    >    * [milk chocolate ingots] which aren't obtainable
    >      https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/b9d1fbfa877d371f321f52c6dad2908bbd0e99ea# v0.72.0


### ✏️ **Recipes**: 
  - ![](https://is.gd/8TJXRK "Basic Voltaic Pile")![](https://is.gd/OUZMHk "Advanced Voltaic Pile")![](https://is.gd/QFIdRZ "DU Voltaic Pile")![](https://is.gd/Soapl6 "Elite Voltaic Pile")![](https://is.gd/9v1WYM "Basic Lithium Ion Battery")![](https://is.gd/VPbRi1 "Advanced Lithium Ion Battery")![](https://is.gd/Jym5J9 "DU Lithium Ion Battery")![](https://is.gd/19ynPJ "Elite Lithium Ion Battery") fix uncraftable in ME



### 🔵 **Mods**: 
  - Downgrade AE2
    > It had some bugs, also server was already uploaded with downgraded version.

### 📖 **Quest Book**: 
  - Fix **Conflux** not giving ranks
    > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/124






# v0.71.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/229/973/256/256/637058295576216433.png"         width="50"> | 🟩       [**Random Bone Meal Flowers (Forge)**](https://www.curseforge.com/minecraft/mc-mods/random-bone-meal-flowers)      <sup><sub>rbmf_1.12-1.0.jar</sub></sup> <br> 🎲 Randomizes the flowers spawned by bonemeal, allowing all (modded) types to spawn everywhere. | To generate every kind of flower
<img src="https://media.forgecdn.net/avatars/thumbnails/295/569/256/256/637337350733304395.png"         width="50"> | 🟨                                 [**ReAuth**](https://www.curseforge.com/minecraft/mc-mods/reauth)                        <sup><sub>ReAuth-1.12-Forge-4.0.3.jar</sub></sup> <br> Fixes the Problem of having to restart your Client when your Session invalidates | They fixed MS compat

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/417/353/256/256/637641198339910843.png"         width="50"> | 🟫                                  [**OAuth**](https://www.curseforge.com/minecraft/mc-mods/oauth)                         <sup><sub>oauth-1.06.4.jar</sub></sup> <br> Adds the ability to login and authenticate to Microsoft, Mojang, or Legacy accounts! |  Replaced by better ReAuth

## 🟡 Updated Mods

- **Tweaked Petroleum**
- **Village Names**
- **AE2 Fluid Crafting Rework**
- **Tweaked Petroleum: Gas Addon**
- **AE2 Unofficial Extended Life**
- **LittleTiles**


## ✏️ **Recipes**
  - Inherit upgrades of armor
    > Now armor inherits Enchantments, Upgrades and other stuff from previous tier armor.  
    > For example: ![](https://is.gd/oAXqAq "Dark Plate") => ![](https://is.gd/Qm8x3l "Ender Plate")
  - Lot of new drops from mobs and animals
    > - Add loot for lot of entities without drop (like Hamsters).
    > - Add some special loot for bosses, like Pink Wither  
    > **List of all new items dropped from entities:**  
    > ![](https://is.gd/KbbZzo "Vishroom Spore")![](https://is.gd/ED0k1V "Glowing Mushroom")![](https://is.gd/Y0c4nX "Magic™ Mushroom")![](https://is.gd/rRble9 "Pumpkin Seeds")![](https://is.gd/dRuQ5I "Ball of Fur")![](https://is.gd/Lh1Znk "Silkworm")![](https://is.gd/aNL6K7 "Worm")![](https://is.gd/oPByJZ "Silkworm")![](https://is.gd/aNL6K7 "Worm")![](https://is.gd/zCAaeh "Hardened Leather")![](https://is.gd/U8xew8 "Uberous Soil")![](https://is.gd/xvlY9m "Sea Serpent Scales")![](https://is.gd/SCXKlq "Garbage Pile")![](https://is.gd/V02cT9 "Timber Wolf Pelt")![](https://is.gd/PjUSoR "Chicken Chunk")![](https://is.gd/Jg1NgI "Desk Bell")![](https://is.gd/xvlY9m "Sea Serpent Scales")![](https://is.gd/vDdsLz "Raven Feather")![](https://is.gd/MvAbXL "Evil Tear")![](https://is.gd/zQmRAW "Golden Spikes")![](https://is.gd/fN7Fa5 "Crystalline Pink Slime Ingot")![](https://is.gd/pDF2bQ "Pink Slime Ingot")![](https://is.gd/W5JTQ0 "Tiny Pile of Titanium Dust")![](https://is.gd/fGNpoZ "Void Sack")![](https://is.gd/GQEf1A "Void Charm")![](https://is.gd/dmOBML "Ender Sack")![](https://is.gd/ToyYgw "Storage Bag")![](https://is.gd/vOEh2o "Satchel (Void)")![](https://is.gd/JIvJWb "Demon Ingot")![](https://is.gd/5slR5Y "Heart Crystal Shard")![](https://is.gd/PftVRG "Blackout Powder")![](https://is.gd/FBuRAr "Bursting Powder")![](https://is.gd/iUP8qs "Wood Casing")![](https://is.gd/KRq2Dn "Soul Bead")![](https://is.gd/3foFIC "Floo Token")![](https://is.gd/P3tJ5U "Florb (Empty)")![](https://is.gd/tMjdNQ "Dragon Ice")![](https://is.gd/Z74H9R "Blitz Powder")![](https://is.gd/Omxd3L "Coalescence Matrix")![](https://is.gd/sHwbSG "Green Slime Crystal")![](https://is.gd/lLAr2w "Chestnut")![](https://is.gd/8n6qKM "Hazelnut")![](https://is.gd/5Raagr "Nutmeg")![](https://is.gd/qZvjTX "Peanut")![](https://is.gd/6wrg6y "Water Chestnut")![](https://is.gd/X9ck66 "Ice Essence")![](https://is.gd/TIEFw7 "Ice Shard")![](https://is.gd/om5LW0 "Glowstone Nano-Particles")
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/62uwzY "Single Compressed Wood") now can be made from any vanilla wood
    - ![](https://is.gd/sBttUZ "Bee House") return removed by E2E dev recipe
    - ![](https://is.gd/vOEh2o "Satchel (Void)") return accidentally removed recipe
    - ![](https://is.gd/sLKIcz "Chaos Shard") Skyblock alt
    - ![](https://is.gd/GuOKiP "Dread Shard")![](https://is.gd/ePEN6S "Desert Myrmex Resin")![](https://is.gd/zcD18p "Jungle Myrmex Resin")![](https://is.gd/tMjdNQ "Dragon Ice")![](https://is.gd/7aA7Kc "Pixie Dust")![](https://is.gd/Ija9YE "Necrotic Bone")![](https://is.gd/GVIX8A "Withering Soul") now available in ![](https://is.gd/4lNgYy "Loot Fabricator")
    - ![](https://is.gd/AdRzk4 "Taintwood Planks") now sawable as other wood
    - ![](https://is.gd/NpmF7k "Weak Blood Shard") from ![](https://is.gd/Lv8XYl "Adaminite Nugget")
    - ![](https://is.gd/uhoAP5 "Fire Dragon Blood")![](https://is.gd/mf1Eml "Ice Dragon Blood")![](https://is.gd/oZRZdH "Fire Dragon Heart")![](https://is.gd/bqKGaU "Ice Dragon Heart") add alternative crafts
    - ![](https://is.gd/GVIX8A "Withering Soul") from ![](https://is.gd/9KFtXN "Nether Star Essence")
    - ![](https://is.gd/7B9b45 "String Cheese") new tech recipe

  - ### ✐ **Cheaper**
    - ![](https://is.gd/HFbY4l "Viaduct (Untreated)")
      ![](https://is.gd/EzDtrV "Long Range Viaduct")
      ![](https://is.gd/pX7dxQ "Viaduct")
      ![](https://is.gd/QEqWya "Long Range Linking Viaduct")
      ![](https://is.gd/BX2HRL "Energy Storage Upgrade")
      ![](https://is.gd/UgWNKn "ME Drive")

  - ### ✎ **Harder**
    - ![](https://is.gd/yYupHs "Treetap") but now 400 durability (was 16)
    - ![](https://is.gd/U0ETAw "Basic Lens")
      ![](https://is.gd/yiGdeX "Clear Laser Lens")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/25VuUy "Painting Machine") fix uncraftable with colored painters
    - ![](https://is.gd/4uBPVM "Copper Ore")![](https://is.gd/lhqFNJ "Tin Ore")![](https://is.gd/eU0NrY "Copper Dust")![](https://is.gd/weUQp8 "Tin Dust") now can be converted to normal materials, since they dropped from ![](https://is.gd/6mLQei "Scrap Box")
    - Remove Two Shrooms from sieving [Turf]
    - ![](https://is.gd/MbqZ7l "Blank Dark Steel Upgrade") fix ![](https://is.gd/cA34bm "Decay Hastener") Recycling
    - ![](https://is.gd/4JdLIU "Jetpack")![](https://is.gd/ygIney "Electric Jetpack") fix recipe
    - ![](https://is.gd/glxX4B "Flux Capacitor (Basic)") keep enchantments on upgrade
    - ![](https://is.gd/6mLQei "Scrap Box") now returns a lot more userful items by returning ![](https://is.gd/6mLQei "Scrap Box") 50% of time  
      > (this happens due IC2 Tweaker bug - before this change ![](https://is.gd/1M2gYL "Matter Ball") was dropped 50% of time)
    - Oredict most custom recipes in EnderIO machines ![](https://is.gd/3z8f7b "Alloy Smelter")
    - ![](https://is.gd/Soapl6 "Elite Voltaic Pile")![](https://is.gd/QFIdRZ "DU Voltaic Pile")![](https://is.gd/OUZMHk "Advanced Voltaic Pile")![](https://is.gd/8TJXRK "Basic Voltaic Pile")![](https://is.gd/19ynPJ "Elite Lithium Ion Battery")![](https://is.gd/VPbRi1 "Advanced Lithium Ion Battery")![](https://is.gd/Jym5J9 "DU Lithium Ion Battery")![](https://is.gd/9v1WYM "Basic Lithium Ion Battery") now automatable in ME (hopefully)
    - ![](https://is.gd/GdrJxj "Crystal Sword") now can be used in ME craft (untested too)
    - ![](https://is.gd/ddtDHl "Rotten Egg") change catalyst to ![](https://is.gd/iDyv37 "Fried Egg")
    - ![](https://is.gd/xodaDh "Compressed Crafting Table")![](https://is.gd/O20TpL "Double Compressed Crafting Table") remove and hide, remove as ingredients
    - ![](https://is.gd/eRUKul "Amplifying Tube") minor change ingredients
    - ![](https://is.gd/SCXKlq "Garbage Pile") Burn time less multiplier
    - ![](https://is.gd/hrruQv "V.I.E.W. (Vaultopic Inventory Explorer Workbot)")![](https://is.gd/drW7X7 "V.I.E.W. X (Vaultopic Inventory Explorer Workbot eXtended)")![](https://is.gd/r576qT "V.I.C.E. (Vaultopic Item Crafting Entity)") now stackable



## 🔵 **Mods updates**
  - ### 🌱 **Mystical Agriculture**: Rework furnaces into Compressed Furnaces <img src="https://i.imgur.com/vshn6b6.png" width="25%" align=right>
      > - Change texture
      > - Change Lang
      > - Change craft to x4 => x1
      > - Ultimate furnace (9001x speed) unchanged

  - ### 🏪 **Requious Fracto**: JEI for **Entity Drops** <img src="https://i.imgur.com/YIBNPJH.png" width="25%" align=right>
      > List of items that drop from entities

  - ### 🦯 **Thaumcraft**: Buff ![](https://is.gd/rhD6Sx "Golem") stats
      > - x2 HP
      > - ➕ armor² / 10
      > - ➕ damage² / 2

  - ### 🎒 **Traveler's Backpack**: Death Placement working better and in void
      > - More accurate way to look where to place Backpack on death
      > - searches farther for land to place backpack (worst case it has to search 4 full chunks in empty void world)
      > - searches within 0-255 bounds even if player dies in the void or while very high
      > - now considers more valid spaces than just diagonals
      > - will always prefer to place backpack on a solid block near the player, but can place in air if there are no better spots
      > 
      > [By @git-confused](https://github.com/Krutoy242/Enigmatica2Expert-Extended/pull/119)



## 🔄 **Misc Changes**
  - Remove ![](https://is.gd/gQmBTn "Conglomerate Of Life") outdated tooltip
  - Do not convert ![](https://is.gd/oTanZB "Nature Chest")![](https://is.gd/ELsiYB "Water Chest") into [Lootr chest]
  - Carryon: blacklist Lootr, Packaged Ex Crafting and ![](https://is.gd/5kakQE "Chester")
  - Fix ![](https://is.gd/uE7VJj "Marx Generator Projector") lang
  - Entity Culling enable option for weak video cards
  - Misc translations fixes by [Oddish](https://github.com/Krutoy242/Enigmatica2Expert-Extended/pull/123)

## 📖 **Quest Book**: Quests: Updates
  > - Remove ![](https://is.gd/Q5i0Ea "Geiger Counter") from reward
  > - Fix Conflux unclaimable
  > - Add to reward: ![](https://is.gd/pX7dxQ "Viaduct")![](https://is.gd/EzDtrV "Long Range Viaduct")![](https://is.gd/QEqWya "Long Range Linking Viaduct")





# v0.70.0



---------

### Warning

<img src="https://media.forgecdn.net/avatars/thumbnails/598/912/256/256/637977536887443552.png" width="50">

This patch introducing new mods: **Tweaked Petroleum** and **Tweaked Petroleum: Gas Addon**.
They would remap fluid reserviors in already generated world. That means, you will probably need to move your Pumpjacks in new locations.

Also, you will probably need to de-patch ImmersivePetroleum `.jar` files.

1. Enter `mods/` folder
2. Remove file `immersivepetroleum-1.12.2-1.1.10-patched.jar`
3. Rename `immersivepetroleum-1.12.2-1.1.10.disabled` to `immersivepetroleum-1.12.2-1.1.10.jar`

---------


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/582/719/256/256/637948923198368494.png"         width="50"> | 🟩                      [**Tweaked Petroleum**](https://www.curseforge.com/minecraft/mc-mods/tweaked-petroleum)             <sup><sub>tweakedpetroleum-1.2.2.jar</sub></sup> <br> Adding more configuration options to Immersive Petroleum | 
<img src="https://media.forgecdn.net/avatars/thumbnails/598/912/256/256/637977536887443552.png"         width="50"> | 🟩           [**Tweaked Petroleum: Gas Addon**](https://www.curseforge.com/minecraft/mc-mods/tweaked-petroleum-gas-addon)   <sup><sub>tweakedpetroleumgas-1.0.2.jar</sub></sup> <br> Adding Mekanism gas support to IP | 

## 🟡 Updated Mods

- **U Team Core**
- **Aqua Acrobatics**
- **Zen Utils**
- **Foam​Fix**
- **AE2 Unofficial Extended Life**
- **LittleTiles**


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/ddtDHl "Rotten Egg") alt for someone who dont want to wait chickens
    - ![](https://is.gd/DfQwmn "Phyto-Gro") now drops when **Rat** kill **Slime**
    - ![](https://is.gd/9msv0F "Magic Bean") from ![](https://is.gd/NUxzYh "Magic Beans")
    - ![](https://is.gd/FmpPmk "Plutonium") now replicable
    - ![](https://is.gd/ZIjMzq "Basalt") from ![](https://is.gd/tRohFU "Pahoehoe Lava") + ![](https://is.gd/KTg4et "Witchwater Can")
    - ![](https://is.gd/lQnpB5 "DirtChest 9000!") now oredicted and can be used in crafts
    - **Mini Me** can be milked now
    - ![](https://is.gd/Q0Z8LR "Stick")![](https://is.gd/4mbOSH "Scaffolding")![](https://is.gd/oJwV7M "Framed Trim") Now have x36 recipes from [Single Compressed Wood][Double Compressed Wood][Triple Compressed Wood]
    - ![](https://is.gd/1pfSfW "Reinforced Stone") x36 alt
    - ![](https://is.gd/mR0jNl "Greatwood Log")![](https://is.gd/v8BNIL "Silverwood Planks") from ![](https://is.gd/qGsUjc "Salis Mundus")
    - ![](https://is.gd/8S7sLW "Monster Ball")

  - ### ✐ **Cheaper**
    - ![](https://is.gd/AYEqep "Random Peacock")![](https://is.gd/kKKDVW "Random Rabbit")![](https://is.gd/fVdzAe "Random Cow")![](https://is.gd/Gyafd4 "Random Pig")![](https://is.gd/JOmac9 "Random Chicken")![](https://is.gd/s5hDPQ "Random Goat")![](https://is.gd/2ZWPvx "Random Sheep")
    - ![](https://is.gd/L3pRMp "Monster Ball") not requre ![](https://is.gd/OODnZg "Packager") anymore
    - ![](https://is.gd/Tz5YPF "RE-Battery")
      ![](https://is.gd/LHZ1OP "Advanced RE-Battery")
      ![](https://is.gd/8mj6XT "Framed Framed Chest")
      ![](https://is.gd/ikD6qm "Blast resistant ME Drive")

  - ### ✎ **Harder** <img src="https://i.imgur.com/mtKLpHY.png" width=50% align=right>
    - ![](https://is.gd/qWY26Y "1k ME Storage Component")![](https://is.gd/oqmZD0 "4k ME Storage Component")![](https://is.gd/eTVRSI "16k ME Storage Component")![](https://is.gd/xF47xz "64k ME Storage Component")![](https://is.gd/nuBWu6 "256k ME Storage Component")![](https://is.gd/KqbnyX "1024k ME Storage Component")![](https://is.gd/I4Lelj "4096k ME Storage Component")![](https://is.gd/eIJxXC "16384k ME Storage Component")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/GdrJxj "Crystal Sword") fix cant be used in crafts
    - ![](https://is.gd/GCAA2F "Slime in a Bucket") fix excited version cant be accepted in crafts
    - Fix rat generating 64 items when kill something
    - ![](https://is.gd/Xys2bw "Energy Crystal") fix wrong meta in usage
    - ![](https://is.gd/Sr2g1u "Diamond Seeds") and ![](https://is.gd/cCuuoM "Emerald Seeds") now Tier4 (was 5)
    - ![](https://is.gd/1VGTKX "EEPROM") update [LostUser EEPROM](https://gist.github.com/Krutoy242/1f18eaf6b262fb7ffb83c4666a93cbcc)
    - ![](https://is.gd/ACE6KN "Tinkers' Disassembler") now require only 5 instruments (instead of 14). Still need to rework it.
    - ![](https://is.gd/25VuUy "Painting Machine") fix working speed
    - ![](https://is.gd/D1Lle9 "Crystal Matrix Ingot") and ![](https://is.gd/dzTuwm "Heart Container") now have AdvRocketry recipes to allow automating
    - ![](https://is.gd/KqBDBC "Lapotron Crystal") now have shortcut in ![](https://is.gd/Dp74o7 "Crystallizer")
    - ![](https://is.gd/ygIney "Electric Jetpack") fix uncraftable
    - ![](https://is.gd/TWBgxE "NanoSuit Bodyarmor")![](https://is.gd/lGKnKB "NanoSuit Boots")![](https://is.gd/BRZ5ay "NanoSuit Leggings")![](https://is.gd/BoL2xU "NanoSuit Helmet") fix uncraftable
    - ![](https://is.gd/qGsUjc "Salis Mundus") fix uncraftable sometimes



## 🔵 **Mods updates**
  - ### ▦ **Ex Nihilo**: ExCompressum: ![](https://is.gd/oaTRhj "Auto Hammer") default usage to 128 rf/t

  - ### 🏪 **Requious Fracto**: : Add ![](https://is.gd/ZIjMzq "Basalt") JEI hints

  - ### 📭 **Storage Drawers**: change default size of drawers
      > Drawers changes:
      > - ![](https://is.gd/9SIOkD "Basic Drawer") 64 => 80
      > - ![](https://is.gd/BiW9JP "Basic Drawers 2x2") 8 => 12
      > - ![](https://is.gd/UlKQxv "Half Drawers 2x2") 4 => 6

  - ### 🔌 **Industrial Craft 2**: ![](https://is.gd/OwVCvk "Mining Laser") change consumption, buff power storages
      > ![](https://is.gd/IF8vpj "CESU")![](https://is.gd/Ml7RKi "MFE")![](https://is.gd/spsPjb "MFSU") buffed x2. ![](https://is.gd/LPPjy6 "BatBox") x4.
      > ![](https://is.gd/NWQMfA "Charging RE Battery")![](https://is.gd/ZAz0NA "Advanced Charging Battery")![](https://is.gd/tfEGVm "Charging Energy Crystal")![](https://is.gd/nkGksE "Charging Lapotron Crystal") buff capacity x2 and transfer speed x10
      > ![](https://is.gd/OwVCvk "Mining Laser") change consumption to 20k - 500k eu
      > But increase max stored and nearly instant charging speed.

  - ### 🖥 **OpenComputers**: Buff ![](https://is.gd/mdfS9L "Capacitor")
      > - Now store 160000 (was 1600)
      > - Now adds + 80000 if adjacent (was 800)
      > - Ocelots and sheeps now generates 600 and 300 rf (was 6 and 3)

  - ### 🖽 **LittleTiles**: Buff ![](https://is.gd/RiOU4g "Little Hammer") and ![](https://is.gd/TBOzBX "Little Chisel")
      > Changes:
      > - maxAffectedBlocks 6 => 32
      > - maxEditBlocks 27 => 128
      > - maxPlaceBlocks 27 => 512

  - ### 🦯 **Thaumcraft**: ![](https://is.gd/bLjcAW "Meaty Orb") generates any kind of raw meat now
      > ![](https://is.gd/74xV6D "Raw Chevon")![](https://is.gd/eG3HJ6 "Raw Frog Legs")![](https://is.gd/quaJuE "Raw Horse")![](https://is.gd/FhmQ42 "Raw Peacock")![](https://is.gd/lfTSqD "Raw Prime Beef")![](https://is.gd/9RjV3t "Raw Prime Chevon")![](https://is.gd/LVSgGG "Raw Prime Chicken")![](https://is.gd/4Go9Ds "Raw Prime Mutton")![](https://is.gd/cCy148 "Raw Prime Peacock")![](https://is.gd/00T4aL "Raw Prime Pork")![](https://is.gd/2lBFQI "Raw Prime Rabbit")![](https://is.gd/DYrj9E "Raw Prime Steak")![](https://is.gd/JJqdj4 "Raw Pheasant")![](https://is.gd/nzUzMB "Raw Turkey Leg")![](https://is.gd/lvcc6r "Raw Turkey")![](https://is.gd/qxP1Fr "Raw Venison")![](https://is.gd/VTaUpj "Raw Duck")![](https://is.gd/M4KmgS "Ground Beef")![](https://is.gd/NYq7IJ "Ground Chicken")![](https://is.gd/hKH8n5 "Ground Duck")![](https://is.gd/ngHEvC "Ground Fish")![](https://is.gd/V2IgFn "Ground Mutton")![](https://is.gd/ajx6c9 "Ground Pork")![](https://is.gd/2AKWT5 "Ground Rabbit")![](https://is.gd/suZipe "Ground Turkey")![](https://is.gd/DK2Qj0 "Ground Venison")![](https://is.gd/TlT65f "Bee Grub")![](https://is.gd/ZJ8dj2 "Raw Tofabbit")![](https://is.gd/JS1qGH "Raw Tofacon")![](https://is.gd/hY6d7v "Raw Tofeak")![](https://is.gd/bLCXd7 "Raw Tofenison")![](https://is.gd/02PS1D "Raw Toficken")![](https://is.gd/VmO2aY "Raw Tofuduck")![](https://is.gd/IE8W6Q "Raw Tofurkey")![](https://is.gd/A4Ov05 "Raw Tofutton")![](https://is.gd/GywGlw "Raw Turkey")![](https://is.gd/cUtsGJ "Raw Venison")![](https://is.gd/1zBWDL "Raw Beef")![](https://is.gd/MUAUNF "Raw Chicken")![](https://is.gd/NOu4zi "Raw Mutton")![](https://is.gd/9H5mJr "Raw Porkchop")![](https://is.gd/JYUpJS "Raw Rabbit")![](https://is.gd/lpvjFH "Raw Rat")![](https://is.gd/oJu9qq "Raw Meat Ingot")

  - ### 🧻 **JEI**
    - Add ![](https://is.gd/Hjve4a "Small Solar Panel") to **##Solar**
    - Add ![](https://is.gd/OyULqe "Charger") to **#Charger**
      > Also note: HEI fixed `## search`.

  - ### 🛢️ **Immersive Engineering**: Immersive Petroleum: Move custom reservoirs to new mod <img src="https://i.imgur.com/Bg5DqRd.png" align=right width=50%>
      > - Remove all Bansoukou tweaked files for Petroleum
      > - Remove custom JEI category from Requious
      > - Add some gas reservoirs



## 🔄 **Misc Changes**
  - Fix ![](https://is.gd/PVDxHU "Travel Anchor") cant be used without line of sight
    > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/82
  - Disable **Drone** and **Lootr chests** from CarryOn
  - Remove Thrash button in inventory (use DEL keyboard key)
  - Autocreate Void Island for new Skyblock players
  - **Alabaster** blocks now fluidloggable
  - ![](https://is.gd/SUyTCc "Energy Infuser") now not culled
  - ### ⚡ **Performance**: Remove delay for Animania's Pigs
      > So now they can fetch for truffles faster

  - ### 🧩 **Configs**
    - Add **FTB Utilities** configs to enable JM intergration
      > Now you would see claimed regions on Journey Map
    - Fix options.txt was defaulting on first launch
      > Now when you launch game for the first time you will have **recommended** settings instead of default.  
      > If you ever had problems with "Blue Squires" or cant find unused key to add another binding - remove your `options.txt` file to recommended take its place.
    - Remove  ![](https://is.gd/uLfSI9 "Redstone")+![](https://is.gd/mxxVXM "Lava") => ![](https://is.gd/cVhFER "Flux") recipe from JEI
      > Its not working anyway.
      > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/102

  - ### 🌍 **World Generation**: Remove Bedrock Ore generation at level 0 in Nether

  - ### 📖 **Quest Book**
    - Add note that ![](https://is.gd/zGEQz3 "Golem") can't break blocks in Skyblock
      > Also disable protection range for skyblock (may also fix)
      > Probably fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/83
    - Add **Conflux** ranks <img src="https://i.imgur.com/bMtpQwS.png" width=50% align=right>
      > - You starting with 9 claimable chunks + 1 chunk loadable
      > - When you unlock each gate for tier you get next **Conflux** level
      > - With next level you get more available chunks
      > - Also your chat name changes
      > 
      > Closes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/39
    - Add quest about getting fire with Slabs + Sticks <img src="https://i.imgur.com/okFquhO.gif" width=50% align=right>
      > PLUS New way to get fire in modpack.
      > MINUS ![](https://is.gd/4q9xMG "Flint and Steel") from starting inventory
    - Gates tiered sectors
    - ![](https://is.gd/3o25l4 "Meaty Orb") Add
    - ![](https://is.gd/9EA9Uf "Labeled Crate") remove nested crates from reward because several players reported it as bug
    - ![](https://is.gd/u8L9az "Hungry Chest") add quest
    - ![](https://is.gd/OXhcUG "Cheese Wheel (Goat)") for Animals quests make required items oredicted
    - ![](https://is.gd/2j9KOb "Truffle") add quest
    - ![](https://is.gd/jFss5k "ME Chest") add quest
    - Tooltip and quest "Improved Coke Oven is disabled"
      > fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/103

  - ### 📜 **Text**: Misc fixes in lang files

  - ### 🍯 **Potions**: Fix ![](https://is.gd/mmoNUJ "Gunpowder") turn anything into ![](https://is.gd/iXFmmL "Splash Potion of Doom")
      > Seems like there is bug with **CraftTweaker**, because if i remove ![](https://is.gd/bqJSB1 "Potion of Extension") recipe, Gunpowder turn enything into Doom.
      > Same time, if i NOT remove ![](https://is.gd/bqJSB1 "Potion of Extension"), everything with redstone turns into Extension potion.
      > - Remove ![](https://is.gd/bqJSB1 "Potion of Extension")
      > - Change every "extend" custom potion recipe ingredient from ![](https://is.gd/uLfSI9 "Redstone") to ![](https://is.gd/XcidMO "Tiny Pile of Redstone Dust")
      > 
      > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/79






# v0.69.0


## 🟡 Updated Mods

- **CraftTweaker**
- **Had Enough Items**
- **Zen Utils**
- **Spectral Edge**
- **OpenComputers**


## ✏️ **Recipes**
    
  - ### 🖉 **New Recipes** <img src="https://i.imgur.com/CcvZqZc.png" align=right width=25%>
    - ![](https://is.gd/WcunPy "Piston") from ![](https://is.gd/9u6l1B "Raw Ferrous-Juniper Planks")
    - ![](https://is.gd/gYz8mt "Silicon Plate") with ![](https://is.gd/5Bty3w "Forge Hammer")

  - ### ✐ **Cheaper** <img src="https://i.imgur.com/M6Ts8yR.png" align=right width=25%>
    - ![](https://is.gd/rRuQJj "Hole Filler") x16 output
    - ![](https://is.gd/3aFpfq "Superlubricent Ice") not requre ![](https://is.gd/IeZ8VU "Hydrator") anymore
    - ![](https://is.gd/hmmAgl "Tiny Potato") now x63 dupe
    - ![](https://is.gd/25VuUy "Painting Machine") now T1 machine

  - ### ✏ **Misc Changes** <img src="https://i.imgur.com/9LcQ2Ms.png" align=right width=25%>
    - Fix ![](https://is.gd/q5Dw2P "Purified Crushed Lead Ore") smelting
      > fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/93
    - ![](https://is.gd/WcunPy "Piston") remove recipes from ![](https://is.gd/DBM4Uj "Silver Plate") and ![](https://is.gd/iqoryR "Nickel Plate")
    - Misc Changes in **Crafting Hints** JEI category



## 🔵 **Mods updates**
  - ### 🌳 **Twilight Forest**: ![](https://is.gd/Hl1DBX "Steeleaf Axe")![](https://is.gd/6i5Rpm "Diamond Minotaur Axe")![](https://is.gd/OiMDV6 "Golden Minotaur Axe")![](https://is.gd/0uB9NV "Knightly Axe")![](https://is.gd/gTFWVE "Ironwood Axe") Cut Log => Planks
      > <img src="https://i.imgur.com/6EE3EaS.png" align=right>
      > Better Axes cut more planks. There is also two new TCon traits for this.

  - ### 🔌 **Industrial Craft 2**: ![](https://is.gd/OwVCvk "Mining Laser") increase x10 - x100 power consumption

  - ### 🦯 **Thaumcraft**: **Vis Seeds** plantable also in **Emptiness**



## 🔄 **Misc Changes**
  - ![](https://is.gd/hokB0t "Void Pickaxe of the Core") and ther void tools now mining level **10**
  - ![](https://is.gd/CiKLio "Spectre Coil Nr. 207") now produce only 32 rf/t (was 64)
  - `/restart_server` fix command, add more descriptions
  - ### 📖 **Quest Book**: Quests misc changes
      > - **Vis Seeds** now plantable in **Emptiness**






# v0.68.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/526/595/256/256/637846069796215011.png"         width="50"> | 🟩                      [**Entity Desync Fix**](https://www.curseforge.com/minecraft/mc-mods/entity-desync-fix)             <sup><sub>EntityDesyncFix-1.12.2-1.0.2.jar</sub></sup> <br> Fix entity motion desync (for example arrows or thrown items) | 

## 🟡 Updated Mods

- **Village Names**
- **Chunk-Pregenerator**
- **OpenComputers**
- **AE2 Unofficial Extended Life**
- **Fluidlogged API**
- **Smooth Font**


## ✏️ **Recipes**
  - ### ✐ **Cheaper**: ![](https://is.gd/HAnbpl "Teleport Rail")

  - ### ✏ **Misc Changes**
    - Remove Chaos Dragon Milking (not working anyway)
    - ![](https://is.gd/VShDzE "Infinity Furnace") works x20 times faster: 0.5 seconds now



## 🔵 **Mods updates**
  - ### ▦ **Ex Nihilo**: ExCompressum: Auto machines now consume ~50k RF/t
      > Now Auto Sieves and Hammers gated less - only ![](https://is.gd/UdsThD "Auto Heavy Sieve") require ![](https://is.gd/5pVeKj "Titanium Ingot"). But Consumption was changed.
      > - ![](https://is.gd/aJlvkM "Auto Compressed Hammer") 25,000 rf/t
      > - ![](https://is.gd/oaTRhj "Auto Hammer") 2,000 rf/t
      > - ![](https://is.gd/UdsThD "Auto Heavy Sieve") 100,000 rf/t
      > - ![](https://is.gd/ZcaZFZ "Auto Sieve") 50,000 rf/t

  - ### 🔌 **Industrial Craft 2**: ![](https://is.gd/OwVCvk "Mining Laser") Nerf Explosion mode damage

  - ### 🦯 **Thaumcraft**: Vis Seeds plantable only on planets
      > Now you can't plant Vis Seeds in Overworld, End, Twilight forest and any other dimensions, except ones added by Advanced Rocketry.



## 🔄 **Misc Changes**
  - Change Memory Tester RAM cap to 5k
  - Remove tooltips from BoPs gems since they not spawn anymore
  - Update `Skyblock` new world template description
  - Creative Skyblock Players now can teleport any dim
  - Fix myrmex cocoon convert to lootr chests
    > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/90
  - ### 📖 **Quest Book**: Quests:
      > - Add `Questing Ram` Morb quest
      > - Add `Vis Seeds` quest
      > - Fix `Ultimate Crafting Table` unfinishable
      > - Add Hearts in `Utils` chapter
      > - Add ![](https://is.gd/tmBCmD "Bee Diversity Store") working description




# v0.67.0


## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Fluidlogged API**
- **Had Enough Items**
- **Spectral Edge**
- **Aqua Acrobatics**
- **Village Names**
- **AE2 Fluid Crafting Rework**
- **CraftTweaker**


## ✏️ **Recipes**
  - ### ✐ **Cheaper**: ![](https://is.gd/cyIWmZ "Formulaic Assemblicator") not requre ![](https://is.gd/43tx1G "Steel Casing") anymore

  - ### ✏ **Misc Changes**
    - <img src="https://i.imgur.com/sPDTkL9.png" width=50% align=right> ![](https://is.gd/XKPEGn "Crafting Station") now crafted instead ov vanilla ![](https://is.gd/mgkdAs "Crafting Table").
      > Table could be converted from Station. Some recipes that using Crafting Table as ingredient was oredicted.
    - ![](https://is.gd/JH1wMy "Chicken Wing Ring") fix uncraftable
    - ![](https://is.gd/q5Dw2P "Purified Crushed Lead Ore")![](https://is.gd/j4Aiga "Purified Crushed Uranium Ore") fix unsmeltable
    - ![](https://is.gd/zRRmNV "Network Visualisation Tool") purge and add tooltip about replacement
    - ![](https://is.gd/L3pRMp "Monster Ball") fix craft
    - ![](https://is.gd/sTakGu "Morphing Tool") replace ![](https://is.gd/cNcUwj "Silver Gear") => ![](https://is.gd/FDrAd0 "Aluminum Gear"), fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/87
    - [Inventory Panel Remote] fix uncraftable



## 🔵 **Mods updates**

  - ### 🏪 **Requious Fracto**: <img src="https://i.imgur.com/omLUmp4.png" align=right> Change JEI planets icons, add flux goo hint

  - Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/84

  - ### 🐉 **Ice and Fire**: Remove armor from `Dread Thrall`
      > Hopefully fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/80

  - ### 🐻 **Better Animals Plus**: Naval animals x3 - x4 times less spawn
      > This should help squids spawn more.
      > Anyway, you can always spawn squids with bait.



## 🔄 **Misc Changes**

  - <img src="https://i.imgur.com/Y0rVg0K.png" width=300 align=right> About 400 modded blocks now Fluidloggable. [Screenshot 2](https://i.imgur.com/OVihTqd.jpeg).
  - ![](https://is.gd/pchFPH "Flopper") x2 faster working to be anough speed for combinings with ![](https://is.gd/jddHvL "Drying Basin")
  - Add 4 new screenshots to main menu from player `jimgo514`
  - ### 📖 **Quest Book**: Quests: Misc changes
      > - Accept any cheese wheels now
      > - Add plasma bucket tip
      > - ![](https://is.gd/XqCZsR "Bedrock Miner") tip
      > - ![](https://is.gd/3YSbk7 "Crop") wiki link
      > - ![](https://is.gd/E5SXgp "Infinity Booster Card") move to Bragging Rights
      > - Add missing AE2 opening quest






# v0.66.0


## 🟡 Updated Mods

- **Zen Utils**
- **Chunk-Pregenerator**
- **CensoredASM**
- **ThaumTweaks**
- **Lootr (Forge)**
- **AE2 Fluid Crafting Rework**
- **Quark: RotN Edition**


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - <img src="https://i.imgur.com/gDy9Ar0.png" align=right> ![](https://is.gd/Qhrxfp "Ender Dragon Data Model") can be upgraded without killing dragon
    - ![](https://is.gd/FYLOHg "Treated Stick") from ![](https://is.gd/HBBDrk "Treated Wood Planks")
    - ![](https://is.gd/ZbNSw1 "Oxidized Ferric Sand") now obtainable from Asteroids
    - ![](https://is.gd/FrsEcH "Alumite Ingot") in Arc Furnace and ![](https://is.gd/oVvQdq "Alumite Block") in ![](https://is.gd/O19A3r "Electric Arc Furnace")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/gUYFvk "Lava Heat Exchanger") x2 power output buff
    - ![](https://is.gd/JkIhF9 "Clay-Coated Glowstone Dust") remove from [Arc Furnace] to make ![](https://is.gd/0eVQUR "Energetic Alloy Ingot") craftable
    - ![](https://is.gd/l9ISXw "Quantum Entangled Singularity") make oredicted to make craftable in ME
    - ![](https://is.gd/C37CSz "Ashes") from ![](https://is.gd/vZIgLF "Solid Fuel Firebox") make convertable to ![](https://is.gd/JDTXC0 "Ash")
    - ![](https://is.gd/RdmasP "Quantum Entangloporter") fix ME unpatternable



## 🔵 **Mods updates**

  - ### <img src="https://i.imgur.com/Hn3dxx4.png" width=300 align=right> 🔌 **Industrial Craft 2**: Disable Explosions 💣
      > People are tired exploding their ![](https://is.gd/OokXq2 "Matter Fabricator")

  - ### ☢️ **NuclearCraft**: Compressed RTGs - add radiation

  - ### 🏪 **Requious Fracto**: Add ![](https://is.gd/wJA44E "Firefly") and ![](https://is.gd/8aolIw "Cicada") hints from Twilight trees

  - ### 🛢️ **Immersive Petroleum**: Add planet spheres in JEI
      > Instead of BOP planet now would be sphere with appropriate block.



## 🔄 **Misc Changes**
  - <img src="https://i.imgur.com/ceAIjx1.png" width=300 align=right> ![](https://is.gd/bJM8Ye "Fluid Pipe") now fluidloggable
  - Add 2 new screenshots to main menu
  - Regenerate Thaumcraft aspects
  - **Chronologist** mob cap spawn to <20
  - **Lootr** disable conversions of ![](https://is.gd/C2E15A "Dropper") and ![](https://is.gd/uieLFV "Dispenser")
  - ![](https://is.gd/Q4LD0S "Void Helm")![](https://is.gd/BL7Tn4 "Void Chestplate")![](https://is.gd/JfwGDV "Void Leggings")![](https://is.gd/axfV5v "Void Boots") nerf protection
  - ### 🧩 **Mod Director**: Remove `Dynamic Surroundings` and `Ore Lib`
      > ModDirector cant load mods from CurseForge anymore

  - ### 📖 **Quest Book**: Quests: Misc changes
      > - Reward ![](https://is.gd/AFdGA5 "Heavy Ingot") with [Labeled Crate]
      > - ![](https://is.gd/LUafcg "Compacting Drawer") remove slime conversion hint (conversion not working)
      > - ![](https://is.gd/U0Pz71 "Zombie Data Model") Add quest
      > - ![](https://is.gd/tsdolA "Rat on Arrow") can't be tamed hint

  - ### 📜 **Text**: **Difficulty** trait ![](https://is.gd/pDF2bQ "Pink Slime Ingot"), add hint about working on armor






# v0.65.1





### 🧱 Fix NPE when Dank Null picking up items

  > This items related to function that merging Transmuting Stones from Thaumic Wonders
  > <img src="https://i.imgur.com/NArum2R.png" width=50%>




# v0.65.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/573/97/256/256/637934782154930654.png"          width="50"> | 🟩                                [**Pointer**](https://www.curseforge.com/minecraft/mc-mods/pointer)                       <sup><sub>pointer-1.0.jar</sub></sup> <br> Access a block from anywhere in the same dimension | Magic end-tech item to replace Wireless AE terminal
<img src="https://media.forgecdn.net/avatars/thumbnails/138/174/256/256/636519903439155200.png"         width="50"> | 🟧                            [**Smooth Font**](https://www.curseforge.com/minecraft/mc-mods/smooth-font)                   <sup><sub>SmoothFont-mc1.12.2-2.1.3.jar</sub></sup> <br> Draws all font smoothly for better readability and can replace to fonts in your computer. | Better and more permormanced font

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/301/368/256/256/637362118745351863.png"         width="50"> | 🟨                         [**Entity Culling**](https://www.curseforge.com/minecraft/mc-mods/entity-culling)                <sup><sub>EntityCulling-1.12.2-6.1.0.jar</sub></sup> <br> Skip rendering of hidden entities. | Removed since caused lot of different **crashes, lags and issues**. Players should install it optionally by themselves.
<img src="https://media.forgecdn.net/avatars/thumbnails/549/461/256/256/637886733123040054.png"         width="50"> | 🟩                              [**RenderLib**](https://www.curseforge.com/minecraft/mc-mods/renderlib)                     <sup><sub>RenderLib-1.12.2-1.1.0.jar</sub></sup> <br> Library for entity rendering | `Entity Culling` lib


## 🟡 Updated Mods

- **CraftTweaker**
- **Had Enough Items**
- **MixinBooter**
- **Lootr (Forge)**
- **AE2 Fluid Crafting Rework**
- **AE2 Unofficial Extended Life**
- **Fluidlogged API**


## ✏️ **Recipes**
  - Fix ![](https://is.gd/ZjbJBb "Destabilized Redstone Tank") craftable in ![](https://is.gd/g54T2G "Melter")
  - ![](https://is.gd/kzeKy1 "Advanced Scrap Factory Controller") fix hopper placement (now accept any placement)
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/8GG28e "Terrestrial Artifact")![](https://is.gd/ECUEr3 "Terrestrial Artifact Block") metling and recycling in ![](https://is.gd/BWfCX8 "Essentia Centrifuge")
    - ![](https://is.gd/K9miKD "Bacon") now considering as **PrimeMeat** and cook into ![](https://is.gd/QYogUU "Roast Prime Bacon")
    - **Energy Dimlet (Alpha)** and other dimlets fom **RFToolsDimTweaker** mod

  - ### ✐ **Cheaper**: ![](https://is.gd/3E7man "Stellar Energy Conduit")

  - ### ✎ **Harder**: ![](https://is.gd/SvWgZu "Fluxed Phyto-Gro") consume x50 times more RF to make (400,000 rf now)

  - ### ✏ **Misc Changes**
    - Remove ![](https://is.gd/HyTlkW "Copper Block") and other unified blocks from ![](https://is.gd/RVqGU0 "Compressor")
    - ![](https://is.gd/WM8ap4 "Shape Card") fix doesnt have UU cost
    - ![](https://is.gd/I0keaS "Fusewood Shard") and ![](https://is.gd/iE9K9a "Bloodwood Shard") fix ![](https://is.gd/h0kGXf "Part Builder") recipe
    - ![](https://is.gd/mwSvUD "High Pressure Steam Bucket") now can be high-efficient turn **Immersive Technology** turbine
    - ![](https://is.gd/zgKE73 "Digital Miner") fix uncraftable with previously placed ![](https://is.gd/WwBfmP "Advanced Computer")
    - ![](https://is.gd/8GG28e "Terrestrial Artifact") turn into ![](https://is.gd/ZernyE "Litherite") x4 times faster
    - ![](https://is.gd/DGPOhI "Flux-Infused Bow") replace TCon items as ingredients
    - ![](https://is.gd/IcyA4G "Dimension Enscriber") Make uncraftable. Use **Prototype** version
    - [Alienist's Stone][Alchemist's Stone][Transmuter's Stone] now combine durability on pickup. Note, that you get 10% bonus durability of lowest one, so its always more efficient to combine bigger stones together.
    - Melting ![](https://is.gd/otl5tj "Block of Enderpearl") now require 80k RF in ![](https://is.gd/beZ8SD "Magma Crucible (Basic)")
    - Jellyfish cant be milked with ![](https://is.gd/x1UUTj "Wooden Barrel") anymore



## 🔵 **Mods updates**

  - ### <img src="https://i.imgur.com/WebRuem.png" width=200 align=right> 🛢️ **Immersive Petroleum**: Add new reserviours
      > - Added about 50 new reserviours on other planets, including Twilight Forest or Luna
      > - Some reservoirs require more RF/t to pump out
      > - Reservoirs has various size, replenish rates and pump speed
      > - **KELT-2ab** has ![](https://is.gd/XBUhMq "Water Bucket") reserviour pump extremely fast (5,000,000 mb / tick)

  - ### 🌠 **Astral Sorcery**: set max perk level from `30` to `50`
      > Since modpack have huge play time, it would be cool if players spend more playtime by buffing their perks.  
      > Also, **Aevitas** perk now grants `25%` more XP, and **Evorsio** `25%` less

  - ### 🏪 JEI: Join 4 categories into **Crafting Hints**
      > - `cc_printer`
      > - `oc_printer3d`
      > - `special_craft`
      > - `xp_bottler`

  - ### 👨‍🏭 **Mekanism**: Misc config changes
      > - Set sound volume even lower
      > - ![](https://is.gd/RdmasP "Quantum Entangloporter") transfer RF x100 faster
      > - ![](https://is.gd/dkpGoG "Chargepad") x10 store buff

  - ### 🔨 **Tinker's Construct**: Nerf AA gems and Psimetal stats

  - ### 🦯 **Thaumcraft**: ![](https://is.gd/0cR12F "Impetus Generator") buff output to `20,000 RF/t`
      > Also, increase buffer and buff efficiency to `1 Impetus` = `5,000,000 RF`



## 🔄 **Misc Changes**
  - Remove tooltip from ![](https://is.gd/KwMcCF "Golden Lasso"), since its fixed already
  - Disable ThaumTweaks runic shielding changes (actually do nothing)
  - Lower chance of spawning ![](https://is.gd/6rnYdX "Cave Roots"), **speleothems**, **blazes** in nether, **Ashens** and **Dweller**
  - When press `F5` now you can see your face
  - Add tip about **Horologrium** + **Chaos Guardian**
  - Remove **Shady merchant** trades from JER
  - Enable `Convert Worldgen Inventories` for Lootr
  - Set `IGNORE_JAVA_CHECK=1;` for server settings to fix unable to lauch for some players
  - Add 3 new screenshots to main menu
  - ### 🌍 **World Generation**
    - <img src="https://i.imgur.com/8e3TpMd.png" width=200 align=right> **Emptiness (14676)** dimension better scan
      > Now all blocks like ![](https://is.gd/S1Fkcz "Eldritch Stone") or ![](https://is.gd/ZX1vYX "Ancient Stone") displayed propertly.
      > Also fix cinderpearl in overworld.
    - Disable **BoP** ores generation in Overworld
      > List of disabled ores:
      > - ![](https://is.gd/aOIaZO "Ruby Ore")![](https://is.gd/LBABKU "Peridot Ore")![](https://is.gd/oufhD6 "Topaz Ore")![](https://is.gd/NWKFIv "Tanzanite Ore")![](https://is.gd/wiMTCx "Malachite Ore")![](https://is.gd/LuiSI4 "Sapphire Ore")

  - ### 📖 **Quest Book**: Quests: Misc changes
      > - <img src="https://i.imgur.com/T1mrQlS.png" width=200 align=right> Add `Uncraftable TCon Parts` quest, fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/62
      > - Fix `Enderman` quest uncompletable
      > - Add quests for [Alienist's Stone][Alchemist's Stone][Transmuter's Stone]
      > - Remove ![](https://is.gd/2khgAR "Cursed Heart") and ![](https://is.gd/wVB45u "Enchanted Heart") quest
      > - Fix some typos
      > - Fix ![](https://is.gd/A40VNc "Void Ore Miner Controller Tier 1") quest uncompletable
      > - ![](https://is.gd/nH5rep "Apiary") add plants speedup info
      > - ![](https://is.gd/eGZu8O "Dimension Enscriber") quest replace to [Dimension Enscriber Prototype]
      > - ![](https://is.gd/kziTu3 "Advanced Package Crafter") add quest




# v0.64.0


## 🟠 Downgraded **Lootr**

  > New version of Lootr causing old world to [stall and crash](https://github.com/noobanidus/Lootr/issues/123).




# v0.63.0


## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/388/322/256/256/637579369193737704.png"         width="50"> | 🟫                       [**Integrated Proxy**](https://www.curseforge.com/minecraft/mc-mods/integrated-proxy)              <sup><sub>integrated_proxy-1.12-1.0.14.jar</sub></sup> <br> An addon for Integrated Dynamics that allows you to redirect the part's target to another position. | Removed until this bug would be fixed: https://github.com/shBLOCK/IntegratedProxy/issues/29

## 🟡 Updated Mods

- **ThaumTweaks**
- **Lootr (Forge)**
- **Aqua Acrobatics**


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**: ![](https://is.gd/0ld0jn "Centrifuge Core")![](https://is.gd/OgphPC "Centrifuge Tank")
    > Please report dupes

  - ### ✏ **Misc Changes**
    - Change ![](https://is.gd/bVmqm5 "Creative Gas Tank") and ![](https://is.gd/mUrlfo "Creative Fluid Tank") central ingredient from Trophies to PlusTIC centrifuge tank and core. This should fix uncraftable.
    - fix ![](https://is.gd/hv4ImX "Sponge") dupe in ![](https://is.gd/Fp7FPJ "Infinity Furnace")
    - fix some **Wireless Terminal**s uncraftable



## 🔵 **Mods updates**
  - Removed **Integrated Proxy** until this issue fixed: https://github.com/shBLOCK/IntegratedProxy/issues/29
  - ### 🔌 **Industrial Craft 2**: Fix config load crash after changing configs
      > Before fix, if you open IC2 configs ingame, `ic2.ini` was rewritten with errors that leads to crash game on next load
      > ```less
      > LoaderExceptionModCrash: Caught exception from IndustrialCraft 2 (ic2)
      > Caused by: java.lang.NumberFormatException: For input string: "2:367; Metal Press Mold"
      > ```
      > To fix comments should not have `:` in them

  - ### 🔨 **Tinker's Construct**: _**Enderium**_ now has **Endspeed** trait

  - ### 🦯 **Thaumcraft**: Revert ![](https://is.gd/9Vitsu "Thaumostatic Harness") speed to defaults
      > Also slightly lower vis costs



## 🔄 **Misc Changes** 
  - New texture for PlusTic Centrifuge <img src="https://i.imgur.com/GOVG4Z1.png" width=200 align=right></img>
  - Change **Sound Physics** mod to _non-optional_
    > Crashes it caused was fixed in latest mod updates
  - Disable sounds on items impact ground
  - AIReducer mod: remove task delay for every animania **cows and bulls**. This should help with breeding.
  - ### ⛏️ **Mining**: Harder Branch Bining: x10 less Dig Speed penalty
      > Many people report that HBM is too annoying. This change would keep HBM but make it less noticeble.






# v0.62.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/207/32/256/256/636963083899312742.png"          width="50"> | 🟨            [**AE2 Wireless Fluid Terminal**](https://www.curseforge.com/minecraft/mc-mods/wireless-fluid-terminal)       <sup><sub>WirelessFluidTerminal-1.12.2-1.0.4.jar</sub></sup> <br> Adds a Wireless Fluid Terminal with infinite range capbilities | More small addons for wireless terminals
<img src="https://media.forgecdn.net/avatars/thumbnails/207/22/256/256/636963030261217195.png"          width="50"> | 🟨              [**Wireless Pattern Terminal**](https://www.curseforge.com/minecraft/mc-mods/wireless-pattern-terminal)     <sup><sub>WirelessPatternTerminal-1.12.2-1.0.3.jar</sub></sup> <br> Adds a wireless version of the AE2 Pattern Terminal | 
<img src="https://media.forgecdn.net/avatars/thumbnails/207/40/256/256/636963114692628381.png"          width="50"> | 🟨        [**AE2 Wireless Interface Terminal**](https://www.curseforge.com/minecraft/mc-mods/wireless-interface-terminal)   <sup><sub>WirelessInterfaceTerminal-1.12.2-1.0.2.jar</sub></sup> <br> A wireless version of the AE2 Interface Terminal | 
<img src="https://media.forgecdn.net/avatars/thumbnails/559/283/256/256/637908604129051982.png"         width="50"> | 🟧                  [**dan's Crafting Tweaks**](https://www.curseforge.com/minecraft/mc-mods/dans-crafting-tweaks)          <sup><sub>CraftingTweaks_1.12.2-9.0.1.jar</sub></sup> <br> A Continuation of Crafting Tweaks for 1.12.2 | Maintained fork of **Crafting Tweaks**
<img src="https://media.forgecdn.net/avatars/thumbnails/337/5/256/256/637473842688195004.png"           width="50"> | 🟫                          [**Lootr (Forge)**](https://www.curseforge.com/minecraft/mc-mods/lootr)                         <sup><sub>lootr-1.12.2-0.3.0.jar</sub></sup> <br> A mod that makes it so nobody misses out on Loot! All loot chests are instanced per player and visually unique. | Buffs adventure for multiplayer
<img src="https://media.forgecdn.net/avatars/thumbnails/343/120/256/256/637487797218677486.png"         width="50"> | 🟩                     [**Better Biome Blend**](https://www.curseforge.com/minecraft/mc-mods/better-biome-blend)            <sup><sub>betterbiomeblend-1.12.2-1.1.7-forge.jar</sub></sup> <br> Improves and fixes biome color blending | Better graphics
<img src="https://media.forgecdn.net/avatars/thumbnails/551/761/256/256/637890134785772271.png"         width="50"> | 🟩                          [**Spectral Edge**](https://www.curseforge.com/minecraft/mc-mods/spectral-edge)                 <sup><sub>spectral_edge-forge-1.12.2-1.2.jar</sub></sup> <br> Adds a new enchantment called Spectral Edge | Enchantment better suited for health changes in modpack
<img src="https://media.forgecdn.net/avatars/thumbnails/385/984/256/256/637574191414697010.png"         width="50"> | 🟧                        [**Fluidlogged API**](https://www.curseforge.com/minecraft/mc-mods/fluidlogged-api)               <sup><sub>Fluidlogged-API-v1.8.1c-mc1.12.2.jar</sub></sup> <br> This mod adds basic fluidlogging to 1.12, and serves a base or optional api for other mod devs to use in their own projects. | Nice future MC features

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/49/427/256/256/636077959957495136.png"          width="50"> | 🟫                        [**Crafting Tweaks**](https://www.curseforge.com/minecraft/mc-mods/crafting-tweaks)               <sup><sub>CraftingTweaks_1.12.2-8.1.9.jar</sub></sup> <br> Allows you to rotate, balance or clear the crafting matrix by the press of a button, in any (supported) crafting window. | Replaced by fork

## 🟡 Updated Mods

- **Village Names**
- **Industrial Craft**
- **Entity Culling**
- **RenderLib**
- **Chunk Animator**
- **RFTools Dimension Tweaker**
- **ModTweaker**


## ✏️ **Recipes**

  - ### 🖉 **New Recipes** <img src="https://i.imgur.com/dGhiHkh.png" width=200 align="right" />
    - **/dank/null Docking Station** add recipe
    - **Creative Wireless Ultimate Terminal** add recipe 
    - ![](https://is.gd/KviMg5 "Rock Crystal") add "Technical" recipe in ![](https://is.gd/iKbzwH "Simple Sagmill (decoration block)")
    - ![](https://is.gd/sbuUeI "Drop of Evil") from ![](https://is.gd/EEYJkw "Pristine Wither Skeleton Matter")
    - ![](https://is.gd/UAgI7Z "Distilled Water") and ![](https://is.gd/BetBeD "Steam") add conversions

  - ### ✐ **Cheaper**
    - ![](https://is.gd/Polcvk "Fluix Aggregator")
    - ![](https://is.gd/qj72Wi "Redstone Proxy")

  - ### ✎ **Harder**: ![](https://is.gd/UiOZdW "Resonating Crystal")

  - ### ✏ **Misc Changes** <img src="https://i.imgur.com/WCSEA0j.png" width=200 align="right" />
    - ![](https://is.gd/SSovby "Light Blue Crystal Cluster")![](https://is.gd/hYaDh9 "Blue Crystal Cluster")![](https://is.gd/hTqBiP "Green Crystal Cluster")![](https://is.gd/RXzdI1 "White Crystal Cluster")![](https://is.gd/00L0rQ "Black Crystal Cluster")![](https://is.gd/Viyz2L "Red Crystal Cluster") in ![](https://is.gd/fidfU6 "Rat Upgrade: Gemcutter") now crafts from blocks (fixes diamond conflict)
    - Fix **Excavate Modifier** and **Airtight Seal**  books was uncraftable
    - [Shimmerleaf Seed][Cinderpearl Seed][Vishroom Spore] fix output amount. Was 1 now 8
    - ![](https://is.gd/QKfqGF "Hopper") remove melting to prevent Iron => Aluminium conversion
    - [Alienist's Stone][Alchemist's Stone][Transmuter's Stone] now have 65000 durability but craft different ways and can be combuned
    - ![](https://is.gd/eNtVPQ "Gold Nugget") and all other nuggets now cant be beneficate directly, but turn into ![](https://is.gd/3QCDqy "Crystallized Gold Shard")
    - ![](https://is.gd/6wTi0c "Dirty Gold") and all other Dirty ore now ouput more when processed in advanced machines. For example, in ![](https://is.gd/x3QHJA "Chemical Dissolution Chamber") 1 Dirty Ore equal to 23 ingots
    - ![](https://is.gd/32nngS "Copper Plate") and other plates remove craft from 1 ingot
    - ![](https://is.gd/D1Lle9 "Crystal Matrix Ingot") change requirments of ![](https://is.gd/N6RCLx "Diamond Lattice") from 4 to 1
    - Fix **Tungsten Ore Chunk** output from Void miner



## 🔵 **Mods updates**
  - ### 📑 **Tips**: add ![](https://is.gd/DmnIMW "Printed Page") guide

  - ### <img src="https://i.imgur.com/eZ8Gv1g.png" width=200 align="right" /> 🔌 **Industrial Craft 2**
    - Remove UU-values calculating on game load
      > This would fix strange bug, when predefined values was rewritten with wrong ones.
      > Also, this would remove some small UU recipes, like wooden slabs or buttons
    - ![](https://is.gd/RT2K1G "Semifluid Generator") add JEI category and new fuels
      > This made possible with fix NoClassDef error via Bansoukou.
      > Additional fuels: ![](https://is.gd/OXjDhS "Biodiesel Tank")![](https://is.gd/NUKeO3 "Biofuel Tank")![](https://is.gd/jHplnz "Biocrude Tank")![](https://is.gd/BMSN2B "Grassoline Tank")

  - ### 🧻 **JEI**: blacklist updates

  - ### 🪐 **AdvRocketry**: Buff ![](https://is.gd/7R3HwG "Power Input Plug") cap to `200,000,000` RF
      > Also remove quest book mention about 100k limit

  - ### 🍱 DankNull: Now consuming Catalyst to insert into ![](https://is.gd/QrzYSD "Station Docking Port")



## 🔄 **Misc Changes**
  - Ice&Fire dragons exclude from EntityCulling
  - Fix ![](https://is.gd/7MSBOT "Jetpack") and ![](https://is.gd/yYupHs "Treetap") crash by disabling **Sound Physics** for IC2
  - Fix xnet not displaying rf/t for energy channels
  - Updated Solar Tower schematics
  - ### 🌍 **World Generation**:
    - x4 less [Exhausting Ore]
    - x10 less metal blocks on `Io`



# v0.61.1


## 🟡 Updated Mods

- **Had Enough Items**
- **U Team Core**
- **RenderLib**
- **Aqua Acrobatics [Forge]**
- **CensoredASM**
- **AE2 Fluid Crafting Rework**


## 🔄 Fix wrong manifest
  > `v0.61.0` was missed actual `manifest.json`




# v0.61.0



## ✏️ **Recipes**
  > <img src="https://i.imgur.com/aKG0uRn.png" width="150" align="right"/>
  - ![](https://is.gd/2p4jtA "Liquid Sunshine Tank") and all other EnderIO liquids in ![](https://is.gd/ENnoOy "Chemical Reactor") require different ingredients to exclude conflicts
  - ![](https://is.gd/IGyW4P "Potion of Levitation") fix craft
  - Buff ![](https://is.gd/YbwSrd "Chlorine Bucket") and ![](https://is.gd/1C0xOb "Molten Sodium Bucket") output x7.5 and x3 times faster

## 🔵 **Mods updates**
  - ### 👿 **Extra Utilities 2**: Fix ![](https://is.gd/KwMcCF "Golden Lasso") teleport entities back
      > Vanilla bug `MC-2025` was fixed in `Random Patches`, but also in mod `Surge`.
      > Surge's version of fix was not good enough, so i disable it now.

  - ### 🔌 **Industrial Craft 2**: Buff crops growth `x10` faster
      > Go reed, go!

  - ### 🦯 **Thaumcraft**
    >  <img src="https://i.imgur.com/k9kJwbk.gif" width="150" align="right"/>
    - ![](https://is.gd/8tL5ej "Impulse Cannon") fix damage in Burst mode
      > ![](https://is.gd/162pCc "Burst Fire Conversion") upgrade was shot too fast, that cause Better Hurt Timer to clamp damage. Now `Impetus` damage type capped by 1 tick, making it unable to fire fast.
    - Fix `NullPointerException` crash with Thaumatorium
      > Sometimes Top part of thaumatorium was unaware about bottom. Fixed with explicit null check
      > 
      > ```cs
      > java.lang.NullPointerException at thaumcraft.common.tiles.crafting.TileThaumatoriumTop.isEmpty(TileThaumatoriumTop.java:262)
      > ```

  - ### 🛢️ **Immersive Engineering**: IE: Buff Alternator x2 times (Steam Turbine Generator)
      > Now it output up to `24,576 rf/t`

  - ### 🍗 **Scaling Feast**: Config changes
      > - `How a player's max saturation should scale to their max hunger` set to *player's saturation can never be higher than half of their max hunger.*
      > - Remove all Scaling Feast potions and several enchantments



## 🔄 **Misc Changes**
  >  <img src="https://i.imgur.com/tQHV9gQ.jpg" width="200" align="right"/>
  - Add more screenshots to main menu
  - Add Schematics for `Immersive Technology`/`Electrolytic Crucible Battery`
  - Set `itemCombinationMode=ENABLED` for **NotEnoughEnergetics**
  - Only show the health bar for the entity looked at
  - Disable chest spawn on skyblock island (we dont need chest since there is nothing in it)
  - Set default `view_distance` for server to `12` (may cause lags on server-side)
  - Hide tooltip of ![](https://is.gd/cR0aiJ "Osmium Ore") because its not actually at any level.
  - ### 📖 **Quest Book**: Quests: Misc changes
    > - Accept Any charged ![](https://is.gd/P3ztKd "Cropnalyzer")
    > - Accept any ![](https://is.gd/TchPPc "Pink Castle Rune Brick")
  - ### 🔥 **Nether** health restriction set to 30 HP (15 hearts)
    > was 40

## 🌍 Worldgen: Mercury overhaul
  >  <img src="https://i.imgur.com/1W95Z7S.png" width="200" align="right"/>
  - now uses its unique biome, made from ![](https://is.gd/WwqwTr "White Sand") and ![](https://is.gd/SgS49V "White Alabaster")
  - removed pyrotheum lakes from Mercury
  - added better caves config to ban 99% of remaining water on Mercury
  - remove atmosphere from Mercury



# v0.60.1


## 🔵 **Mods updates**
  - Fix accidentally added wrong AE2 version
  - ### 🦯 **Thaumcraft**: Slightly revert latest [Void Thaumturge Boots] buff
      > They becomes too fast to play.






# v0.60.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/49/427/256/256/636077959957495136.png"          width="50"> | 🟨                        [**Crafting Tweaks**](https://www.curseforge.com/minecraft/mc-mods/crafting-tweaks)               <sup><sub>CraftingTweaks_1.12.2-8.1.9.jar</sub></sup> <br> Allows you to rotate, balance or clear the crafting matrix by the press of a button, in any (supported) crafting window. | Could be handy, used in many modpacks

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/266/967/256/256/637234263329276851.png"         width="50"> | 🟫                     [**Game Stages Viewer**](https://www.curseforge.com/minecraft/mc-mods/game-stages-viewer)            <sup><sub>gamestagesviewer-1.0.jar</sub></sup> <br> Visualize the your stages of the Game Stages | This mod was more confusing to players. As a reminder, GameStages only serve technical needs.

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **NuclearCraft**
- **Atlas Lib**
- **RenderLib**
- **Chunk-Pregenerator**
- **Better P2P**
- **Thaumic Augmentation**
- **AE Additions - ExtraCells2 Fork**
- **AE2 Fluid Crafting Rework**


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/4kndYB "Ash Block") very cheap in ![](https://is.gd/LDD9Qs "Crucible")
    - ![](https://is.gd/u8L9az "Hungry Chest") now includes in **ore:chest**. This means, you can use Hungry Chest in recipes
    - ![](https://is.gd/ftz1bR "Dimlet Parcel") from ![](https://is.gd/K75cqB "Pristine Shulker Matter")

  - ### ✐ **Cheaper**
    - ![](https://is.gd/IAzYnJ "Entity Cell")  
      <img src="https://i.imgur.com/2GxUFfF.png" width=200>
    - ![](https://is.gd/kciZQ2 "Adaminite Block")  
      <img src="https://i.imgur.com/YDagR2i.png" width=200>
    - ![](https://is.gd/7i7929 "Vis Battery")  
      <img src="https://i.imgur.com/F5vY1Ai.png" width=200>

  - ### ✎ **Harder**: ![](https://is.gd/JCz5iV "Gas Upgrade") make way harder and stackable x64  
    <img src="https://i.imgur.com/U11vF88.png" width=200>

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/7XysFO "Advanced Circuit Plate") and ![](https://is.gd/tbcZNv "Basic Circuit Plate") fix ![](https://is.gd/K4VAlu "Precision Laser Etcher") recipe (wrong plates)
    - ![](https://is.gd/s8UJJY "Basalt") add to Chisel  
      <img src="https://i.imgur.com/cwytlua.png" width=200>
    - ![](https://is.gd/A7u7S9 "Potion of Extension") fix turn to ![](https://is.gd/HIzQ10 "Potion of Gravity") when trying to add **Redstone Dust**
    - ![](https://is.gd/XgGyrg "Potion of Health Boost") fix uncraftable
    - Fix **Tungsten Ore Dust** => ![](https://is.gd/Kda0A6 "Tungsten Ingot") smelting



## 🔵 **Mods updates**
  - ### 🌠 **Astral Sorcery**: Remove Yellorite from Aevitas perk
      > And from Void Trash perk too

  - ### 🏪 **Requious Fracto**: JEI add ![](https://is.gd/yRpWIP "Ancient Spores") => ![](https://is.gd/KCSC1W "Mycelium") info

  - ### 👿 **Extra Utilities 2**: Drum fix bucket vanishing on full inventory
      > Makes it unable to right-click a barrel with any item when you have no empty slots

  - ### 🦯 **Thaumcraft**
    - Buff **Impetus** gear
      > ![](https://is.gd/hk8rgW "Void Thaumaturge Boots")![](https://is.gd/8tL5ej "Impulse Cannon")![](https://is.gd/9Vitsu "Thaumostatic Harness") buff this and some other **Thaumic Augmentation** items significantly.  
      ![](https://is.gd/8tL5ej "Impulse Cannon") for example now deals 100 damage in Railgun mode.
    - x20 Buff ![](https://is.gd/Ildldo "Magic Mirror") & ![](https://is.gd/9jLccA "Essentia Mirror")  
      > Now mirrors 20 times faster restore their `instability` value.  
      > For example, the ![](https://is.gd/Ildldo "Magic Mirror"):  
      > For each item passed or received, the mirror gains 1 point of **instability**. When 128 points are accumulated, 1 unit of Flux pollution is added.  
      > Previously, the mirror restores 1 point of instability every 100 ticks (5 seconds).  
      > With the new change, the mirror will restore every 5 ticks, allowing transfer 4 items per second without pollution.  
    - Disable need to sleep to craft ![](https://is.gd/qGsUjc "Salis Mundus")

  - ### 🧻 **JEI**
    - Add [Factory Hopper] to **#Hopper**
    - blacklist updates

  - ### 🍃 **Botania**
    - Add tooltips of required mana
    > <img src="https://i.imgur.com/hsYf6D1.png" width=200/>



## 🔄 **Misc Changes**
  - Changed ![](https://is.gd/waBg0Q "Dilithium Ore") mining level from 4 to 10 (to match rutile)
  - Regenerate Thaumcraft aspects (some aspects was fixed)
  - OpenBlocks Tropy and Psi programmer culling fix
  - Rebalance AdvRock fuels (better fuels give more thrust)
  - ### 🧩 **Configs**: Set `IGNORE_OFFLINE` option
      > since sometimes this cause unable to launch server

  - ### 📖 **Quest Book**: Quests: Misc changes
      > - Give free ![](https://is.gd/oobwOD "Thaumometer") for ![](https://is.gd/BfqQHG "Arcane Workbench") quest
      > - Add quests for ![](https://is.gd/kciZQ2 "Adaminite Block") and ![](https://is.gd/lL4nS4 "Mithrillium Block")
      > - Now Trophyes for each completed chapter could be received only as team
      > - New Quest "IF Upgrades" for crystal memory usage info
      > - Added a quest pointing out ores on other planets



## 🌍 **World Generation**

  - ### Make **Io** spawn EnderIO metals in bedrock stalagmites
    > You would need some kinds of Miner machines to reach them.
    > 
    > <img src="https://i.imgur.com/P6beiFb.jpg" width=200 />
    > <img src="https://cdn.discordapp.com/attachments/911676461050642434/984761477380583474/unknown.png" width=200 />
    > <img src="https://cdn.discordapp.com/attachments/911676461050642434/984764937169690634/javaw_ezktcQZebv.png" width=200 />  
    > 
    > Also, make water dark on this planet.

  - ### Other Advanced Rocketry planet tweaks (from [TrashboxBobylev](https://github.com/TrashboxBobylev))

    - Surface tweaks
      > - Mercury is now mountains instead of volcanic island, to differentiate it from Venus
      > - Io uses Volcanic biome instead of default moon one and generates more hilly
      > - Titan uses wasteland biomes instead of default moon one
      > - fixed Neptune's fluid generation scripts
      > - Enable caves on all planets (only works for new-created worlds)

    - Ore tweaks
      > - blacklisted bedrock ores from Mercury, as it was causing stackoverflow issues
      > - increased amount of ![](https://is.gd/nFgkwj "Lead Ore") on Titan
      > - ![](https://is.gd/X0p6yV "Uranium Ore") generates on Titan 10x as frequently
      > - ![](https://is.gd/Aoybj8 "Redstone Ore") generates on Philucka 8-9x as frequently
      > - ![](https://is.gd/KzaWxj "Copper Ore") generates 5x times as high on Europa
      > - ![](https://is.gd/DI6Jbz "Nickel Ore") generates 5x times as high on Uranus
      > - ![](https://is.gd/1slPka "Tin Ore") and ![](https://is.gd/fZJj6E "Aluminum Ore") spawn 5x as often on Mercury
      > - ![](https://is.gd/KMMFol "Lapis Lazuli Ore") appears roughly 5x as often on Neptune
      > - ![](https://is.gd/sLEWp7 "Gold Ore") spawns roughly 4x-5x as often on Venus
      > - ![](https://is.gd/jArjba "Iron Ore") generates twice as often on Mars
      > - ![](https://is.gd/YzhTM5 "Diamond Ore") and ![](https://is.gd/FFPgku "Coal Ore") generate as much as twice as often on Novus
      > - added ![](https://is.gd/8n4iNU "Gelid Cryotheum Tank") + ![](https://is.gd/g3wz5W "Aurora Block") lakes to Neptune



# v0.59.0



- ### 🦯 **Thaumcraft**: Recipes rework, part two
  > 💪 Buffs
  >
  > - ![](https://is.gd/TY2Upx "Lamp of Fertility") buff x5 less ![](https://is.gd/PdXK7a "Desiderium Vis Crystal") consumed
  > - ![](https://is.gd/hokB0t "Void Pickaxe of the Core")![](https://is.gd/AkYpxR "Void Shovel of the Earthmover")![](https://is.gd/X97E6a "Void Axe of the Stream") buff **Efficiency**
  >
  > 💫 Revert
  >
  > - ![](https://is.gd/LzO2JF "Pickaxe of the Core")![](https://is.gd/OHps4j "Shovel of the Earthmover")![](https://is.gd/e7PoEL "Axe of the Stream") revert latest **Efficiency** buff partially, now pick is `24`, showel `10`, axe `120`.
  > - ![](https://is.gd/DIQV93 "Ink Sac") and ![](https://is.gd/QFx9bA "Slimeball") revert Hedge Alchemy recipes
  >
  > ✏️ Recipes
  >
  > - ![](https://is.gd/fsGJbH "Mithrillium Plate")![](https://is.gd/D4EbjY "Adaminite Plate")![](https://is.gd/oWNwxi "Mithminite Plate") Unify recipes same as other plates in modpack
  > - ![](https://is.gd/BVvKf2 "Blank Greater Focus")![](https://is.gd/xamg7S "Control Seal: Block Breaker")![](https://is.gd/VMolGL "Biothaumic Mind") Less instablility in craft
  > - ![](https://is.gd/I7ZMwe "Causality Collapser") Change recipe to 1 amount (4 wont craft)
  > - ![](https://is.gd/2u6GsZ "Alchemical Brass Ingot")![](https://is.gd/Ofipbe "Thaumium Ingot") fix uncraftable
  > - ![](https://is.gd/iIkEEU "Osmotic Enchanter") way harder, gated behind ![](https://is.gd/dzV0xW "Shadow Enchanter")
  > - ![](https://is.gd/NAazR1 "Sanitizing Soap")[Flux Capacitor][Flux Distiller] cheaper
  > - x3 less **Nuggets** when melting any **Native Cluster** in ![](https://is.gd/alncus "Infernal Furnace")
  > - **Aluminum native Cluster** fix melting

## ✏️ **Recipes**
  - [Single Compressed Clay] now made from blocks instead of Balls
  - [(every) Sign] (engineer) Chiseling

## 🔵 **Mods Changes**
  - ### 🌡️ **Thermal Expansion**: Thermal Innovations: Enable Saw and Drill
      > And make drill recipe really hard to not shadow TCon tools


## 🔄 **Misc Changes**

  - Change **Sound Physics** mod to optional

  - ![](https://is.gd/Nf1PYA "Stellar Pickaxe")![](https://is.gd/Ax3nJG "Stellar Axe") buff mining level to 12 **Supremium**

  - ### 📖 **Quest Book**: Quests: Misc changes
      > - Fix Mini-Gates was unable to finish
      > - Add ![](https://is.gd/0330S0 "Lamp of Fertility")
      > - Add [Flux Distiller] quest
      > - Make Astral Sorcery tables commands visible
      
  - 🚜 [Excavate Modifier] Rework (fixes)
    > - Harder recipe (lot of cobble and 4 ![](https://is.gd/Ugnwhy "Bronze Plate"))
    > - Change maximum of tinkers modifiers to 6, still 1 mod each level
    > - Change back *block limit* to 256 (same as in E2E)



# v0.58.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/549/461/256/256/637886733123040054.png"         width="50"> | 🟩                              [**RenderLib**](https://www.curseforge.com/minecraft/mc-mods/renderlib)                     <sup><sub>RenderLib-1.12.2-1.0.6.jar</sub></sup> <br> Library for entity rendering | New Dependency for EntityCulling
<img src="https://media.forgecdn.net/avatars/thumbnails/548/30/256/256/637882959576383371.png"          width="50"> | 🟫              [**AE2 Fluid Crafting Rework**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)     <sup><sub>Fluid Craft for AE2-2.2.1-r.jar</sub></sup> <br> A port and reworked  of AE2FC. Implement the fluid autocrafting mechanic in AE2. | Fork of old Fluid Crafting

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/276/640/256/256/637266832013509313.png"         width="50"> | 🟨                     [**AE2 Fluid Crafting**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting)            <sup><sub>ae2fc-1.12.2-1.0.11.jar</sub></sup> <br> Implements an experimental fluid autocrafting mechanic in AE2. | Replaced by Fork
<img src="https://media.forgecdn.net/avatars/thumbnails/235/398/256/256/637085039429483186.png"         width="50"> | 🟫                    [**FTB Quests Importer**](https://www.curseforge.com/minecraft/mc-mods/ftb-quests-importer)           <sup><sub>FTBQImporter-forge-1.12.2-2.0.1.jar</sub></sup> <br> A small utility mod that lets you import Better Questing Quests and Loot Crates into FTB Quests | Migration completed. If you update from `v0.54.0` and earlier you should install this mod manually and follow [guide](https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/tag/v0.55.0)
<img src="https://media.forgecdn.net/avatars/thumbnails/18/121/256/256/635674360665172055.png"          width="50"> | 🟧                    [**Thaumic Energistics**](https://www.curseforge.com/minecraft/mc-mods/thaumic-energistics)           <sup><sub>thaumicenergistics-2.2.4.jar</sub></sup> <br> Essentia management in storage, transportation, and application | Replaced by [fork](https://github.com/811Alex/ThaumicEnergistics), downloaded with ModDirector

## 🟡 Updated Mods

- **Had Enough Items**
- **Minor Integrations and Additions (MIA)**
- **LibVulpes**
- **Advanced Rocketry**
- **Entity Culling**
- **CensoredASM**


## 🦯 **Thaumcraft** rework, part one
  Thaumcraft was too complicated and with too many microcrafts.  
  These changes will help Taumcraft and its addons to better fit into the modpack, to have more links with other mods.
  
  🧪 Research

  - ![](https://is.gd/IkaTmz "Blank Lesser Focus") require only book instead of 2 items with enchantments
  
  ⛏️ Tools

  - ![](https://is.gd/Ofipbe "Thaumium Ingot") Buff Thaumium as TCon material
  - ![](https://is.gd/i6zyUV "Thaumium Chestplate") now not require manasteel to craft
  - ![](https://is.gd/LzO2JF "Pickaxe of the Core")![](https://is.gd/OHps4j "Shovel of the Earthmover")![](https://is.gd/e7PoEL "Axe of the Stream") Insanely buff mining speed (use Mining Control now)
  - ![](https://is.gd/e7PoEL "Axe of the Stream") buff damage to 25
  - ![](https://is.gd/rMC3lP "Crimson Cult Helm")![](https://is.gd/jxDwf5 "Crimson Cult Chestplate")![](https://is.gd/KvwYph "Crimson Cult Greaves")![](https://is.gd/6VDN0f "Crimson Cult Boots")![](https://is.gd/aGQWVh "Crimson Cult Hood")![](https://is.gd/qjjDGc "Crimson Cult Robe")![](https://is.gd/d4Qf69 "Crimson Cult Leggings")![](https://is.gd/juD0Ep "Crimson Praetor Helm")
  ![](https://is.gd/Qs65Ac "Crimson Praetor Chestplate")![](https://is.gd/NKqruO "Crimson Praetor Greaves") buff Protection and Toughness values
  
  ✏️ Recipes

  - ![](https://is.gd/2u6GsZ "Alchemical Brass Ingot") now made from ![](https://is.gd/06WiPu "Aluminum Brass Ingot"), x2 output
  - ![](https://is.gd/Ofipbe "Thaumium Ingot") now made from ![](https://is.gd/GzQYNc "Lead Ingot")
  - ![](https://is.gd/wfIn7J "Mundane Amulet")![](https://is.gd/XOX9rP "Fancy Amulet")![](https://is.gd/uWUUEK "Golemancer's Bell") reset to default recipes (cheaper)
  - ![](https://is.gd/OFqpXu "Zombie Essence") => ![](https://is.gd/Gj0ZOM "Zombie Brain") add peaceful recipe
  - ![](https://is.gd/A4h9J8 "Arcane Grappler")![](https://is.gd/WJ5Ztv "Grappler Spool")![](https://is.gd/lFWb9O "Grappler Head")![](https://is.gd/XZItFE "Paving Stone of Travel")![](https://is.gd/cZsNV9 "Simple Arcane Mechanism")![](https://is.gd/ckohiO "Complex Arcane Mechanism")![](https://is.gd/LurYWg "Arcane Pattern Crafter")![](https://is.gd/FA3Opb "Crimson Rites")![](https://is.gd/KVi9dD "Spawn Lesser Crimson Portal")![](https://is.gd/BVvKf2 "Blank Greater Focus")![](https://is.gd/xamg7S "Control Seal: Block Breaker")![](https://is.gd/VMolGL "Biothaumic Mind")![](https://is.gd/I7ZMwe "Causality Collapser") cheaper
  - Also most recipes in **Hedge Alchemy** cheaper (like ![](https://is.gd/dtO6aD "Spider Web") or ![](https://is.gd/QFx9bA "Slimeball"))
  - ![](https://is.gd/yEhVBZ "Sky Stone Block") add **Alienis** aspect
  - ![](https://is.gd/WGP0UT "Native Lead Cluster") fix furnace output
  - ![](https://is.gd/Gr5ADq "Black Quartz Block") fix conflict with ![](https://is.gd/sklbgS "Block of Smokey Quartz")
  
  🔃 Other:
  
  - ![](https://is.gd/BeZY9z "Vis Generator") Buff x10 times
    > Was 20 rf/t and 1k rf from 1 vis.
    > Now 200 rf/t and 10k / vis

  - ![](https://is.gd/LzO2JF "Pickaxe of the Core") Buff __*Refining*__ Infusion Enchantment
    > Now it works this way:
    > - `I` 50% chance to drop native cluster instead of Ore
    > - `II` 100% chance
    > - `III` 100% of one ore +50% of second
    > - `IV` 1 + 75% of second

--------

## ✏️ **Recipes**
  - Fix "Wrond recipe name" warnings for vanilla => tcon conversion
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/tWaivc "Gaia Spirit") add Peaceful recipe
    - ![](https://is.gd/YqfSmo "Rat Toga") now craftable in Peaceful
    - ![](https://is.gd/FYLOHg "Treated Stick") in different machines

  - ### ✐ **Cheaper**
    - ![](https://is.gd/EguiFN "Crystallized Lapis Lazuli Shard") and other shards in ![](https://is.gd/j2kgcC "Starlight Infuser")
    - ![](https://is.gd/gQmBTn "Conglomerate Of Life")![](https://is.gd/nEHqwr "Inventory Rerouter")![](https://is.gd/2khgAR "Cursed Heart")![](https://is.gd/wVB45u "Enchanted Heart")![](https://is.gd/2mWd6x "Compact Machine Wall")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/J78CzO "Polymer Clay") fix bucket variant. Now craftable in ![](https://is.gd/m7hyAw "Fluid Crafter")
    - ![](https://is.gd/JcpEwP "Smooth End Stone")![](https://is.gd/XV51U6 "End Stone Pillar")![](https://is.gd/4pQpga "Chiseled End Bricks") add to ![](https://is.gd/zcDUCZ "Chisel")
    - Remove enchantments since they are duplicates from other mods: Cyclic's **Auto-Smelt** and **Magnet**, EnderIO's **AutoSmelt**



## 🔵 **Mods updates**
  - ### 🏪 **Requious Fracto**: JEI add some **Crafting Hints** entries
      > ![](https://is.gd/NpmF7k "Weak Blood Shard")![](https://is.gd/APDZnP "Canola Oil Bucket")![](https://is.gd/gm3U9c "Refined Canola Oil Bucket")![](https://is.gd/cYzgjS "Liquid Antimatter Bucket")

  - ### 🐝 **Forestry**: ![](https://is.gd/69h95v "Digging Backpack") add capability for ![](https://is.gd/b2QUkI "Compressed Dirt")
      > And all other compressed blocks

  - ### 💼 **Actually Additions**: Buff ![](https://is.gd/mP2vMg "Display Stand") RF input & storage
      > It was 80k storage and 1k RF/t input.  
      > Now its 320k and 2k

  - ### 📑 **Tips**: `/restart_server` Command: fix serverside message to unlocalized

  - ### 🔨 **Tinker's Construct**: Buff ![](https://is.gd/s3WhsP "Molten Sunnarium Bucket") and ![](https://is.gd/O7LMP2 "Mirion Ingot") mining levels
      > Now 12 and 11 respectively

  - ### 🩸 **Blood Magic**: Fix Meteor now spawn all ores
      > Fixes [#59](https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/59)

  - ### 🛢️ **Immersive Engineering**: Buff Excavator's veins
      > `x2.5` Increase chance that a given chunk will contain a mineral vein (from `0.2` to `0.5`)



## 🔄 **Misc Changes**
  - Add tooltip to ![](https://is.gd/KwMcCF "Golden Lasso"), since its bugged and not working
  - Some changes in default configs
  - 🚜 *__Excavate Modifier__* Rework
    > - Each modifier level require empty slot (was only first)
    > - Maximum level is 12 (was 5)
    > - Excavate enchantment now have `VI` levels
    > - The maximum number of blocks that can be excavated at once is `512` (was `256`)
    > - 📖 Pick quest rewards with 3 exccavate modifiers
    > - Add tooltip

## 📖 **Quest Book**: Quests: Misc changes
  > - Remove ![](https://is.gd/0OomHZ "Pattern Chest") duplicate from quest "Mining level 1"
  > - Lang additions for ![](https://is.gd/YQ1B21 "Golden Egg") quest
  > - [Grapple Gun] as Thaumcraft opening quest
  > - Ignore damage for ![](https://is.gd/XzsETi "Goggles of Revealing") quest and few other armor quests in Thaum
  > - Few additional thaumcraft quests based on TC vanilla scanning orders



# v0.57.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/181/645/256/256/636802039112320410.png"         width="50"> | 🟨             [**Too Many Efficiency Losses**](https://www.curseforge.com/minecraft/mc-mods/too-many-efficiency-losses)    <sup><sub>tmel-1.12.2-1.4.0.0.jar</sub></sup> <br> Fixes that nasty efficiency loss in Extra Utilities 2 that makes large farms impossible and more. | Added to tweak EU2 generator GP output values
<img src="https://media.forgecdn.net/avatars/thumbnails/332/156/256/256/637462671721313813.png"         width="50"> | 🟩            [**Thaumcraft Research Patcher**](https://www.curseforge.com/minecraft/mc-mods/thaumcraft-research-patcher)   <sup><sub>ThaumcraftResearchPatcher-1.12.2-1.1.3.jar</sub></sup> <br> A Thaumcraft addon that allows adding and editing research | In next updates would be used to unhide all hidden researhes (not yet implemented)

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/151/327/256/256/636603225300587402.png"         width="50"> | 🟫                             [**VanillaFix**](https://www.curseforge.com/minecraft/mc-mods/vanillafix)                    <sup><sub>VanillaFix-1.0.10-150.jar</sub></sup> <br> Keep playing after a crash | Increase your FPS by up to 3x | Functionality fully implemented by **CensoredASM**

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **LittleTiles**
- **Engineer's Decor**
- **Chunk-Pregenerator**
- **ThaumTweaks**
- **Aqua Acrobatics [Forge]**
- **Modular Controller**
- **CensoredASM**
- **CraftTweaker**


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/VWAbeD "Base Essence Ingot") in ![](https://is.gd/O19A3r "Electric Arc Furnace")
    - ![](https://is.gd/fLTUPT "Shulker Pearl") from ![](https://is.gd/K75cqB "Pristine Shulker Matter")
    - ![](https://is.gd/b7RsDP "Light Radiation Shielding")![](https://is.gd/cyAwtv "Medium Radiation Shielding")![](https://is.gd/B9xrZO "Heavy Radiation Shielding") now can be put on Tinker's Armor
    - ![](https://is.gd/3ZVRWs "Coke Brick") now have alt recipe from ![](https://is.gd/woe80z "Clay")
    - ![](https://is.gd/RUi9ui "Insulated Gold Wire Coil") and all IW coils now have recipe visible in JEI
    - ![](https://is.gd/WJOf5q "Osmium Dust") in ![](https://is.gd/Kb1LLe "Squeezer")
    - ![](https://is.gd/GSvxHq "Silky Jewel") from ![](https://is.gd/JJ0WvW "Flux Crystal")
    - Add recycling of Twilight Forest spawners

  - ### ✐ **Cheaper**
    - ![](https://is.gd/a2fadE "Endervoir") x9 times less ![](https://is.gd/lQjJVn "Molten Lapis Tank")
    - ![](https://is.gd/Ar6N1g "Mob Slaughter Factory") not require ![](https://is.gd/gaJ9Zx "Iridium Plate") anymore
    - ![](https://is.gd/JwCkcj "Crafting Interface") not requre ![](https://is.gd/d3z1wk "Vibrant Bimetal Gear")
    - ![](https://is.gd/553WC2 "Chlorine Tank") and ![](https://is.gd/RlG3az "Liquid Sodium Tank") ~x8 cheaper

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/7XysFO "Advanced Circuit Plate") Fix duplicate recipe
    - ![](https://is.gd/C7dsGg "Uranium Grit") fix smelting
    - **Turtle** fix unable to attach tool
    - ![](https://is.gd/ZpsCEX "Wax Capsule") from ![](https://is.gd/O7uIOz "Pressed Wax") fix uncraftable
    - ![](https://is.gd/HNo3u9 "Potion of Poison Antidote") fix conflict
    - ![](https://is.gd/qdv6lS "Scribing Tools") buff durability to `600` (was 100)
    - ![](https://is.gd/O0nnGt "Native Titanium Cluster") remove accidentally added recipe (![](https://is.gd/ZsQ8l7 "Rutile Ore") cant be processed as usual ore)
    - ![](https://is.gd/fyaG3I "Hardened Mana Infused Glass") fix recipe
    - ![](https://is.gd/BbG6nJ "Plastic Waste") fix in ![](https://is.gd/Kb1LLe "Squeezer") (chance was 0%)
    - ![](https://is.gd/fAirbM "HOP Graphite Dust") fix visibility in IE Squeezer (squeezer hide item output if there is no liquid)
    - ![](https://is.gd/7zyYKH "Stone Pickaxe") => **Tinker's Pickaxe** add conversion



## 🔵 **Mods updates**
  - ### 🏪 **Requious Fracto**: JEI for **Pech Trades**
      > List of items you can buy from Pech
      > ![](https://i.imgur.com/J18amqj.png)

  - ### 👿 **Extra Utilities 2**: Buff Mills
      > - Lava Mill `x3.0`
      > - Lunar Panel `x2.0`
      > - Manual Mill `x4.0`
      > - Water Mill `x0.75`
      > - Wind Mill `x2.5`

  - ### 📑 **Tips**: info for ![](https://is.gd/e75qcc "Inventory Upgrade"), IC2 reactor T5 pow
      > Also add ![](https://is.gd/tXmfX8 "Flügel Tiara") to **##Flight**

  - ### 🦯 **Thaumcraft**
    - Add aspects to 12 items:
      > - ![](https://is.gd/aPzCnF "Rat Diamond")![](https://is.gd/sPbejc "Enderman Head")![](https://is.gd/2RAofO "Diamond Dust")![](https://is.gd/jEpbgh "Compressed Diamond")![](https://is.gd/N6RCLx "Diamond Lattice")![](https://is.gd/h6J284 "Diamond Gear")![](https://is.gd/wf22tY "Diamatine Crystal")![](https://is.gd/L2zlcN "Diamatine Crystal Block")![](https://is.gd/vLnKQl "Empowered Diamatine Crystal")![](https://is.gd/lveclB "Empowered Diamatine Crystal Block")
    - Pechs require 2x more Desiderium to trade better
      > Also, barely remove top cap of item aspects: you can trade ![](https://is.gd/4U5Mj5 "Double Compressed Diamond Hammer") with actually higher value than ![](https://is.gd/9r1Q6B "Block of Diamond")
    - ![](https://is.gd/Fgy8iu "ME Fluid Pattern: Liquid Death") Buff damage `5` => `40`

  - ### 🧙‍♂️ **Cyclic**: Remove ![](https://is.gd/V87EXX "Potion of Luck")
      > This potion was uncraftable anyway, doubled by CofhCore potion.

  - ### 🛂 **Triumph**: Remove **"Welcome to Expert Modpack!"** achievment
      > Something wrong and after each modpack reload, first joined player always get it again, no matter if they had it already



## 🔄 **Misc Changes**
  - Move damage indicators from **Dynamic Surroundings** to **ToroHealth**, since DS is not optional mod
  - Enable **Fancy Graphic** in options as defaults (Transparent Leaves)
  - Enable **New Water** in Aqua Acrobatic's since coloration was fixed
  - Some changes in default Optifine configs
  - ![](https://is.gd/VpScnM "Essence Ore") now have **mining level 6**
  - `onDemandAnimatedTextures=false` for LoliASM configs until this issue fixed: https://github.com/LoliKingdom/LoliASM/issues/92
  - ### 📖 **Quest Book**
    - Quests: Fix bucket NBT for creosote
      > Fixes #58
    - Add `Explosions` chapter reward
    - Reward with full pattern chest for tinkers
    - Reward triple compressed wood for wood quest
    - Make silver quest ask for any kind of silver (not ingot)
    - Add ![](https://is.gd/9uNtB8 "Beacon") quest
    - Move Ball of Fur to **Animals**
    - Add Net Visualizer tool
    - Add Dummy to Uncommon loot
    - Add ![](https://is.gd/tllxHi "Research Table") new capability of fetch
    - Merge pull request #57 from XeramHosting:master
      > - Fix Amounts in rewards and requests



# v0.56.1


## 💧 Aqua Acrobatics: Fix white water by disabling "New Water" option
  > New mod version caused this white water issue: https://i.imgur.com/hYCpcLS.jpeg

## 📖 Update `zh_cn` questbook
  > Pattern Expansion Card
  > Igneous Extruder



# v0.56.0



## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/101/150/256/256/636320791384304672.png"         width="50"> | 🟧                             [**OC Sensors**](https://www.curseforge.com/minecraft/mc-mods/oc-sensors)                    <sup><sub>ocsensors-1.0.4-b23.jar</sub></sup> <br> Sensor Addon for OpenComputers | Helps to automate NBT-dependent setups
<img src="https://media.forgecdn.net/avatars/thumbnails/132/859/256/256/636478744657081536.png"         width="50"> | 🟨                [**Baubley Heart Canisters**](https://www.curseforge.com/minecraft/mc-mods/baubley-heart-canisters)       <sup><sub>baubley-heart-canisters-1.12.2-2.0.3.jar</sub></sup> <br> Bauble Heart Canisters  | Additional bonus for loot boxes and fight system
<img src="https://media.forgecdn.net/avatars/thumbnails/203/831/256/256/636935134673300045.png"         width="50"> | 🟨                 [**AE2 Network Visualiser**](https://www.curseforge.com/minecraft/mc-mods/ae2-network-visualiser)        <sup><sub>AE-Net-Vis-Tool-1.12.2-1.0.3.0-universal.jar</sub></sup> <br> For all of your AE2 debugging needs! | Better Network debugging
<img src="https://media.forgecdn.net/avatars/thumbnails/436/794/256/256/637679304966892368.png"         width="50"> | 🟨            [**MmmMmmMmmMmm (Target Dummy)**](https://www.curseforge.com/minecraft/mc-mods/mmmmmmmmmmmm)                  <sup><sub>MmmMmmMmmMmm-1.12-1.14.jar</sub></sup> <br> Target Dummy that show damage dealt and can be equipped with armor | Great tool to test weapons and armor

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Had Enough Items**
- **ThaumTweaks**
- **Better P2P**
- **spark**
- **LibVulpes**
- **Advanced Rocketry**
- **Aqua Acrobatics [Forge]**
- **Entity Culling**
- **CensoredASM**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.56.0.md)


## ✏️ **Recipes**

  - ### ✐ **Cheaper**
    - ![](https://is.gd/KVi9dD "Spawn Lesser Crimson Portal")
      ![](https://is.gd/FA3Opb "Crimson Rites")
      ![](https://is.gd/k033wB "Device Frame")
      ![](https://is.gd/jmPZEB "Terminal")

  - ### ✎ **Harder**: ![](https://is.gd/xT1POn "Ender Anchor")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/aiXOcC "Creative Vending Upgrade") now output x1 instead of x2
    - ![](https://is.gd/0bdatN "The Ultimate Ingot") and ![](https://is.gd/LsXNa9 "Block of The Ultimate") add oredict for Dragon Steel
    - ![](https://is.gd/UON85V "Insanium Essence") in ![](https://is.gd/2GFGN0 "Quantum Compressor") now output x10 but require 10k (was 1k)
    - ![](https://is.gd/nzk6MS "Pahoehoe Lava Bucket") fix output in Radiator (was 80 buckets from 1b of lava)
    - Add **Compressed Sticks** recipe for storage sticks in compressed drawer
    - ![](https://is.gd/W2J0tP "Crushed Uranium Ore")  and ![](https://is.gd/cE2n72 "Crushed Lead Ore") add ![](https://is.gd/Ht5DTr "Furnace") recipes
    - **Golden Chicken** ![](https://is.gd/YQ1B21 "Golden Egg") now can eat ![](https://is.gd/jlpAVb "Native Gold Cluster") to lay x8 ![](https://is.gd/GgnboQ "Gold Ingot")
    - Clear ![](https://is.gd/vhuRAX "Biome Essence") tag, fixes #54
    - ![](https://is.gd/1QMnAC "Elite Plating") fix energy requirment in ![](https://is.gd/K4VAlu "Precision Laser Etcher")
      > Fixes #51
    - Add ![](https://is.gd/ekvrtP "Oxygen") conversion in ![](https://is.gd/YKECZz "Fluid Dictionary Converter")
      > Fixes #50
    - ### 🖉 **New Recipes**: ![](https://is.gd/O0nnGt "Native Titanium Cluster") in ![](https://is.gd/LDD9Qs "Crucible")



## 🔵 **Mods updates**
  - ### 🏦 **Modular Machinery**: Remove ![](https://is.gd/6C167M "Arcane Crafting Engine Controller")
      > **ThaumTweaks** mod have [Arcane Crafter] that totally remove necessity of Modular Machine.  
      > With Arcane Crafter everything can be automateable.

  - ### 🏪 **Requious Fracto**: JEI for **![](https://is.gd/9uNtB8 "Beacon") Effects** and **Crafting Hints**

  - ### 🔌 **Industrial Craft 2**: ![](https://is.gd/BWrVEK "Nuclear Reactor") increase power tier to `5`
      > ⚠️ Warning: Your IC2 wires will explode from new power tier.
      > Use ![](https://is.gd/hlgbTb "Glass Fiber Wire Coil") from Industrial Wires instead.

  - ### 🦯 **Thaumcraft**: Remove useless tooltip on items
      > Remove this:  
      > `Most Thaumcraft items need to be unlocked through research in the Thaumonomicon.`

  - ### 🧻 **JEI**
    - Add tag **#User** to ![](https://is.gd/Q50DvG "Dynamism Tablet")
    - blacklist updates

  - ### 🙋‍♀️ **Quark**: Add custom ![](https://is.gd/9uNtB8 "Beacon") effects
      > Place special list of blocks near beacon to change its list of possible effects.
      > Screenshots:
      > 1. https://i.imgur.com/qAPj7Aq.png
      > 2. https://i.imgur.com/2YL0kMr.png  
      > See JEI for more effect descriptions.

  - ### 🍯 **Potion Core**: x2-x6 Buff of most potions
      > - *Archery bonus* 3 => 6
      > - *Broken armor* -0.25 => -0.5
      > - *Broken Magic Shield* -0.25 => =-0.5
      > - *Burst* 2.0 => 5.0
      > - *Diamond Skin* 4.0 => 12.0
      > - *Explode* 2.0 => 6.0
      > - *Iron Skin* 2.0 => 10.0
      > - *Klutz* -4.0 => -8.0
      > - *Launch* 1.0 => 3.0
      > - *Magic Focus* 0.75 => 1.5
      > - *Magic Inhibition* -0.3 => -0.6
      > - *Magic Shield* 4.0 => 12.0
      > - *Recoil* 0.1 => 0.3
      > - *Vulnerable* -0.5 => -0.75

  - ### 💙 BaubleyHeartCanisters: Disable heart drops and add crafts



## 🔄 **Misc Changes**
  - Enable `reuseBucketQuads` in Loliasm, since issue was fixed
  - Set `fixMobsWallGlitching=true` from Surge mod (MC-2025)
  - List All TCon ![](https://is.gd/7y8O8a "Tool Forge"), since many people ask how to craft some
  - Rewert Thaumcraft `regenKey=DEFAULT` option since it wont fix 0 vis in chunks issue
  - Disable Random Tweak's `auto-third person`, since it controlled by other mod
  - [Primal Destroyer] buff damage to `38`
  - Buff **Fire Dragon** Breath damage `2` => `4`
  - **Carryon** blacklist carry Rats and Dragons
  - ### 📖 **Quest Book**
    - Quests: Misc changes
      > - Remove splash potions from common loot
      > - Add Hearts to loot chests
      > - Add ![](https://is.gd/QKfqGF "Hopper") to Improved Blast Furnace quest
      > - Add power buffs info to ic2 **Nuclear Reactor**
    - Quests: add more info about Mob Crusher and explosions
      > - Add tooltip about 100 damage
      > - Fixes #49
  - 🏗️ Merge pull request #52 from XeramHosting:master
    > Fixed known quest bugs




# v0.55.0

## ⚠️ Attention

This version <u>remove Better Questing</u> mod and all its addons.

To migrate all quest progress, you should **enter this command** after loading world:

```sh
/ftbq_import progress
```

This should be done once by server operator or single-player. [More info](https://www.curseforge.com/minecraft/mc-mods/ftb-quests-importer).



## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/275/363/256/256/637261948352026071.png"         width="50"> | 🟧                     [**FTB Quests (Forge)**](https://www.curseforge.com/minecraft/mc-mods/ftb-quests-forge)              <sup><sub>FTBQuests-1202.9.0.15.jar</sub></sup> <br> Questing Mod by FTB | Moved from Better Questing
<img src="https://media.forgecdn.net/avatars/thumbnails/183/63/256/256/636812486536100113.png"          width="50"> | 🟨                   [**Item Filters (Forge)**](https://www.curseforge.com/minecraft/mc-mods/item-filters-forge)            <sup><sub>ItemFilters-1.0.4.2.jar</sub></sup> <br> Item Filters is a library mod that is used by mods like FTB Quests. It adds several filter items that let you precisely select which items to match. | Dependency of FTBQuest
<img src="https://media.forgecdn.net/avatars/thumbnails/235/398/256/256/637085039429483186.png"         width="50"> | 🟩                    [**FTB Quests Importer**](https://www.curseforge.com/minecraft/mc-mods/ftb-quests-importer)           <sup><sub>FTBQImporter-forge-1.12.2-2.0.1.jar</sub></sup> <br> A small utility mod that lets you import Better Questing Quests and Loot Crates into FTB Quests | Tool to migrate from BQ. use `/ftbq_import progress` command
<img src="https://media.forgecdn.net/avatars/thumbnails/433/782/256/256/637673397314695131.png"         width="50"> | 🟩                     [**Give Me Back My HP**](https://www.curseforge.com/minecraft/mc-mods/give-me-back-my-hp)            <sup><sub>give-me-back-my-hp-1.12.2-1.0.0.jar</sub></sup> <br> fixes the max-HP-on-login bug | Should fix common HP problem

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/34/921/256/256/635916684056573464.png"          width="50"> | 🟫           [**Better Questing - Quest Book**](https://www.curseforge.com/minecraft/mc-mods/better-questing-quest-book)    <sup><sub>questbook-3.1.1-1.12.jar</sub></sup> <br> Adds a quest book to Funwayguy's Better Questing Mod | Moved to FTBQuests
<img src="https://media.forgecdn.net/avatars/thumbnails/317/984/256/256/637423606351535331.png"         width="50"> | 🟫    [**Better Questing Tweaker (BQTweaker)**](https://www.curseforge.com/minecraft/mc-mods/bqtweaker)                     <sup><sub>BQTweaker-1.3.3.jar</sub></sup> <br> Tweaker mod to change some aspects of BetterQuesting | Moved to FTBQuests
<img src="https://media.forgecdn.net/avatars/thumbnails/30/140/256/256/635857624698238672.png"          width="50"> | 🟫                        [**Better Questing**](https://www.curseforge.com/minecraft/mc-mods/better-questing)               <sup><sub>BetterQuesting-3.5.329.jar</sub></sup> <br> A new and improved questing mod for Minecraft pack creators | Moved to FTBQuests
<img src="https://media.forgecdn.net/avatars/thumbnails/32/952/256/256/635888498231572475.png"          width="50"> | 🟫   [**Better Questing - Standard Expansion**](https://www.curseforge.com/minecraft/mc-mods/better-questing-standard-expansion) <sup><sub>StandardExpansion-3.4.173.jar</sub></sup> <br> Standard tasks, rewards, importers and themes for BetterQuesting | Moved to FTBQuests
<img src="https://media.forgecdn.net/avatars/thumbnails/33/213/256/256/635892355993800985.png"          width="50"> | 🟫                   [**Dynamic Surroundings**](https://www.curseforge.com/minecraft/mc-mods/dynamic-surroundings)          <sup><sub>DynamicSurroundings-1.12.2-3.6.3.jar</sub></sup> <br> Adds a variety of sound and visual effects to improve your Minecraft experience | Moved to optional (prompt on first MC load)
<img src="https://media.forgecdn.net/avatars/thumbnails/179/851/256/256/636789387601122352.png"         width="50"> | 🟫                                 [**OreLib**](https://www.curseforge.com/minecraft/mc-mods/orelib)                        <sup><sub>OreLib-1.12.2-3.6.0.1.jar</sub></sup> <br> Support library for OreCruncher's mods | Dynamic Surroundings lib

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Had Enough Items**
- **U Team Core**
- **Dropt**
- **Chunk-Pregenerator**
- **ThaumTweaks**
- **AE Additions - ExtraCells2 Fork**
- **Aqua Acrobatics [Forge]**
- **Entity Culling**
- **CensoredASM**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.55.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/s2BmuR "End Dilithium Ore") add Asteroid
    - ![](https://is.gd/GbxcOK "Resonant End Stone") add Blood Magic Metheor
    - ![](https://is.gd/dRuQ5I "Ball of Fur") use as grinding ball in ![](https://is.gd/Z4WuM3 "SAG Mill")
    - Add Conversion between two **Deuterium** types (from NC and Mek)
    - ![](https://is.gd/seJa8N "Broken Sword Part") from [Gelid Enderium Sword]
    - ![](https://is.gd/GuOKiP "Dread Shard") from ![](https://is.gd/GVIX8A "Withering Soul")
    - ![](https://is.gd/ISYZ6b "Xorcite Cluster") from ![](https://is.gd/85GQrr "Extraterrestrial Matter"), ![](https://is.gd/k4pjZF "Guardian Essence") and ![](https://is.gd/5GY5FH "Pristine Ender Dragon Matter")
    - ![](https://is.gd/LuQc8c "Double Compressed Cobblestone") and ![](https://is.gd/kHFAuH "Triple Compressed Cobblestone") add ![](https://is.gd/t0Rn0k "Heavy Hammer") recipes, but increase mining levels to `6` and `7`

  - ### ✐ **Cheaper**
    - **Pattern Expansion Card** now from ![](https://is.gd/dIJgu3 "Titanium Plate")
    - ![](https://is.gd/Wo9kCf "Fiery Ingot Seeds") not require ![](https://is.gd/BtOS3O "Block of Fiery Metal") anymore (for peaceful)

  - ### ✎ **Harder**
    - ![](https://is.gd/4Pf311 "Mutagen") x10 less from ![](https://is.gd/VKOeWe "Enriched Uranium Nuclear Fuel")
    - ![](https://is.gd/WrQuIr "Soundproofing") now gives only 1 ![](https://is.gd/ytEWhd "Emerald") instead of 7 from Villager trade
    - ![](https://is.gd/sBwv8t "Wyvern Boots") now require ![](https://is.gd/hk8rgW "Void Thaumaturge Boots")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/lO8TOY "Sulfuric Acid Bucket") in ![](https://is.gd/ENnoOy "Chemical Reactor") x2 less rate
    - ![](https://is.gd/MqGY91 "Crude Steel Grinding Ball")![](https://is.gd/OZkhZ5 "Energetic Silver Ingot")![](https://is.gd/wsHsxf "Vivid Alloy Grinding Ball") remove from usage (unused materials)
    - [Shoes of Light] not spawn with ![](https://is.gd/QLwz9f "Aethium Armor Trim") anymore to prevent cheap creative flight
    - [Black Quartz AIOT] buff durability `100` -> `400`
    - ![](https://is.gd/AxdCT3 "Hydroponics Controller") fix input-output mess, fixes [#47](https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/47)
    - ![](https://is.gd/J78CzO "Polymer Clay") and ![](https://is.gd/HBBDrk "Treated Wood Planks") now require any liquid tank (i hope)
    - [Double Compressed Wood] => [Double Compressed Charcoal] fix in Oven
    - ![](https://is.gd/Xc0bor "Zombie Chunk") Move Craftings of **Mob Chunks** to Crafting Table
    - ![](https://is.gd/RpajR6 "Coal Coke") now can be used to craft ![](https://is.gd/3bQVQK "Steel Ingot") in ![](https://is.gd/2xc4gJ "Induction Smelter (Basic)")
    - ![](https://is.gd/BVdGx6 "Inferium Essence") __NOT DROPPING__ from mobs anymore. Instead, ![](https://is.gd/sG9lKy "Inferium Seeds") can be crafted from ![](https://is.gd/oyLtxX "Weed")
    - ![](https://is.gd/GgKIAh "Syngas") fix JEI output in ![](https://is.gd/1a8nLf "Syngas Producer Controller")
    - ![](https://is.gd/0IxXkj "Block Cutting Blade (Iron)")![](https://is.gd/p9S9SI "Block Cutting Blade (Steel)")![](https://is.gd/jZf3Gl "Block Cutting Blade (Diamond)") add recycling



## 🔵 **Mods updates**

  - ### 🏦 **Modular Machinery**: Fix Hydroponics recognize, Fix [#45](https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/45)

  - ### 🏪 **Requious Fracto**: Add JEI for **Asteroids**

  - ### 📑 **Tips**: `/restart_server` Fix command text on server

  - ### 🔨 **Tinker's Construct**: [Dark Matter] [Red Matter] buff mining level

  - ### 🧻 **JEI**
    - blacklist updates
    - Manually add more entries to JER tab
      > New blocks output:
      > - ![](https://is.gd/G9b9Wa "Rock Crystal Ore")
      > - ![](https://is.gd/ISYZ6b "Xorcite Cluster")



## 🔄 **Misc Changes**
  - ### 🧩 **Configs**
    - Restore **Forge Chunk Loading** configs to defaults
      > For example, set `dormantChunkCacheSize=128` => `0`
      > Dont really know what this would change, but same settings persist in many modern 1.12.2 modpacks
    - Mod Director: Make `Dynamic Surroundings` and `Ore Lib` optional
    - Mod Director: Make Sound Physics not freeze game
      > in case it cant be loaded from Web




# v0.54.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/149/168/256/256/636587353752864449.png"         width="50"> | 🟩                           [**Tinker's JEI**](https://www.curseforge.com/minecraft/mc-mods/tinkers-jei)                   <sup><sub>tinkersjei-1.2.jar</sub></sup> <br> Adds a JEI Tab to look at material stats from TConstruct | Some materials crafts with non-obivious items and this would helpt to find them in JEI

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Gambling Style**
- **OAuth**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.54.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/AxdCT3 "Hydroponics Controller") add all MA seed recipes
    - **Soul Vial** in ![](https://is.gd/LDD9Qs "Crucible") with more mobs
    - ![](https://is.gd/3xbcy3 "Broken Spawner (decoration block)") combined with **Any Data Model** to up tier

  - ### ✎ **Harder**
    - **Pattern Expansion Card**
    - ![](https://is.gd/4kgYT4 "Personal Nano Bot Beacon Tier 5")
      ![](https://is.gd/8sX8AX "Personal Nano Bot Beacon Tier 6")
      ![](https://is.gd/aBDfkH "Resistance Modifier")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/gAdqgd "Small Plate Presser") remove ![](https://is.gd/Q0Z8LR "Stick") and ![](https://is.gd/FYLOHg "Treated Stick") recipes because they dont work anyway, fixes #44
    - ![](https://is.gd/Ml9sf2 "Omnivoir") fix recipe in ![](https://is.gd/3z8f7b "Alloy Smelter"), fixes #38
    - ![](https://is.gd/Rzi1Hg "Void Metal Ingot") and many recipes from **Thaumcraft** that was remaded by **Thaum Tweaks** was changed to defaults
    - [Single Compressed Wood] now can be made only from vanilla wood to prevent cheese of ![](https://is.gd/p3KjdA "Ferrous-Juniper Log")
    - [<contenttweaker:item_ore_tungsten:3>] Remove wrong tungsten ingot output
    - ![](https://is.gd/MfOFEv "Ground Trap") now oredicted
    - ![](https://is.gd/auVzAe "Oil Sand") fix not consume sand
    - ![](https://is.gd/41zejU "Fluxomagnet (Hardened)") fix upgrade uncraftable



## 🔵 **Mods updates**
  - ### 🏦 **Modular Machinery**: Hydroponics multiblock fix (attempt to fix #45)

  - ### 🏗️ Schematica: Add Immersive technology schematica

  - ### 📑 **Tips**:
      > - ![](https://is.gd/mGcQzA "Resonant Upgrade Kit") Mention that not working on dynamos, fixes #42
      > - `/restart_server` Fix command not translated on server

  - ### 🦯 **Thaumcraft**: Remove Slime craft from Alchemy research reqs

  - ### 🛢️ **Immersive Engineering**: Buff Silo to *16,776,960* items
      > Silo is hard to use because input and output placed on different sides.  
      > Also multiblock takes a lot of space.  
      > This buff is kinda tricky and involve `.class` file bytecode changes.

  - ### 🥒 Nutrition: Regenerate all nutrition values
      > This would add missed Harvestcraft's nutrition



## 🔄 **Misc Changes**
  - ![](https://is.gd/UuOxem "Flux Point") add to `##ChunkLoader` tag
  - ### ⚡ FTBUtilities: Enable chunk loading (related to #39)
      > - Any player could load up to `3` chunks
      > - They loaded only if player online
      > 
      > FTB chunk loading nerfed this much, because modpack already have several chunk loading blocks.  
      > See:
      > ![](https://is.gd/p7LfU3 "Chunk Loading Ward")![](https://is.gd/PgB6Bq "Chunk Loader")![](https://is.gd/i0ReyB "Anchor Upgrade")![](https://is.gd/ZCmCmy "Chunkloader Upgrade")![](https://is.gd/xT1POn "Ender Anchor")![](https://is.gd/GeQ593 "Flux Point")

  - ### 🌍 **World Generation**: **Deep Dark** dimension buffs
      > - ![](https://is.gd/NBzuos "Black Quartz Ore") x10 times more
      > - [Molten Black Iron] as lakes

  - ### 📖 **Quest Book**: Quests updates
      > - Add **Pattern Expansion Card** quest
      > - ![](https://is.gd/s81cUr "High Oven Controller") fix amount of bricks

  - ## 中文
      > Add full Chinese Localization for ![](https://is.gd/wHTUW6 "Quest Book")





# v0.53.0


## 🟡 Updated Mods

- **ThaumTweaks**
- **Aqua Acrobatics [Forge]**
- **CensoredASM**
- **Cyclic**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.53.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - **Soul Vial** in ![](https://is.gd/LDD9Qs "Crucible") with any vanilla mob
    - **Fur Singularity** and infinity ![](https://is.gd/dRuQ5I "Ball of Fur") recipe
    - ![](https://is.gd/e7b1d9 "Advanced Alloy Turbine Rotor")![](https://is.gd/dMEAIh "Bronze Turbine Rotor")![](https://is.gd/46rM9H "Manyullyn Turbine Rotor")![](https://is.gd/f1L9Bx "Iron Turbine Rotor")![](https://is.gd/fDJZun "Gold Plated Turbine Rotor")![](https://is.gd/jbM6QC "Steel Turbine Rotor")![](https://is.gd/6dQaTz "Enderium Turbine Rotor") recycling recipes
    - ![](https://is.gd/tRohFU "Pahoehoe Lava") in Radiator
    - ![](https://is.gd/1EJwux "Pink Slime") in ![](https://is.gd/jWxmEq "Drying Basin")
    - ![](https://is.gd/nv2f5V "Experience Chunk")![](https://is.gd/Xc0bor "Zombie Chunk")![](https://is.gd/jn1wQZ "Pig Chunk")![](https://is.gd/PjUSoR "Chicken Chunk")![](https://is.gd/7fdjFZ "Cow Chunk")![](https://is.gd/mAkYtY "Sheep Chunk")![](https://is.gd/csl9Yl "Slime Chunk")![](https://is.gd/Lt7sx5 "Skeleton Chunk")![](https://is.gd/ukj58k "Creeper Chunk")![](https://is.gd/8lPuRV "Spider Chunk")![](https://is.gd/Gr0lfb "Rabbit Chunk")![](https://is.gd/amfwCw "Guardian Chunk")![](https://is.gd/Vbcjt3 "Blaze Chunk")![](https://is.gd/GQCQgV "Ghast Chunk")![](https://is.gd/lqSYgZ "Enderman Chunk")![](https://is.gd/zSGJ9J "Tier 6 Mob Chunk") from corresponding broken spawners
    - ![](https://is.gd/GCAA2F "Slime in a Bucket") from ![](https://is.gd/dlVZQW "Slime Cube")
    - ![](https://is.gd/bZiiIa "Heart Crystal Ore") from ![](https://is.gd/Aoybj8 "Redstone Ore")

  - ### ✐ **Cheaper**
    - ![](https://is.gd/RY6F6B "Steam") in ![](https://is.gd/KZi0y1 "Heat Exchanger Controller") x10 more efficient (still need suggestions)
    - ![](https://is.gd/HsfRin "Life Essence Tank") x10 more from sacrificing non-vanilla animals (for example about 30,000 LP for a bull)
    - ![](https://is.gd/fZJj6E "Aluminum Ore") x2 times more worldgen (because lot of caves)

  - ### ✏ **Misc Changes**
    - [ME (every) Gas Storage Cell] fix recipes (wrong components)
    - [Tungsten Nugget] add conversion
    - ![](https://is.gd/qZiPcW "Nitrate Dust") fix wrong output in IE Crusher
    - ![](https://is.gd/fZJj6E "Aluminum Ore") add recipe in ![](https://is.gd/Kb1LLe "Squeezer") and ![](https://is.gd/dMMest "Mechanical Squeezer"), fixes #35
    - ![](https://is.gd/j5hKRM "Graphite Block") fix uncraftable in ![](https://is.gd/3z8f7b "Alloy Smelter"), fixes #36
    - ![](https://is.gd/ZsQ8l7 "Rutile Ore") remove from Infernal Furnace JEI tab (cant be smelted anyway)
    - ![](https://is.gd/rbzrpm "Diamond") remove melting with [Magmatic Crucible]



## 🔵 **Mods updates**
  - ### 🦯 **Thaumcraft**
    - Fix 0 vis in chunks bug attempts
      > You should always use `/thaumicaugmentation fixaura` ingame if this bug happens again
    - Change researches
      > - Remove ![](https://is.gd/dtO6aD "Spider Web") and ![](https://is.gd/1oi1kM "String") from requirment of Hedge Alchemy
      > - Less Vis Crystals for Mettalurgy researches



## 🔄 **Misc Changes**
  - ![](https://is.gd/Mrkrqb "Basic Tank") fix crashing when hover mouse
  - **Freshwater Eels** now spawns less, fixes #34
  - Probably fix too few mobs around
  - Remove Quark's Thrash button, only left in player's inventory
  - Add +2 loading screen tips
  - JEI blacklist updates
  - Slightly move Traveler's Backpack's UI and NC radiation UI
  - Update ThaumicJEI cache
  - ### ⚡ **Performance**: Add `/restart_server` ZS command
      > This command could be useful on dedicated servers.
      > 
      > Sometimes, things broke and you need to restart server to fix that, but without server owner its usually hard to do.
      > 
      > Each player should write `/restart_server` in 15 seconds to server execute command `/stop` that usually means restarting

  - ### 📖 **Quest Book**: Quests updates
      > - ![](https://is.gd/t74fv3 "Enori Crystal") remove TE frame mention






# v0.52.0



## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Aqua Acrobatics [Forge]**
- **Entity Culling**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.52.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - **3D Print** alt without OC
    - **Gelatin** milking from cockatrice (but why?)
    - ![](https://is.gd/sfBqnS "Unstable Glitch Fragment") from ![](https://is.gd/Bdd25O "Gelid Enderium Dust")
    - ![](https://is.gd/zHsoqc "Tome of Sharing") with all Thaumcraft Knowledge
    - ![](https://is.gd/PZRBSR "Superheating Element")

  - ### ✐ **Cheaper**: ![](https://is.gd/gM6QN8 "Sandy Glass")

  - ### ✎ **Harder**: ![](https://is.gd/opjfSP "1k ME Essentia Storage Cell")![](https://is.gd/UHunUx "4k ME Essentia Storage Cell")![](https://is.gd/MnlFlV "64k ME Essentia Storage Cell")![](https://is.gd/2qqcTi "16k ME Essentia Storage Cell") fixes [this issue](https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/33)

  - ### ✏ **Misc Changes**
    - Revert **Feral Ghoul** drop additions to vanilla
    - ![](https://is.gd/spo9fq "ME Interface") return conversion from panel
    - ![](https://is.gd/DYXZEJ "Charged Creeper Chunk") peaceful alt



## 🔵 **Mods updates**
  - ### 🐮 **Animania**: Ticks between birthings 10000 -> 3000

  - ### 📭 **Storage Drawers**: Add Amount of items in tooltip
      > https://i.imgur.com/aecRJuL.png

  - ### 🔨 **Tinker's Construct**: ![](https://is.gd/8yY6fU "Dark Steel Ingot") higher mining level 4 -> 7



## 🔄 **Misc Changes**
  - ![](https://is.gd/Kda0A6 "Tungsten Ingot") add to benification
    > Add many ![](https://is.gd/aQjeXk "Tungsten Ore")-related items, like Ore Pieces and dusts.
    > Now can be processed in many ways.
    > Tungsten can be obtained as sub-product too now.
  - ![](https://is.gd/kmJNWI "Horse Whistle") range 64 -> 512, enable teleport
  - ![](https://is.gd/ISYZ6b "Xorcite Cluster") set mining level to 4
  - Set all NC ore mining level to 7 (Cobalt)
  - **Flying Carpet** add to Carryon blacklist
  - Restore ![](https://is.gd/gqwQxo "Basic Plating") and ![](https://is.gd/IyW7W7 "Machine Frame") UU-replication. Seems like then can work normal.
  - ### 🌍 **World Generation**: ![](https://is.gd/k96kDk "Exhausting Stone") and ![](https://is.gd/Lce5gL "Exhausting Netherrack") lower spawn
      > About x2 times less in overworld and x3 times less in Nether

  - ### 📖 **Quest Book**: Quests updates
      > - New gate **Computers**
      > - New Quest **Tome of Sharing**






# v0.51.0



## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **OAuth**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.51.0.md)


## ✏️ **Recipes**
  - ### ✏ **Misc Changes**
    - Remove ![](https://is.gd/9Vzhf0 "Silicon") from ![](https://is.gd/szoVea "Magic Bean")
    - ![](https://is.gd/gqwQxo "Basic Plating") remove UU replication
    - ![](https://is.gd/Y7Prd8 "Advanced Plating") fix craft in ![](https://is.gd/DnxfYT "Packager") fixes #32
    - ![](https://is.gd/1ykON7 "Evil Infused Iron Ingot") fix craft in ![](https://is.gd/I2dCLV "Dragonforge Fire Core")
    - Remove excess ![](https://is.gd/qokKtZ "Wool") dyeing recipes (already added by Quark)



## 🔵 **Mods updates**
  - ### 📑 **Tips**: Tooltip for ![](https://is.gd/RUa5vi "Vis Salt")

  - ### 🦯 **Thaumcraft**: restore to default almost all block's mining levels
      > ![](https://is.gd/6wtCfL "Arcane Alembic") and blocks other than Ore or Metal mining level was unreasonable high.

  - ### 🙋‍♀️ **Quark**: Restore some default configs
      > - Enabled a lot of Walls, stairs and other blocks
      > - Remove Stained Tiles Terracotta
      > - Enable Shulker box tooltip https://i.imgur.com/IlxBOJj.png
      > - Enable Pickarang
      > - Enable Automatic tool restock
      > - Disable + button for shulker boxes (right-click to add, not working anyway)
      > - Enable trash button in inventories
      > - Enable ![](https://is.gd/7zyYKH "Stone Pickaxe") and other stone tools from Flint and any stone
      > - Enable Glass Shards
      > - Enable Guardians spawn in oceans
      > - Foxhound x2 increase spawn rate
      > - Increase Ashen, Dweller and Crabs spawn rate
      > - Other minor changes



## 🔄 **Misc Changes**
  - Tweak Entity Culling to better display Ice and Fire Dragons
  - Fixed BQ splash image






# v0.50.0


## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/97/340/256/256/636291270964038751.png"          width="50"> | 🟫                        [**CapabilityProxy**](https://www.curseforge.com/minecraft/mc-mods/capabilityproxy)               <sup><sub>CapabilityProxy-1.12.2-2.1.3.jar</sub></sup> <br> Access block capabilities from multiple sides | This mod was unnecessary. Low-level proxies are completely replaced through ![](https://is.gd/nEHqwr "Inventory Rerouter"), and the use of Entity Proxy and other proxies was not obvious.

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Had Enough Items**
- **MixinBooter**
- **CensoredASM**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.50.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**: ![](https://is.gd/TsTB8l "Plague Essence") add skyblock alt

  - ### ✏ **Misc Changes**: ![](https://is.gd/fZJj6E "Aluminum Ore") fix grinding in ![](https://is.gd/1ZpXCt "Quartz Grindstone")



## 🔵 **Mods**
  - HEI update fixes #29
  - ### 🎲 **Random Things**: ![](https://is.gd/ZGrpzg "Peace Candle") add non-working tooltip

  - ### 🛢️ **Immersive Engineering**: Revert wires buff
      > x4 connector transfer buff from last patch not actually working, so i need to revert this change.



## 🔄 **Misc Changes**
  - ### 📖 **Quest Book**: Quests updates
      > - ![](https://is.gd/dzTuwm "Heart Container") quest replaced with ![](https://is.gd/MY4WZ5 "Fire Dragonsteel Ingot")
      > - Add ![](https://is.gd/o4cPFf "Plague Doctorate") quest






# v0.49.0


## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Had Enough Items**
- **Zen Utils**
- **Modular Controller**
- **Entity Culling**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.49.0.md)


## ✏️ **Recipes**
  - New item: [Compressed Tallow]
    > Used to easily turn tallow into biomass, in case you want giant bee farm.
  - ### 🖉 **New Recipes**
    - ![](https://is.gd/QhK0GU "Clipboard") added recipe again (it was disabled)
    - ![](https://is.gd/HiFqTo "Bio Fuel")

  - ### ✐ **Cheaper**
    - ![](https://is.gd/YZQusZ "Ethanol Tank") from ![](https://is.gd/HiFqTo "Bio Fuel")
    - ![](https://is.gd/1zjgdB "Phantomface")

  - ### ✎ **Harder**
    - ![](https://is.gd/FV2xAm "Bio Chaff") from ![](https://is.gd/AZKswv "Oak Sapling")
    - ![](https://is.gd/gfyHzZ "Destruction Gadget")
      ![](https://is.gd/BBirO5 "Copy-Paste Gadget")
      ![](https://is.gd/yt3VjH "Exchanging Gadget")
      ![](https://is.gd/HLwYnV "Building Gadget")
      ![](https://is.gd/nhOodf "End Steel Chassis")
      ![](https://is.gd/WXPhZG "Wooden Lantern")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/YOKguW "Bio-Generator") buffed RF/t +30%
    - ![](https://is.gd/NvHOYL "Guardian Diode") now dropped from **Elder Guardian**
    - ![](https://is.gd/1VGTKX "EEPROM") with predefined [LostUser](https://gist.github.com/Krutoy242/db63637d605c2c247bc95e939c7f7ddd#file-lostuser_readme-md)
    - ![](https://is.gd/cLUWmV "Cobweb") and ![](https://is.gd/1oi1kM "String") temp recipes until fixed https://github.com/LoliKingdom/Thaumic-Speedup/issues/3



## 🔵 **Mods updates**
  - ### 🛢️ **Immersive Engineering**: Wires changes
      > LV - has the same RF/t to burn up as MV wires, but 4x lower per connection  
      > MV - 16,384 RF/t per connection, 262,144 RF/t to wire burn  
      > HV - 524,288 RF/t per connection, burn up power is same  
      > 
      > Industrial Wires "wireRatio" could be set to 4.0 so wires transfer RF 4x better than EU (this should mean you can pass 4x as much power through the same tier of wire without causing IC2 machines to explode).  
      > 
      > IC2 Tin: 0.025 EU loss per block, 512 RF/t per connector  
      > IC2 Copper: 2,048 RF/t  
      > IC2 Gold: 8,192 RF/t  
      > IC2 HV: 13,1072 RF/t (huge downside: leads to instant death if you touch it)  
      > IC2 Glass Fiber: 262,144 RF/t  



## 🔄 **Misc Changes**
  - ![](https://is.gd/JDMtEF "Fluid Tank") show recipes in JEI
  - **Carryon**: blacklist whole Bibliocraft
  - Skyblock🌌: allow `/home` command (must be 500+ blocks from home)
  - Add Grinding trait to Patchouli
  - ![](https://is.gd/If30gx "Feeding Trough") tooltip about 8 animals
  - Merge pull request #27 from freopt/master
    > - Disable Unnecessary JEI categories
    > - Disable unused EnderIO categories
    > - `options.txt` Default to maximum brightness
    > - Hide WAILA metadata
  - ### 📖 **Quest Book**: Quests updates
      > - New quest **Heavy Material**
      > - New quest **Wires Changes**
      > - Removed **Capability Proxy** quest
      > - **Bio Generator** quest in Mekanism chapter not require Wind gen anymore




# v0.48.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/194/280/256/256/636872269749876871.png"         width="50"> | 🟨                       [**Engineer's Decor**](https://www.curseforge.com/minecraft/mc-mods/engineers-decor)               <sup><sub>engineersdecor-1.12.2-1.1.4.jar</sub></sup> <br> Adds cosmetic blocks for the engineer's factory, workshop, and home. | Cool looking blocks nicely fit pack.
<img src="https://media.forgecdn.net/avatars/thumbnails/329/730/256/256/637455830768542343.png"         width="50"> | 🟧                    [**Quark: RotN Edition**](https://www.curseforge.com/minecraft/mc-mods/quark-rotn-edition)            <sup><sub>QuarkRotN-r1.6-185.jar</sub></sup> <br> A modification of Quark for the Rebirth of the Night (RotN) modpack. | Forked updated Quark
<img src="https://media.forgecdn.net/avatars/thumbnails/242/974/256/256/637137056264295014.png"         width="50"> | 🟨               [**Cloche Profit Peripheral**](https://www.curseforge.com/minecraft/mc-mods/cloche-profit-peripheral)      <sup><sub>cloche-profit-peripheral-1.12.2-1.0.3.jar</sub></sup> <br> lets you use more stuff in garden cloches | Better than **MystAgrad Cloche Compat**
<img src="https://media.forgecdn.net/avatars/thumbnails/301/90/256/256/637360994847173146.png"          width="50"> | 🟩                       [**Particle Culling**](https://www.curseforge.com/minecraft/mc-mods/particle-culling)              <sup><sub>particleculling-1.12.2-v1.3.1.jar</sub></sup> <br> Stops rendering particles that the player cannot view | Improve FPS
<img src="https://media.forgecdn.net/avatars/thumbnails/301/367/256/256/637362105323317864.png"         width="50"> | 🟩                         [**Entity Culling**](https://www.curseforge.com/minecraft/mc-mods/entity-culling)                <sup><sub>EntityCulling-1.12.2-5.1.1.jar</sub></sup> <br> Skip rendering of hidden entities. | Improve FPS

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/143/550/256/256/636550246000587956.png"         width="50"> | 🟫                [**MystAgrad Cloche Compat**](https://www.curseforge.com/minecraft/mc-mods/mystagrad-cloche-compat)       <sup><sub>mystagradcompat-1.2.jar</sub></sup> <br> A simple mod to add support for tier 6 seeds in the Immersive Engineering gardening cloche. | Replaced with **Cloche Profit Peripheral**
<img src="https://media.forgecdn.net/avatars/thumbnails/144/505/256/256/636556393289383202.png"         width="50"> | 🟫                              [**Obfuscate**](https://www.curseforge.com/minecraft/mc-mods/obfuscate)                     <sup><sub>obfuscate-0.4.2-1.12.2.jar</sub></sup> <br> A library that adds in useful events and utilities | Unused dependency (dependent mod was removed long ago)
<img src="https://media.forgecdn.net/avatars/thumbnails/45/733/256/256/636046574423088080.png"          width="50"> | 🟫                                  [**TESLA**](https://www.curseforge.com/minecraft/mc-mods/tesla)                         <sup><sub>Tesla-1.12.2-1.0.63.jar</sub></sup> <br> A power API | Unused dependency (dependent mod was removed long ago)
<img src="https://media.forgecdn.net/avatars/thumbnails/13/376/256/256/635561244744605246.png"          width="50"> | 🟫               [**No Mob Spawning on Trees**](https://www.curseforge.com/minecraft/mc-mods/no-mob-spawning-on-trees)      <sup><sub>NoMobSpawningOnTrees-1.2.2-mc1.12.2.jar</sub></sup> <br> A mod prevents mob spawning on wood logs. | Implemented by **InControl** mod
<img src="https://media.forgecdn.net/avatars/thumbnails/282/800/256/256/637290635583249919.png"         width="50"> | 🟫                   [**HarvestCraft Tweaker**](https://www.curseforge.com/minecraft/mc-mods/harvestcraft-tweaker)          <sup><sub>harvestcrafttweaker-1.2c.jar</sub></sup> <br> adds crafttweaker support to harvestcraft | Unused tweaking mod
<img src="https://media.forgecdn.net/avatars/thumbnails/36/643/256/256/635941051938350675.png"          width="50"> | 🟧                                  [**Quark**](https://www.curseforge.com/minecraft/mc-mods/quark)                         <sup><sub>Quark-r1.6-179.jar</sub></sup> <br> A Quark is a very small thing. This mod is a collection of small things that improve the vanilla minecraft experience. | Replaced by fork
<img src="https://media.forgecdn.net/avatars/thumbnails/285/685/256/256/637301913509085829.png"         width="50"> | 🟫                     [**Mekanism Fluxified**](https://www.curseforge.com/minecraft/mc-mods/mekanism-fluxified)            <sup><sub>mekanismfluxified-1.12.2-1.0.0.jar</sub></sup> <br> Fluxifying the Mekaverse | All it do is just making power indicator red
<img src="https://media.forgecdn.net/avatars/thumbnails/138/255/256/256/636520464179775826.png"         width="50"> | 🟫                         [**Born in a Barn**](https://www.curseforge.com/minecraft/mc-mods/born-in-a-barn)                <sup><sub>Born In A Barn V1.8-1.12-1.1.jar</sub></sup> <br> Fixed a Village ChunkLoading Issue | was implemented into forge like [4 years ago](https://github.com/MinecraftForge/MinecraftForge/pull/4689)
<img src="https://media.forgecdn.net/avatars/thumbnails/84/402/256/256/636194827364521008.png"          width="50"> | 🟫                               [**Fakename**](https://www.curseforge.com/minecraft/mc-mods/fakename)                      <sup><sub>Fakename MC1.12.2 v1.2.jar</sub></sup> <br> Fakename adds Commands to change the display name | Broking server names view (should be removed in previous versions)

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Not Enough Energistics**
- **xXx_MoreToolMats_xXx (a PlusTiC fork without the evil, and apparently some new bugs idk)**
- **Thaumic Additions: Reconstructed**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.48.0.md)


## ✏️ **Recipes**
  - ### ✐ **Cheaper**
    - ![](https://is.gd/3bQVQK "Steel Ingot") in ![](https://is.gd/nzYazy "Blast Furnace") x6 times faster
    - ![](https://is.gd/43tx1G "Steel Casing") now not require ![](https://is.gd/WjHBXM "Osmium Block")

  - ### ✎ **Harder**
    - ![](https://is.gd/IyW7W7 "Machine Frame") now require ![](https://is.gd/WjHBXM "Osmium Block")x2 and ![](https://is.gd/5nWAcq "Void Crystal Block")x2 instead of ![](https://is.gd/t74fv3 "Enori Crystal")x4
    - ![](https://is.gd/IyW7W7 "Machine Frame") not replicable with UU anymore (was too cheap)

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/AVzILS "Refined Obsidian") and ![](https://is.gd/feAqqP "Refined Glowstone") could not be melted with ![](https://is.gd/eRUKul "Amplifying Tube") anymore
    - ![](https://is.gd/b2QUkI "Compressed Dirt") Fix melting in ![](https://is.gd/dkRxMG "Smeltery Controller")



## 🔵 **Mods updates**

  - ### 🔌 **Industrial Craft 2**: Add missed Fruit - "Tiny" Fruit (melt to Tin)

  - ### 🔨 **Tinker's Construct**: **Grinding** trait: Work only when *sneaking*



## 🔄 **Misc Changes**
  - Fix `Unloader` mod (probably will start actually work)
    > https://github.com/Unnoen/Unloader/issues/5
  - Fixed mob spawn
    >   Before this change, mobs would not be able to spawn more then 3-4 per type
    >   Now all mobs should spawn vanilla-alike
  - This Hoes now have bigger breaking/harvesting radius (Quark feature):  
    > ![](https://is.gd/GVYDwe "Electric Hoe")![](https://is.gd/khJ5PB "Thaumium Hoe")![](https://is.gd/5ivr5g "Void Hoe")![](https://is.gd/URqwBU "Hoe of Growth")![](https://is.gd/4Fuf01 "Void Hoe of Growth")![](https://is.gd/pCHDLY "Ironwood Hoe")![](https://is.gd/eRtDsk "Steeleaf Hoe")




# v0.47.0


- 🧱 Technical: Fix ModDirector error
  > Forget to remove .json file from list that caused error:
  > `[ModDirector[CORE]]: Failed to install mod /Krutoy242/Enigmatica2Expert-Extended/master/minemenu/menu.json`


## 🟡 Updated Mods

- **Immersive Technology**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.47.0.md)




# v0.46.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/85/764/256/256/636204523468034489.png"          width="50"> | 🟨                                 [**Xtones**](https://www.curseforge.com/minecraft/mc-mods/xtones)                        <sup><sub>Xtones-1.2.2.jar</sub></sup> <br> The "official" successor to Ztones | 
<img src="https://media.forgecdn.net/avatars/thumbnails/64/181/256/256/636150748689024217.png"          width="50"> | 🟩                   [**More Default Options**](https://www.curseforge.com/minecraft/mc-mods/more-default-options)          <sup><sub>moredefaultoptions-1.12-0.0.2.jar</sub></sup> <br> A mod that is useful for modpack developers to create default options for minecraft and various mods | 
<img src="https://media.forgecdn.net/avatars/thumbnails/419/301/256/256/637646189487004112.png"         width="50"> | 🟨                 [**Not Enough Energistics**](https://www.curseforge.com/minecraft/mc-mods/not-enough-energistics)        <sup><sub>NotEnoughEnergistics-1.12.2-1.2.3.jar</sub></sup> <br> Better JEI/NEI integration for AppliedEnergistics2 | 

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/20/396/256/256/635711078981582007.png"          width="50"> | 🟫                        [**Default Options**](https://www.curseforge.com/minecraft/mc-mods/default-options)               <sup><sub>DefaultOptions_1.12.2-9.2.8.jar</sub></sup> <br> A way for modpacks to ship a default (key) configuration without having to include an options.txt file. Also allows local options from any mod .cfg file. | 
<img src="https://media.forgecdn.net/avatars/thumbnails/185/26/256/256/636824950470040787.png"          width="50"> | 🟫          [**Just Enough Energistics (JEE)**](https://www.curseforge.com/minecraft/mc-mods/just-enough-energistics-jee)   <sup><sub>JustEnoughEnergistics-1.12.2-1.0.8.jar</sub></sup> <br> Adds proper JEI integration for the AE2 Pattern Terminal | 

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **Modular Controller**
- **CensoredASM**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.46.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - Now **Chaos Guardian** can be milked
    - ![](https://is.gd/qtPrKr "Draconium Chest") in ![](https://is.gd/m3iAvN "Imbuing Station")
    - **Elder Guardian** now drops ![](https://is.gd/NvHOYL "Guardian Diode")
    - ![](https://is.gd/9n2vyn "Steeleaf") drops about x30 times more in Twilight Forest Hills

  - ### ✐ **Cheaper**: ![](https://is.gd/BWfCX8 "Essentia Centrifuge") x10 cheaper Curio and ![](https://is.gd/MmqwwX "Flux Goo Tank") recipes

  - ### ✎ **Harder**: ![](https://is.gd/RoaEcF "Industrial Machine Chassis") not craftable in ![](https://is.gd/2xc4gJ "Induction Smelter (Basic)") anymore

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/WDUl1r "Luminessence") Move  from ![](https://is.gd/ENnoOy "Chemical Reactor") to ![](https://is.gd/Dp74o7 "Crystallizer")
    - ![](https://is.gd/U2BfzE "Water Tank") + ![](https://is.gd/dYwTk1 "UU-Matter Tank") touch Crystal color fix
    - ![](https://is.gd/J6GYgc "Rune of Spring")![](https://is.gd/9g1muU "Rune of Autumn")![](https://is.gd/6RPYPA "Rune of Winter") fix being uncraftable
    - ![](https://is.gd/4FFe53 "Molten Sulfur Tank") fix uncraftable
    - ![](https://is.gd/oEFQIZ "Uranium Dust") fix wrong dust output from Mek Machines
    - ![](https://is.gd/ukCAvd "Hardened Copper Glass") and all other Hardened glasses fix craft from ![](https://is.gd/fhhbVF "Fused Quartz") in ![](https://is.gd/2xc4gJ "Induction Smelter (Basic)")
    - ![](https://is.gd/woe80z "Clay") => ![](https://is.gd/LVGur9 "Hardened Clay") fix in ![](https://is.gd/M0ys9f "Dehydrator")



## 🔵 **Mods updates**
  - Now `options.txt` and some other files would be pulled from `More Default Options` mod configs rather then from GitHub
  - ### 🔨 **Tinker's Construct**
    - Some stast of materials shuffled
      > - Supremium now have fixed mining level
      > - About 10-20 materials was slightly tweaked
    - Grinding trait rework
      > - Jump on blocks do crush them
      > - Chance depends on how many armor with this trait you have and how fast you fall
      > - Amount of output depends on how many armor parts from Heavy material you have
      > - Take ![](https://is.gd/DgFrgH "Wooden Tool Rod") in hand to see debug info when jumping




## 🔄 **Misc Changes**
  - ### 📖 **Quest Book**: Quests updates
      > - Added Solar Tower quest
      > - Steam Dynamo quest task fix






# v0.45.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/172/24/256/256/636733556615558282.png"          width="50"> | 🟨                    [**Better Animals Plus**](https://www.curseforge.com/minecraft/mc-mods/betteranimalsplus)             <sup><sub>betteranimalsplus-1.12.2-9.0.1.jar</sub></sup> <br> [Forge/Fabric] Adds 35+ new animals to your world, with items, food, blocks, and armor. | Revert from fork. See below.

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/448/781/256/256/637707187659164886.png"         width="50"> | 🟫               [**Better Animals Plus Plus**](https://www.curseforge.com/minecraft/mc-mods/better-animals-plus-plus)      <sup><sub>betteranimalsplusplus-1-29-2022.jar</sub></sup> <br> An updated version of Better Animals Plus which adds attack animations and greatly improves AI | Reverted to non-forked version until this two issues would be fixed: [#1](https://www.curseforge.com/minecraft/mc-mods/better-animals-plus-plus/issues/1) [#2](https://www.curseforge.com/minecraft/mc-mods/better-animals-plus-plus/issues/2)

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **NuclearCraft**
- **Dropt**
- **MixinBooter**
- **ThaumTweaks**
- **CraftTweaker**
- **BiblioCraft**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.45.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**: ![](https://is.gd/Hvrdb0 "Basalt Sediment") from ![](https://is.gd/ZIjMzq "Basalt") with ![](https://is.gd/zv1QP2 "Chemical Thrower")

  - ### ✐ **Cheaper**: ![](https://is.gd/U6GDFC "Charm of Undying")

  - ### ✏ **Misc Changes**
    - ![](https://is.gd/aiXOcC "Creative Vending Upgrade") now craft with ![](https://is.gd/IIziXQ "Lamp of Cinders") instead of master Trophy
    - ![](https://is.gd/qU58ZQ "Rabbit's Foot") now drops 2-4 EVERY time player kills Animania's rabbit
    - ![](https://is.gd/fhhbVF "Fused Quartz") from ![](https://is.gd/NDmr8t "Empowered Phosphor") now output 8 instead of 9
    - ![](https://is.gd/N5iVpb "Dynamite") and ![](https://is.gd/HJAKlE "Sticky Dynamite") now stackable up to 64
    - ![](https://is.gd/2GTeZM "Pulverized Silver") more from ![](https://is.gd/vhuRAX "Biome Essence")



## 🔵 **Mods**
  - ### 🐉 **Ice and Fire**: Misc spawn changes
      > - **Amphithere** Attack Strength now 14 (was 7)
      > - Twice lower Generate **Dragon Skeleton** Chance
      > - Twice higher **Hydra Caves** Gen Chance
      > - Twice higher Spawn **Cyclops Cave** Chance
      > - Spawn Sea Serpent Chance now `1` for `1000` chunks (was 1 / 3000)

  - ### 📑 **Tips**: add tips: ![](https://is.gd/uuT6WC "Archaeologist Hat")![](https://is.gd/4HVKfu "Hand Of Fate")

  - ### 🗃️ **Loot Tables**: New rare entries for some structures
      > - **Mana Ring** now with mana in Dragon Caves
      > - Removed Vial's from Dragon Caves
      > - Feral Ghoul now drops ![](https://is.gd/kWFv6x "Tiny Pile of Uranium 235")
      > New Pirate ships loot:
      > - ![](https://is.gd/Kwtxzh "Combat Dynamite")![](https://is.gd/3ruinc "Mining Dynamite")![](https://is.gd/BsOv5a "Dynamite VI")![](https://is.gd/N5iVpb "Dynamite")![](https://is.gd/HJAKlE "Sticky Dynamite")![](https://is.gd/fJ1m8A "Explosive Arrow")![](https://is.gd/gJnc9N "EFLN")![](https://is.gd/4ooZqT "Obsidian TNT")

  - ### 🧻 **JEI**: blacklist updates

  - ### 🛸 **EnderIO**: Any Inventory System Storage ![](https://is.gd/SiNpBu "Large Inventory System Storage") use 1 RF now
      > Was 10-20.
      > This change would make IST last veery long before need recharge.
      > Current storage capacity is about 100k RF.

  - ### 🙋‍♀️ **Quark**: ![](https://is.gd/uuT6WC "Archaeologist Hat") now buff 100% gem yeld (was 25%)



## 🔄 **Misc Changes**
  - Lag Goggles:
    > - Change number of microseconds at which an object is marked with a deep red colour for WORLD lag to 500 (was 100)
    > - Change minimum amount of microseconds required before an object is tracked in the client to 5 (was 1)
    > - Enable Fog again (Better FPS option)
  - ### 📖 **Quest Book**: Some quests updates






# v0.44.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/308/905/256/256/637393363910667862.png"         width="50"> | 🟫                       [**Better Gendustry**](https://www.curseforge.com/minecraft/texture-packs/better-gendustry)        <sup><sub>Better Gendustry v1.0.zip</sub></sup> <br> A better looking gendustry, with 16x16 textures | Recommended Resource pack for `E2E-E`
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/256/256/637752171904887013.jpeg"        width="50"> | 🟥                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)              <sup><sub>HadEnoughItems_1.12.2-4.16.1.jar</sub></sup> <br> JEI fork for 1.12.2 that fixes memory issues. | Promising fork for JEI
<img src="https://media.forgecdn.net/avatars/thumbnails/317/984/256/256/637423606351535331.png"         width="50"> | 🟨    [**Better Questing Tweaker (BQTweaker)**](https://www.curseforge.com/minecraft/mc-mods/bqtweaker)                     <sup><sub>BQTweaker-1.3.3.jar</sub></sup> <br> Tweaker mod to change some aspects of BetterQuesting | Makes actually better look of BQ
<img src="https://media.forgecdn.net/avatars/thumbnails/448/781/256/256/637707187659164886.png"         width="50"> | 🟫               [**Better Animals Plus Plus**](https://www.curseforge.com/minecraft/mc-mods/better-animals-plus-plus)      <sup><sub>betteranimalsplusplus-1-29-2022.jar</sub></sup> <br> An updated version of Better Animals Plus which adds attack animations and greatly improves AI | Updated fork
<img src="https://media.forgecdn.net/avatars/thumbnails/483/123/256/256/637782695232246251.png"         width="50"> | 🟧           [**AE2 Unofficial Extended Life**](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life)             <sup><sub>appliedenergistics2-rv6-stable-7-extended_life-v49ac.jar</sub></sup> <br> A Fork of a Minecraft Mod about Matter, Energy and using them to conquer the world..  | Updated fork
<img src="https://media.forgecdn.net/avatars/thumbnails/329/717/256/256/637455786531686894.png"         width="50"> | 🟫            [**Bansōkō [絆創膏] - Mod Patcher**](https://www.curseforge.com/minecraft/mc-mods/bansoko)                       <sup><sub>_bansoukou-4.3.1.jar</sub></sup> <br> A simple coremod that streamlines patching of mods. | Used for fix advancements inside mod's JARs

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/64/142/256/256/636150438341223136.png"          width="50"> | 🟫                    [**Minecraft Font (PC)**](https://www.curseforge.com/minecraft/texture-packs/minecraft-font-pc)       <sup><sub>MinecraftFont.zip</sub></sup> <br> Replacement for the default (thin) Unicode font | This mod was used for Russian client, but since CF distributable is EN by default, Russian players could install it themselve
<img src="https://media.forgecdn.net/avatars/thumbnails/29/69/256/256/635838945588716414.jpeg"          width="50"> | 🟪                [**Just Enough Items (JEI)**](https://www.curseforge.com/minecraft/mc-mods/jei)                           <sup><sub>jei_1.12.2-4.16.1.302.jar</sub></sup> <br> View Items and Recipes | Replaced by `Had Enough Items`
<img src="https://media.forgecdn.net/avatars/thumbnails/172/24/256/256/636733556615558282.png"          width="50"> | 🟨                    [**Better Animals Plus**](https://www.curseforge.com/minecraft/mc-mods/betteranimalsplus)             <sup><sub>betteranimalsplus-1.12.2-9.0.1.jar</sub></sup> <br> [Forge/Fabric] Adds 35+ new animals to your world, with items, food, blocks, and armor. | Replaced by `Better Animals Plus Plus`
<img src="https://media.forgecdn.net/avatars/thumbnails/28/371/256/256/635826252878407531.png"          width="50"> | 🟫                           [**(Chat) Ping!**](https://www.curseforge.com/minecraft/mc-mods/chat-ping)                     <sup><sub>ping-1.9-3.0.9.jar</sub></sup> <br> Notifying users when they are mentioned in chat | Had issues when receiving advancements. Also no updates for several years.

## 🟡 Updated Mods

- **CreativeCore**
- **Zen Utils**
- **CensoredASM**


## [> Mods updates detailed.](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/changelogs/MODS_v0.44.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - **Morb** with **Dread Lich**
    - ![](https://is.gd/INCOem "Carton") from ![](https://is.gd/fTw85b "Compressed Sawdust")
    - ![](https://is.gd/nJf2zg "Osmiridium Nugget") in ![](https://is.gd/s0eN4S "Kiln Brick")
    - ![](https://is.gd/Y1dMRl "Intermedium Essence") and ![](https://is.gd/uZRjsC "Ectoplasm") now dropping from **Hirschgeist**
    - ![](https://is.gd/AOsqWq "Dyeable Clean") and other Dyeable blocks
    - ![](https://is.gd/iakqlp "Traveller's Cloak (Slow Fall)")
      ![](https://is.gd/IIziXQ "Lamp of Cinders")
      ![](https://is.gd/vefT29 "Castle Brick")
      ![](https://is.gd/TchPPc "Pink Castle Rune Brick")
      ![](https://is.gd/zBAZ3O "Blue Castle Rune Brick")
      ![](https://is.gd/83n3eW "Yellow Castle Rune Brick")
      ![](https://is.gd/XNKHjJ "Violet Castle Rune Brick")

  - ### ✐ **Cheaper**
    - ![](https://is.gd/iACT3v "Inferium Furnace")![](https://is.gd/AcdtMX "Prudentium Furnace")![](https://is.gd/MhqePq "Intermedium Furnace")![](https://is.gd/bkcQQr "Superium Furnace")![](https://is.gd/nWqFgu "Supremium Furnace")![](https://is.gd/WdFIpI "Ultimate Furnace")
    - light sources: ![](https://is.gd/CDC2hk "Station Light")![](https://is.gd/qgPYqZ "Thermite Torch")![](https://is.gd/GXcq7f "Charged Quartz Fixture")![](https://is.gd/MhQZI3 "Vibrant Quartz Glass")![](https://is.gd/8ei24U "Purpur Lamp")![](https://is.gd/hwdTM0 "White Candle")![](https://is.gd/QtmzVB "Paper Lamp")![](https://is.gd/ORjUbi "Rat Lantern")![](https://is.gd/WXPhZG "Wooden Lantern")![](https://is.gd/JOw5BG "Golden Lantern")![](https://is.gd/xB4IPt "Iron Lantern")![](https://is.gd/vscbBd "Silver Lantern")![](https://is.gd/bzxf0B "White Tallow Candle")
    - [Eye of Fire Dragon]
      [Eye of Ice Dragon]
    - **Every** Iron Chest upgrade now 1/4 cheaper in comparsion to chest itself
    - ![](https://is.gd/XqCZsR "Bedrock Miner")
      ![](https://is.gd/tUuQHQ "Energizer")
      ![](https://is.gd/VPHyvy "Enervator")
      ![](https://is.gd/xFpSOT "Battery Box")
      ![](https://is.gd/OkvH2j "Energy Acceptor")
      ![](https://is.gd/8GG28e "Terrestrial Artifact")
      ![](https://is.gd/ECUEr3 "Terrestrial Artifact Block")
      ![](https://is.gd/wTZM90 "Biome Finder")
      ![](https://is.gd/8KYGtj "Traveller's Goggles (Base)")![](https://is.gd/hFhjle "Traveller's Goggles (Zoom)")![](https://is.gd/bFrvtW "Traveller's Goggles (Soul Sight)")![](https://is.gd/jvacN8 "Traveller's Goggles (Night Vision)")
      ![](https://is.gd/olvpi9 "Traveller's Knapsack")
      ![](https://is.gd/ToyYgw "Storage Bag")
      ![](https://is.gd/SUyTCc "Energy Infuser")
      ![](https://is.gd/UuYoGX "Disenchanter")
      ![](https://is.gd/BzDgE1 "Simple Wired Charger")
      ![](https://is.gd/pxNYYp "Wired Charger")
      ![](https://is.gd/U565kz "Enhanced Wired Charger")
      ![](https://is.gd/puW9wN "Black Iron Frame")
      ![](https://is.gd/cmHfFs "Crane Backpack")
      ![](https://is.gd/CXIJrb "Compost")
      ![](https://is.gd/ruOfVk "Medium Inventory System Storage")![](https://is.gd/pMXn3b "Tiny Inventory System Storage")![](https://is.gd/cIsDGM "Small Inventory System Storage")![](https://is.gd/SiNpBu "Large Inventory System Storage")![](https://is.gd/IuxZg1 "Big Inventory System Storage")![](https://is.gd/LE1f89 "Huge Inventory System Storage")![](https://is.gd/Nd0hLO "Inventory System Storage Extended Warehouse")![](https://is.gd/1OeRW7 "Inventory System Storage Warehouse")![](https://is.gd/KYnwdg "Enormous Inventory System Storage")

  - ### ✎ **Harder**
    - ![](https://is.gd/dMRuQH "Nature's Compass")
      ![](https://is.gd/cn0UWL "Tier 2 Storage Module")

  - ### ✏ **Misc Changes**
    - Some unused dusts was removed from Furnace, for exmple: ![](https://is.gd/Ar6QkY "Electrum Grit")
    - **Modular Controller** now craftable straight without blueprint
    - [Treated Wood Stick] now output x2 from two planks like all other stick recipes do
    - ![](https://is.gd/IRwfF8 "Ghostwood Shard") and ![](https://is.gd/TcoxT3 "Darkwood Shard") now craftable, instead of direct turn logs/planks to material
    - ![](https://is.gd/HrzNI4 "Iron Sword") All vanilla gear (weapons/armor) would not spawn in loot chests or drop
    - ![](https://is.gd/fFoiic "Silky Comb") and other combs now can be processed with ![](https://is.gd/hyNyMX "Crushing Block")
    - ![](https://is.gd/lfetNX "Woven Digging Backpack") now can be made in **crafting table** instead of ![](https://is.gd/alvVC5 "Carpenter")
    - ![](https://is.gd/uRHzqL "Liquid Ethylene") now accepted by ![](https://is.gd/eBtcmn "Gas Turbine controller")
    - ![](https://is.gd/KqRCeD "Banana") Now radioactive
    - ![](https://is.gd/2GFGN0 "Quantum Compressor") fix uncraftable
    - ![](https://is.gd/0OomHZ "Pattern Chest") now can be upgraded
    - **Dog** killing **Slime** now drops ![](https://is.gd/WvJlWu "Prudentium Essence")
    - ![](https://is.gd/1ZpXCt "Quartz Grindstone") fix most wrong outputs
    - Fix crash when using Tcon recycler
    - **Guardian Of Sprites** Drops ![](https://is.gd/mRStgh "Superium Essence") on player hit



## 🔵 **Mods**

  - ### 🌿 **Patchouli**: Add entry about World rules (Torches and Explosions)
      > Also add **Guardian of Sprites** non-standard drop

  - ### 🐝 **Forestry**
    - Attempt to enable generation of Cocoons
      > Also buff drop to always drop ![](https://is.gd/vssyyg "Silk Wisp")
    - Add lot new possible items to Backpacks
      > Now even more items could be inserted and auto-pickup.

  - ### 🖽 **LittleTiles**: Buff Storage size x2
      > Now Little Tiles storage Block x4 larger then one vanilla chest

  - ### 🗃️ **Loot Tables**: New rare entries for some structures
      > Adventuring require better gear, that hard to craft if you dont build base.
      > This new entries would help to have better storage and equipment without building base.
      > 
      > **Cyclops Cave**:
      > - ![](https://is.gd/N08o8s "Grains of Vibrancy")![](https://is.gd/2V0TS0 "Machine Parts")![](https://is.gd/oxFgn8 "Basic Inventory Charger")![](https://is.gd/75Zzxu "Inventory Charger")![](https://is.gd/JxhkVk "Vibrant Inventory Charger")![](https://is.gd/cn0UWL "Tier 2 Storage Module")![](https://is.gd/UMX8dv "Tier 3 Storage Module")![](https://is.gd/pnwhBQ "Nutrient Distillation")![](https://is.gd/0Pw1e4 "Dew of the Void")
      > 
      > **Hydra Cave**:
      > - ![](https://is.gd/NDmr8t "Empowered Phosphor")![](https://is.gd/TogzhP "Signalum Nugget")![](https://is.gd/14fSwf "Coal Dust")![](https://is.gd/fiPq18 "Sulfur Dust")![](https://is.gd/eZUq0U "Ender Pearl Dust")![](https://is.gd/2p4jtA "Liquid Sunshine")**And Every IC2 Fruit**
      > 
      > **Mausoleum**:
      > - ![](https://is.gd/ITcoFx "Resistance")![](https://is.gd/IhUtM0 "Fire Resistance")![](https://is.gd/ZzgFRt "Projectile Resistance")![](https://is.gd/cfcHD2 "Blast Resistance")![](https://is.gd/hZq7YZ "Manufactory Halo")![](https://is.gd/INCOem "Carton") **And some /Dank/Null panels**

  - ### 🧻 **JEI**
    - Add tag **#Charger**
      > Now you can find all blocks and items that could charge RF-holding tools and capacitors.

  - ### 🟨 **Recurrent Complex**: Remove structure with ![](https://is.gd/EXNQJB "Command Block") in chests
      > Its a bug or Easter Egg, but one of houses have about stack of Command Blocks in it

  - ### 🛂 **Triumph**: Remove erroring `recipes/` achievments, add E2E-E root
      > Now new players would be greeted with brand new E2E-E achievments.
      > Also, removed all vanilla and modded achievments that only give recipes in recipe book (already disabled)



## 🔄 **Misc Changes**
  - ### 🧩 **Configs**
    - **Bansoukou**: fix most erroring missed achievments

      > Before this change, achievements that had a reward in the form of a modified recipe simply wouldn't load.  
      > If such a "mistaken" achievement had children, the whole branch was missing.  
      > The Bansoukou mod changes the `.json` files inside the `.jar` files, allowing achievements to be changed before they are loaded.  
      > This reduces the number of errors in the log and makes more achievements available.
      > This change completely removes the error `Parsing error loading built-in advancement` from the log.  
      > Example - fully visible Integrated Dynamics branch https://i.imgur.com/QBLpvR2.png

    - **Minemenu** now only loads on first launch
      > Before, MineMenu circle options (key R by default) was updated every modpack version.
      > Now it would be only loaded from github on first modpack launch, makes it possible to configure.  

    - Remove unused **Schematics** (like from Wizardry)

    - Disabling Dynamic Surroundings' aurora (credit LuizLoyola)
      > Aurora drop FPS hard and provide issues when using shaders

  - ### 🌍 **World Generation**
    - Generate Cyclops caves, Gorgon temples, etc in Ratlantis
    - Other Bedrock Ores will spawn in any dim except 0
      > This would make bedrock level in Ratlantis and other dimensions
      > more rich, full of other ores (except Silver ofc).
      > Example in Ratlantis: https://i.imgur.com/WBZAG5i.png

  - ### 📖 **Quest Book**: Quests updates, Loot chests stackable
      > Now loot chests can be stacked up 🎉.  
      > Also, chest rarity in name.  
      > Add **This chapter is complete!** quest with Trophy for each chapter.  
      > This would help everyone on server see when people finishing chapters.  
      > Also, since Trophy detect when it was achieved, players can see how fast
      > they advanced in progression.  
      > Other changes:
      > - Note about AdvRocketry 100,000 RF/t limit
      > - Simplify Exploration Gate
      > - Show loot chests rarity in reward
      > - Change EmberRoot quest to interaction instead of killing
      > - New quests about Difficulty and Nerfs
      > - New reward for `Harvest Level 1`
      > - Quest about Twilight Forest in Skyblock mode





# v0.43.1


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/207/377/256/256/636965971168795895.png"         width="50"> | 🟩                         [**Nimble (Forge)**](https://www.curseforge.com/minecraft/mc-mods/nimble)                        <sup><sub>Nimble-0.0.2.jar</sub></sup> <br> Perspective animation / Auto third person / Elytra camera roll | Better horse ridings
<img src="https://media.forgecdn.net/avatars/thumbnails/295/249/256/256/637336304211212554.png"         width="50"> | 🟨                            [**ThaumTweaks**](https://www.curseforge.com/minecraft/mc-mods/thaumtweaks)                   <sup><sub>thaumtweaks-0.3.jar</sub></sup> <br> Small addon to make Thaum 6 more fair. | Could help reach end-tech TH stuff
<img src="https://media.forgecdn.net/avatars/thumbnails/465/80/256/256/637745616975327466.png"          width="50"> | 🟩                       [**Modular Assembly**](https://www.curseforge.com/minecraft/mc-mods/modular-assembly)              <sup><sub>ModularAssembly-1.12.2-1.0.2.jar</sub></sup> <br> Modular Assembly is an addon for Modular Machinery.It makes it easy for players to assembly modular machines with one click. | Great tool for fast building machines
<img src="https://media.forgecdn.net/avatars/thumbnails/52/552/256/256/636115610063349816.png"          width="50"> | 🟩                         [**Console Filter**](https://www.curseforge.com/minecraft/mc-mods/console-filter)                <sup><sub>ConsoleFilter-1.12.2-1.1.1.jar</sub></sup> <br> Keeps your console looking fresh. | Remove 10mb of `debug.log` file, make it way smaller

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/353/339/256/256/637509884491240816.png"         width="50"> | 🟫                              [**Versioner**](https://www.curseforge.com/minecraft/mc-mods/versioner)                     <sup><sub>versioner-1.0.3.jar</sub></sup> <br> Modpack utilities, version checking, sponsors & more! | Version info now outputs with **Custom Main Menu** mod

## 🟡 Updated Mods

- **Village Names**
- **CraftTweaker**
- **Zen Utils**
- **WanionLib**
- **Rocky Tweaks**
- **LibVulpes**
- **Advanced Rocketry**


## [> Mods updates detailed.](changelogs/MODS_v0.43.1.md)


## ✏️ **Recipes**
  - Return four AIOT tools
    > Four types of AIOTs from **Actually Additions** was added back (was removed).  
    > They have lowered durability, slow mining speed and very high cost.  
    > Intended to use with enchantments and potion effects.
  - ### 🖉 **New Recipes**
    - **Zotzpire** now drop ![](https://is.gd/zCAaeh "Hardened Leather") and ![](https://is.gd/pVusFu "Nether Wings")
    - ![](https://is.gd/ml2EvO "Lavawood") -> ![](https://is.gd/YhrCHH "Obsidian") by ![](https://is.gd/fgiM64 "Pure Daisy")
    - [Excavate Modifier] -> ![](https://is.gd/9Nehsu "Enchanted Book") convert
    - ![](https://is.gd/p2LYkk "Arcane Curiosity")![](https://is.gd/HZ4mIX "Ancient Curiosity")![](https://is.gd/uuE2B5 "Illuminating Curiosity")![](https://is.gd/bKz6O5 "Twisted Curiosity") from ![](https://is.gd/MmqwwX "Flux Goo")
    - ![](https://is.gd/n5jVPe "Endorium Nugget") in ![](https://is.gd/Dp74o7 "Crystallizer")
    - ![](https://is.gd/oMZmjG "Biome Essence Ore") in ![](https://is.gd/TY9CHI "Orechid Vacuam")
    - Endermite now drop ![](https://is.gd/RJd5Sm "Ender Dust") and ![](https://is.gd/uMCwJz "Tungsten Nugget")
    - Netherfish now drops ![](https://is.gd/JDTXC0 "Ash")
    - Rainbow Fairie now drop ![](https://is.gd/netjim "Illumination Powder")
    - ![](https://is.gd/DUVmvu "Celestial Crystal Shard") from ![](https://is.gd/HqINCS "Obsidian Shard")
    - ![](https://is.gd/2GTeZM "Pulverized Silver") in ![](https://is.gd/631LX8 "Grindstone")

  - ### ✐ **Cheaper**
    - More ![](https://is.gd/MmqwwX "Flux Goo") in [Essentia Centrifuge]
    - ![](https://is.gd/m70rUQ "Ender Air Bottle") from ![](https://is.gd/85GQrr "Extraterrestrial Matter")
    - ![](https://is.gd/fhhbVF "Fused Quartz")x8 from ![](https://is.gd/NDmr8t "Empowered Phosphor")x1
    - ![](https://is.gd/3Gi94v "Totemic Capacitor")
      ![](https://is.gd/gvfZDT "Traveler's Sack")
      ![](https://is.gd/JJ54rW "Antenna")
      ![](https://is.gd/OkvH2j "Energy Acceptor")
      ![](https://is.gd/om5LW0 "Glowstone Nano-Particles")
      ![](https://is.gd/cEsgTs "Yellow Nitor")
      ![](https://is.gd/aD5Sv9 "Moonworm")

  - ### ✎ **Harder**
    - ![](https://is.gd/RYYt7r "Battery")
      ![](https://is.gd/IEY75H "Enchanter")
      ![](https://is.gd/yPSFQS "Sprinkler")
      ![](https://is.gd/dy4GJP "Structure Builder")
      ![](https://is.gd/Gh66ly "Controlled Miner")
      ![](https://is.gd/ahcVV4 "Tier 1 Crafting Seed")![](https://is.gd/ajlEmV "Tier 2 Crafting Seed")![](https://is.gd/qIUHEA "Tier 3 Crafting Seed")![](https://is.gd/cpnvto "Tier 4 Crafting Seed")![](https://is.gd/NuFIH0 "Tier 5 Crafting Seed")![](https://is.gd/QhAa53 "Tier 6 Crafting Seed")

  - ### ✏ **Misc Changes**
    - New item [Compressed Garbage Pile]
    - ![](https://is.gd/scuQGy "Endorium Ingot") alt in AR machine
    - ![](https://is.gd/Gh1sGK "Spectre Coil") alt from ![](https://is.gd/scuQGy "Endorium Ingot")
    - ![](https://is.gd/DmnIMW "Printed Page") now stackable
    - ![](https://is.gd/vfFP5S "Turtle") now craftable from ![](https://is.gd/C9Ix79 "Iron Alloy Ingot")
    - ![](https://is.gd/gAdqgd "Small Plate Presser") Remove all **Ore** => **Tiny Dust** recipes
    - ![](https://is.gd/zl5FhW "Sieve") now output seeds of ![](https://is.gd/IuZ3ku "Cinderpearl") and ![](https://is.gd/gbjknn "Shimmerleaf") instead of flowers
    - ![](https://is.gd/CNjVFg "Slag") was unified (replaced with IE)
    - ![](https://is.gd/3bQVQK "Steel Ingot") now can be made from ![](https://is.gd/C9Ix79 "Iron Alloy Ingot")
    - ![](https://is.gd/XShjba "Climograph Base Unit") now have alt recipe that can be crafted only when player hang over void
    - ![](https://is.gd/Rk6gwX "Thermal Centrifuge") Fix ![](https://is.gd/RwVsHT "Block of Apatite") recycle
    - ![](https://is.gd/5ibd0C "Royal Jelly") now made in machines
    - ![](https://is.gd/g99wcT "Mob Crusher") Added alt with [Robot] instead of ![](https://is.gd/1JeAUl "Mechanical User")
    - ![](https://is.gd/mTLI3B "Redstone Conductance Coil") now craftable from ![](https://is.gd/n8BjYF "Fluix Wire Coil")
    - ![](https://is.gd/41zejU "Fluxomagnet (Hardened)")![](https://is.gd/xw3t9J "Fluxomagnet (Reinforced)")![](https://is.gd/20pVUW "Fluxomagnet (Signalum)")![](https://is.gd/cXYE0T "Fluxomagnet (Resonant)") now save tags when upgrading
    - ![](https://is.gd/SCXKlq "Garbage Pile") recipe can output more than 64 blocks
    - Add missed ![](https://is.gd/uQuC0S "Native Cinnabar Cluster") -> ![](https://is.gd/ptsoCP "Quicksilver") furnace recipe
    - Way more JEI info about **Infernal Furnace** output
    - Fix wrong nuggets in **Infernal Furnace**
    - **Morb** with **Questing Ram** now craftable



## 🔵 **Mods**
  - Fix `manifest.json` - remove **Nutrition** mod
  - ### 🔌 **Industrial Craft 2**: Huge Crops Rework
      > - Add JEI category for crops
      > - Some IC2 tiny dusts was retextured and renamed to be used totally another way
      > - Three new Tiny Dust items was created - they should replace old ones
      > - Tiny Pile of Iron dust from Copper+Tin was removed

  - ### 🧙‍♂️ **Cyclic**: Enable Sprinkler Animations
      > Now sprinklers are pricy and its harder to place them everywhere.
      > Also, water splashes can be disabled by **shift-right-click**

  - ### 🧻 **JEI**
    - blacklist updates
    - Add few items to **##Generator** tag

  - ### 🛹 **Integrated Dynamics**: Cap max range of access proxy to `32`
      > It was infinite and allow infinite fast item transfer



## 🔄 **Misc Changes**
  - Change texture of Cobalt and Ardite dust
  - Temporary fix for FoamFix + ResourcePack issue (transparent grass blocks)
    > https://github.com/asiekierka/FoamFix/issues/277
  - Filter lot of `debug.log` output, for example `Couldn't load advancement`
  - ![](https://is.gd/Qdrz8o "Creative Bin") sligltly increase capacity to prevent 1999999999 amount
  - Return vanilla Server Tab info
  - Remove BoP files from releases and repository
  - Disable `reuseBucketQuads`
    > Temporary fix for
    > https://github.com/LoliKingdom/LoliASM/issues/55
  - ### 🧩 **Configs**
    - Remove **Difficulty** depends on distance from spawn
      > Now Difficulty only determined by players own difficulty.  
      > This change need because if spawn point in Overworld moved far from 0:0
      > in Nether teleporting point would be so far from spawn, that
      > too much difficulty added
    - Fix Server forge version on `settings.cfg`
    - Change Forge splash gif, change main menu logo
      > Also change new version message in main menu

  - ### 📖 **Quest Book**: Quests updates
      > - Signif. buff **Travel Kit**
      > - Add bonus reward to Twilight Forest quest
      > - Other changes






# v0.43.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/417/353/256/256/637641198339910843.png"         width="50"> | 🟨                                  [**OAuth**](https://www.curseforge.com/minecraft/mc-mods/oauth)                         <sup><sub>oauth-1.06.2.jar</sub></sup> <br> Adds the ability to login and authenticate to Microsoft, Mojang, or Legacy accounts! | Replace **ReAuth**, because **OAuth** can work with Microsoft accounts
<img src="https://media.forgecdn.net/avatars/thumbnails/141/61/256/256/636539476766896518.png"          width="50"> | 🟨                           [**Book Display**](https://www.curseforge.com/minecraft/mc-mods/book-display)                  <sup><sub>bookdisplay-1.12.2-2.0.0.jar</sub></sup> <br> Read books while moving! | Would be nice since E2E-E have a lot of books
<img src="https://media.forgecdn.net/avatars/thumbnails/464/988/256/256/637745263087022445.png"         width="50"> | 🟩                            [**Persistency**](https://www.curseforge.com/minecraft/mc-mods/persistency)                   <sup><sub>persistency-1.2.0.jar</sub></sup> <br> Library to aid data persistency | New dependency lib for **Thaumic Speedup**

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/28/209/256/256/635824003539291791.png"          width="50"> | 🟫                                 [**ReAuth**](https://www.curseforge.com/minecraft/mc-mods/reauth)                        <sup><sub>reauth-3.6.0.jar</sub></sup> <br> Fixes the Problem of having to restart your Client when your Session invalidates | Replaced with **OAuth**

## 🟡 Updated Mods

- **CraftTweaker**
- **AE Additions - ExtraCells2 Fork**
- **Biomes O' Plenty**
- **JustEnoughIDs**
- **MixinBooter**
- **WanionLib**
- **Extended Crafting: Omnifactory Edition**
- **UniDict**
- **LittleTiles**
- **Thaumic Speedup**


## [> Mods updates detailed.](CHANGELOG_MODS_v0.43.0.md)


## ✏️ **Recipes**
  - ### ✐ **Cheaper**
    - ![](https://git.io/JcbhR "Dense Obsidian Plate") from only 3 ![](https://git.io/J3JEq "Obsidian"), was from 4
    - ![](https://git.io/JyGmx "Glowstone Dust") from ![](https://git.io/Jz9qS "Firefly") now output 20, was 2

  - ### ✏ **Misc Changes**
    - Fix in world texture of [Molten Electronics] and [Molten Spectre]
    - ![](https://git.io/JcW20 "Stone Gear") Fix recipe (was uncraftable from cobble)
    - ![](https://git.io/JyngK "Bucket Cast") Fix recipe, now cast from ![](https://git.io/Jyng6 "Unfired Clay Bucket")
    - ![](https://git.io/JDL6l "Infinity Dust Block")[Compressed Gunpowder] fix sieving



## 🔵 **Mods**
  - updates
    > Fixes #16
  - ### 📑 **Tips**: Fix joining Skyblock message about Haste effect `VI` -> `IV`



## 🔄 **Misc Changes**
  - Fix issue that allower Rats to spawn everywhere
  - Fix English in loading screen tips
  - Remove servers list from defaultoptions
  - ### 🧩 **Configs**
    - Add Animated Gif to splash screen
    - Add Modpack icon

  - ### 📖 **Quest Book**: Quests updates






# v0.42.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/200/104/256/256/636911346406811955.png"         width="50"> | 🟨                            [**ScalingGUIs**](https://www.curseforge.com/minecraft/mc-mods/scalingguis)                   <sup><sub>scalingguis-1.12.2-1.0.3.0.jar</sub></sup> <br> Decouples the scaling of individual GUIs, the HUD, and Tooltips | Replace of **TipTheScales** with better handling. Also, give ability to control tooltip size separately, whats really helps with TCon's toolc CTRL view.
<img src="https://media.forgecdn.net/avatars/thumbnails/16/241/256/256/635643462839567949.png"          width="50"> | 🟧                  [**Custom Loading Screen**](https://www.curseforge.com/minecraft/mc-mods/better-loading-screen)         <sup><sub>CustomLoadingScreen-1.12.2-1.5.6.jar</sub></sup> <br> Allows you to completly customise the loading screen with json files. (Formally Better Loading Screen) | Splendid loading screen. Probably adds +20 seconds to load time (need test).
<img src="https://media.forgecdn.net/avatars/thumbnails/254/937/256/256/637200075120452466.png"         width="50"> | 🟨                             [**AI Reducer**](https://www.curseforge.com/minecraft/mc-mods/ai-reducer)                    <sup><sub>AIReducer-1.12.2-0.3.0.jar</sub></sup> <br> Configurable AI for performance | Helps with Ice&Fire mobs and some other.
<img src="https://media.forgecdn.net/avatars/thumbnails/194/704/256/256/636874517756132934.png"         width="50"> | 🟧                        [**Thaumic Wonders**](https://www.curseforge.com/minecraft/mc-mods/thaumic-wonders)               <sup><sub>thaumicwonders-1.8.2.jar</sub></sup> <br> Create wonders with Thaumcraft 6! | More features fro TC.
<img src="https://media.forgecdn.net/avatars/thumbnails/289/135/256/256/637314086602926303.png"         width="50"> | 🟧 [**Extended Crafting: Omnifactory Edition**](https://www.curseforge.com/minecraft/mc-mods/extended-crafting-omnifactory-edition) <sup><sub>ExtendedCrafting-Omnifactory-Edition-1.6.1.jar</sub></sup> <br> Bigger crafting tables and more! | Updating fork of Extended Crafting.
<img src="https://media.forgecdn.net/avatars/thumbnails/218/61/256/256/637009864888519539.png"          width="50"> | 🟨                    [**FindMeAnyDurability**](https://www.curseforge.com/minecraft/mc-mods/findmeanydurability)           <sup><sub>findme-1.12.2-1.1.0.jar</sub></sup> <br> Modified version of Buuz135's FindMe mod which enables the search function to work regardless of item durability | Better fork.
<img src="https://media.forgecdn.net/avatars/thumbnails/353/339/256/256/637509884491240816.png"         width="50"> | 🟨                              [**Versioner**](https://www.curseforge.com/minecraft/mc-mods/versioner)                     <sup><sub>versioner-1.0.3.jar</sub></sup> <br> Modpack utilities, version checking, sponsors & more! | Show version number in main meny.
<img src="https://media.forgecdn.net/avatars/thumbnails/209/896/256/256/636984387439692141.png"         width="50"> | 🟨    [**Smooth Scrolling Everywhere (Forge)**](https://www.curseforge.com/minecraft/mc-mods/smooth-scrolling-everywhere)   <sup><sub>smooth-scrolling-everywhere-1.1.jar</sub></sup> <br> Adds smooth scrolling to every list. | Looks nice.
<img src="https://media.forgecdn.net/avatars/thumbnails/28/371/256/256/635826252878407531.png"          width="50"> | 🟨                           [**(Chat) Ping!**](https://www.curseforge.com/minecraft/mc-mods/chat-ping)                     <sup><sub>ping-1.9-3.0.9.jar</sub></sup> <br> Notifying users when they are mentioned in chat | Helpful to not lose messages to you in chat.
<img src="https://media.forgecdn.net/avatars/thumbnails/84/402/256/256/636194827364521008.png"          width="50"> | 🟨                               [**Fakename**](https://www.curseforge.com/minecraft/mc-mods/fakename)                      <sup><sub>Fakename MC1.12.2 v1.2.jar</sub></sup> <br> Fakename adds Commands to change the display name | Userful in multiplayer.

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/115/986/256/256/636397128892485256.png"         width="50"> | 🟫                      [**Extended Crafting**](https://www.curseforge.com/minecraft/mc-mods/extended-crafting)             <sup><sub>ExtendedCrafting-1.12.2-1.5.6.jar</sub></sup> <br> Adds some new ways to craft items, as well as extra crafting items and utilities. | Replaced with newer fork.
<img src="https://media.forgecdn.net/avatars/thumbnails/149/484/256/256/636589738152406559.png"         width="50"> | 🟨                                 [**FindMe**](https://www.curseforge.com/minecraft/mc-mods/findme)                        <sup><sub>findme-1.12.2-1.1.0-8.jar</sub></sup> <br> Search for an item in nearby inventories | Replaced with newer fork.
<img src="https://media.forgecdn.net/avatars/thumbnails/131/501/256/256/636467873539016713.png"         width="50"> | 🟫                           [**TipTheScales**](https://www.curseforge.com/minecraft/mc-mods/tipthescales)                  <sup><sub>TipTheScales-1.12.2-1.0.4.jar</sub></sup> <br> Allows for more options when adjusting the GUIScale option as well as making it a slider. | Replaced with newer **ScalingGUIs**.

## 🟡 Updated Mods

- **Village Names**
- **Zen Utils**
- **Minor Integrations and Additions (MIA)**
- **SneedASM**
- **Just Enough Drags**
- **spark**
- **LittleTiles**


## [> Mods updates detailed.](changelogs/CHANGELOG_MODS_v0.42.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://git.io/JDL6B "Tungsten Nugget") from ![](https://git.io/JLhhT "Crushed End Stone")
    - ![](https://git.io/JDL6R "Flint Stiffened Mesh") Lots of changes for output
    - [Single Compressed Gunpowder] and ![](https://git.io/JDL6l "Infinity Dust Block") new recipes in ![](https://git.io/JOv90 "Sieve")
    - ![](https://git.io/JDJuK "Obsidian Catalyst")
      ![](https://git.io/JDJuo "Ender Air Bottle")
      ![](https://git.io/JDJua "Dragon's Breath")
      ![](https://git.io/JDLi8 "Jungle Myrmex Egg")
      ![](https://git.io/JDLil "Desert Myrmex Egg")

  - ### ✐ **Cheaper**
    - ![](https://git.io/JPiDT "Steam") in ![](https://git.io/JtJPC "High Oven Controller") x10 times faster
    - ![](https://git.io/JDICi "Magenta Lamp") and all other lamps from AA
    - All **Little Tiles** tools use ![](https://git.io/JDJu6 "Platinum Nugget") instead of ![](https://git.io/JDJur "Osmiridium Nugget")
    - ![](https://git.io/JDL6R "Flint Stiffened Mesh") change ingredient from ![](https://git.io/JDL64 "Elite Catalyst") to ![](https://git.io/JDL68 "Basic Catalyst")
    - ![](https://git.io/Jsw4e "Shock Absorber")
      ![](https://git.io/JDIC6 "Farm Block")
      ![](https://git.io/JDJuM "Personal Chest")
      ![](https://git.io/JDJuw "Robit")
      ![](https://git.io/JtJFY "Rat Upgrade: Chef")
      ![](https://git.io/JtJTp "Strongbox (Basic)")
      ![](https://git.io/JzqeB "Teleport Rail")
      ![](https://git.io/JDL6u "Basic Component")
      ![](https://git.io/JDL68 "Basic Catalyst")

  - ### ✎ **Harder**: ![](https://git.io/Jsw4v "Rock Crystal Ore") from ![](https://git.io/JDJuX "Rock Crystal Essence")

  - ### ✏ **Misc Changes**
    - Add new items - [Phosphor Ore] and [Phosphor Nugget]
    - Fix Compressed Dirt and Clay melting
    - ![](https://git.io/JMnCj "Uranium Ore Piece") fix mesh level
    - ![](https://git.io/JzX6S "Netherrack") lower spawn rate when interacting with ![](https://git.io/JMnWI "Fiery Essence")
    - ![](https://git.io/JtJk7 "Leather Boots") fix recipe (restore vanilla)
    - ![](https://git.io/JZYfW "Rune of Summer") replace Vis crystal to ![](https://git.io/JDICK "Alchemical Brass Nugget")
    - ![](https://git.io/JmV4Y "Spectre Ingot") now have alt from ![](https://git.io/JcNOf "Cyanite Dust")
    - ![](https://git.io/JDJu2 "Blue Network Cable") now requre ![](https://git.io/JDJuV "Carbon Plate") instead of ![](https://git.io/JDICP "Lapis Lazuli Plate")
    - [Molten Electronics] more recipes
    - [Astral Starmetal Essence] new items related to ![](https://git.io/Jw3xR "Starmetal Ingot")
    - ![](https://git.io/JDL6E "EEPROM") new chip recipe with pre-programmed user



## 🔵 **Mods**
  - ### 🌿 **Patchouli**: Add description for new spawning rules

  - ### 🏪 **Requious Fracto**: JEI for **Entity Kill Entity**

  - ### 🐮 **Animania**: recipes speedup and improvments
      > - `24000` => `6000` Ticks that a Cheese takes to mature
      > - `16` => `8` Range that Animals search blocks
      > - `80` => `40` Range that the animal cap applies for around each animal
      > - `100` => `500` AI Tick Countdown Timer
      > - `0.1` => `0.2` Chance that multiple animals will be born
      > - `200` => `100` Ticks before next incremental growth
      > - `12000` => `4000` Ticks between dropping feathers for chickens and peafowl
      > - `20000` => `10000` Ticks between birthings
      > - `2000` => `1000` Ticks between laying eggs
      > - `8000` => `2000` Ticks before wool regrowth after shearing
      > - Enable Shift-Right-Click for Seed Placement

  - ### 📑 **Tips**: Add New loading screen, logo, tips

  - ### 🧻 **JEI**
    - blacklist updates
    - Add few items to **##Generator** tag



## 🔄 **Misc Changes**
  - Enable Logging for AppiedEnergetics
  - ![](https://git.io/JcbN6 "Dragon Egg") Forces to spawn every time the dragon is killed
  - Increased number of **Block Drops** calculations (affects only developing, not affecting player's experience)
  - Unidict add some `childrenOfMetals` and `metalsToUnify`. Not sure if it changes something
  - ![](https://git.io/JDJu1 "Mana Lens: Bore") ![](https://git.io/JDJuP "Mana Lens: Weight") increasse harvest levels up to 9
  - Change **Tooltip Scale** 1 size smaller
  - **Nether Portal Spread** change radius `30` => `15`. Should help with performance
  - ![](https://git.io/Ju4r3 "Quantum Compressor") lower mining level 11 => 8
  - Fix players gets translation lang key instead of messages on server (on first world join for example)
  - Drop players out of forbidded dimensions in Skyblock, if they manage to get there (for Deep Dark for example)
  - ![](https://git.io/J3hV0 "Crushing Block") lower mining level 11 => 6
  - **Carryon** now allow to carry **Cooking For Blockheads** and some **TConstruct** blocks but disallow:
    > * Some TComplement blocks
    > * Integrated Dynamics / Tunnels / Terminals
  - ### ⚡ **Performance**
    - add delay for all Animania animals
      > Not tested if actually increase performance
    - add delay for Rat tasks to `10` ticks (probably not working)

  - ### 🌍 **World Generation**: Bedrock  1 => 2 layers, but 1 layer in Nehter roof
      > This is related to:
      > https://github.com/NillerMedDild/Enigmatica2Expert/issues/1899  
      > **Astral Sorcery** rituals not working without clar sky
      > OR 1 layer of bedrock above ritual.  
      > I make floor and roof with 2 blocks, but replace 1 layer of
      > ![](https://git.io/JDJui "Bedrock") with ![](https://git.io/JDIC1 "Compressed Netherrack") in nether to give players ability to use rituals.
      > This change necessary to prevent making holes in **Overworld** with
      > ![](https://git.io/JDICX "Mining Laser") or many other block miners, because they remove
      > **Bedrock Ores** and leave holes.  
      > Now `y=0` level is plain bedrock, and `y=1` level content Ores.  
      > Also, fix ![](https://git.io/JDJuD "Draconium Ore") spawn in **Deep Dark**

  - ### 📖 **Quest Book**: Quests updates
      > - **Thaumcraft** reward x20 times more Curio






# v0.41.1



## ✏️ **Recipes**
  - Fix Molten Electronics name and fix JEI crash




# v0.41.0



## 🟡 Updated Mods

- **Zen Utils**
- **Minor Integrations and Additions (MIA)**
- **SneedASM**
- **Athenaeum**
- **Collective (Forge)**
- **Immersive Technology**
- **CreativeCore**
- **LittleTiles**
- **Thaumic Augmentation**


## [> Mods updates detailed.](changelogs/CHANGELOG_MODS_v0.41.0.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - Every **Dirty dust** -> **Dust** in ![](https://git.io/JmVeA "Fluid Tank")
    - ![](https://git.io/JcbbH "Cheese Wheel (Goat)")![](https://git.io/JcbbX "Cheese Wheel (Holstein)")![](https://git.io/Jcbbd "Cheese Wheel (Jersey)")![](https://git.io/JcbbA "Cheese Wheel (Sheep)")![](https://git.io/Jcbb6 "Cheese Wheel (Friesian)") in ![](https://git.io/JGGjS "Crystallizer")
    - ![](https://git.io/JMnWJ "Heart of Diamond") -> ![](https://git.io/JmVuJ "Empowered Diamatine Crystal")
    - This Fluids now can be "milked" from different mobs:
      > ![](https://git.io/JMnWO "Distilled Water")
      > ![](https://git.io/JMnWs "Tree Oil")
      > ![](https://git.io/JMnWC "Molten Iron Alloy")
      > ![](https://git.io/JMnWI "Fiery Essence")
      > ![](https://git.io/JXrMC "Crushed Ice")
      > ![](https://git.io/JMnWf "Lubricant")
      > ![](https://git.io/JMnWU "Electronics Assembler")
      > ![](https://git.io/JMnWG "Molten Obsidian")
      > ![](https://git.io/JMnWq "Molten Platinum")
      > ![](https://git.io/JMnWZ "Pink Slime")
      > ![](https://git.io/JMnCh "Amorphous Crystal Matrix")
    - ![](https://git.io/JMnCj "Uranium Ore Piece")
      ![](https://git.io/JMnWk "Dirty Copper Dust")
      ![](https://git.io/JMnWe "Dirty Tin Dust")
      ![](https://git.io/JMnWY "Apatite Dust")
      ![](https://git.io/JMnWL "Spawn Rat")
      ![](https://git.io/JXrXU "Molten Fiery")
      ![](https://git.io/Jz0VY "Lava")

  - ### ✐ **Cheaper**
    - ![](https://git.io/JMnWT "Tiny Pile of Osmium Dust") and ![](https://git.io/JMnWl "Tiny Pile of Black Quartz Dust") from Prime wool x4 more
    - ![](https://git.io/JMnWm "Portable Analyzer")
      ![](https://git.io/JznPk "Rat on Arrow")

  - ### ✏ **Misc Changes**
    - ![](https://git.io/JMnW3 "Witchwater") changed interactions. No more cheap dirt. See JEI.
    - ![](https://git.io/JMnWt "Carving Knife") buff durability x10
    - ![](https://git.io/JMnWv "Raw Venison") Return to JEI and as drop to be able spawn **Hirschgeist**
    - Fix Pebbles to blocks craftings (was wrong output with different types)
    - Nerf ![](https://git.io/JgeGF "Ferrous-Juniper Log") but buff ![](https://git.io/J3p88 "Ironberries")
    - ![](https://git.io/JMnWn "Wrench") buff durability to 5000
    - Right ingredients for ![](https://git.io/JcNYb "Blizz Rod") and others, Fix #18
    - [Molten Electronics] New liquid and its casts
    - Remove Shulker Boxes from **Chest** oredict



## 🔵 **Mods**
  - updates
  - ### 🏪 **Requious Fracto**: JEI for **Barrel Milking** and more ![](https://git.io/JMnW3 "Witchwater")



## 🔄 **Misc Changes**
  - Disable Analytics and Update check
  - Add RF usage for **Integrated Terminals** and **Integrated Crafting**
  - Player would not be buffed with Haste each time enter Skyblock (only first)
  - Add Nutritions not ![](https://git.io/JMnWW "Assorted Vegetables")
  - Reduce Skull dropping from players
  - Some Compressed Blocks mining level higher
  - Buff ![](https://git.io/JXrMB "Pitiful Fuel Generator") x2
  - Buff ![](https://git.io/JMnWc "Hover Boots") stats
  - ### 🧩 **Configs**: Rat, Watcher, End Guard and other new spawning rules
      > - **Enderman** now 10% of time carry some End Stone or End Ores blocks
      > - **Dire Wolfs** now spawning only at 7 and less light level
      > - **Stonelings** x10 times less spawn
      > - **Rats** now can spawn on ![](https://git.io/JzVqO "Garbage Pile")
      > - **Watcher** now can spawn in Overworld, but only on ![](https://git.io/JLhh0 "End Stone")
      > - **End Guard** can spawn in any dimension but only on ![](https://git.io/JMnBq "Purpur Block")
      > - **Golems** not shoot hostile mobs anymore

  - ### 📖 **Quest Book**: Quests updates:
      > - Remove all Coins from Loot Chests
      > - Other quest changes






# v0.40.1


## 🟡 Updated Mods

- **CraftTweaker**


## [> Mods updates detailed.](changelogs/CHANGELOG_MODS_v0.40.1.md)


## ✏️ **Recipes**
  - ![](https://git.io/JcNYb "Blizz Rod") and ![](https://git.io/JXrMl "Basalz Rod") test recipes, related to #18
    > Some players experience that they cant put ![](https://git.io/Jz0Vt "Empty Rod") onto casting table.  
    > Try to craft all three rods on your instance and report which one is craftable
  - ### ✐ **Cheaper**
    - ![](https://git.io/J1xK3 "Lantern")
      ![](https://git.io/JtJMC "Powered Lantern")
      ![](https://git.io/J1xKL "Floodlight")
      ![](https://git.io/J1xKq "Reinforced Coke Brick")
      ![](https://git.io/J6y7T "Stable Ender Pearl")

  - ### ✎ **Harder**
    - ![](https://git.io/JP6gc "Lormyte Stone")
      ![](https://git.io/JcbbK "Fertilized Essence")
      [Mechanical Miner]

  - ### ✏ **Misc Changes**
    - ![](https://git.io/J1HzN "Fluix-Plated Iron Ingot") fix ingredients wasnt consumed
    - ![](https://git.io/JzVqO "Garbage Pile") add HarvestLevel accounting
    - ![](https://git.io/JcNYX "Plutonium-238") in ![](https://git.io/J1Hzb "Mutagen Producer") output less ![](https://git.io/J1HzA "Mutagen")
    - ![](https://git.io/J1xKm "Dragon Scale") can be purchased or dropped from Slime vs Cockatrice
    - ![](https://git.io/J1xKY "Knife") can be made with more durability
    - [Single Compressed Fish] can be made from any fish
    - ![](https://git.io/JZYf2 "Rune of Earth") replace ![](https://git.io/JcbNJ "Rare Earths") to ![](https://git.io/J1xKI "Peat")
    - ![](https://git.io/Jgexr "Mysterious Token Chunk") now drops from slimes
    - Dragon Scales from Ice & Fire now have more crafts
    - Remove Knowledge Absorber usage


## 🔄 **Misc Changes**
  - ![](https://git.io/J1xKt "Bowl") can now filled into ![](https://git.io/J1xKO "Bowl of Water") from ![](https://git.io/J3hVE "Wooden Barrel")
  - Now Nultrition could be lower up to 20 after death to prevent "die to eat" exploit
  - Add `options.txt` and `optionsof.txt` to repo to use it as defaults
  - Lower RAM requirments in README
  - Add **Haste** effect for newly joined players in Skyblock
  - ### ⚡ **Performance**: set `vertexDataCanonicalization=false`
      > From config description:
      > > EXPERIMENTAL: Deduplicate BakedQuad's Vertex Data array.
      > > If you see any artifacting in-game, turn this off and report it on github

  - ### 🧩 **Configs**
    - Add Discord link to main menu and Github's README
    - Enable chunk claiming, enable explosions in them
      > Also, disable logging of afk in console.

  - ### 📖 **Quest Book**: Quests updates
      > - Less requirment amount for Eggs, Feathers and Meat
      > - Grant Astral Sorcery progression when completing altairs quest - this would help for multiplayer
      > - Some new quests






# v0.40


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/358/827/256/256/637520208754289091.png" width="50"> | 🟫 [**SneedASM**](https://www.curseforge.com/minecraft/mc-mods/sneedasm) <sup><sub>loliasm-4.3.jar</sub></sup> <br> Huge optimizations that are targeted at 1.12.2. Feed and sneed. | Need some tests. Disabled in this version

## 🟡 Updated Mods

- **AE Additions - ExtraCells2 Fork**
- **Athenaeum**
- **Kiro's Basic Blocks**
- **Collective (Forge)**
- **CreativeCore**
- **LittleTiles**
- **Just Enough Calculation**


## [> Mods updates detailed.](changelogs/CHANGELOG_MODS_v0.40.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://git.io/JZviQ "Conduit Binder") in ![](https://git.io/JGGjS "Crystallizer")
    - [Single Compressed Wood] => ![](https://git.io/J1BGw "Block of Charcoal")
    - [Double Compressed Wood] => [Single Compressed Charcoal]
    - ![](https://git.io/J1Bs6 "Fertilizer")

  - ### ✐ **Cheaper**
    - ![](https://git.io/Jsw4e "Shock Absorber")
      ![](https://git.io/JtJJk "White Alabaster")

  - ### ✏ **Misc Changes**
    - ![](https://git.io/J1Bsi "Hardened Casing") now craftable from ![](https://git.io/JtIrt "Rat Diamond")
    - Gas Turbine x5 ![](https://git.io/J1BsP "Flue Gas") output
    - ![](https://git.io/JzVqO "Garbage Pile") buff output amount



## 🔵 **Mods**
  - ### 🐝 **Forestry**: Add all Environmental Materials blocks to ![](https://git.io/J6y7J "Building Backpack")

  - ### 👨‍🏭 **Mekanism**: buff ![](https://git.io/JCt02 "Advanced Bin") and higher

  - ### 🎒 **Traveler's Backpack**: buff tank up to 100 buckets



## 🔄 **Misc Changes**
  - ### 📖 **Quest Book**: Quests updates






# v0.39


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/453/721/256/256/637719719509416092.png" width="50"> | 🟫 [**Tinkers OreDict Cache**](https://www.curseforge.com/minecraft/mc-mods/tinkers-oredict-cache) <sup><sub>TinkersOreDictCache-1.0.jar</sub></sup> <br> caches all oredict smelting recipes of TConstruct to speed up game loading. | Speedup modpack loading for about 30 seconds! (-6% of total load time)
<img src="https://media.forgecdn.net/avatars/thumbnails/445/527/256/256/637701622407921289.png" width="50"> | 🟨 [**Better P2P**](https://www.curseforge.com/minecraft/mc-mods/betterp2p) <sup><sub>betterp2p-1.12.2-1.2.2.jar</sub></sup> <br> Better P2P and memory card for Applied Energistics 2 | Sounds nice, should test that

## 🟡 Updated Mods

- **Village Names**
- **CraftTweaker**
- **Zen Utils**
- **Modular Controller**
- **Just Enough Drags**
- **LittleTiles**


## [> Mods updates detailed.](changelogs/CHANGELOG_MODS_v0.39.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://git.io/JtJGS "Compressed Cobblestone") and 19 other compressed items could be melted (with reduced output)
    - ![](https://git.io/JOGu6 "Endervoir") in Transposerand and Fluid Infuser
    - ![](https://git.io/JXrMO "Crystallized Canola Seed") from ![](https://git.io/Jsey2 "Rat Nugget")
    - ![](https://git.io/JcW2R "Basic Tank") from ![](https://git.io/JOGgk "Propolis")
    - ![](https://git.io/JcNYb "Blizz Rod")![](https://git.io/JXrM8 "Blitz Rod")![](https://git.io/JXrMl "Basalz Rod")
    - ![](https://git.io/JXrMC "Crushed Ice")

  - ### ✐ **Cheaper**
    - ![](https://git.io/JXrMB "Pitiful Fuel Generator")
      ![](https://git.io/JXrM3 "Plate Base")
      ![](https://git.io/JXrMn "Collection Plate")
      ![](https://git.io/JXrM4 "Extraction Plate")

  - ### ✎ **Harder**
    - ![](https://git.io/JXrMZ "Endorium Ingot")
      ![](https://git.io/J6y7Z "Cheese")
      ![](https://git.io/Jtyeb "Output Variable Transformer")
      ![](https://git.io/JtyeA "Input Variable Transformer")
      ![](https://git.io/JtyeN "Mono-Directional Connector")
      [Mechanical Crafter]

  - ### ✏ **Misc Changes**
    - ![](https://git.io/JXrXU "Molten Fiery Tank") and ![](https://git.io/JXV80 "Molten Supremium") higher temperature
    - ![](https://git.io/JcbNq "Orechid") Significantly buff ![](https://git.io/JXrMR "Apatite Ore") output
    - ![](https://git.io/JXrMs "Magic Infuser") fix missed ingredients
    - ![](https://git.io/JtJff "Water Essence")![](https://git.io/JcbNU "Wood Essence")![](https://git.io/JXrMW "Slime Essence") have new crafting usages



## 🔵 **Mods**
  - ### 🐀 **Rats**: ![](https://git.io/JzVqO "Garbage Pile") use **Multiply** insted of **addition** to get amount
      > Before, each item add their own fraction to result amount.  
      > Now, all "values" of inputs would be multiplied with each other.  
      > This makes recipe harder to automate, but easier to make more Garbage manually

  - ### 💼 **Actually Additions**: Buff ![](https://git.io/JXrXR "Worm") lifetime x10

  - ### 🔨 **Tinker's Construct**: Extend melting ignore list (More items could be melted)

  - ### 🧻 **JEI**: Add spectre blocks in **Spectre** dimension

  - ### 🏝️ **Void Island Control**: Disable island protection
      > Now player can travel far from spawn



## 🔄 **Misc Changes**
  - ### 📖 **Quest Book**
    - Quests updates
    - Lootboxes: ![](https://git.io/JRLSO "Neutron Collector") remove from loot
    - Osgloglas crafting - fix description (fix #14)






# v0.38


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/200/673/256/256/636914940710758684.png" width="50"> | 🟧 [**Village Names**](https://www.curseforge.com/minecraft/mc-mods/village-names) <sup><sub>VillageNames-1.12.2-4.3.7.jar</sub></sup> <br> Generate names for villages and villagers, as well as for other entities and structures. | Would make villages even richer.
<img src="https://media.forgecdn.net/avatars/thumbnails/254/124/256/256/637197335439078686.png" width="50"> | 🟫 [**ModDirector**](https://www.curseforge.com/minecraft/mc-mods/moddirector) <sup><sub>mod-director-launchwrapper-1.5-SNAPSHOT-all.jar</sub></sup> <br> A mod to automatically download and load other mods before starting | Would be used later to download default configs and non-curseforge mods.

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/304/710/256/256/637378126956149226.png" width="50"> | 🟫 [**Ears**](https://www.curseforge.com/minecraft/mc-mods/ears) <sup><sub>ears-forge-1.12-1.2.4.jar</sub></sup> <br> Faithful fancy fashion features for fuzzy folk. 1.2 - 1.18 Forge/Fabric/Rift + more. | Its happens that ears actually not working. Also this mod more for local groups.

## 🟡 Updated Mods

- **CraftTweaker**
- **Atlas Lib**
- **LootTweaker**
- **Carry On**
- **LibNine**
- **Immersive Technology**
- **LibVulpes**
- **LittleTiles**
- **Dynamic Surroundings**
- **Discord Integration Forge**
- **JAOPCA**


## [> Mods updates detailed.](changelogs/CHANGELOG_MODS_v0.38.md)


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://git.io/JoUaT "Small Plate Presser") add many sticks and buff plates recipes
    - ![](https://git.io/JP6gc "Lormyte Stone") in ![](https://git.io/JP6zp "Stone Barrel")
    - ![](https://git.io/JPiDe "Crystallized Obsidian Bucket") from ![](https://git.io/JLhhc "Menril Resin")
    - Many recipes changes for this machines: ![](https://git.io/JP6zb "Dehydrator")![](https://git.io/JP6zF "Solidifier")![](https://git.io/JtTPL "Hydrator")![](https://git.io/Jsw8b "Packager")
    - ![](https://git.io/JP6gl "Enriched Lava") now can be separated into many liquids in ![](https://git.io/JPiDf "Essentia Centrifuge"):
      > ![](https://git.io/JP6gI "Molten Thaumium")
      > ![](https://git.io/JP6gV "Molten Manasteel")
      > ![](https://git.io/JP6gv "Fluidic Sentience")
      > ![](https://git.io/JP6gG "Molten Bound Metal")
      > ![](https://git.io/JP6zM "Molten Livingrock")
      > ![](https://git.io/JP6zh "Molten Terrasteel")
      > ![](https://git.io/Jgexo "Flux Goo")
    - ![](https://git.io/Jz0VC "Hellbark Leaves")
      ![](https://git.io/JmVve "Carbon Brick")

  - ### ✐ **Cheaper**
    - ![](https://git.io/JuAiu "Prismarine") now outputs x10 times more resources in ![](https://git.io/JOv90 "Sieve")
    - ![](https://git.io/Jsw8h "Draconium Chest")
      ![](https://git.io/JP6zQ "Resonant Rice")
      ![](https://git.io/Jz844 "Void Charm")
      ![](https://git.io/JPiDv "Crystallized Amber")
      ![](https://git.io/JP6zD "Crystallized Obsidian")
      ![](https://git.io/JP6KP "Superlubricent Ice")
      ![](https://git.io/JmVvt "Omnivoir")
      ![](https://git.io/JOGu6 "Endervoir")
      ![](https://git.io/JuAit "Endorium Nugget")
      ![](https://git.io/JP6g3 "Steeleaf Seeds")
      ![](https://git.io/JPiDI "Player Interface")
      ![](https://git.io/JP6go "Escape Rope")
      ![](https://git.io/JP6gt "Crystal Matrix Ingot")
      ![](https://git.io/JcbNq "Orechid")
      ![](https://git.io/JuAMM "Orechid Ignem")
      ![](https://git.io/JP6gB "Orechid Vacuam")
      ![](https://git.io/JPiDJ "Redstone Clock")
      ![](https://git.io/JP6z5 "Sword of Atrophy")
      ![](https://git.io/JP6gL "Sword of Decay")
      ![](https://git.io/JP6gU "Sword of Evasion")
      ![](https://git.io/JZYfT "Organic Brown Dye")
      ![](https://git.io/JPi1x "Blast resistant ME Drive")

  - ### ✎ **Harder**
    - ![](https://git.io/JuAit "Endorium Nugget")
      ![](https://git.io/JP6zP "Stone Pebble")
      ![](https://git.io/J6y7I "Apple Sprout")
      ![](https://git.io/JP6gr "Lapis Apple")
      ![](https://git.io/JP6gq "Infected Carrot")
      ![](https://git.io/JtkwT "Auto Anvil")
      ![](https://git.io/JP6zd "XP Shower")
      ![](https://git.io/JP6zx "Apple of Lofty Stature")
      ![](https://git.io/JoFu0 "Storage Control Screen Module")
      ![](https://git.io/JP6zx "Apple of Lofty Stature")
      ![](https://git.io/JqUJQ "Monster Ball")
      ![](https://git.io/JP6gz "Frost Bringer")
      ![](https://git.io/JP6g2 "Duskflame Hex")
      ![](https://git.io/Jt8DE "Battery")
      ![](https://git.io/JP6zj "Fluid Storage Tank")

  - ### ✏ **Misc Changes**
    - Fix ![](https://git.io/JGGjU "Electric Arc Furnace") steel recipe (was wrong steel)
    - ![](https://git.io/JgeGN "Ferrous-Juniper Log") now can be melted in more machines
    - ![](https://git.io/JP6ga "Heavy Mix Lump") also can be made from ![](https://git.io/JOGgk "Propolis")
    - ![](https://git.io/J6yQx "Weather Egg <Rain>") alt from ![](https://git.io/JP6oY "Iceball")
    - ![](https://git.io/JP6z9 "Block of Sticks") nerf burn time
    - ![](https://git.io/JP6gK "Evil Tear") Alternative recipe
    - [Ratlanean Flame] Alt recipe
    - ![](https://git.io/JqUJb "Simple Powercell") not require ![](https://git.io/JZYf8 "Glowing Chorus Fruit") anymore
    - ![](https://git.io/JuAPL "Elytra") durability buffet 432 -> 1200
    - Pebbles from ExNihilo now can be mixed together to save rare pebbles
    - ![](https://git.io/JOPvF "Glowcelium") add recycle
    - ![](https://git.io/Jgexa "Rat Upgrade: Gemcutter") cant make coins anymore
    - ![](https://git.io/JuAPL "Elytra") not used in jetpacks recipes anymore
    - ![](https://git.io/JoFug "Grinder")![](https://git.io/JoFuE "Presser") less microcraftings
    - ![](https://git.io/JP6gY "Fusion Crafting Core") remove all ET materials except Aethium
    - ![](https://git.io/JP6oT "Pipette") added clearing
    - ![](https://git.io/JcbNq "Orechid") now can produce only ~8 ores
    - ![](https://git.io/JP6gO "Perfect Fuel") in ![](https://git.io/JRLSt "Fusion Core") produce ![](https://git.io/Jgexo "Flux Goo") and ![](https://git.io/JP6g0 "Antimatter")
    - Added recipes for all ![](https://git.io/JPiDU "Molten Gelid Enderium Bucket") tools and armor
    - ![](https://git.io/JP6ge "Extraterrestrial Matter") drops from Chronologist
    - Other craft changes:
      ![](https://git.io/JP6zb "Dehydrator")
      ![](https://git.io/JqUJN "Forester")
      ![](https://git.io/JP6gk "Automatic Fishing Net")
      ![](https://git.io/JP6gg "Antimatter Evaporator")
      ![](https://git.io/JP6zH "Water Spreader")
      ![](https://git.io/JtTPL "Hydrator")
      ![](https://git.io/JPiMe "Fan")
      ![](https://git.io/JP6zX "Standard Exchange Scepter")
      ![](https://git.io/JP6gf "Gentle Exchange Scepter")
      ![](https://git.io/JtJH6 "Rod of Elevation")
      ![](https://git.io/JPi1h "Enchanter")
      ![](https://git.io/J3xyA "Magma Anvil")
      ![](https://git.io/JP6zy "Ender Wing Prime")
      ![](https://git.io/JP6g4 "Ender Wing")
      ![](https://git.io/JOGra "Climbing Gloves")
      ![](https://git.io/JP6zA "Powered Diamond Anvil")
      ![](https://git.io/JRLyy "Solid Ender Eye")
      ![](https://git.io/JP6z7 "Chaos Reaper")
      ![](https://git.io/J3xyj "Speed Charm")
      ![](https://git.io/JP6gR "Auto Crafter")
      ![](https://git.io/JPi1p "Sprinkler")
      ![](https://git.io/Jsw8b "Packager")
      ![](https://git.io/JP6gn "Fire Starter")
      ![](https://git.io/JPi1j "Structure Builder")
      ![](https://git.io/JP6gm "Controlled Miner")
      ![](https://git.io/JP6gE "Harvester")
      ![](https://git.io/JP6gJ "Engraved Thunder")
      ![](https://git.io/Jsmvj "Water Candle")
      ![](https://git.io/JP6gu "Ranged Building Scepter")
      ![](https://git.io/J6y7m "Item Collector")
      ![](https://git.io/JP6zF "Solidifier")
      ![](https://git.io/JP6gW "Automated User")
      ![](https://git.io/JOGzg "Air Charm")
      ![](https://git.io/JP6gZ "Pharos Beacon")
      ![](https://git.io/JP6gs "Pattern Replicator")
      ![](https://git.io/JPiDk "Inventory Upgrade")



## 🔵 **Mods**
  - ### 🏪 **Requious Fracto**
    - ![](https://git.io/JP6gT "Liquid Starlight") more interactions added to JEI
    - JEI for **Expire In Block**

  - ### 🐝 **Forestry**: Speedup bees x2 (400 => 200 ticks per cycle)

  - ### 🔨 **Tinker's Construct**: Slightly buff ![](https://git.io/JP6g6 "Heavy Ingot")

  - ### 🛢️ **Immersive Engineering**
    - Buff Steel Tank to 20,000 buckets
    - Buff internal fluid storage of most machines
    - Buff x5
    - x6 times all ![](https://git.io/JPiDT "Steam") consumption/production
    - Buff x10 times fuels for boiler



## 🔄 **Misc Changes**
  - Change starting inventory for Skyblock mode to ![](https://git.io/JP6gw "Flint and Steel") instead of ![](https://git.io/JP6gC "Lava Clay Bucket")
  - Enable ![](https://git.io/JP6zS "Uncrafting Table") uncrafting ability (table itself still unavaliable)
  - Add all modded saplings to **Twerk** mechanics
  - Nerf Cyclic's swords damage and durability
  - ![](https://git.io/JP6z1 "Sword of the Zephyr") buff damage
  - **Chronologist** forbid in spawners
  - More carryon blacklist
  - Cyclic Machines using more RF/T
  - ### 📖 **Quest Book**: Quests changes, New **Utils** chapter






# v0.37


## 🟡 Updated Mods

- [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) <sup><sub>zenutils-1.9.5.jar</sub></sup>
- [**Chunk-Pregenerator**](https://www.curseforge.com/minecraft/mc-mods/chunkpregenerator) <sup><sub>Chunk Pregenerator-V1.12-2.5.1.jar</sub></sup>
- [**Hammer Lib**](https://www.curseforge.com/minecraft/mc-mods/hammer-lib) <sup><sub>HammerLib-1.12.2-2.0.6.31.jar</sub></sup>
- [**Animus**](https://www.curseforge.com/minecraft/mc-mods/animus) <sup><sub>Animus-1.12-2.1.8.jar</sub></sup>
- [**Immersive Technology**](https://www.curseforge.com/minecraft/mc-mods/mct-immersive-technology) <sup><sub>MCTImmersiveTechnology-1.12.2-1.9.97.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.31_mc1.12.2.jar</sub></sup>
- [**Let Me Sleep**](https://www.curseforge.com/minecraft/mc-mods/let-me-sleep) <sup><sub>LetMeSleep-v1.2.3-1.12.2.jar</sub></sup>
- [**JAOPCA**](https://www.curseforge.com/minecraft/mc-mods/jaopca) <sup><sub>undefined</sub></sup>


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - ![](https://git.io/Jw3xg "Titanium Ingot") in ![](https://git.io/JGGjU "Electric Arc Furnace")
    - ![](https://git.io/J6y78 "Slop") in ![](https://git.io/J3hVE "Wooden Barrel")
    - ![](https://git.io/J6y7f "Biome Marker") for Hell, End, Ratlantis
    - ![](https://git.io/J6y7n "Molten Heavy Metal Tank") casting
    - ![](https://git.io/J6y70 "Green Slimy Grass")![](https://git.io/J6y7G "Blue Slimy Grass")![](https://git.io/JzX6Q "Purple Slimy Grass")![](https://git.io/J6y7L "Magma Slimy Grass")
    - ![](https://git.io/J6y7Y "Healer")
      ![](https://git.io/J6y7r "Backpack")
      ![](https://git.io/J6y7R "Summoning Pendulum")
      ![](https://git.io/J6yQN "Spectre Coil Nr. 450")
      ![](https://git.io/J6y7v "Pitcher Plant")
      ![](https://git.io/J6y7g "Wildberry Bush")
      ![](https://git.io/J6yQj "Hamster")
      ![](https://git.io/J6yQF "Constellation Paper")

  - ### ✐ **Cheaper**
    - ![](https://git.io/Jz0VY "Lava") from [Hellbark]
    - ![](https://git.io/J6y7l "Maim Trap")
      ![](https://git.io/J6y7a "Iron Rod")
      ![](https://git.io/JOGzF "Time in a bottle")
      ![](https://git.io/J6y73 "Spectre Key")
      ![](https://git.io/J6yQh "Fertilized Dirt")
      ![](https://git.io/J6y7s "Weather Egg <Sun>")![](https://git.io/J6yQx "Weather Egg <Rain>")![](https://git.io/J6y7C "Weather Egg <Storm>")
      ![](https://git.io/Jn5Z2 "Spectre String")
      ![](https://git.io/J6y7c "Spectre Lens")
      ![](https://git.io/J6y74 "Spectre Energy Injector")
      ![](https://git.io/J6y7T "Stable Ender Pearl")
      ![](https://git.io/J6y7m "Item Collector")
      ![](https://git.io/J6y7E "Rain Shield")
      ![](https://git.io/J6y7o "Igniter")
      ![](https://git.io/J6y7u "Liquid Barrel")
      ![](https://git.io/J6y72 "Ice Bomb")
      ![](https://git.io/J6y7z "Traveller's Knapsack")

  - ### ✎ **Harder**
    - ![](https://git.io/J6y7V "XP Drain")
      ![](https://git.io/JzVq3 "Slime Cube")
      ![](https://git.io/J6y7I "Apple Sprout")
      ![](https://git.io/JcbbK "Fertilized Essence")

  - ### ✏ **Misc Changes**
    - New util item: [Any Different Item]
    - **Vex** now drops ![](https://git.io/JGGhx "Overworldian Matter")
    - **Vex** Cant be spawned with ![](https://git.io/J3xyN "Spawner Changer") and ![](https://git.io/JuAii "Mob Duplicator")
    - ![](https://git.io/J6y7w "Player Trap") can be crafted from ![](https://git.io/JtIrt "Rat Diamond")
    - ![](https://git.io/JoUaT "Small Plate Presser") only output thrid extra in tiny amounts
    - ![](https://git.io/J6yQA "Compressed Crushed Andesite") and ![](https://git.io/J6yQb "Compressed Crushed Diorite") fix hammering
    - Unhide vanilla armor, make default durability, but remove crafts
    - ![](https://git.io/J6yQd "Climograph Base Unit") from rat diamond
    - ![](https://git.io/Jgexa "Rat Upgrade: Gemcutter") now output AA Crystal Clusters instead of gems
    - Rat Ore Nuggets cant be put in ![](https://git.io/JOGz2 "Pulverizer (Basic)") anymore
    - ![](https://git.io/JcbNm "Phyto-Gro") add to `ore:fertilizer`
    - ![](https://git.io/J6y7k "Menril Berries") added to `ore:listAllberry`
    - ![](https://git.io/J6y7t "Grape Seeds") added to `ore:listAllseed`



## 🔵 **Mods**

  - ### ☢️ **NuclearCraft**: Move Radiation hud to right bottom

  - ### 🐝 **Forestry**: ![](https://git.io/J6y7J "Building Backpack") add **Sonar Core** blocks

  - ### 📑 **Tips**: for items:
      > - Most Open Blocks Trophy
      > - ![](https://git.io/J6y7U "Fusewood Shard")![](https://git.io/J6y7W "Darkwood Shard")![](https://git.io/J6y7e "Bloodwood Shard")![](https://git.io/J6y7O "Ghostwood Shard")

  - ### 🔨 **Tinker's Construct**
    - ![](https://git.io/J6yQp "Fiery Ingot") buff mining level to `9`
    - ![](https://git.io/J6y7Z "Cheese") nerf durability to `-400`
    - **Grinding** trait rework (WIP)

  - ### 🧻 **JEI**
    - Add ![](https://git.io/J6y7B "Luggage")
    - blacklist updates
    - Remove Slime Islands mentions from **Emptiness**



## 🔄 **Misc Changes**

  - Typo Fixes and New Mod Changes (#13)
    > - Push Player Out Of Blocks
    > - Replenish Air Slowly
    > - Disable spawn a monster and wake player when sleeping in an insufficiently lit area
    > - Tooltips and tips typo fixes

  - ### ⛏️ **Mining**: Lower Hardness for Amber, Cinnabar and Charged Quartz ores






# v0.36


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/326/306/256/256/637446119467182217.png" width="50"> | 🟩 [**Aqua Acrobatics**](https://www.curseforge.com/minecraft/mc-mods/aqua-acrobatics) <sup><sub>AquaAcrobatics-v1.3.5-1.12.2.jar</sub></sup> <br> Fancy swimming, elegant sneaking: modern movement without compromises in 1.12. | Better than **Idō**
<img src="https://media.forgecdn.net/avatars/thumbnails/151/327/256/256/636603225300587402.png" width="50"> | 🟩 [**VanillaFix**](https://www.curseforge.com/minecraft/mc-mods/vanillafix) <sup><sub>VanillaFix-1.0.10-150.jar</sub></sup> <br> Keep playing after a crash, Increase your FPS by up to 3x | Performance mod
<img src="https://media.forgecdn.net/avatars/thumbnails/203/29/256/256/636930071936544657_animated.gif" width="50"> | 🟨 [**Gambling Style**](https://www.curseforge.com/minecraft/mc-mods/gambling-style) <sup><sub>GamblingStyle-v1.1.2-1.12.2.jar</sub></sup> <br> Overhauled villager trading gui for far better usability and a lot of convenient extras. | QOL addon
<img src="https://media.forgecdn.net/avatars/thumbnails/205/55/256/256/636945344962892592.png" width="50"> | 🟨 [**Let Me Sleep**](https://www.curseforge.com/minecraft/mc-mods/let-me-sleep) <sup><sub>LetMeSleep-v1.2.2-1.12.2.jar</sub></sup> <br> Bad dreams? Configure your sleeping experience to your desires.| Better than **Just Sleep**

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/179/172/256/256/636784045568071942.png" width="50"> | 🟫 [**Just Sleep**](https://www.curseforge.com/minecraft/mc-mods/just-sleep) <sup><sub>JustSleep-1.0.0.1.jar</sub></sup> <br> Just sleep allows you to sleep in other beds without setting your spawn location. | Replaced by **Let Me Sleep**
<img src="https://media.forgecdn.net/avatars/thumbnails/132/883/256/256/636478921997010608.jpeg" width="50"> | 🟫 [**Bed Patch**](https://www.curseforge.com/minecraft/mc-mods/bed-patch) <sup><sub>bedpatch-2.2-1.12.2.jar</sub></sup> <br> A small mod that fixes the vanilla "stuck in bed" bug | Replaced by **Let Me Sleep**
<img src="https://media.forgecdn.net/avatars/thumbnails/214/845/256/256/636994435717300712.png" width="50"> | 🟫 [**Idō**](https://www.curseforge.com/minecraft/mc-mods/ido) <sup><sub>ido-1.12.2-2.0.0-B.jar</sub></sup> <br> Brings 1.13 and 1.14 movement like swimming and crawling into 1.12.2 | Replaced by **Aqua Acrobatics**
<img src="https://media.forgecdn.net/avatars/thumbnails/54/911/256/256/636139469480553122.png" width="50"> | 🟫 [**Reborn Core**](https://www.curseforge.com/minecraft/mc-mods/reborncore) <sup><sub>RebornCore-1.12.2-3.19.5-universal.jar</sub></sup> <br> Powering Team Reborn | Lib for **Bed Patch**

## 🟡 Updated Mods

- [**Advanced Rocketry**](https://www.curseforge.com/minecraft/mc-mods/advanced-rocketry) <sup><sub>AdvancedRocketry-1.12.2-2.0.0-256-universal.jar</sub></sup>
- [**JAOPCA**](https://www.curseforge.com/minecraft/mc-mods/jaopca) <sup><sub>JAOPCA-1.12.2-2.2.8.106.jar</sub></sup>

## ✏️ **Recipes**
  - ### ✏ **Misc Changes**: ![](https://git.io/JoUaT "Small Plate Presser") Now crush ore and output 2 extra tiny dusts
    >   For example: ![](https://git.io/JKYuF "Amber Ore") ->
    >   1x![](https://git.io/JKYub "Amber Dust") + 6x![](https://git.io/JKYu5 "Tiny Pile of Iron Dust") + 1x![](https://git.io/JKYud "Tiny Pile of Aquamarine Dust")

## 🔵 **Mods**
  - ### ⬛ **Bedrock Ore**: enable `uiOnlyWhenSneaking` config

## 🔄 **Misc Changes**
  - Clear negative potions after sleep
  - Heal 2 hearts after sleep
  - ### 📖 **Quest Book**: Quests changes
  - ### 📑 **Tooltips**: for ![](https://git.io/JsmfJ "Syringe")






# v0.35


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/33/253/256/256/635892752942054834.png" width="50"> | 🟫 [**Default World Generator (port)**](https://www.curseforge.com/minecraft/mc-mods/default-world-generator-port) <sup><sub>DefaultWorldGenerator-port-1.12-2.3.jar</sub></sup> <br> Change the Default World Generator for both clients and servers! | Would fix issue that Void world generated as default

## 🟡 Updated Mods

- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.662.jar</sub></sup>  
- [**Modular Controller**](https://www.curseforge.com/minecraft/mc-mods/modular-controller) <sup><sub>ModularController-1.1.4.jar</sub></sup>  
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.28_mc1.12.2.jar</sub></sup>  


## ✏️ **Recipes**
  - ### 🖉 **New Recipes**
    - [Mob Spawner]
    - ![](https://git.io/JoPgx "Mazestone")
      ![](https://git.io/JoP2e "Infested Towerwood")
      ![](https://git.io/JoP2m "Raw Turkey")
      ![](https://git.io/JoFuW "Celestial Crystal Shard")
      ![](https://git.io/JoFuR "Redstone Ore")
    - ![](https://git.io/JoP2O "Naga Spawner")
      ![](https://git.io/JoP2Y "Lich Spawner")
      ![](https://git.io/JoP2J "Alpha Yeti Spawner")
      ![](https://git.io/JoP2v "Knight Phantoms Spawner")
      ![](https://git.io/JoP2T "Minoshroom Spawner")
      ![](https://git.io/JoP23 "Hydra Spawner")
      ![](https://git.io/JoPgb "Ur-Ghast Spawner")
      ![](https://git.io/JoPgp "Snow Queen Spawner")

  - ### ✐ **Cheaper**
    - ![](https://git.io/JuAiz "End Steel Ingot")
      ![](https://git.io/JoPg7 "Solar Panel")
      ![](https://git.io/JoFug "Grinder")
      ![](https://git.io/JoFuE "Presser")
      ![](https://git.io/JoFuB "Water Filter")
      ![](https://git.io/JtJFs "Storage Upgrade (III)")

  - ### ✎ **Harder**
    - ![](https://git.io/JoFuu "Unbreakable Wand")
      ![](https://git.io/JoFu0 "Storage Control Screen Module")

  - ### ✏ **Misc Changes**
    - ![](https://git.io/JmV4Y "Spectre Ingot") made in crafting table instead of alloying
    - ![](https://git.io/JoPgH "Lunar Reactive Dust")![](https://git.io/JoP2s "Liveroots") add rat alternative craft
    - ![](https://git.io/JoPgA "Peace Candle") remove craft
    - ![](https://git.io/Jgexl "Gold Ingot") actually increase drop rate from pigman
    - ![](https://git.io/JzX6Q "Purple Slimy Grass") Remove excess recipe (one added with TCon itself)
    - ![](https://git.io/JoFu8 "Base Addon") fix unreplicable
    - ![](https://git.io/JOGzx "Fluid Transposer (Basic)") fix new recipes was hidden in JEI
    - ![](https://git.io/JoFuC "Evil Infused Iron Ingot") now have alt in Dragon Forge
    - ![](https://git.io/JoFul "Lingering Potion of Wings") fix all **Potion Core** crafts (now craftable)
    - [Knowledge Absorber] add Unbreaking enchant affect craft
    - ![](https://git.io/J3hV0 "Crushing Block") excluded from benefication (cant process ![](https://git.io/JoFu4 "Dirty Iron") for example)
    - ![](https://git.io/JoFuc "Quartz Grindstone") fix extra output (was second extra, now first extra)
    - ![](https://git.io/JnN1J "SAG Mill") fix any dirty ore ![](https://git.io/JoFu4 "Dirty Iron") thrid extra output



## 🔵 **Mods**

  - ### ⚙️ **JAOPCA**: Rework all extra outputs
      > Now machines that able to provide byproducts would output many
      > different materials.  
      > [Full list in this Gist](https://gist.github.com/Krutoy242/d19065d619acbfbba08140675ab0632b)

  - ### 🎲 **Random Things**: Disable ![](https://git.io/JoPgA "Peace Candle") gen (item not actually working)

  - ### 🐀 **Rats**
    - Higher Rat Dig Strength up to 20 (was 4)
    - Fix untamed named rats despawning

  - ### 📑 **Tips**: for some items
      > ![](https://git.io/JtkK3 "Traveler's Backpack")![](https://git.io/JmV4s "Silver Ore")![](https://git.io/Jz9q2 "Transformation Powder")

  - ### 🔨 **Tinker's Construct**: Recycle rework, fix crash

  - ### 🧻 **JEI**
    - Add ![](https://git.io/JoPgj "Liveroot") to JER
    - Add [Quickdry Concrete] to jei list
    - Add tag ![](https://git.io/JoPg7 "Solar Panel") to **##Solar** tag
    - Add ![](https://git.io/JtDnO "Chemical Thrower") category
    - Add block drops for ![](https://git.io/Jz9qy "Bean Pod") and [Monster Spawner]

  - ### 🙋‍♀️ **Quark**: Blacklist all Mekanism's Tile Entities to move with piston

  - ### 🍗 **Scaling Feast**: Fix wrong placement of hunger stat numbers, fixes #10



## 🔄 **Misc Changes**
  - Lower to 1-5-10 max durability of vanilla armor
  - ### 📖 **Quest Book**: Add ![](https://git.io/JoP2L "Common Treasure")![](https://git.io/JoP2U "Uncommon Treasure")![](https://git.io/JoP2t "Rare Treasure") in loot chests






# v0.34.1

## ✏️ Recipes


**New Recipes:**
- ![](https://git.io/JgKYr "Dried Sand")![](https://git.io/JsfOp "White Sand")![](https://git.io/JgKYo "Purpur Shards")

**Cheaper:**
- ![](https://git.io/JgKYK "BatBox")![](https://git.io/JuAPL "Elytra")

**Misc Changes:**
- Fix some **Immersive Engineering** items was uncraftable
- Removing redundant items code was rewritten - accidentally recipes for
non-exist items could appear.

## 🔵 Mods


- ### 🍇 End Reborn

  - Disable Purpur Guards
    > They are too annoying for their shooting range.

- ### 🐀 Rats

  - Fix ratlantis mobs has 0 hp

## 🔄 Misc Changes

- 
  > - Disable "No Team" notifications
  > - Disables player damage when they are stuck in walls to prevent
  > random dying when long world load in Multiplayer






# v0.34

## 🟡 Updated Mods

- [**ME Capability Adapter**](https://www.curseforge.com/minecraft/mc-mods/capability-adapter) <sup><sub>capabilityadapter-1.1.3.jar</sub></sup>
- [**Ender Tweaker**](https://www.curseforge.com/minecraft/mc-mods/endertweaker) <sup><sub>EnderTweaker-1.12.2-1.2.3.jar</sub></sup>
- [**CreativeCore**](https://www.curseforge.com/minecraft/mc-mods/creativecore) <sup><sub>CreativeCore_v1.10.65_mc1.12.2.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.27_mc1.12.2.jar</sub></sup>

## 📖 Quest Book

- Quests changes and updates

## ✏️ Recipes


**New recipes:**
- ![](https://git.io/JzX6Q "Purple Slimy Grass")![](https://git.io/JzX69 "Blue Slime Sapling")![](https://git.io/JzX6d "Purple Slime Sapling")
- [Knowledge Absorber] (new item) combined with different books gives different Ores
- ![](https://git.io/JuAPf "Treated Wood Planks") in ![](https://git.io/JmVeA "Fluid Tank")
- ![](https://git.io/Jz9q2 "Transformation Powder") & ![](https://git.io/Jz9qa "Torchberry Plant") by crooking
- ![](https://git.io/Jn5Zz "Cinderpearl")
  ![](https://git.io/Jz0Vs "Certus Quartz Nugget")
  ![](https://git.io/Jz0aA "Copper Ore Piece")
  ![](https://git.io/Jz0aQ "Arid Garden")![](https://git.io/Jz0VZ "Frost Garden")![](https://git.io/Jz0a7 "Shaded Garden")![](https://git.io/Jz0ad "Windy Garden")![](https://git.io/Jz0Vq "Soggy Garden")![](https://git.io/Jz0V8 "Garden Soup")![](https://git.io/Jz0a5 "Tropical Garden")
  ![](https://git.io/Jz0Vl "Marble")
  ![](https://git.io/Jz0ah "Luminous Crafting Table")
  ![](https://git.io/Jz0VL "Fresh Water")
  ![](https://git.io/JuAPe "Essence Ore")
  ![](https://git.io/JzVqs "Ferrous-Juniper Sapling")
  ![](https://git.io/JzVqT "Spawn Stymphalian Bird")![](https://git.io/JgexX "Random Peacock")
  ![](https://git.io/Jgexc "Random Rabbit")
  ![](https://git.io/Jgexu "Random Cow")
  ![](https://git.io/Jgexg "Random Pig")
  ![](https://git.io/JgexK "Random Chicken")
  ![](https://git.io/JgexC "Random Goat")
  ![](https://git.io/JgexE "Random Sheep")
  ![](https://git.io/Jz9qo "Faint Amaranth")
  ![](https://git.io/Jgex4 "Blood Wood")
  ![](https://git.io/JcbN2 "Dreadwood Log")
  ![](https://git.io/Jgexw "Raw Marbled Cheese")

**Cheaper:**
- ![](https://git.io/Jz0VI "Stone Wand")
  ![](https://git.io/Jz0VT "Iron Wand")
  ![](https://git.io/Jz0Vc "Emerald Apple")
  ![](https://git.io/JtNTX "Flopper")
  ![](https://git.io/Jz0Vm "Moonworm")
  ![](https://git.io/Jz0Vt "Empty Rod")
  ![](https://git.io/JOGg3 "Bituminous Peat")
  ![](https://git.io/JzVqm "Inferium Watering Can")![](https://git.io/JzVqY "Prudentium Watering Can")![](https://git.io/JzVqq "Intermedium Watering Can")![](https://git.io/JzVqU "Superium Watering Can")![](https://git.io/JzVqt "Supremium Watering Can")
  ![](https://git.io/JzVqk "Precious Emerald")
  ![](https://git.io/JzVq3 "Slime Cube")
  ![](https://git.io/JtJvV "Nature Core")
  ![](https://git.io/JtJFW "Rat Upgrade: Aristoc-Rat")
  ![](https://git.io/JCuh5 "Empowered Phosphor")
  ![](https://git.io/JqUJN "Forester")
  ![](https://git.io/Jgexz "Ender Orb")
  ![](https://git.io/Jgex8 "Ender Orb Translocator")
  ![](https://git.io/J03tf "Wyvern Core")
  ![](https://git.io/JgexW "Draconic Energy Core")
  ![](https://git.io/Jz9qD "End Seeds")
  ![](https://git.io/JgexZ "Elevator")
  ![](https://git.io/Jz9qM "Rat Cage")
  ![](https://git.io/JgexR "Rat Breeding Lantern")
  ![](https://git.io/Jsmfs "Heart Dust")
  ![](https://git.io/JtNTD "V.I.E.W. X (Vaultopic Inventory Explorer Workbot eXtended)")
  ![](https://git.io/JgexG "Mysterious Token Fragment")![](https://git.io/Jgexr "Mysterious Token Chunk")![](https://git.io/Jgexn "Chunky Cheese Token")
  ![](https://git.io/JtkK3 "Traveler's Backpack")
  
**Harder:**
  - ![](https://git.io/Jz0VO "Red Sand")
    ![](https://git.io/Jz0VU "Shipping Bin")

**Misc Changes:**
- ![](https://git.io/Jz0VY "Lava") from ![](https://git.io/Jz0aj "Hellbark Wood")
- ![](https://git.io/Jz0aF "Soot-covered Redstone") can be washed
- ![](https://git.io/JLjc2 "Dirt") in ![](https://git.io/J3hVE "Wooden Barrel") reworked
- ![](https://git.io/JzVqI "Crushed Endstone")![](https://git.io/JsfOp "White Sand") more output in ![](https://git.io/JOv90 "Sieve")
- ![](https://git.io/JzVqO "Garbage Pile") Added cool recipe and then can be siften in ![](https://git.io/JOv90 "Sieve")
- ![](https://git.io/JLjc2 "Dirt") cheaper in ![](https://git.io/J3hVE "Wooden Barrel")
- ![](https://git.io/JzVqL "Iron Ore Piece") add craft in ![](https://git.io/JsegO "Drying Basin")
- This items could be melted into ![](https://git.io/JzqUd "Molten Iron"):  
  > ![](https://git.io/JgeGF "Ferrous-Juniper Log")
  > ![](https://git.io/JgeGN "Ferrous-Juniper Log")
  > ![](https://git.io/JgeGb "Ferrous-Juniper Planks")
  > ![](https://git.io/JgeGd "Raw Ferrous-Juniper Planks")
- ![](https://git.io/JzX6D "Canola Oil") and ![](https://git.io/JzX6H "Creosote") give less burn time in Smeltery
- ![](https://git.io/JzX6y "Blazing Pyrotheum Tank")![](https://git.io/JzX65 "Gelid Cryotheum Tank")![](https://git.io/JzX6F "Zephyrean Aerotheum Tank")![](https://git.io/JzX67 "Tectonic Petrotheum Tank") can be melted with ![](https://git.io/JtJfb "Phosphor")
- ![](https://git.io/J3hVE "Wooden Barrel") bit more ingredients for Composting
- ![](https://git.io/Jgex0 "Elementium Axe") return from purged to cut ![](https://git.io/Jgex2 "Gaia Guardian's Head") and melt it
- ![](https://git.io/Jgexl "Gold Ingot") now dropping x20 times more when Zombie Pigman killed by player
- ![](https://git.io/JgexB "Block of Cheese") removed Crafting Table recipe
- ![](https://git.io/Jz9qS "Firefly") can be recycled
- ![](https://git.io/Jgexa "Rat Upgrade: Gemcutter") now can obtain ![](https://git.io/JgexV "Exhausting Nugget") and AA crystals
- ![](https://git.io/JgexM "Stardust")![](https://git.io/Jgex6 "Cobalt Ore Dust") obtainable as byproduct for several ores
- ![](https://git.io/JcNG4 "Combiner") enable and add recipes
- ![](https://git.io/JgexP "Primal Mana") new recipe from ![](https://git.io/Jgexi "Spectre") and ![](https://git.io/Jgexo "Flux Goo")
- **Infernal Furnace** now output secondary extra (was first extra)

## 🔵 Mods

- ### 🐀 Rats

  - Enable rats despawning
    > For some reason in Twilight Forest rats spawned continuously
    > This change should stop it

- ### 🔨 Tinker's Construct

  - EquipGeneration increase performance
    > Instead using `onSpecialSpawn` and `onCheckSpawn` events
    > now using `onEntityJoinWorld` that would increase performance

- ### 🛸 EnderIO

  - Buff ![](https://git.io/Jgex1 "Pressurized Fluid Tank") up to 128 buckets

- ### 🗳️ Colossal Chest

  - Max Size set to `5`

- ### 🍯 Potion Core

  - Temporary disable all recipes
    > Something broke and sometimes brewing output ![](https://git.io/Jz9qK "Potion of Doom") instead of right potion result

### ⛏️ Mining

  - Lower Hardness for some vanilla blocks like ![](https://git.io/JzX6S "Netherrack")






# v0.33

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/51/174/256/256/636100833430881872.png" width="50"> | 🟫 [**Twerk Sim 2K16**](https://www.curseforge.com/minecraft/mc-mods/twerk-sim-2k16) <sup><sub>TS2K16-1.2.10.jar</sub></sup> <br> Work it, twerk it, grow that wood! | Would help for skyblock mode but wouldn't harm for main mode

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/101/718/256/256/636324883919963872.png" width="50"> | 🟫 [**Dimension Stages**](https://www.curseforge.com/minecraft/mc-mods/dimension-stages) <sup><sub>DimensionStages-1.12.2-2.0.23.jar</sub></sup> <br> Allows access to dimensions to be restricted based on stages. | All mod functionality replaced with `𝓩𝒮`


## ✏️ Recipes

- **New recipes:**
  - ![](https://git.io/Jz84B "Bamboo")
    ![](https://git.io/Jz84z "Olive Sapling")
    ![](https://git.io/Jz84R "Beehive")
    ![](https://git.io/Jz848 "Beeswax")
    ![](https://git.io/Jz840 "Bee Nest")
    ![](https://git.io/Jz84E "Vis Crystal")
  
- **Cheaper:**
  - ![](https://git.io/Jz844 "Void Charm")
    ![](https://git.io/JtqT3 "Artificial Hive")

- **Misc Changes:**
  - ![](https://git.io/Jz84l "Void Crystal") fix craft from ![](https://git.io/JtJfN "Coal") -> ![](https://git.io/JtJkX "Black Quartz")
  - ![](https://git.io/Jz84u "Water") from ![](https://git.io/Jz84g "Cactus")

## 🔵 Mods

- ### 🐀 Rats

  - x2 increase rat spawn rate

- ### 👨‍🏭 Mekanism

  - ![](https://git.io/JRLSc "Osmium Ore") Since it based in bedrock, drop it's Hardness to default value







# v0.32

## ✏️ Recipes

- 
  > - Fix melting of ![](https://git.io/JzksM "Crushed Aluminium Ore") and ![](https://git.io/JzksV "Crushed Astral Starmetal Ore")
  > - ![](https://git.io/Jzksg "Tin Wire Relay")![](https://git.io/Jzks0 "Copper Wire Relay")![](https://git.io/JzksE "Gold Wire Relay")![](https://git.io/JzksB "Universal HV Wire Relay")![](https://git.io/Jsmfk "Glass Fiber Wire Relay") output x8 instead of x4

## 📖 Quest Book

- Some Quests changes

## 🌍 World Generation

- ![](https://git.io/JRLSc "Osmium Ore") in bedrock rework
  > * No other ores except Osmium is generated in bedrock
  > * Osmium now appear in **each chunk**
  > * Fix bug where ![](https://git.io/Jzksr "Computer") or ![](https://git.io/Jzks1 "Rotary Condensentrator") was spawn instead of Osmium

## 🔵 Mods


- ### ☢️ NuclearCraft

  - Remove radiation from ![](https://git.io/Jzksz "Uranium Ore")
    > This would remove natural radiation in chunks.  
    > Chunks with ![](https://git.io/JcbNz "Thorium Ore") would still have little radiation through.

- ### 🧻 JEI

  - Add ![](https://git.io/Jzks2 "Geode") to Block Drops

- ### 🛢️ Immersive Engineering

  - Nerf x2 ![](https://git.io/Jzkso "Thermoelectric Generator")
    > Because many liquids temperature was buffed,
    > Thermoelectric Generator got unexpected buff.
    > This change should make it similar to Solars effectiveness

## 🔄 Misc Changes

- Fix player unable to teleport other dimensions





# 0.31

## ✏️ Recipes

- Return accidentally removed ![](https://git.io/JuAPf "Treated Wood Planks") recipe

## 📖 Quest Book

- BetterQuesting: Minor quest description changes

## ⛏️ Mining

- Set to default some custom block's hardness (a.k.a Mining Speed)
  > When ore has several meta- variations,
  > all Ores receive hardness of hardest block.
  > 
  > Now if Ore block have non-standard hardness, all its meta- variations
  > would have smallest hardness value.
  > 
  > Bonus: Sequoia Wood Logs (and several other Forestry's high-tier trees)
  > now have `Axe` tool and mining level of `4`.
  > Also, some Actually Addition's blocks with same Block Definition
  > (`actuallyadditions:block_misc`) now have `hardness = 4`

## 🔵 Mods


- ### ☢️ NuclearCraft

  - ![](https://git.io/JCqVS "Lithium Ion Cell") make stackable back
    > Seems like i was wrong and FE cant be actually duped.

- ### 🔨 Tinker's Construct

  - **Speedy** Modifier now x5 times cheaper
    > **Speedy** Modifier uses ![](https://git.io/Jsmfs "Heart Dust") and its not so easy to earn.
    >
    > Now you need only 10 dust to reach 1 level.

- ### 🍗 Scaling Feast

  - Remap Hunger bonuses milestones.
    > Starting at 20, for every `10 + 5n` new food you get **+2 shanks**.
    > 
    > `n` increments every `n` milestones. First 5 milestones: `20, 35, 50, 70, 90`.
  - Replace Ore generation with CofhWorld
    > [Exhausting Ore] now rare




# 0.30

**IMPORTANT!**  
In this version default world type is **VOID**.  
Manually change to **Biomes O Plenty** in new world options.


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/266/967/256/256/637234263329276851.png" width="50"> | 🟫 [**Game Stages Viewer**](https://www.curseforge.com/minecraft/mc-mods/game-stages-viewer) <sup><sub>gamestagesviewer-1.0.jar</sub></sup> <br> Visualize the your stages of the Game Stages | Help player find all received mob armor stages
<img src="https://media.forgecdn.net/avatars/thumbnails/108/684/256/256/636374315485450120.png" width="50"> | 🟨 [**U Team Core**](https://www.curseforge.com/minecraft/mc-mods/u-team-core) <sup><sub>u_team_core-1.12.2-2.2.5.147.jar</sub></sup> <br> This libary contains many usefull modding stuff | Lib
<img src="https://media.forgecdn.net/avatars/thumbnails/101/718/256/256/636324883919963872.png" width="50"> | 🟩 [**Dimension Stages**](https://www.curseforge.com/minecraft/mc-mods/dimension-stages) <sup><sub>DimensionStages-1.12.2-2.0.23.jar</sub></sup> <br> Allows access to dimensions to be restricted based on stages. | Forbid Visiting Nether unless you get 40 hp
<img src="https://media.forgecdn.net/avatars/thumbnails/394/880/256/256/637592369221037365.png" width="50"> | 🟫 [**AE Additions - ExtraCells2 Fork**](https://www.curseforge.com/minecraft/mc-mods/ae-additions-extra-cells-2-fork) <sup><sub>AEAdditions-1.12.2-1.3.1.jar</sub></sup> <br> An Updated Extra Cells 2 fork with bug fixes, improvements and new things | Updated mod
<img src="https://media.forgecdn.net/avatars/thumbnails/158/41/256/256/636649849318027366.png" width="50"> | 🟩 [**JustEnoughIDs**](https://www.curseforge.com/minecraft/mc-mods/jeid) <sup><sub>JustEnoughIDs-1.0.3-55.jar</sub></sup> <br> Remove the block, item, and biome ID limits by using the 1.13 chunk format in 1.12 | Better than NEID
<img src="https://media.forgecdn.net/avatars/thumbnails/431/99/256/256/637665942273064272.png" width="50"> | 🟨 [**Modular Controller**](https://www.curseforge.com/minecraft/mc-mods/modular-controller) <sup><sub>ModularController-1.1.2.jar</sub></sup> <br> An addon to Modular Machinery making each machine has its own controller. | Could be more useful then ![](https://git.io/JuAMS "Machine Blueprint")
<img src="https://media.forgecdn.net/avatars/thumbnails/177/405/256/256/636770491013689770.png" width="50"> | 🟨 [**Useful Railroads**](https://www.curseforge.com/minecraft/mc-mods/useful-railroads) <sup><sub>useful_railroads-1.12.2-1.1.3.24.jar</sub></sup> <br> Wo don't want extreme high speed rails for travel? | Early game automation and item transport
<img src="https://media.forgecdn.net/avatars/thumbnails/139/476/256/256/636528457531380269.png" width="50"> | 🟫 [**Terracart Reloaded**](https://www.curseforge.com/minecraft/mc-mods/terracart-reloaded) <sup><sub>terracartreloaded-1.12.2-1.2.3.jar</sub></sup> <br> Terraria Cart in Minecraft, Right click track and have fun! | QOL mod for rail lovers
<img src="https://media.forgecdn.net/avatars/thumbnails/156/357/256/256/636638775074425697.png" width="50"> | 🟩 [**Enable Cheats**](https://www.curseforge.com/minecraft/mc-mods/enable-cheats) <sup><sub>EnableCheats-1.12.2-1.0.0.jar</sub></sup> <br> Enable or Disable Cheats without opening to LAN | Little sugar
<img src="https://media.forgecdn.net/avatars/thumbnails/160/614/256/256/636666750686247023.png" width="50"> | 🟨 [**Deep Mob Learning - Blood Magic Addon**](https://www.curseforge.com/minecraft/mc-mods/deep-mob-learning-blood-magic-addon) <sup><sub>deepmoblearningbm-1.12.2-1.0.1-universal.jar</sub></sup> <br> BloodMagic addon for Deep Mob Learning. | More integration
<img src="https://media.forgecdn.net/avatars/thumbnails/85/928/256/256/636205851394458635.png" width="50"> | 🟨 [**Void Island Control**](https://www.curseforge.com/minecraft/mc-mods/void-island-control) <sup><sub>voidislandcontrol-1.5.3.jar</sub></sup> <br> Adds a world type for a customizable, multiplayer, "void" world. | Add ability to create Skyblock worlds. Actual skyblock recipes not propertly tweaked yet
<img src="https://media.forgecdn.net/avatars/thumbnails/328/240/256/256/637451982118648315.png" width="50"> | 🟫 [**Tinkers' Addons(Fork) with Mod Support**](https://www.curseforge.com/minecraft/mc-mods/tinkers-addons-fork) <sup><sub>Tinkers' Addons-1.12.2-1.0.10.jar</sub></sup> <br> Adding Back old TiCon Modifiers to Tinkers' Construct 2 with Construct's Armory Support | Conarm support for toolkits
<img src="https://media.forgecdn.net/avatars/thumbnails/354/118/256/256/637511625805500753.png" width="50"> | 🟧 [**spark**](https://www.curseforge.com/minecraft/mc-mods/spark) <sup><sub>spark-forge1122.jar</sub></sup> <br> spark is a performance profiling plugin/mod for Minecraft clients, servers and proxies. | Great profiler
<img src="https://media.forgecdn.net/avatars/thumbnails/275/632/256/256/637262902934662148.png" width="50"> | 🟩 [**Stupid Horse Stand Still**](https://www.curseforge.com/minecraft/mc-mods/stupid-horse-stand-still) <sup><sub>horsestandstill-1.12.2-1.0.0.jar</sub></sup> <br> Dismounting a saddled horse instructs it to wait for you | Little more sugar
<img src="https://media.forgecdn.net/avatars/thumbnails/284/308/256/256/637296797301571773.png" width="50"> | 🟫 [**RFTools Dimension Tweaker**](https://www.curseforge.com/minecraft/mc-mods/rftools-dimension-tweaker) <sup><sub>RFTDimTweak-1.12.2-1.0.jar</sub></sup> <br> Provides end-game and overflow-free variants of dimension machines. | Alternative cheaper and better machines
<img src="https://media.forgecdn.net/avatars/thumbnails/28/535/256/256/635829271511825665.png" width="50"> | 🟨 [**Colossal Chests**](https://www.curseforge.com/minecraft/mc-mods/colossal-chests) <sup><sub>ColossalChests-1.12.2-1.7.3.jar</sub></sup> <br> For when regular chests are too small | Modpack have multiblock Tanks, now it will have multiblock Chests!
<img src="https://media.forgecdn.net/avatars/thumbnails/388/609/256/256/637580698900743739.png" width="50"> | 🟫 [**ContentTweaker Registry Orderer**](https://www.curseforge.com/minecraft/mc-mods/contenttweaker-registry-orderer) <sup><sub>CoTRO-1.0.0-1.12.2.jar</sub></sup> <br> Orders the registration of ContentTweaker items and blocks | Without this mod items are shuffled in `@contenttweaker` tab

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/239/522/256/256/637114384686820957.png" width="50"> | 🟫 [**Performant**](https://www.curseforge.com/minecraft/mc-mods/performant) <sup><sub>performant-1.12.2-1.10.jar</sub></sup> <br> Lag begone! Increases Performance, less entity lag less rubberbanding, more players on the server | Caused [jump+place block bug](https://github.com/someaddons/performant_issues/issues/68)
<img src="https://media.forgecdn.net/avatars/thumbnails/341/410/256/256/637484195977976685_animated.gif" width="50"> | 🟫 [**Recast**](https://www.curseforge.com/minecraft/mc-mods/recast) <sup><sub>recast_1.12.2-1.2.jar</sub></sup> <br> 🎣 Automatically re-casts the fishing rod line for a player when an item is caught. | In automation modpack this should do a machine. Or at least a rat.
<img src="https://media.forgecdn.net/avatars/thumbnails/233/408/256/256/637071875768748102.png" width="50"> | 🟫 [**Immersive Tweaker**](https://www.curseforge.com/minecraft/mc-mods/immersive-tweaker) <sup><sub>immersivetweaker-0.1.jar</sub></sup> <br> Additional CraftTweaker compat for Immersive Engineering | Add Arc Furnance equipment recycling, but only with vanilla recipes
<img src="https://media.forgecdn.net/avatars/thumbnails/260/993/256/256/637216341847519420.png" width="50"> | 🟫 [**Artisan Automation**](https://www.curseforge.com/minecraft/mc-mods/artisan-automation) <sup><sub>artisanautomation-1.12.2-1.0.6.jar</sub></sup> <br> An automation solution for Artisan Worktables. | Artisan Worktables was used only for 5 recipes. Movedthis recipes to other crafting methods.
<img src="https://media.forgecdn.net/avatars/thumbnails/300/225/256/256/637356608867340430.png" width="50"> | 🟫 [**Extra CPUs**](https://www.curseforge.com/minecraft/mc-mods/extracpus) <sup><sub>extracpus-1.12.2-1.1.0.jar</sub></sup> <br> A mod to give you more Crafting Storages for Applied Energistics 2. | Incomptable with new ExtraCells2 fork
<img src="https://media.forgecdn.net/avatars/thumbnails/24/252/256/256/635754842297919962.png" width="50"> | 🟫 [**NotEnoughIDs**](https://www.curseforge.com/minecraft/mc-mods/notenoughids) <sup><sub>NotEnoughIDs-1.5.4.4.jar</sub></sup> <br> Extends hardcoded block id limit | Replaced with JEID
<img src="https://media.forgecdn.net/avatars/thumbnails/135/621/256/256/636501635168660414.png" width="50"> | 🟫 [**Artisan Worktables 1.12**](https://www.curseforge.com/minecraft/mc-mods/artisan-worktables) <sup><sub>artisanworktables-1.12.2-1.24.2.jar</sub></sup> <br> Themed worktables with a tool slot. Optional tools provided. CraftTweaker, JEI, GameStages. | Artisan Worktables was used only for 5 recipes. Movedthis recipes to other crafting methods.
<img src="https://media.forgecdn.net/avatars/thumbnails/135/819/256/256/636503139447725408.png" width="50"> | 🟫 [**Preston**](https://www.curseforge.com/minecraft/mc-mods/preston) <sup><sub>Preston-0.3.5.jar</sub></sup> <br> Compressed blocks on a massive scale | Deprecated with other compression mod
<img src="https://media.forgecdn.net/avatars/thumbnails/41/763/256/256/636000363793448321.png" width="50"> | 🟨 [**Tinkers' Addons**](https://www.curseforge.com/minecraft/mc-mods/tinkers-addons) <sup><sub>Tinkers' Addons-1.12.1-1.0.7.jar</sub></sup> <br> Adding Back old TiCon Modifiers to Tinkers' Construct 2 | Replaced with its fork
<img src="https://media.forgecdn.net/avatars/thumbnails/144/165/256/256/636554078130517823.png" width="50"> | 🟫 [**Sampler**](https://www.curseforge.com/minecraft/mc-mods/sampler) <sup><sub>sampler-1.84.jar</sub></sup> <br> Performance oriented debugging/administration tools | Replaced with Spark

## 🟡 Updated Mods

- [**PackagedAuto**](https://www.curseforge.com/minecraft/mc-mods/packagedauto) <sup><sub>PackagedAuto-1.12.2-1.0.5.18.jar</sub></sup>
- [**Dropt**](https://www.curseforge.com/minecraft/mc-mods/dropt) <sup><sub>dropt-1.12.2-1.19.1.jar</sub></sup>
- [**B.A.S.E**](https://www.curseforge.com/minecraft/mc-mods/base) <sup><sub>base-1.12.2-3.14.0.jar</sub></sup>
- [**Scaling Feast**](https://www.curseforge.com/minecraft/mc-mods/scaling-feast) <sup><sub>scalingfeast-1.8.0.jar</sub></sup>
- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.660.jar</sub></sup>
- [**Brandon's Core**](https://www.curseforge.com/minecraft/mc-mods/brandons-core) <sup><sub>BrandonsCore-1.12.2-2.4.20.162-universal.jar</sub></sup>
- [**Draconic Evolution**](https://www.curseforge.com/minecraft/mc-mods/draconic-evolution) <sup><sub>Draconic-Evolution-1.12.2-2.3.28.354-universal.jar</sub></sup>
- [**ME Capability Adapter**](https://www.curseforge.com/minecraft/mc-mods/capability-adapter) <sup><sub>capabilityadapter-1.1.2.jar</sub></sup>
- [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) <sup><sub>zenutils-1.9.4.jar</sub></sup>
- [**Atlas Lib**](https://www.curseforge.com/minecraft/mc-mods/atlas-lib) <sup><sub>Atlas-Lib-1.12.2-1.1.4.jar</sub></sup>
- [**Nether Portal Spread**](https://www.curseforge.com/minecraft/mc-mods/nether-portal-spread) <sup><sub>netherportalspread_1.12.2-5.4.jar</sub></sup>
- [**Hole Filler Mod**](https://www.curseforge.com/minecraft/mc-mods/hole-filler-mod) <sup><sub>hole_filler_mod-1.2.4.1-mc_1.12.2-forge.jar</sub></sup>
- [**IC2 Patcher**](https://www.curseforge.com/minecraft/mc-mods/ic2-patcher) <sup><sub>ic2patcher-2.0.3.jar</sub></sup>
- [**Kiro's Basic Blocks**](https://www.curseforge.com/minecraft/mc-mods/kiros-basic-blocks) <sup><sub>kirosblocks-1.2.jar</sub></sup>
- [**Collective**](https://www.curseforge.com/minecraft/mc-mods/collective) <sup><sub>collective-1.12.2-2.64.jar</sub></sup>
- [**AE2 Fluid Crafting**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting) <sup><sub>ae2fc-1.12.2-1.0.11.jar</sub></sup>
- [**Advancement Screenshot**](https://www.curseforge.com/minecraft/mc-mods/advancement-screenshot) <sup><sub>advancementscreenshot_1.12.2-2.0.jar</sub></sup>
- [**Uber Conduit Probe**](https://www.curseforge.com/minecraft/mc-mods/uber-conduit-probe) <sup><sub>uberconduitprobe-1.0.3.jar</sub></sup>
- [**Immersive Technology**](https://www.curseforge.com/minecraft/mc-mods/mct-immersive-technology) <sup><sub>MCTImmersiveTechnology-1.12.2-1.9.96.jar</sub></sup>
- [**LibVulpes**](https://www.curseforge.com/minecraft/mc-mods/libvulpes) <sup><sub>LibVulpes-1.12.2-0.4.2-84-universal.jar</sub></sup>
- [**Advanced Rocketry**](https://www.curseforge.com/minecraft/mc-mods/advanced-rocketry) <sup><sub>AdvancedRocketry-1.12.2-2.0.0-254-universal.jar</sub></sup>
- [**MixinBootstrap**](https://www.curseforge.com/minecraft/mc-mods/mixinbootstrap) <sup><sub>_MixinBootstrap-1.1.0.jar</sub></sup>
- [**CreativeCore**](https://www.curseforge.com/minecraft/mc-mods/creativecore) <sup><sub>CreativeCore_v1.10.63_mc1.12.2.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.21_mc1.12.2.jar</sub></sup>
- [**Ears**](https://www.curseforge.com/minecraft/mc-mods/ears) <sup><sub>ears-forge-1.12-1.2.3.jar</sub></sup>
- [**Tesla Core Lib**](https://www.curseforge.com/minecraft/mc-mods/tesla-core-lib) <sup><sub>tesla-core-lib-1.12.2-1.0.18.jar</sub></sup>
- [**Thaumic Augmentation**](https://www.curseforge.com/minecraft/mc-mods/thaumic-augmentation) <sup><sub>ThaumicAugmentation-1.12.2-2.1.4.jar</sub></sup>

## 🧩 Configs

- Scaling Feast: fix hunger cant reach >20
  > Problem was with mod **Random Tweaks** that tries to manage hunger too.

## ✏️ Recipes

- Disable barely all benefication of ![](https://git.io/JRLyd "Rutile Ore")
  > How Titanium can be obtained only through this machines:
    - ![](https://git.io/JRLy7 "Washing Factory")
      ![](https://git.io/JGGjU "Electric Arc Furnace")
      ![](https://git.io/JuA6p "Chemical Dissolution Chamber")
- OreDict.zs refactor. Could cause some oreDict bugs, but i checked twice.
- ![](https://git.io/JuAi9 "Auto Hammer")![](https://git.io/JZYfe "Auto Compressed Hammer") Changed recipes
- ![](https://git.io/JCt0z "Creative Paste Container") fix wrong nbt
- ![](https://git.io/Jc4Qj "Basic Lithium Ion Battery") fix battery tag
- ![](https://git.io/JuAPq "Rocket Fuel Tank") buff but makes harder
- ![](https://git.io/JuAin "Nutrient Distillation Tank") now made from ![](https://git.io/JuAiw "Short Mead Tank") instead of water
- ![](https://git.io/JuAiF "Hootch Tank") made from ![](https://git.io/JcbNB "Milk")
- ![](https://git.io/JuAiX "Cloud Seed Tank") made from ![](https://git.io/JuAiB "Crushed Ice Tank") in Cooling Tower instead of ![](https://git.io/JtJf9 "The Vat")
- Creative Fluid Tank Frame now made in vanilla crafting table
- ![](https://git.io/JZYf3 "Diamond Hammer") Drop to vanilla recipe but set efficiency to `0` (very slow)
- ![](https://git.io/JuAMM "Orechid Ignem") add 2 new ore (for Lens Of The Miner)
- ![](https://git.io/JuAiw "Short Mead Tank") <-> ![](https://git.io/JuAMF "Mead Tank") conversion
- ![](https://git.io/JtIrt "Rat Diamond") new 6 most common uses
- Simple Trophyes now have colored piedestal
- Mekanism's machines no longer process Rat Poop
- Fix accidentally removed vanilla recipes, ![](https://git.io/Jt1ue "Rail") for example
- ![](https://git.io/JZYv5 "Empowered Void Crystal Block") from ![](https://git.io/JuAio "Sky Stone Block") instead of ![](https://git.io/JZYvp "Black Quartz Block")
- ![](https://git.io/JuAid "Void Crystal Block") from ![](https://git.io/JZYvp "Black Quartz Block") instead ![](https://git.io/JuAiH "Block of Coal")
- Rearrange several Mystical Agriculture seeds tiers
- ![](https://git.io/JcCHa "Garden Cloche") +1 liquid
- ![](https://git.io/JtJfx "Furnace") from ![](https://git.io/JuAiP "Bio Coal") too
- Some Conflicts fixing
- ![](https://git.io/Jczsa "Precision Laser Etcher") and some other AR machines use more energy and work slower
- Twilight Forest Trees add recipes
- ![](https://git.io/JuAig "Ironwood Sapling") add recipe
- **A lot** of new outputs from ![](https://git.io/Jcbxn "Acacia Leaves"), ![](https://git.io/JuAPU "Turf Block") and ![](https://git.io/JuAiu "Prismarine") in ![](https://git.io/JOv90 "Sieve")
- ![](https://git.io/JZYfn "Pulsating Crystal") fix excess recipes
- ![](https://git.io/J0kg2 "Enrichment Chamber"), ![](https://git.io/JCt0l "Energized Smelter") fix missing recipes
- ![](https://git.io/JtJvo "Creative Bin") with ![](https://git.io/JuAiA "Salt") add recipe
- ![](https://git.io/JRqca "Universal Fluid Cell") in creative crafts fix
- 14 new portal spread conversions
- [Blood-Infused Stone] proper alloy ingredients
- ![](https://git.io/JuAiR "Blank Rune")![](https://git.io/JuAiV "Blank Slate") fix cast cost
- ![](https://git.io/JRLyD "The Ultimate Singularity") removed **12** Tier1 singularities, added +1 new
- ![](https://git.io/JnN1J "SAG Mill") some custom recipes work with Grinding Balls now
- ![](https://git.io/JuAie "Energetic Alloy Block")![](https://git.io/JRLSe "Vibrant Alloy Block") alts in ![](https://git.io/JGGjU "Electric Arc Furnace")
- ![](https://git.io/J0kgg "Stone Dust") -> ![](https://git.io/J0kgz "Seared Brick") recipe
- ![](https://git.io/JuAis "Molten Manyullyn Tank") & [Molten Fluix Steel] melting and casting with NuclearCraft
- ![](https://git.io/JuAPI "PSI-O Cell") now keep charge when upgrading
- ![](https://git.io/Jsmfs "Heart Dust") now used instead of Shards to craft morbs
- Several IC2 recipes was revealed (was hidden)
- ![](https://git.io/JuMld "Advanced Alchemic Condenser") now can make Morbs
- ![](https://git.io/JuAPf "Treated Wood Planks") now can be made from IC2 Creosote
- ![](https://git.io/JRLy9 "Metallurgic Infuser") accept more Fungies
- ![](https://git.io/JRLy9 "Metallurgic Infuser") add recipes:
  * ![](https://git.io/JuAiZ "Overgrowth Seed")
  * ![](https://git.io/JuAPv "Glowing Mushroom")
  * ![](https://git.io/JuAi3 "Organic Black Dye")
 
 **Add craft for:**
 - ![](https://git.io/JuAiv "Sickly Twilight Oak Sapling")
   ![](https://git.io/JuAiT "Robust Twilight Oak Sapling")
   ![](https://git.io/JuAif "Tree of Time Sapling")
   ![](https://git.io/JuA6x "Tree of Transformation Sapling")
   ![](https://git.io/Jc47v "Miner's Tree Sapling")
   ![](https://git.io/JuAiJ "Sorting Tree Sapling")
 
 **Harder:**
  - ![](https://git.io/JuAic "Enchantment Factory")
    ![](https://git.io/JuAia "Upgrade Template")
    ![](https://git.io/JuAiM "Klein Bottle")
    ![](https://git.io/JcW2R "Basic Tank")
    ![](https://git.io/JE8nA "Uranium RTG")
    ![](https://git.io/JuAi2 "Solar Generator")
    ![](https://git.io/JuA6N "Advanced Solar Generator")
  - [Enchantment Extractor]
  - [Teleport Rail]
 
 **Cheaper**
  - ![](https://git.io/J3p8H "Lens of the Miner")
    ![](https://git.io/JuAi6 "Molten Sunnarium Tank")
    ![](https://git.io/JZITJ "Inventory Panel")
    ![](https://git.io/Jcz37 "Large Inventory System Storage")![](https://git.io/Jcz3y "Medium Inventory System Storage")![](https://git.io/Jsw4f "Tiny Inventory System Storage")![](https://git.io/JczsW "Small Inventory System Storage")![](https://git.io/Jcz3H "Big Inventory System Storage")![](https://git.io/Jcz3S "Huge Inventory System Storage")![](https://git.io/Jcz3Q "Inventory System Storage Extended Warehouse")![](https://git.io/Jcz3d "Inventory System Storage Warehouse")![](https://git.io/Jcz39 "Enormous Inventory System Storage")
    ![](https://git.io/JRLyX "Rat Upgrade: Creative")
    ![](https://git.io/JRLyH "Infinity Catalyst")
    ![](https://git.io/JRLyF "Endest Pearl")
    ![](https://git.io/JRLSs "Ultimate Stew")
    ![](https://git.io/JRLSn "Cosmic Meatballs")
    ![](https://git.io/JuAiL "Electric Light")
    ![](https://git.io/JuAiO "Wireless Light")
    ![](https://git.io/JuAi8 "Inventory Sensor")
    ![](https://git.io/JuA6j "Machine Parts")
    ![](https://git.io/JcCHV "Reinforced Large Drum")
    ![](https://git.io/Jcz3h "Demonically Gargantuan Drum")
    ![](https://git.io/JuAir "Rain Tank")
    ![](https://git.io/JCt0R "Creative Rod Frame")
    ![](https://git.io/JRLSO "Neutron Collector")
    ![](https://git.io/J03tf "Wyvern Core")
    ![](https://git.io/JuAil "Energy Core")
    ![](https://git.io/JuAi1 "Energy Pylon")
    ![](https://git.io/JRsaA "Energy Core Stabilizer")
    ![](https://git.io/JuAiU "Sun Crystal (Empty)")
    ![](https://git.io/J03te "Fluid Pipe")
    ![](https://git.io/JE8np "Capacitor Backpack")
    ![](https://git.io/JuAip "Solar Panel")
    ![](https://git.io/JuAi4 "Refractory Bricks")
    ![](https://git.io/JuAPk "Energy Field Addon")
  - [Inventory Panel Remote]
  - [Advanced Inventory Panel Remote]
  - [Infinity Grinding Ball]
  - [(Every) Extended Crafty Crate]
  
  **Add craft to:**
  - ![](https://git.io/JuAig "Ironwood Sapling")
    ![](https://git.io/JuAMy "Canola Seeds")
    ![](https://git.io/JuAiN "Red Orchid")

## 📖 Quest Book

- Quests changes
- Fix Glitch Infused armor set spawning

## 🔵 Mods

- Modular Controller integration, new colors for modular machines
- NEID->JEID changes
- Mod replace: **ExtraCells** -> **AE Additionals**

- ### 🔴 Removed Mods

  - Cleanup last mentions of **Spartan Shields**
  - Remove **Preston** from recipes

- ### ▦ Ex Nihilo

  - Return **Compost** recipes

- ### ☢️ NuclearCraft

  - Nerf t1 solar to 30 RF/t
  - ![](https://git.io/JCqVS "Lithium Ion Cell") make unstackable to prevent FE dupe
  - Always enable rad overlay (no need ![](https://git.io/JuAi0 "Geiger Counter"))
  - Add nutrition values to food
  - Fix ![](https://git.io/JuAiC "Infinity Ingot") radiation

- ### ⛽ Advanced Generators

  - AdvGen: More ![](https://git.io/J3xSJ "Syngas") carbon sources (see JEI)
    > Also increase internal tank capacity

- ### 🌠 Astral Sorcery

  - **Mineralis** work with any stone variant

- ### 🌸 Industrial Foregoing

  - Buff ![](https://git.io/JuAiI "Energy Field Provider")

- ### 🌿 Patchouli

  - Patchouli_js: Automatic Update

- ### 🍇 End Reborn

  - Modpack Integration
    > - Some **structure** and **mob** spawning chances changed
    > - ![](https://git.io/JuAPe "Essence Ore") more generation
    > - ![](https://git.io/JuAiz "End Steel Ingot") using tungsten now
    > - ![](https://git.io/JuAiG "Void Ore Miner Controller Tier 5")![](https://git.io/JuA6A "Void Resource Miner Controller Tier 5") new entries
    > - ![](https://git.io/JuAit "Endorium Nugget") from ![](https://git.io/JuAiS "Ender Lilly")
    > - ![](https://git.io/JuAiY "Lormyte Crystal") and ![](https://git.io/JuAih "Dragon Scales") recipes
    > - ![](https://git.io/JuAiE "Tungsten Ore") [Xorcite Cluster] in [Orechid Vacuam]
    > - ![](https://git.io/JuAiW "Dragon Chestplate") set craft and mob spawn
    > - ![](https://git.io/JuAiq "Simple Machine Chassis") Now uses [Lormyte Block]
    > - ![](https://git.io/Jczsv "Photovoltaic Composite") now uses ![](https://git.io/JuAPt "Mysical Flesh")
    > - [Fluix-Plated Iron Ingot] Remake
    > - ![](https://git.io/JqUUe "Ender Chest")![](https://git.io/JuAiK "Enchantment Table")![](https://git.io/JuAix "Beacon") now use ![](https://git.io/JuAij "Essence")
    > - ![](https://git.io/JuAPL "Elytra") remake
    > - This items use ![](https://git.io/JuAiy "Tungsten Ingot") instead of ![](https://git.io/JLjca "Iron Ingot"):
    >   - ![](https://git.io/JuAPJ "Basic Card")
    >     ![](https://git.io/JuAPT "ME Interface")
    >     ![](https://git.io/JuAik "ME Fluid Interface")
    >     [ME Gas Interface]

- ### 🏪 Requious Fracto

  - JEI for **Excavator** and **Mineralis**
  - Fix ![](https://git.io/J3p8B "Infinity Furnace")
    > texture turned upsidedown  
    > But still turned wrong in world
  - JEI for **A book written by a Cow**
  - JEI for ![](https://git.io/J3xSU "Syngas Producer Controller") & ![](https://git.io/JcCHa "Garden Cloche")

- ### 🐀 Rats

  - Probably fix issue when rats spawn as worms
  - Add ![](https://git.io/JcW2H "Ratglove Flower") native spawning in Ratlantis

- ### 👨‍🏭 Mekanism

  - Buff solars to 50 and 250 RF/t
  - [Cardboard Box] cant grab **Bedrock Ore**

- ### 👿 Extra Utilities 2

  - Buff [(any) Lux Saber] damage 11 -> 21

- ### 📑 Tips

  - New tips and tooltips

- ### 📭 Storage Drawers

  - Buff all drawer upgrades +1
  - Buff ![](https://git.io/JcW2R "Basic Tank") up to 16b

- ### 🔌 IndustrialCraft 2

  - Nerf solar back to 1 EU/t

- ### 🔨 Tinker's Construct

  - **Laser Gun** Rework - 1,000,000 RF/shot
    > - Now each shot consuming 1M RF
    > - **Battery Cells** now craftable in table instead of casting
    > - ![](https://git.io/JcuNp "Laser Medium Cast") now cheaper (but still require ![](https://git.io/JcBSs "Tiny Chaos Fragment"))
  - Add `hailhydra` trait to ![](https://git.io/JuAi7 "Sky Stone")
  - Fix damage indicator not working
    > Before, when player fast hitting target,
    > there was no reload cursor indicator.
  - ![](https://git.io/JuAib "Apatite") add **Brittle** trait
    > This would help to disable abusing infinity apatite tools for farms

- ### 🦯 Thaumcraft

  - Fix **Armor Trim** aspects

- ### 🧬 Draconic Evolution

  - Buff **Energy Core** tiers  
    > Now its:
    > 1.  50,000,000,000
    > 2.  100,000,000,000
    > 3.  150,000,000,000
    > 4.  200,000,000,000
    > 5.  4,000,000,000,000
    > 6.  8,000,000,000,000
    > 7.  10,000,000,000,000
    > 8.  9.223372036854776E18

- ### 🧻 JEI

  - blacklist updates
  - Add tag **#Solar**
  - Always show all Thaumcraft recipes
    > Hidden recipes without research confuse players when they
    > cant see progression
  - Add Tags to 3 NC machines

- ### 🩸 Blood Magic

  - **DML** integration increase RF/T consumption

- ### 🛢️ Immersive Engineering

  - Immersive Tech: More recipes integrations
    > - ![](https://git.io/JuAiX "Cloud Seed Tank") recipe
    > - ![](https://git.io/JuAMD "Molten Diamond Tank") now can be obtainable only in **Melting Crucible**
    > - ![](https://git.io/JuAi5 "Chlorine Tank") and ![](https://git.io/JuAiD "Liquid Sodium Tank") now only obtainable in multyblock
    > - ![](https://git.io/JuAiQ "Hydrogen") and [Oxygen] in ![](https://git.io/JuA6h "Electrolytic Separator") 10x times HARDER
    >   but obtainable in multiblock
  - Make Tin, Copper & Gold wires longer (32)
    > This would help compete them with other types of wires

- ### 🛸 EnderIO

  - Remove `required="true"` to not crash game when item missed
  - `AlloySmelter.removeRecipe` not working, switch to `user_recipes.xml`

- ### 🟨 Recurrent Complex

  - Add A lot new [Village structures](https://complex.ivorius.de/submissions/184) 

- ### 🥽 LagGoggles

  - Higher red threshold

- ### 🖥️ Deep Mob Learning

  - Rule spawn Glitch
    > - Add spawn with **RFTools Spawner**
    > - Forbid Spawn with ![](https://git.io/JuAii "Mob Duplicator")

- ### 🍹 Nutrition

  - **Dairy** nutrition decay twice slower
    > Now when eating non-dairy food, your `dairy` value would descrease
    > twice slower compared to other nutrients.
    > 
    > This could help, because usually, minecraft have less variaty for milk
    > products than other types of food.

- ### 🙋‍♀️ Quark

  - Enables **Piston Move Tile Entities**
    > Take care.  
    > All **RandomThings** tile entities blacklisted

- ### 🗳️ Colossal Chest

  - Integration and recipes

- ### 🌎 JER

  - JER: Add RFTools ![](https://git.io/JOGzA "Dimensional Blank Block")
  - JER: Update **Ratlantis (-8)** and **Novus (113)**

## 🔄 Misc Changes

- Fix some `.name` named items
- Forbid Visit any dimensions except Overworld
  > For skyblock mode
- Void Island Control configs
- Make all hard blocks slower but disable Ore slow in deeps
  > Modpack have bunch of blocks with higher mining level than vanilla values.
  > For example: Metal Blocks, Void Ore Miner's cores, Thaum Wood Logs.
  > 
  > Before, all hard blocks had default mining speed a.k.a. **hardness**.
  > Now Hardness start to change from **level 3**
  > by formula `(lvl^2)/2`
  > 
  > Same time, **Harder Branch Mining** was disabled for Ores, so,
  > mining ore blocks in deeps would be easier
- 
  > - [Excavate Modifier] Change texture to 16x16
  > - ![](https://git.io/JqUJK "Terrestrial Artifact Block") improve texture

- ### 🧱 Technical

  - CoT new item - [Silicon Block]
  - New Fluid: **Perfect Fuel**
    > **Perfect Fuel** crafting from bunch of different TOP-Tier fluids.
    > Used as fuel for bunch of different machines.
    > Also used as ingredient for Creative Fluid Tank.

## 🔥 Nether

- Restrict visiting **Nether** if you not having 40 HP

## 🍯 OMega potion

- Refactor, remove Artisan Worktable craft, cheaper







# 0.29

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/346/844/256/256/637496100920279441.png" width="50"> | [**Animania Cats & Dogs**](https://www.curseforge.com/minecraft/mc-mods/animania-cats-dogs) <sup><sub>undefined</sub></sup> <br> This Animania Addon adds Cats and Dogs to your game! | Cats and dogs have barely no use.
<img src="https://media.forgecdn.net/avatars/thumbnails/358/827/256/256/637520208754289091.png" width="50"> | [**SneedASM**](https://www.curseforge.com/minecraft/mc-mods/sneedasm) <sup><sub>loliasm-2.5.jar</sub></sup> <br> Yet another crazy optimization mod - powered by ****s | Can't actually feel the difference with this mod or without
<img src="https://media.forgecdn.net/avatars/thumbnails/19/743/256/256/635700596326350676.png" width="50"> | [**OpenSecurity**](https://www.curseforge.com/minecraft/mc-mods/opensecurity) <sup><sub>OpenSecurity-1.12.2-1.0-71.jar</sub></sup> <br> Security addon for OpenComputers | Not much userful. Would add back on request.
<img src="https://media.forgecdn.net/avatars/thumbnails/343/214/256/256/637488101185625226.jpeg" width="50"> | [**ComputerCraft Addons**](https://www.curseforge.com/minecraft/mc-mods/cc-addons) <sup><sub>Computronics-1.12.2-1.6.6.jar</sub></sup> <br> ComputerCraft Addons | Not much userful. Would add back on request.

## 🟡 Updated Mods

- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.655.jar</sub></sup>
- [**Immersive Petroleum**](https://www.curseforge.com/minecraft/mc-mods/immersive-petroleum) <sup><sub>immersivepetroleum-1.12.2-1.1.10.jar</sub></sup>
- [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) <sup><sub>zenutils-1.9.0.jar</sub></sup>
- [**Fluid Drawers**](https://www.curseforge.com/minecraft/mc-mods/fluid-drawers) <sup><sub>fluiddrawers-1.12.2-1.0.7.jar</sub></sup>
- [**Cyclic**](https://www.curseforge.com/minecraft/mc-mods/cyclic) <sup><sub>Cyclic-1.12.2-1.20.11.jar</sub></sup>
- [**ThermalLogistics**](https://www.curseforge.com/minecraft/mc-mods/thermallogistics) <sup><sub>thermallogistics-0.3-43.jar</sub></sup>
- [**Hammer (Lib) Core**](https://www.curseforge.com/minecraft/mc-mods/hammer-lib) <sup><sub>HammerLib-1.12.2-2.0.6.28.jar</sub></sup>
- [**Animania Cats & Dogs**](https://www.curseforge.com/minecraft/mc-mods/animania-cats-dogs) <sup><sub>undefined</sub></sup>
- [**Rocky Tweaks**](https://www.curseforge.com/minecraft/mc-mods/rocky-tweaks) <sup><sub>rockytweaks-1.12.2-0.6.0-PRE-RELEASE-3.jar</sub></sup>
- [**ModTweaker**](https://www.curseforge.com/minecraft/mc-mods/modtweaker) <sup><sub>modtweaker-4.0.20.4.jar</sub></sup>
- [**Thaumic Augmentation**](https://www.curseforge.com/minecraft/mc-mods/thaumic-augmentation) <sup><sub>ThaumicAugmentation-1.12.2-2.1.3.jar</sub></sup>

## 🧩 Configs

- Scaling Feast: set "Hunger Regen Type"=VANILLA_LIKE
  > and
  > "Saturated Regen Type"=VANILLA_LIKE

## ✏️ Recipes

- changes and fixes
  > - ![](https://git.io/JZYvh "Draconium Infused Obsidian") Now obtainable only with ![](https://git.io/JczsZ "Containment Chalice") or in end
  > - ![](https://git.io/Jt8wI "Menril Sapling") Can be crooked flom ![](https://git.io/Jcbxn "Acacia Leaves")
  > - **Hydroponics** cheaper
  > - ![](https://git.io/JCuhp "The Ultimate Ingot") revived craft
  > - ![](https://git.io/JCt0W "Block of The Ultimate") add craft matching ingot
  > - ![](https://git.io/JczsL "Creative Gas Tank") replace ![](https://git.io/JCzfY "Flue Gas Tank") with **Exhaust Steam**
  > - ![](https://git.io/Jczsx "Creative Fluid Tank") fixed tanks in craft sizes (900 buckets now)
  > - ![](https://git.io/JCt0R "Creative Rod Frame") cheaper (now obtainable before Infinity ingots)
  > - ![](https://git.io/JOGzE "Creative Modifier") cheaper (now T2 table)
  > - ![](https://git.io/JCt0V "Creative Mill") Way cheaper, T3 now
  > - ![](https://git.io/JLjsf "Basalt") now obtainable from ![](https://git.io/JczsZ "Containment Chalice")
  > - ![](https://git.io/JCuh5 "Empowered Phosphor") new have burn time **180000**, propolis in recipe
  > - ![](https://git.io/JcbNV "French Fry") & ![](https://git.io/JcbbS "Bacon") have more output when mashing
  > - ![](https://git.io/JCtgZ "Sentient Armour Gem") fix craft (remove ![](https://git.io/JCt0g "Diamond Chestplate"))
  > - ![](https://git.io/JCuhx "Violet Crystal Block") and other AR crystals: new harder ways to recycle
  > - [Fluix Dust] from [Fluix Block] fix
  > - ![](https://git.io/JCt0z "Creative Paste Container") add craft
  > - ![](https://git.io/JCt04 "Dark Oak Chest") and other chests conversion with **Chisel**
  > - ![](https://git.io/JCzf3 "Item Collector") fix plate
  > - ![](https://git.io/JCqV9 "Particle Generator") craft from ![](https://git.io/JZYvh "Draconium Infused Obsidian")
  > - ![](https://git.io/JCuhN "Basic Wireless Energy Crystal") back vanilla craft
  > - ![](https://git.io/JCuhh "Nickel Ore Piece") now turn to Ore in compressors
  > - ![](https://git.io/JCt00 "Creative Harvest") add craft
  > - ![](https://git.io/Jc4m4 "Anglesite Ore") and ![](https://git.io/Jc4m8 "Benitoite Ore") instead of gems craft
  > - Vain Bee -> ![](https://git.io/JcNYM "Insanium Coal") cheaper
  > - [Access Proxy] harder
  > - ![](https://git.io/JCt02 "Advanced Bin") Fix craft
  > - ![](https://git.io/JCtgs "Ultimate Seeds") fix second craft
  > - ![](https://git.io/JCqVy "Star of PSI") add craft
  > - ![](https://git.io/JcVAS "Reinforced Ender Bucket") clearing
  > - ![](https://git.io/JOGzF "Time in a bottle") change craft
  > - ![](https://git.io/JCt0u "Lens") add Modular Machinery craft
  > 
  > Cheaper:
  > - **Dark Matter**
  > - **Red Matter**
  > - ![](https://git.io/JcVA9 "Basic Voltaic Pile")
  >   ![](https://git.io/JCuhj "Advanced Voltaic Pile")
  >   ![](https://git.io/JCuhd "DU Voltaic Pile")
  >   ![](https://git.io/JCuhF "Elite Voltaic Pile")
  >   ![](https://git.io/Jc4Qj "Basic Lithium Ion Battery")
  >   ![](https://git.io/Jc47e "Advanced Lithium Ion Battery")
  >   ![](https://git.io/Jc4Qh "DU Lithium Ion Battery")
  >   ![](https://git.io/Jc4Qp "Elite Lithium Ion Battery")
  >   ![](https://git.io/JLhhW "Blue Quartz")
  >   ![](https://git.io/JCt0E "Infinity Drill")
  >   ![](https://git.io/Jsmfn "Creative Storage Upgrade")

## 📖 Quest Book

- Quests changes

## 🔵 Mods

- ### 🍇 End Reborn

  - Lower **Chronologyst** spawn ratio

- ### 💼 Actually Additionals

  - ![](https://git.io/JCzTK "Drill") buff mining level up to 8

## 🔄 Misc Changes

  - IC2: Enlarge Nuke maximum Diameter
  - CoT new item - **Saturated Phosphor**
    > Craft with enriching ![](https://git.io/JCuh5 "Empowered Phosphor") with syngas.
    > Has huge burn time.






# 0.28

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/197/875/256/256/636895802097061618.png" width="50"> | [**ID Squeezer Tweak**](https://www.curseforge.com/minecraft/mc-mods/id-squeezer-tweak) <sup><sub>SqueezerPatch-1.12.2-1.0.0.jar</sub></sup> <br> Fixes the ID Squeezer at low TPS. | Should help with low (< 10) TPS
<img src="https://media.forgecdn.net/avatars/thumbnails/265/341/256/256/637229158012603596.png" width="50"> | [**TickCentral**](https://www.curseforge.com/minecraft/mc-mods/tickcentral) <sup><sub>TickCentral-3.2.jar</sub></sup> <br> A future proof coremod for control over in-game ticking | Added with updated Lag Goggles
<img src="https://media.forgecdn.net/avatars/thumbnails/388/322/256/256/637579369193737704.png" width="50"> | [**Integrated Proxy**](https://www.curseforge.com/minecraft/mc-mods/integrated-proxy) <sup><sub>integrated_proxy-1.12-1.0.14.jar</sub></sup> <br> An addon for Integrated Dynamics that allows you to redirect the part's target to another position. | Should replace **Capability Proxy** mod in future

## 🟡 Updated Mods

- [**LagGoggles**](https://www.curseforge.com/minecraft/mc-mods/laggoggles) <sup><sub>LagGoggles-1.12.2-5.8-132.jar</sub></sup>

## ✏️ Recipes

  * Changes:
    - ![](https://git.io/Jsw4X "Heat Exchanger Controller") Consume less non-water cooles. More heat sources and block outputs.
    - ![](https://git.io/JcuAe "Machine Frame") now ask for special ![](https://git.io/JLjsf "Basalt") instead of ![](https://git.io/JcuNh "Machine Case")
    - ![](https://git.io/JsTPR "Starmetal Laser Medium")![](https://git.io/JcuNN "Prismarine Laser Medium")![](https://git.io/JcuAU "Blazerod Laser Medium")![](https://git.io/JcuAv "Endrod Laser Medium")![](https://git.io/JcuNF "Psigem Laser Medium") now require ![](https://git.io/JcBSs "Tiny Chaos Fragment") instead of ![](https://git.io/JcuNA "Draconic Metal Nugget")
    - ![](https://git.io/JcuNj "Mana Dust") Require for ![](https://git.io/JOijc "Tanzanite") instead of ![](https://git.io/JcuNb "Mana Diamond")
    - ![](https://git.io/JcuNx "Signalum Ingot") now ask for 3 Silver and 1 Copper (was 3 copper 1 silver)
    - ![](https://git.io/JcW20 "Stone Gear") can be made in ![](https://git.io/JczsY "Compactor (Basic)")
    - ![](https://git.io/Jczs0 "Floo Token") made in machines
    - ![](https://git.io/Jczsn "Basic Plating") now less microcraftings
    - ![](https://git.io/Jczsm "Advanced Plating")![](https://git.io/JczsV "DU Plating")![](https://git.io/JG5UH "Elite Plating") now can be made cheaper in ![](https://git.io/Jczsa "Precision Laser Etcher")
    - ![](https://git.io/JcCWK "Cubic Boron Nitride")![](https://git.io/Jczsp "Sulfuric Acid Bucket")![](https://git.io/Jczst "Calcium Sulfate") cheaper pipeline alt only in 2 **AdvRocketry** machines
    - ![](https://git.io/Jczsz "IC2 Hot Coolant") less efficient in **NuclearCraft** Heat Exchanger
    - ![](https://git.io/JczsB "Nuke") Fix craft
    - ![](https://git.io/Jczs6 "Iridium Neutron Reflector") can be crafted in ![](https://git.io/JGGjv "Precision Assembler")
    - ![](https://git.io/JcW2e "Quad Fuel Rod (Uranium)") and ![](https://git.io/JcWgF "Quad Fuel Rod (MOX)") alternative crafts
    - ![](https://git.io/JnN1T "Fluix Dust") can be made from ![](https://git.io/JnN1Y "Fluix Block")
    - ![](https://git.io/Jcz3j "Electric Mushroom") buff ![](https://git.io/JOGzp "Enervation Dynamo (Basic)") output
    - ![](https://git.io/Jc4mB "Anglesite") not dropping from ![](https://git.io/JZYfz "Ball of Fur") anymore
    - ![](https://git.io/JnN1m "Thaumium Fortress Cuirass")![](https://git.io/Jcz3x "Thaumium Fortress Helm")![](https://git.io/JczsP "Thaumium Fortress Thigh Guards") recycle
    - ![](https://git.io/JczsX "Interconnect")![](https://git.io/Jcz3N "Flight Speed Modifier")![](https://git.io/Jczs3 "Dislocator")![](https://git.io/JnN1O "Matter Condenser")![](https://git.io/JOGz7 "Advanced Pressure Valve")![](https://git.io/JczsL "Creative Gas Tank")![](https://git.io/Jczsx "Creative Fluid Tank") Misk changes
    - Several **Fluid Interactions** buffs (see ![](https://git.io/JczsZ "Containment Chalice") in JEI)
    - ![](https://git.io/Jczsk "Thermal Centrifuge") and ![](https://git.io/JczsK "Ore Washing Plant") now output right tiny dusts (instead of non-oredicted)
    - ![](https://git.io/JOGru "Heavy Oak Sieve") otput only 6/9 of non-heavy output (was 7/9)
    - ![](https://git.io/JcCKY "Basic Tier Installer")![](https://git.io/JcCD5 "Advanced Tier Installer")![](https://git.io/JcCDF "Elite Tier Installer")![](https://git.io/JcCDd "Ultimate Tier Installer") reworked: now used in crafts instead of ![](https://git.io/Jcz3p "Ultimate Fluid Tank")![](https://git.io/Jczsc "Ultimate Gas Tank")![](https://git.io/JczZY "Ultimate Energy Cube")
      > Also reworked:
      > - most **Mekanism** tiered machines
      > - **Chemical ~** machines
      > - ![](https://git.io/JczGs "Energy Upgrade")![](https://git.io/JczG3 "Speed Upgrade") used instead ![](https://git.io/JcCWP "Energy Tablet") in some crafts
  
  * Cheaper:
    - ![](https://git.io/JcCW1 "Copper Solenoid")
      ![](https://git.io/Jc4Qj "Basic Lithium Ion Battery")
      ![](https://git.io/Jcz35 "Machine Vent")
      ![](https://git.io/JGGjm "Black Hole Unit")
      ![](https://git.io/JnAYd "Cobweb")
      ![](https://git.io/JcWgj "Reactor Fuel Rod (Legacy)")
      ![](https://git.io/Jczso "Stone Drum")
      ![](https://git.io/Jczsu "Iron Drum")
      ![](https://git.io/JcCHV "Reinforced Large Drum")
      ![](https://git.io/Jcz3h "Demonically Gargantuan Drum")
      ![](https://git.io/JOv90 "Sieve")
      ![](https://git.io/JczsI "Simple Photovoltaic Cell")
      ![](https://git.io/JnAY5 "Draconic Core")
      ![](https://git.io/Jcz3b "Basic Energy Relay Crystal")
      ![](https://git.io/JGGhp "Space Suit Chest-Piece")![](https://git.io/Jc4mP "Space Suit Helmet")![](https://git.io/Jc4mX "Space Suit Leggings")![](https://git.io/Jc4m1 "Space Suit Boots")
      ![](https://git.io/JOGz9 "Pressurized Tank")
      ![](https://git.io/Jczsq "Suit Workstation")
      ![](https://git.io/Jczs4 "Low Pressure Tank")
      ![](https://git.io/Jczsg "Pressure Tank")
      ![](https://git.io/JczsE "High Pressure Tank")
      ![](https://git.io/Jcz3F "Super High Pressure Tank")
      ![](https://git.io/JczsC "Hover Upgrade")
      ![](https://git.io/Jcz3D "Flight Speed Control Upgrade")
      ![](https://git.io/Jczsr "Bionic Leg Upgrade")
      ![](https://git.io/JczsO "Padded Landing Boots")
      ![](https://git.io/JczsT "Anti-Fog Visor")
      ![](https://git.io/Jczsw "Beacon Finder")
      ![](https://git.io/Jczss "Jet Pack")
      ![](https://git.io/Jczse "Atmosphere Analyzer")
      ![](https://git.io/Jczsf "Glitch Infused Helmet")
      ![](https://git.io/J3p4Z "Glitch Infused Chestplate")
      ![](https://git.io/JczGO "Glitch Infused Leggings")
      ![](https://git.io/Jczsl "Glitch Infused Greaves")
      ![](https://git.io/Jcz3A "Awakened Draconium Block")
  
  * Harder:
    - ![](https://git.io/JczsR "Teleportation Core")
      ![](https://git.io/JczsJ "Carbonic Fluix Complex")
      ![](https://git.io/Jczs2 "Logic Director")
      ![](https://git.io/Jczsi "Upgrade Base")
      ![](https://git.io/Jczs8 "Block of Crystaltine")
      ![](https://git.io/JczsG "Vibrant Crystal")
      ![](https://git.io/Jczsv "Photovoltaic Composite")
      ![](https://git.io/JczsU "1k ME Storage Component")

## 📖 Quest Book

- Quests changes,change Potions in rewards to Splash Potions

## 🔵 Mods


- ### 👨‍🏭 Mekanism

  - **Significantly** buff Tanks, Cubes and Bins
    > Because now Ultimate versions of this items cost very much

- ### 📑 Tips


## 🔄 Misc Changes

  - Tooltips for ![](https://git.io/Jcz37 "Large Inventory System Storage")![](https://git.io/Jcz3y "Medium Inventory System Storage")![](https://git.io/Jsw4f "Tiny Inventory System Storage")![](https://git.io/JczsW "Small Inventory System Storage")![](https://git.io/Jcz3H "Big Inventory System Storage")![](https://git.io/Jcz3S "Huge Inventory System Storage")![](https://git.io/Jcz3Q "Inventory System Storage Extended Warehouse")![](https://git.io/Jcz3d "Inventory System Storage Warehouse")![](https://git.io/Jcz39 "Enormous Inventory System Storage") and ![](https://git.io/JcCDd "Ultimate Tier Installer")
  - Update JEI blacklist
  - Update **Thaumic Speedup** cache
  - **Thaumcraft** Crystals skip mining level to default
  - **EndReborn** lower **End Guard** spawn
  - Fluid Drawer slightly buff




# 0.27

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/108/855/256/256/636375431792008840.png" width="50"> | [**Shoulder Surfing Reloaded**](https://www.curseforge.com/minecraft/mc-mods/shoulder-surfing-reloaded) <sup><sub>ShoulderSurfing-1.12.2-1.15.1.jar</sub></sup> <br> ShoulderSurfer Adapted to the latest versions | Latest version caused [lunch crash](https://github.com/Exopandora/ShoulderSurfing/issues/51). Also, shoulder view could be more handy for survival-oriented modpacks. In E2E precise clicking ask for first-person view.

## 🟡 Updated Mods

- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.652.jar</sub></sup>
- [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) <sup><sub>zenutils-1.8.2.jar</sub></sup>
- [**Atlas Lib**](https://www.curseforge.com/minecraft/mc-mods/atlas-lib) <sup><sub>Atlas-Lib-1.12.2-1.1.3d.jar</sub></sup>
- [**Tinkers' Evolution**](https://www.curseforge.com/minecraft/mc-mods/tinkers-evolution) <sup><sub>tconevo-1.12.2-1.0.44.jar</sub></sup>
- [**Hammer (Lib) Core**](https://www.curseforge.com/minecraft/mc-mods/hammer-lib) <sup><sub>HammerLib-1.12.2-2.0.6.27.jar</sub></sup>
- [**IC2 Patcher**](https://www.curseforge.com/minecraft/mc-mods/ic2-patcher) <sup><sub>ic2patcher-2.0.2.jar</sub></sup>
- [**Advanced Rocketry**](https://www.curseforge.com/minecraft/mc-mods/advanced-rocketry) <sup><sub>AdvancedRocketry-1.12.2-2.0.0-250-universal.jar</sub></sup>
- [**Mouse Tweaks**](https://www.curseforge.com/minecraft/mc-mods/mouse-tweaks) <sup><sub>MouseTweaks-2.10.1-mc1.12.2.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.15_mc1.12.2.jar</sub></sup>
- [**LagGoggles**](https://www.curseforge.com/minecraft/mc-mods/laggoggles) <sup><sub>undefined</sub></sup>
- [**Discord Integration Forge**](https://www.curseforge.com/minecraft/mc-mods/dcintegration) <sup><sub>dcintegration-forge-2.2.0-1.12.jar</sub></sup>
- [**FPS Reducer**](https://www.curseforge.com/minecraft/mc-mods/fps-reducer) <sup><sub>FpsReducer-mc1.12.2-1.20.jar</sub></sup>

## 🧩 Configs

- Hole Filler Mod fix free dirt

## ✏️ Recipes

  - ![](https://git.io/Jn5Zn "Cheese") now OreDicted
  - ![](https://git.io/Jn5ZV "Blaze Powder") from ![](https://git.io/Jn5Zz "Cinderpearl") recipe fix
  - ![](https://git.io/Jn5Zl "Black Quartz Large Plate") now pressed from 1 ![](https://git.io/Jn5Zc "Block of Black Quartz")
  - ![](https://git.io/JnzzL "Augment: Flux Reconstruction") now way harder because it could repair almost anything
  - ![](https://git.io/Jn5Z2 "Spectre String") x4 cheaper
  - ![](https://git.io/Jn5ZC "Potion of Extension") change ingredient
  - ![](https://git.io/Jnzzk "Graphite Ingot") and ![](https://git.io/JZYJu "Graphite Block") cant be melted into coal anymore
  - ![](https://git.io/JZviQ "Conduit Binder") now made in ![](https://git.io/J3hVU "Compost")
  - ![](https://git.io/Jn5ZB "Dough") now made in ![](https://git.io/Jn5ZE "Crushing Tub")
  - ![](https://git.io/Jn5Zg "Baguette") and ![](https://git.io/Jn5ZH "Toast") new crafts
  - Recipes OreDicted: 
    ![](https://git.io/Jn5ZF "Pizza") 
    ![](https://git.io/Jn5ZR "Big Cookie") 
    ![](https://git.io/Jn5Z0 "Chocolate Cake")
  - Cheaper:
    ![](https://git.io/Jn5Zu "Experience Rod")
    ![](https://git.io/Jn5ZW "Experience Obelisk")
    ![](https://git.io/Jnzzq "Trial Keystone")

## 📖 Quest Book

  - Quests changes

## 🔵 Mods


- ### 🌿 Patchouli

  - Automatic lootbox page updates

- ### 🍃 Botania

  - 6 Relics tooltips

- ### 🔨 Tinker's Construct

  - TinkersEvolution: `disableDamageCutoff=true`, `meltSpeedMultiplier=2`
  - Some tweaks and changes
    > - ![](https://git.io/Jn5Z8 "Fire Dragonsteel Ingot") and ![](https://git.io/Jn5Za "Ice Dragonsteel Ingot") nerf about 15%
    > - ![](https://git.io/Jn5Z4 "Soularium Ingot") durability 25% nerf
    > - ![](https://git.io/JtURG "Aquamarine") nerf mining speed
    > - [Gelid Enderium Ingot] and [Gelid Gem] x2 buffs
  - New trait **Apprentice**, tweaks for **Mentor** (WIP)
    > **Apprentice** - new armor trait. Stackable.
    > Each part add `damage / 10` experience on being hurt,
    > but deals 10% more damage for wielder
    > 
    > **Mentor** still have WIP math for calculating damage / xp
    > 
    > Also, fixes new line and color for custom traits description
  - **Spectre** trait now stackable
    > This trait add **Reach** potion effect level on player each 80 ticks for
    > each armor part with this trait and each main/offhand
    > tool part.

- ### 🗃️ Loot tables

  - Tank as reward: increase liquid amount from 16b to 24b

- ### 🛸 EnderIO

  - Buff packed Solar panels
    > Now they produce up to 3M rf/t
  - Disable [Death Urn]
  - Signif. buff Inventory Storage

- ### ⚙️ JAOPCA

  - Fix blacklist (most unused items removed)

- ### 🗂️ Additional Compression

  - Fix conflicts and nerf burn time

- ### 🏦 Modular Machinery

  - Remove **Advanced Metallurgic Fabricator**
    > Metallurgic fabricator was barely unused any progression style i know.
    > Recipes moved to ![](https://git.io/JGGjU "Electric Arc Furnace"), becase it look similar.
    > Also this could help AdvRcoketry to have more recipes.

- ### 🧻 JEI

  - Add tags **#Crafter** and **#Repairer**

## 🔄 Misc Changes

- MineMenu: Tool Belt and Night Vision
- Misc: Remove Emerald `found in ...` tooltip
- Automatic `/bq_admin default load` and `/bqs_loot` commands on player log in



# 0.26

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/152/846/256/256/636614472137003477.png" width="50"> | [**Thaumic Additions: Reconstructed**](https://www.curseforge.com/minecraft/mc-mods/thaumic-additions) <sup><sub>ThaumicAdditions-1.12.2-12.6.7.jar</sub></sup> <br> Meet new neat and handy features to Thaumcraft VI | Test add for better Essentia Jars and other cool stuff
<img src="https://media.forgecdn.net/avatars/thumbnails/166/444/256/256/636697974870138158.png" width="50"> | [**Redstone Repository Revolved**](https://www.curseforge.com/minecraft/mc-mods/redstone-repository-revolved) <sup><sub>RedstoneRepository-1.12.2-1.4.0-dev-universal.jar</sub></sup> <br> An addon to Redstone Arsenal | New materials for TCon, all and armor disabled (except baubles)
<img src="https://media.forgecdn.net/avatars/thumbnails/358/827/256/256/637520208754289091.png" width="50"> | [**SneedASM**](https://www.curseforge.com/minecraft/mc-mods/sneedasm) <sup><sub>loliasm-2.5.jar</sub></sup> <br> Yet another crazy optimization mod - powered by ****s | Should lower memory usage
<img src="https://media.forgecdn.net/avatars/thumbnails/385/440/256/256/637573099313673556.png" width="50"> | [**ExtraCells2 - SamLam140330's Fork**](https://www.curseforge.com/minecraft/mc-mods/extracells2-samlam140330s-fork) <sup><sub>ExtraCells-1.12.2-2.6.7.jar</sub></sup> <br> Giving you more ME storage cells and some other stuff for Applied Energistics 2 | Fork, Replace old Extra Cells mod
<img src="https://media.forgecdn.net/avatars/thumbnails/265/6/256/256/637228246468007633.png" width="50"> | [**xXx_MoreToolMats_xXx (a PlusTiC fork without the evil, and apparently some new bugs idk)**](https://www.curseforge.com/minecraft/mc-mods/plusticminusbad) <sup><sub>plustic-8.0.3.jar</sub></sup> <br> Minecraft mod for adding new tools to and integrating various mods with Tinkers Construct | Replace PlusTic
<img src="https://media.forgecdn.net/avatars/thumbnails/45/75/256/256/636039358080536200.png" width="50"> | [**Hammer (Lib) Core**](https://www.curseforge.com/minecraft/mc-mods/hammer-lib) <sup><sub>HammerLib-1.12.2-2.0.6.26.jar</sub></sup> <br> Library used by all of DragonForge team's mods. | Lib for Thaumic Additions

<br>

## 🟡 New but disabled mods
This mods should be manually enabled by players, if they want to play with **Refined Storage**.  
Crafts still tweaked.

Icon | Summary 
----:|:--------
<img src="https://media.forgecdn.net/avatars/thumbnails/198/539/256/256/636900690640301258.png" width="50"> | [**RSInfiniteWireless**](https://www.curseforge.com/minecraft/mc-mods/rsinfinitewireless) <sup><sub>rsinfinitewireless-1.2.jar</sub></sup> <br> Adds back the Infinite Wireless Transmitter ! | 
<img src="https://media.forgecdn.net/avatars/thumbnails/179/817/256/256/636789115663061246.png" width="50"> | [**Refined Storage: Requestify**](https://www.curseforge.com/minecraft/mc-mods/rs-requestify) <sup><sub>refinedstoragerequestify-1.12.2-1.0.2-3.jar</sub></sup> <br> Keep you refined storage stocked with crafteable items | 
<img src="https://media.forgecdn.net/avatars/thumbnails/37/507/256/256/635952629598958912.png" width="50"> | [**Refined Storage**](https://www.curseforge.com/minecraft/mc-mods/refined-storage) <sup><sub>refinedstorage-1.6.16.jar</sub></sup> <br> An elegant solution to your hoarding problem. | 
<img src="https://media.forgecdn.net/avatars/thumbnails/251/626/256/256/637184819329731874.png" width="50"> | [**Refined Storage Large Patterns**](https://www.curseforge.com/minecraft/mc-mods/rslargepatterns) <sup><sub>RSLargePatterns-1.12.2-1.0.0.1.jar</sub></sup> <br> The dream of automation realized. Again. | 
<img src="https://media.forgecdn.net/avatars/thumbnails/106/273/256/256/636358693065137736.png" width="50"> | [**Refined Storage Addons**](https://www.curseforge.com/minecraft/mc-mods/refined-storage-addons) <sup><sub>refinedstorageaddons-0.4.5.jar</sub></sup> <br> An addon mod for Refined Storage. | 

<br>

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/317/984/256/256/637423606351535331.png" width="50"> | [**Better Questing Tweaker (BQTweaker)**](https://www.curseforge.com/minecraft/mc-mods/bqtweaker) <sup><sub>BQTweaker-1.1.0.jar</sub></sup> <br> Tweaker mod to change some aspects of BetterQuesting | Not updated with latest BQ versions, that caused messed up text aligment
<img src="https://media.forgecdn.net/avatars/thumbnails/53/26/256/256/636121064554051162.png" width="50"> | [**Spartan Shields**](https://www.curseforge.com/minecraft/mc-mods/spartan-shields) <sup><sub>SpartanShields-1.12.2-1.5.4.jar</sub></sup> <br> Needing more Shields in Minecraft? You've come to the right place! | Barely unused mod
<img src="https://media.forgecdn.net/avatars/thumbnails/232/533/256/256/637066773825345434.png" width="50"> | [**Creative Block Replacer**](https://www.curseforge.com/minecraft/mc-mods/creative-block-replacer) <sup><sub>creativeblockreplacer_1.12.2-1.4.jar</sub></sup> <br> Allows easy switching in between placing and replacing blocks in creative mode. | More annoying than useful
<img src="https://media.forgecdn.net/avatars/thumbnails/89/502/256/256/636231887954920121.png" width="50"> | [**Bad Wither No Cookie - Reloaded**](https://www.curseforge.com/minecraft/mc-mods/bad-wither-no-cookie-reloaded) <sup><sub>badwithernocookiereloaded-1.12.2-3.4.18.jar</sub></sup> <br> Localizes the wither and dragon attacking sounds. | **RandomTweaks** can give same option without separate mod
<img src="https://media.forgecdn.net/avatars/thumbnails/188/167/256/256/636843585210544210.png" width="50"> | [**Probe**](https://www.curseforge.com/minecraft/mc-mods/probe) <sup><sub>probe-0.1.24.jar</sub></sup> <br> Dump information to .zsrc file for vscode plugin. | No more used in Dev. Never appeared in release anyway.

## 🟡 Updated Mods

- [**Botania**](https://www.curseforge.com/minecraft/mc-mods/botania) <sup><sub>Botania r1.10-364.4.jar</sub></sup>
- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.647.jar</sub></sup>
- [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) <sup><sub>zenutils-1.8.1.jar</sub></sup>
- [**Fluid Drawers**](https://www.curseforge.com/minecraft/mc-mods/fluid-drawers) <sup><sub>fluiddrawers-1.12.2-1.0.6.jar</sub></sup>
- [**ContentTweaker**](https://www.curseforge.com/minecraft/mc-mods/contenttweaker) <sup><sub>ContentTweaker-1.12.2-4.10.0.jar</sub></sup>
- [**Minor Integrations and Additions (MIA)**](https://www.curseforge.com/minecraft/mc-mods/minor-integrations-and-additions-mia) <sup><sub>mia-1.12.2-0.2.1a.jar</sub></sup>
- [**Atlas Lib**](https://www.curseforge.com/minecraft/mc-mods/atlas-lib) <sup><sub>Atlas-Lib-1.12.2-1.1.3c.jar</sub></sup>
- [**Tinkers' Evolution**](https://www.curseforge.com/minecraft/mc-mods/tinkers-evolution) <sup><sub>tconevo-1.12.2-1.0.42.jar</sub></sup>
- [**Gas Conduits**](https://www.curseforge.com/minecraft/mc-mods/gas-conduits) <sup><sub>EnderIO-conduits-mekanism-1.12.2-5.3.70.jar</sub></sup>
- [**Foam​Fix**](https://www.curseforge.com/minecraft/mc-mods/foamfix-optimization-mod) <sup><sub>foamfix-0.10.14-1.12.2.jar</sub></sup>
- [**MixinBooter**](https://www.curseforge.com/minecraft/mc-mods/mixin-booter) <sup><sub>mixinbooter-2.0.jar</sub></sup>
- [**Ender IO Endergy**](https://www.curseforge.com/minecraft/mc-mods/ender-io-endergy) <sup><sub>EnderIO-endergy-1.12.2-5.3.70.jar</sub></sup>
- [**Ender Tweaker**](https://www.curseforge.com/minecraft/mc-mods/endertweaker) <sup><sub>EnderTweaker-1.12.2-1.2.2.jar</sub></sup>
- [**LootTweaker**](https://www.curseforge.com/minecraft/mc-mods/loottweaker) <sup><sub>LootTweaker-0.3.0+MC1.12.2.jar</sub></sup>
- [**NuclearCraft**](https://www.curseforge.com/minecraft/mc-mods/nuclearcraft-mod) <sup><sub>NuclearCraft-2.18z-1.12.2.jar</sub></sup>
- [**MTLib**](https://www.curseforge.com/minecraft/mc-mods/mtlib) <sup><sub>MTLib-3.0.7.jar</sub></sup>
- [**CraftTweaker Integration**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker-integration) <sup><sub>ctintegration-1.8.0.jar</sub></sup>
- [**CreativeCore**](https://www.curseforge.com/minecraft/mc-mods/creativecore) <sup><sub>CreativeCore_v1.10.61_mc1.12.2.jar</sub></sup>
- [**ModTweaker**](https://www.curseforge.com/minecraft/mc-mods/modtweaker) <sup><sub>modtweaker-4.0.19.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.14_mc1.12.2.jar</sub></sup>
- [**Ender IO**](https://www.curseforge.com/minecraft/mc-mods/ender-io) <sup><sub>EnderIO-1.12.2-5.3.70.jar</sub></sup>
- [**Thaumic Augmentation**](https://www.curseforge.com/minecraft/mc-mods/thaumic-augmentation) <sup><sub>ThaumicAugmentation-1.12.2-2.1.1.jar</sub></sup>
- [**Reborn Core**](https://www.curseforge.com/minecraft/mc-mods/reborncore) <sup><sub>RebornCore-1.12.2-3.19.5-universal.jar</sub></sup>

## 🧩 Configs

- Random Tweaks
  > - `disableWitherSpawnSound=true`
  > - `nearbyMonsterGlowParticles=true`
- Scaling Feast: Fix losing hunger under 20, mixed tweaks

## ✏️ Recipes

- 
  > ---------
  > Harder:
  > - ![](https://git.io/JZYfG "EFLN")
  >   ![](https://git.io/JZYf8 "Glowing Chorus Fruit")
  >   ![](https://git.io/JZYf0 "Electric Pump")
  >   ![](https://git.io/JZYfB "Blue Slimy Mud")
  >   ![](https://git.io/JsTPR "Starmetal Laser Medium")
  >   ![](https://git.io/JZLjz "Aethium Armor Trim")
  >   ![](https://git.io/Jse6m "Flux Capacitor (Basic)")
  >   ![](https://git.io/JGncp "Ender Book")
  >   ![](https://git.io/J3xSv "Tank")
  >   ![](https://git.io/JZYfJ "Dimensional Blend")
  >   ![](https://git.io/JZYvx "Base Crafting Seed")
  >   ![](https://git.io/JZYfI "Player Simulator")
  >   ![](https://git.io/JZYfY "Mechanical User")
  >   ![](https://git.io/JZYv5 "Empowered Void Crystal Block")
  >   ![](https://git.io/JZYf3 "Diamond Hammer")
  >   ![](https://git.io/JZYfe "Auto Compressed Hammer")
  >   ![](https://git.io/JZYfn "Pulsating Crystal")
  >   ![](https://git.io/JZYvh "Draconium Infused Obsidian")
  >   ![](https://git.io/JZYfu "Experience Pylon")
  >   ![](https://git.io/JZLjE "Empty Sack of Holding")
  >   ![](https://git.io/JOGz9 "Pressurized Tank")
  >   ![](https://git.io/JGGh5 "Advanced Machine Structure")
  >   ![](https://git.io/JGGjs "User Interface")
  >   ![](https://git.io/JZYvp "Black Quartz Block")
  >   ![](https://git.io/J3p8H "Lens of the Miner")
  >   ![](https://git.io/Jsw8A "Small Storage Crate")
  >   ![](https://git.io/JZYvb "Chest To Storage Crate Upgrade")
  >   ![](https://git.io/JZYff "Vertical Digger")
  >   ![](https://git.io/JZYfl "Casing")
  >   ![](https://git.io/JGGje "Basic Circuit Plate")
  >   ![](https://git.io/JGGjI "Advanced Circuit Plate")
  >   ![](https://git.io/JGGjO "Silicon Boule")
  > - ![](https://git.io/JGGh7 "Mana Infused Ingot") now only obtainable through [fluid:Primal Mana] interaction
  > 
  > ---------
  > Cheaper:
  > - ![](https://git.io/JGGjL "Intricate Circuit Board")
  >   ![](https://git.io/JZYf4 "Fluidic Plenisher")
  >   ![](https://git.io/JZYvj "Machine Circuitry")
  >   ![](https://git.io/Jst3a "Shape Card (Quarry)")
  >   ![](https://git.io/JZYfU "Blutonium Ingot")
  >   ![](https://git.io/Jsw8N "Crafting Interface")
  >   ![](https://git.io/JGGjm "Black Hole Unit")
  >   ![](https://git.io/JZLju "Laser Drill")
  >   ![](https://git.io/JGGjZ "Replicator")
  >   ![](https://git.io/JZYvd "Heat-Capacity Reactor Plating")
  >   ![](https://git.io/JZYvF "Containment Reactor Plating")
  >   ![](https://git.io/JGGjJ "Basic Capacitor")
  >   ![](https://git.io/JZYfT "Organic Brown Dye")
  >   ![](https://git.io/Jsw8h "Draconium Chest")
  >   ![](https://git.io/JZYfL "Bound Dislocator (Point to Point)")
  >   ![](https://git.io/JZYvA "Bound Dislocator (Player)")
  >   ![](https://git.io/JZYJ4 "Gaia Spirit Ingot")
  >   ![](https://git.io/JZYfw "Ender Casing")
  >   ![](https://git.io/JZYfR "Rune of Water")
  >   ![](https://git.io/JGGhN "Rune of Fire")
  >   ![](https://git.io/JZYf2 "Rune of Earth")
  >   ![](https://git.io/JZYfO "Rune of Air")
  >   ![](https://git.io/JZYfk "Rune of Spring")
  >   ![](https://git.io/JZYfW "Rune of Summer")
  >   ![](https://git.io/JZYfq "Rune of Autumn")
  >   ![](https://git.io/JZYfm "Rune of Winter")
  >   ![](https://git.io/JZYfg "Rune of Mana")
  > - [Advanced Carpenter]
  > 
  > ---------
  > Changed:
  > - ![](https://git.io/J3xSv "Tank") => ![](https://git.io/JmVvt "Omnivoir") changed all occurances
  > - ![](https://git.io/JOGrV "Block of Enderpearl") no more meltable in smeltery
  > - ![](https://git.io/Jsw8p "Cake") stackable x64
  > - ![](https://git.io/Jsw4i "Slightly-Larger Chest") now become "compressed chest"
  > - ![](https://git.io/JZYfU "Blutonium Ingot") castable in smeltery
  > - ![](https://git.io/JOGz2 "Pulverizer (Basic)") no more required ![](https://git.io/JsfOp "White Sand")
  > - [Hearty Shank] recipe removed. Obtain in loot
  > - ![](https://git.io/JZYJu "Graphite Block") from ![](https://git.io/JZYJB "Block of Charcoal") in ![](https://git.io/J3xyb "Alloy Smelter")
  > - ![](https://git.io/Jst3B "Crystal Memory") now can be crafted with predefined recipes
  > - ![](https://git.io/JZYfv "Tiny Pile of Plutonium") and ![](https://git.io/JGGhF "Plutonium") now recycleable into ![](https://git.io/JZYJR "Uranium-235")
  > - ![](https://git.io/JZYJE "Block of Coal Coke") in ![](https://git.io/JsTPV "Augment: Pyrolytic Conversion") craft time fix
  > - ![](https://git.io/JGGjY "Concrete Trapdoor") added craft
  > - ![](https://git.io/Jsw4J "Basic Coil") and ![](https://git.io/JZYfV "Advanced Coil") in ![](https://git.io/JGGjv "Precision Assembler")
  > - ![](https://git.io/JZYJV "QuantumSuit Bodyarmor") recycle give only 1 ingot
  > - ![](https://git.io/J3xy3 "NanoSuit Bodyarmor") fix recycle
  > - ![](https://git.io/JZYfE "Mending Moss") can be filled in ![](https://git.io/JmVeA "Fluid Tank")
  > - ![](https://git.io/JZYJw "Sawdust") remove from Hammering
  > - ![](https://git.io/JZYvN "Machine Frame") now require ![](https://git.io/JZYJ0 "Cooked Meat Ingot")

## 📖 Quest Book

- Space Suit add to mobs spawning, add TA void boots
- Other Quests changes

## 🌍 World Generation

- ![](https://git.io/JZYfa "Dilithium Ore") x7 times rarely in Solar System
- Disable 122 Kepler 0118 liquids replacing
  > Replacing works fine, but after recent AdvRocketry update, each block
  > was replaces into Boron-11, so planet looks like Boron mountains
- Disable Seaweed on **118 KELT-2ab**, stalactite changes on **123 Kepler_0119**

## 🔵 Mods

- ### ☢️ NuclearCraft

  - ![](https://git.io/JOija "Lapis Lazuli") nerf 25% active cooling
    > Unlikely other active coolers, lapis melts into 666mb,
    > that makes it very cheap comparing to other.

- ### ⛽ Advanced Generators

  - ![](https://git.io/Jsw4X "Heat Exchanger Controller") Buff steam output, add more sources:
    > Added working with:
    > - [fluid:pyrotheum]
    > - [fluid:fire_water]
    > - [fluid:enrichedlava]
    > - [fluid:distwater]
    > - [fluid:ic2hot_water]
    > - [fluid:ic2distilled_water]

- ### 🌡️ Thermal Expansion

  - Redstone Repository: Nerf main ingredients crafts

- ### 🌿 Patchouli

  - Remove Patches and redundant info

- ### 🍃 Botania

  - ![](https://git.io/JZYfs "Endoflame") Decay in one hour (turn into dead bush)

- ### 🏪 Requious Fracto

  - JEI for ![](https://git.io/Jsw4X "Heat Exchanger Controller")
  - JEI for ![](https://git.io/JGGj3 "Petro Petunia")

- ### 🐀 Rats

  - Rats Spawn Like Animals
    > Should fix rapid Rat spawning when AS **Lucerna** ritual active  
    > Usually, there is ~400 rats around it

- ### 🐝 Forestry

  - Remove Trees from spawning, update their JER

- ### 👨‍🏭 Mekanism

  - ![](https://git.io/JZYfZ "Ultimate Bin") buff and other Bins
  - ![](https://git.io/JGGhd "Cardboard Box") Spawner Content tooltip
  - Nerf Pump - x10 consumption
    > Pump is too fast and too strong. Basically it fastest and efficient pump in pack  
    > Also it have huge radius - 80 blocks - to drain entire Nether

- ### 🔨 Tinker's Construct

  - From **Aethium** material only ![](https://git.io/JZLjz "Aethium Armor Trim") gives flight
  - TconEvo New liquids and materials, other mix tweaks
  - ![](https://git.io/Jsmfs "Heart Dust") as Conarm Speed Modifier instead Redstone
  - ![](https://git.io/JGncx "Osgloglas Ingot") Buff stats, but remove 2 traits
    > **Global Traveler** and **Brown Magic** removed
  - ![](https://git.io/JZYU3 "Fire Resistance") ![](https://git.io/Jtd0k "Projectile Resistance") ![](https://git.io/Jtd0J "Blast Resistance") only uses one slot
    > Also add tooltips to Resistant Modifiers

- ### 🗃️ Loot tables

  - Add ME Storage Cells to Loot Boxes, add [Hearty Shank]
  - Loot Tweaks
    > - ![](https://git.io/Jsw46 "Sapphire") add to dragon lairs
    > - ![](https://git.io/Jtyd1 "Sapphire") remove from loot
    > - ![](https://git.io/JsvC6 "Impulsion Wand") add to AS shrines

- ### 🔩 RFTools

  - Round Environmental Modules values from epsilons

- ### 💼 Actually Additionals

  - ![](https://git.io/J3p8H "Lens of the Miner") Nerf
    > Now it can only 5 types of Nether Ores and
    > 9 types of Overworld Ores.
    > See JEI for details.
  - [Deathworm Chitin] Add to ![](https://git.io/JZYfz "Ball of Fur")

- ### 📭 Storage Drawers

  - Add Sealed content Tooltip
  - ![](https://git.io/JZYfC "Sand") -> [Compressed Sand] prefferable for compacting (instead Sandstone)

- ### 🌸 Industrial Foregoing

  - x10 - x100 energy consumption
    > Some machines was best machines in pack, like ![](https://git.io/JtNTy "Plant Gatherer")
    > but still have too low consumption (from 10 RF/t).  
    > Through, most low-tech machines would keep same low RF rate, like ![](https://git.io/JZYft "Dye Mixer")

- ### 🧻 JEI

  - Update item blacklist, Remove ![](https://git.io/JZYfc "Recycler") category
  - Add TAGS to items `##Flight`

## 🔄 Misc Changes

- ![](https://git.io/JLhpD "Blasted Coal") Buff burn time
- MineMenu: `Put On Wall` key
- Buff ![](https://git.io/J3xSv "Tank") up to 24 buckets/block
- JER: Update The End
- Merchant new trades (WIP)






# 0.25

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/239/522/256/256/637114384686820957.png" width="50"> | [**Performant**](https://www.curseforge.com/minecraft/mc-mods/performant) <sup><sub>performant-1.12.2-1.10.jar</sub></sup> <br> Lag begone! Increases Performance, less entity lag less rubberbanding, more players on the server | Probably should reduce some lags. Need tests
<img src="https://media.forgecdn.net/avatars/thumbnails/258/376/256/256/637207865258153609.png" width="50"> | [**Scaling Feast**](https://www.curseforge.com/minecraft/mc-mods/scaling-feast) <sup><sub>scalingfeast-1.7.0.jar</sub></sup> <br> A simple, balanced way to increase your maximum hunger | Something interesting, for tests
<img src="https://media.forgecdn.net/avatars/thumbnails/362/336/256/256/637529092874107816.png" width="50"> | [**Atlas Lib**](https://www.curseforge.com/minecraft/mc-mods/atlas-lib) <sup><sub>Atlas-Lib-1.12.2-1.1.2.jar</sub></sup> <br> A library for shared code between minecraft mods. | Lib for **Blood Smeltery**
<img src="https://media.forgecdn.net/avatars/thumbnails/372/357/256/256/637543356508059182.png" width="50"> | [**Uber Conduit Probe**](https://www.curseforge.com/minecraft/mc-mods/uber-conduit-probe) <sup><sub>uberconduitprobe-1.0.1.jar</sub></sup> <br> No more clicking on 1000 conduit connections | Cool tool
<img src="https://media.forgecdn.net/avatars/thumbnails/310/991/256/256/637400908142738750.png" width="50"> | [**BilingualName**](https://www.curseforge.com/minecraft/mc-mods/bilingualname) <sup><sub>bilingualname-1.2.jar</sub></sup> <br> show items' Engilish Name as tooltip | Help with localized clients
<img src="https://media.forgecdn.net/avatars/thumbnails/376/298/256/256/637552466801290064.png" width="50"> | [**Blood Smeltery**](https://www.curseforge.com/minecraft/mc-mods/blood-smeltery) <sup><sub>Blood-Smeltery-1.12.2-1.1.1.jar</sub></sup> <br> A Blood Magic addon that allows automation via the TConstruct Smeltery | Blood magic need more integrations. This could help.

## 🟡 Updated Mods

Name|File
----|----
[**Surge**](https://www.curseforge.com/minecraft/mc-mods/surge) | <sup><sub>Surge-1.12.2-2.0.79.jar</sub></sup>
[**AttributeFix**](https://www.curseforge.com/minecraft/mc-mods/attributefix) | <sup><sub>AttributeFix-1.12.2-1.0.10.jar</sub></sup>
[**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) | <sup><sub>CraftTweaker2-1.12-4.1.20.646.jar</sub></sup>
[**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) | <sup><sub>zenutils-1.8.0.jar</sub></sup>
[**Just Enough Items (JEI)**](https://www.curseforge.com/minecraft/mc-mods/jei) | <sup><sub>jei_1.12.2-4.16.1.302.jar</sub></sup>
[**Precision Mining**](https://www.curseforge.com/minecraft/mc-mods/precision-mining) | <sup><sub>miningspeed2-1.7.jar</sub></sup>
[**Advanced Rocketry**](https://www.curseforge.com/minecraft/mc-mods/advanced-rocketry) | <sup><sub>AdvancedRocketry-1.12.2-2.0.0-248-universal.jar</sub></sup>
[**CreativeCore**](https://www.curseforge.com/minecraft/mc-mods/creativecore) | <sup><sub>CreativeCore_v1.10.58_mc1.12.2.jar</sub></sup>
[**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) | <sup><sub>LittleTiles_v1.5.8_mc1.12.2.jar</sub></sup>
[**Just Enough Calculation**](https://www.curseforge.com/minecraft/mc-mods/st-enough-calculation) | <sup><sub>JustEnoughCalculation-1.12.2-3.2.6.jar</sub></sup>
[**/dank/null**](https://www.curseforge.com/minecraft/mc-mods/dank-null) | <sup><sub>zz_DankNull-1.12.2-1.7.101.jar</sub></sup>
[**JAOPCA**](https://www.curseforge.com/minecraft/mc-mods/jaopca) | <sup><sub>JAOPCA-1.12.2-2.2.8.105.jar</sub></sup>

## ✏️ Recipes

  Harder:
  - ![](https://git.io/J3xyN "Spawner Changer")
    ![](https://git.io/Jsmvp "Coal Generator")
    ![](https://git.io/J3xyj "Speed Charm")
    ![](https://git.io/Jsmvj "Water Candle")
    ![](https://git.io/Jsmvh "Item Conduit")
    ![](https://git.io/J3p0w "Flat Transfer Node (Items)")
    ![](https://git.io/J3p0r "Flat Transfer Node (Fluids)")
    ![](https://git.io/Jsmfk "Glass Fiber Wire Relay")
    ![](https://git.io/JqUJV "Mechanical Squeezer")
    ![](https://git.io/JmVvI "Dynamic Tank")
    ![](https://git.io/JmVeQ "Structural Glass")
    ![](https://git.io/JsmfJ "Syringe")
    ![](https://git.io/JsmvA "Charged Porter")
    ![](https://git.io/Jsmfq "Advanced Charged Porter")
    ![](https://git.io/Jsmfs "Heart Dust")
    ![](https://git.io/Jse6m "Flux Capacitor (Basic)")
    ![](https://git.io/JsmfZ "Flux Capacitor (Hardened)")
    ![](https://git.io/Jsmvb "Flux Capacitor (Reinforced)")
    ![](https://git.io/Jsmfe "Flux Capacitor (Signalum)")
    ![](https://git.io/JsmfO "Flux Capacitor (Resonant)")
  
  Cheaper
  - ![](https://git.io/Jsmfv "Dark Steel Upgrade Empowered")
    ![](https://git.io/J3pcV "Netherstar Generator")
    ![](https://git.io/JsmfL "Redstone Engineering Block")
    ![](https://git.io/J3JZF "Mob Slaughter Factory")
    ![](https://git.io/J3hV0 "Crushing Block")
    ![](https://git.io/J3xyF "Universal Bin")
    ![](https://git.io/JsmfY "Screen Controller")
    ![](https://git.io/JsmfG "Booster")
    ![](https://git.io/Jtydj "Elevator")
    ![](https://git.io/Jsmfn "Creative Storage Upgrade")
    ![](https://git.io/JsmfU "Void Seed")
    ![](https://git.io/JOKc6 "Plate of Unsealing")
  
  Other:
  - ![](https://git.io/JsmfT "Fishing Spear") add recipe (because snow villages is disabled)
  - ![](https://git.io/J3p4Z "Glitch Infused Chestplate") Set recycle
  - ![](https://git.io/J3xy3 "NanoSuit Bodyarmor") Set recycle
  - ![](https://git.io/JOG2B "Iron Turbine") Fix rotor dupe
  - ![](https://git.io/Jsmfm "Akashic Tome") add **End Reborn**
  - ![](https://git.io/JtJGS "Compressed Cobblestone") => [Compressed Stone] in ![](https://git.io/J3xyb "Alloy Smelter")
  - ![](https://git.io/Jsmff "Copper Coil Block") cant be smelted in ![](https://git.io/JOGz0 "Magma Crucible (Basic)") anymore
  - ![](https://git.io/JsvPH "Refined Obsidian Ingot") & ![](https://git.io/JsvPj "Glowstone Ingot") melt in ![](https://git.io/JOGz0 "Magma Crucible (Basic)")
  - ![](https://git.io/Jt342 "Morphing Tool") add ![](https://git.io/JsmfI "Cheese Staff") and ![](https://git.io/Jsmft "Dragon Command Staff")
  - ![](https://git.io/J3xFv "Block of Prosperity") remove crafting table recipe
  - ![](https://git.io/JsmvN "Granite Pavement") and all other pavements remove (conflicted with compressed)
  - ![](https://git.io/J3xSe "Primordial Pearl") add alt recipe

## 📖 Quest Book

  - **RFTools** chapter rework
  - **Lens of miner**, **Flat Nodes**, and other additions
  - **Psi** gate require both Programmer and Constructor
  - **Dolls** in TE quest reward
  - **Hypoinfuser** quest
  - Fix **TwiForst** open quest

## 🌍 World Generation

- Disable **Forestry** trees to spawn
- Add **BoP gem ore** back, but extremely rare, update JER

## 🔵 Mods


- ### 🌡️ Thermal Expansion

  - Disable ![](https://git.io/JOGgv "Petrotheum Dust")/![](https://git.io/JOGzj "Pyrotheum Dust") shapelesses crush/smelt

- ### 🏪 Requious Fracto

  - JEI for ![](https://git.io/J3p8H "Lens of the Miner"), more Liq. Interacs
    > - JEI shows **Thermal Expansion** fluids affect on world
    > - Chances of output for **Infernal Furnace**

- ### 🐉 Ice and Fire

  - Remove **Snow Willages** and ![](https://git.io/Jtyd1 "Sapphire")
    > It was nice try to see how they could integrate into modpack.  
    > But actually, villages are boring, trades are too simple and couldnt
    > tweaked. Sapphire have no actual advantages.

- ### 👨‍🏭 Mekanism

  - ![](https://git.io/J3pca "Atomic Disassembler") increase consumption
    > - x20 Capacity
    > - x20 consumption as weapon and hoe
    > - x100 consumption as tool

- ### 📑 Tips

  - Remove outdated tips, rearrange, colors, automation

- ### 🔨 Tinker's Construct

  - ![](https://git.io/Jt8wf "Primal Metal Ingot") and ![](https://git.io/JsmUJ "Void Metal Ingot") Buff, remap mining levels
    > IMPORTANT: Something broke TCon mining levels.  
    > From version 0.24 all levels are dropped to default. Would be fixed next patches.

- ### 🦯 Thaumcraft

  - ![](https://git.io/J3xy7 "Hardened Ice") Add aspects

- ### 🛢️ Immersive Engineering

  - Fix **Industrial Wires** conversion rate

- ### 💼 Actually Additionals

  - Fix ![](https://git.io/JsewW "Lens of Color") conversions
    > Before, lens would give acces to free ![](https://git.io/JOija "Lapis Lazuli") from, basically, flowers.  
    > Now Lens accept __any__ ore-dicted dyes, but output only last ones
    > (mostly Artificial Dyes)
  - Remove ![](https://git.io/J3p84 "Yellorite Ore") from ![](https://git.io/J3p8H "Lens of the Miner")

- ### 🏦 Modular Machinery

  - Remove **Armor Foundry**
    > It was intended to remove lot of microcraftings, but when
    > modpack removes more and more vanilla-like armor, there
    > is too few armor sets left

- ### 🍁 Rustic

  - Speedup ![](https://git.io/Jsmvx "Brewing Barrel") x2

- ### 🚄 Vaultopic

  - ![](https://git.io/Jsmf3 "V.I.C.E. (Vaultopic Item Crafting Entity)") Buff range x2

- ### 👿 Extra Utilities 2

  - ![](https://git.io/J3pcV "Netherstar Generator") nerf output x4, add 9 other recipes

- ## 🚀 Advanced Rocketry

  - Restore ![](https://git.io/JsmU3 "Solar Generator") buff (2500 RF/t)

- ## 🧙‍♂️ Cyclic

  - Increase ![](https://git.io/J3xyA "Magma Anvil") consumption x2

- ## 🧻 JEI

  - Add TAGS to items
    > Write `##` is JEI to see all of them, or specify:
    > - `##Generator`
    > - `##Chunkloader`
    > - `##User`
    > - `##Miner`
    > - `##Voidminer`
    > - `##Hopper`
    > - `##Tank`
    > Tip: in JEI `Search Options`, switch `#Tooltip` to `require_prefix`




# 0.24

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/255/920/256/256/637203370124735161.png" width="50"> | [**Converting Industrial Wires**](https://www.curseforge.com/minecraft/mc-mods/converting-industrial-wires) <sup><sub>IndustrialWires-1.7-39.jar</sub></sup> <br> Industrial Wires but with energy conversion|IE-like wires that can convers RF <-> EU as alternative for Mek Cables
<img src="https://media.forgecdn.net/avatars/thumbnails/347/586/256/256/637497633208268539.png" width="50"> | [**Hand Over Your Items**](https://www.curseforge.com/minecraft/mc-mods/hand-over-your-items) <sup><sub>handoveryouritems_1.12.2-1.2.jar</sub></sup> <br> Adds to ability for in-game players to give each other itemstacks without dropping/tossing them.|Because i tired to throw items on ground in MP
<img src="https://media.forgecdn.net/avatars/thumbnails/281/832/256/256/637286891950950069.png" width="50"> | [**End: Reborn**](https://www.curseforge.com/minecraft/mc-mods/end-reborn) <sup><sub>EndReborn [0.3.9].jar</sub></sup> <br> Some additions to the End|Need more content in End
<img src="https://media.forgecdn.net/avatars/thumbnails/226/207/256/256/637043945277684575.png" width="50"> | [**Nether Portal Spread**](https://www.curseforge.com/minecraft/mc-mods/nether-portal-spread) <sup><sub>netherportalspread_1.12.2-5.1.jar</sub></sup> <br> Spreads (nether) blocks to the overworld around nether and immersive portals in a configurable radius.|Cool looking and used as new crafting mechanic
<img src="https://media.forgecdn.net/avatars/thumbnails/228/615/256/256/637051309921730731.png" width="50"> | [**Crying Ghasts**](https://www.curseforge.com/minecraft/mc-mods/crying-ghasts) <sup><sub>cryingghasts_1.12.2-1.3.jar</sub></sup> <br> Ghasts drop their tears periodically when a player is close, allowing sustainable farming.|Makes Ghast Farming less grindy
<img src="https://media.forgecdn.net/avatars/thumbnails/237/397/256/256/637099926834713588.png" width="50"> | [**Condition Overload**](https://www.curseforge.com/minecraft/mc-mods/condition-overload) <sup><sub>conditionoverload-1.1.0.jar</sub></sup> <br> Tinkers Construct addon that adds in a Powerful Weapon Modifier|Late game modifier
<img src="https://media.forgecdn.net/avatars/thumbnails/312/949/256/256/637407315722572617.png" width="50"> | [**MixinBooter**](https://www.curseforge.com/minecraft/mc-mods/mixin-booter) <sup><sub>mixinbooter-1.0.jar</sub></sup> <br> A core plugin that prepares, boots mixins. Making lives easier for 1.12.2 mixin modders.|Library for **Thaumic Speedup**
<img src="https://media.forgecdn.net/avatars/thumbnails/230/21/256/256/637058620358653756.png" width="50"> | [**Smaller Nether Portals**](https://www.curseforge.com/minecraft/mc-mods/smaller-nether-portals) <sup><sub>smallernetherportals_1.12.2-1.6.jar</sub></sup> <br> Allows the creation of smaller nether portals, specifically 1x2, 1x3 and 2x2.|Vanilla-like improvment
<img src="https://media.forgecdn.net/avatars/thumbnails/82/416/256/256/636180918658716768.png" width="50"> | [**Additional Compression**](https://www.curseforge.com/minecraft/mc-mods/additional-compression) <sup><sub>Additional-Compression-1.12.2-3.4.jar</sub></sup> <br> A Mod that Adds Compressed Blocks to Minecraft|For using in craft and easier storage
<img src="https://media.forgecdn.net/avatars/thumbnails/334/385/256/256/637468213328449243.png" width="50"> | [**Precision Mining**](https://www.curseforge.com/minecraft/mc-mods/precision-mining) <sup><sub>miningspeed2-1.6.jar</sub></sup> <br> QOL mod that prevents overmining|Fix "too fast" Tinker's tools
<img src="https://media.forgecdn.net/avatars/thumbnails/265/213/256/256/637228736265951330.png" width="50"> | [**[FORGE/FABRIC] Armor Curve**](https://www.curseforge.com/minecraft/mc-mods/armor-curve) <sup><sub>armorcurve-1.2.9.jar</sub></sup> <br> Adjust the armor scaling and degradation formulae for mobs and players.|Better math for overpowered Tinker's sets
<img src="https://media.forgecdn.net/avatars/thumbnails/354/446/256/256/637512279994184609.png" width="50"> | [**IC2 Patcher**](https://www.curseforge.com/minecraft/mc-mods/ic2-patcher) <sup><sub>ic2patcher-1.0-beta.2.jar</sub></sup> <br> Fixes several issues in IndustrialCraft2|Fix some bugs and most importantly - add ability to **disable jetpack in Quantum Suit**
<img src="https://media.forgecdn.net/avatars/thumbnails/9/285/256/256/635425001467813326.png" width="50"> | [**Ping**](https://www.curseforge.com/minecraft/mc-mods/ping) <sup><sub>Ping-1.12.2-1.4.5.jar</sub></sup> <br> Inspired by Portal 2, this mod brings the Ping tool into Minecraft|MP helper to point on blocks
<img src="https://media.forgecdn.net/avatars/thumbnails/352/27/256/256/637507094992634249.png" width="50"> | [**Just Enough Drags**](https://www.curseforge.com/minecraft/mc-mods/just-enough-drags) <sup><sub>justenoughdrags-1.1-beta.5.jar</sub></sup> <br> Adds jei drag support to item filters|Cool feature from EnderIO to other filters
<img src="https://media.forgecdn.net/avatars/thumbnails/307/78/256/256/637387132751465728.png" width="50"> | [**Advancement Screenshot**](https://www.curseforge.com/minecraft/mc-mods/advancement-screenshot) <sup><sub>advancementscreenshot_1.12.2-1.3.jar</sub></sup> <br> [Client] Takes a screenshot every time an advancement is achieved. Document your progress!|Avaliable only in dev
<img src="https://media.forgecdn.net/avatars/thumbnails/232/533/256/256/637066773825345434.png" width="50"> | [**Creative Block Replacer**](https://www.curseforge.com/minecraft/mc-mods/creative-block-replacer) <sup><sub>creativeblockreplacer_1.12.2-1.4.jar</sub></sup> <br> Allows easy switching in between placing and replacing blocks in creative mode.|Helper for creative building
<img src="https://media.forgecdn.net/avatars/thumbnails/297/106/256/256/637343255955991159.png" width="50"> | [**Mixin 0.7-0.8 Compatibility**](https://www.curseforge.com/minecraft/mc-mods/mixin-0-7-0-8-compatibility) <sup><sub>[___MixinCompat-0.8___].jar</sub></sup> <br> Allows mods that use 0.7 or 0.8 mixin to be compatible with each other|Library for **Precision Mining**
<img src="https://media.forgecdn.net/avatars/thumbnails/33/283/256/256/635893403164870085.png" width="50"> | [**NetherPortalFix**](https://www.curseforge.com/minecraft/mc-mods/netherportalfix) <sup><sub>NetherPortalFix_1.12.1-5.3.17.jar</sub></sup> <br> Ensures correct destinations when travelling back and forth through Nether Portals in Multiplayer.|Nice fix
<img src="https://media.forgecdn.net/avatars/thumbnails/302/258/256/256/637366701251451367.png" width="50"> | [**Thaumic Speedup**](https://www.curseforge.com/minecraft/mc-mods/thaumic-speedup) <sup><sub>thaumicspeedup-2.0.jar</sub></sup> <br> Speeds up Thaumcraft's loading process and 'optimizes' some internals. Extremely lazy project.|Actually descrease load time from 11 minutes to 9. Require to rename Dank/Null `.jar` file or would crash
<img src="https://media.forgecdn.net/avatars/thumbnails/346/844/256/256/637496100920279441.png" width="50"> | [**Animania Cats & Dogs**](https://www.curseforge.com/minecraft/mc-mods/animania-cats-dogs) <sup><sub>animania-1.12.2-catsdogs-1.0.0.28.jar</sub></sup> <br> This Animania Addon adds Cats and Dogs to your game!|For people who like animals

## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/295/249/256/256/637336304211212554.png" width="50"> | [**ThaumTweaks**](https://www.curseforge.com/minecraft/mc-mods/thaumtweaks) <sup><sub>thaumtweaks-0.2.4.2.jar</sub></sup> <br> Small addon to make Thaum 6 more fair.|Caused significant lag. Would return when dev fix [this issue](https://github.com/GrigLog/ThaumTweaks/issues/18).
<img src="https://media.forgecdn.net/avatars/thumbnails/307/21/256/256/637386849694673181.png" width="50"> | [**LogicalArmorRework**](https://www.curseforge.com/minecraft/mc-mods/logicalarmorrework) <sup><sub>logicalarmorrework-1.12.2-1.0.jar</sub></sup> <br> A mod that changes how armor works in Minecraft|Pushed out by **Armor Curve** mod

## 🟡 Updated Mods

- [**Tweakers Construct**](https://www.curseforge.com/minecraft/mc-mods/tweakers-construct) <sup><sub>tweakersconstruct-1.12.2-1.6.1.jar</sub></sup>
- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.643.jar</sub></sup>
- [**Cyclic**](https://www.curseforge.com/minecraft/mc-mods/cyclic) <sup><sub>Cyclic-1.12.2-1.20.9.jar</sub></sup>
- [**Tinkers' Evolution**](https://www.curseforge.com/minecraft/mc-mods/tinkers-evolution) <sup><sub>tconevo-1.12.2-1.0.41.jar</sub></sup>
- [**NuclearCraft Reactor Builder**](https://www.curseforge.com/minecraft/mc-mods/nuclearcraft-reactor-builder) <sup><sub>NC-ReactorBuilder-1.12.2-1.0.2.jar</sub></sup>
- [**Carry On**](https://www.curseforge.com/minecraft/mc-mods/carry-on) <sup><sub>carryon-1.12.2-1.12.4.16.jar</sub></sup>
- [**Collective**](https://www.curseforge.com/minecraft/mc-mods/collective) <sup><sub>collective-1.12.2-2.26.jar</sub></sup>
- [**CreativeCore**](https://www.curseforge.com/minecraft/mc-mods/creativecore) <sup><sub>CreativeCore_v1.10.57_mc1.12.2.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.4_mc1.12.2.jar</sub></sup>
- [**Ears**](https://www.curseforge.com/minecraft/mc-mods/ears) <sup><sub>ears-forge-1.12-1.2.2.jar</sub></sup>

## ✏️ Recipes

- Some recipes conflicts resolved.
- Recipes changes:
  - ![](https://git.io/J3Jnv "Big Red Nether Brick")
    ![](https://git.io/Jtkwo "Soulstone")
    ![](https://git.io/JOGgq "Compound Bow")
    ![](https://git.io/JOGza "Fire Axe")
    ![](https://git.io/J3JZF "Mob Slaughter Factory")
  - [Wicked Jewel]
  - other misc changes

## 📖 Quest Book

- **Condition Overload** and **Indus. Wires** quests

## 🔵 Mods


- ### 🌡️ Thermal Expansion

  - Thermal Expansion: Disable tools (no changes actually)

- ### 🏪 Requious Fracto

  - Nether Portal Spread JEI. See ![](https://git.io/J3JEq "Obsidian")

- ### 🐝 Forestry

  - ![](https://git.io/JOGr0 "Adventuring Backpack") can accept any OreDicted item

- ### 📑 Tips

  - Few new tips and tooltips

- ### 🔨 Tinker's Construct

  - ![](https://git.io/JmV4O "Alpha Yeti Fur") material now cast **Frosted** effect from TwiFrst

- ### 🩸 Blood Magic

  - Remove baby animals from ![](https://git.io/J3JZd "Dagger of Sacrifice") list
    > They cant be sacrificed anyway

- ### ⚙️ JAOPCA

  - Reload configs, Color was updated
    > Useless items appears, like Plates and Sticks. Would be removed next release

- ### 🚒 Nether Portal Spread

  - Change spread blocks list

## 🔄 Misc Changes

  - ![](https://git.io/J3JEN "Magic Bean") drop itself too
  - ![](https://git.io/J3JZN "Diamond Ore") Increase mining level 3 -> 4
  - Ghasts crying if player near 64 blocks
  - Immersive Engineering excavator less chance (0.33 -> 0.2)
  - Industrial Wires buff cables up to **32 kEU/t**
  - Nuclearcraft remove fluid duplicates
  - Ping increase distance and duration
  - JEI blacklist
  - Forge Selective resource option (what it actually do? I dont know) `selectiveResourceReloadEnabled=false`




# 0.23

## 🔵 Mods


- ### 🔨 Tinker's Construct

  - Recycle rework. Now you can turn tools into shards: https://imgur.com/a/7ambQhN
  - Temporary Remove High-end materials from random spawn, examples: ![](https://git.io/JOKc4 "Infinity Shard")![](https://git.io/JOKci "Chaotic Shard")![](https://git.io/JOKcP "Supremium Shard")
  - ![](https://git.io/JOKc6 "Plate of Unsealing") way harder to prevent abusing mob drops

## 🌎 Worldgen

- Remove Slime Islands from Emptiness dim
- Just Enough Resources: Add Emptiness dimension to JEI





# 0.22

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/269/673/256/256/637242595025033364.png" width="50"> | [**You Dropped This**](https://www.curseforge.com/minecraft/mc-mods/youdroppedthis) <sup><sub>YouDroppedThis-1.1.0.jar</sub></sup> <br> Simple customizable mod to play sounds when items are dropped. | Add more sound effects and also help to hear butterfingers in Twilight Forest
<img src="https://media.forgecdn.net/avatars/thumbnails/137/218/256/256/636513615515731748.png" width="50"> | [**Tinkers Extras**](https://www.curseforge.com/minecraft/mc-mods/tinkersextras) <sup><sub>TinkersExtras-1.12.2-1.1.0.jar</sub></sup> <br> A tweaks mod for TinkersConstruct to disable certain elements of the mod | Restrict crafting of ![](https://git.io/JOGzD "Laser Medium Pattern") to make custom crafting
<img src="https://media.forgecdn.net/avatars/thumbnails/317/984/256/256/637423606351535331.png" width="50"> | [**Better Questing Tweaker (BQTweaker)**](https://www.curseforge.com/minecraft/mc-mods/bqtweaker) <sup><sub>BQTweaker-1.1.0.jar</sub></sup> <br> Tweaker mod to change some aspects of BetterQuesting | Better BQ looking (not sure through, because some text align skrewed up)
<img src="https://media.forgecdn.net/avatars/thumbnails/41/763/256/256/636000363793448321.png" width="50"> | [**Tinkers' Addons**](https://www.curseforge.com/minecraft/mc-mods/tinkers-addons) <sup><sub>Tinkers' Addons-1.12.1-1.0.7.jar</sub></sup> <br> Adding Back old TiCon Modifiers to Tinkers' Construct 2 | Adds Toolkits: +1 free modifier
<img src="https://media.forgecdn.net/avatars/thumbnails/89/502/256/256/636231887954920121.png" width="50"> | [**Bad Wither No Cookie - Reloaded**](https://www.curseforge.com/minecraft/mc-mods/bad-wither-no-cookie-reloaded) <sup><sub>badwithernocookiereloaded-1.12.2-3.4.18.jar</sub></sup> <br> Localizes the wither and dragon attacking sounds. | Exists in `E2E` but mistakenly removed in previous patches

## 🟡 Updated Mods

- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.634.jar</sub></sup>
- [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil) <sup><sub>zenutils-1.6.7.jar</sub></sup>
- [**Lazy AE2**](https://www.curseforge.com/minecraft/mc-mods/lazy-ae2) <sup><sub>lazy-ae2-1.12.2-1.1.26.jar</sub></sup>
- [**UniDict**](https://www.curseforge.com/minecraft/mc-mods/unidict) <sup><sub>UniDict-1.12.2-3.0.8.jar</sub></sup>
- [**Collective**](https://www.curseforge.com/minecraft/mc-mods/collective) <sup><sub>collective-1.12.2-2.25.jar</sub></sup>
- [**AE2 Fluid Crafting**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting) <sup><sub>ae2fc-1.12.2-1.0.10.jar</sub></sup>
- [**Immersive Technology**](https://www.curseforge.com/minecraft/mc-mods/mct-immersive-technology) <sup><sub>MCTImmersiveTechnology-1.12.2-1.8.94.jar</sub></sup>
- [**LibVulpes**](https://www.curseforge.com/minecraft/mc-mods/libvulpes) <sup><sub>LibVulpes-1.12.2-0.4.2-83-universal.jar</sub></sup>
- [**Advanced Rocketry**](https://www.curseforge.com/minecraft/mc-mods/advanced-rocketry) <sup><sub>AdvancedRocketry-1.12.2-2.0.0-242-universal.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.0-pre328_mc1.12.2.jar</sub></sup>
- [**YUNG's Better Mineshafts (Forge)**](https://www.curseforge.com/minecraft/mc-mods/yungs-better-mineshafts-forge) <sup><sub>BetterMineshaftsForge-1.12.2-2.2.1.jar</sub></sup>
- [**Broken Wings**](https://www.curseforge.com/minecraft/mc-mods/broken-wings) <sup><sub>brokenwings-3.0.0.jar</sub></sup>
- [**JAOPCA**](https://www.curseforge.com/minecraft/mc-mods/jaopca) <sup><sub>JAOPCA-1.12.2-2.2.8.104.jar</sub></sup>

## ✏️ Recipes

  Harder:
  - ![](https://git.io/JOG2Y "Quartzburnt")
    ![](https://git.io/JOGgL "Deep Dark Portal")
    ![](https://git.io/JOGgY "Redstone Gear")
    ![](https://git.io/JOGzW "Ring of the Flying Squid")
    ![](https://git.io/JOGz4 "Dragon Egg Mill")
    ![](https://git.io/JOGui "Kikoku")
    ![](https://git.io/JOGzR "Base Essence Ingot")
    ![](https://git.io/JOGgJ "Empty Frame")
    ![](https://git.io/JOGgI "Crafter Tier 1")
    ![](https://git.io/JOGzz "Crafter Tier 2")
    ![](https://git.io/JOGzo "Crafter Tier 3")
    ![](https://git.io/JqUJb "Simple Powercell")
    ![](https://git.io/JqUUU "Powercell")
    ![](https://git.io/JqUJz "Advanced Powercell")
    ![](https://git.io/JOGzA "Dimensional Blank Block")
    ![](https://git.io/JOGzj "Pyrotheum Dust")
    ![](https://git.io/JOGgT "Cryotheum Dust")
    ![](https://git.io/JOGzl "Aerotheum Dust")
    ![](https://git.io/JOGgv "Petrotheum Dust")
    ![](https://git.io/JOGzd "Augment: Auxiliary Transmission Coil")
    ![](https://git.io/JOGz2 "Pulverizer (Basic)")
    ![](https://git.io/JOGz8 "Phytogenic Insolator (Basic)")
    ![](https://git.io/JOGzw "Induction Smelter (Basic)")
    ![](https://git.io/JOGzx "Fluid Transposer (Basic)")
    ![](https://git.io/JOGz0 "Magma Crucible (Basic)")
    ![](https://git.io/JOGgm "Obsidian Pressure Plate")
    ![](https://git.io/JqUJb "Simple Powercell")
    ![](https://git.io/JqUUU "Powercell")
    ![](https://git.io/JqUJz "Advanced Powercell")
    ![](https://git.io/JOGru "Heavy Oak Sieve")![](https://git.io/JOGrE "Heavy Spruce Sieve")![](https://git.io/JOGrg "Heavy Birch Sieve")![](https://git.io/JOGrw "Heavy Jungle Sieve")![](https://git.io/JOGrz "Heavy Acacia Sieve")
    ![](https://git.io/JOGgU "Auto Sieve")
    ![](https://git.io/JOGzK "Mana Sieve")
    ![](https://git.io/JOGzi "Auto Heavy Sieve")
  
  Cheaper:
  - ![](https://git.io/JOGzE "Creative Modifier")
    ![](https://git.io/JmVvt "Omnivoir")
    ![](https://git.io/JOGzM "Energy Gauge")
    ![](https://git.io/JOGu6 "Endervoir")
    ![](https://git.io/JOGzb "Black Paper")
    ![](https://git.io/JOGgq "Compound Bow")
    ![](https://git.io/JOGza "Fire Axe")
    ![](https://git.io/JOG2Z "Tank")
    ![](https://git.io/JOGzF "Time in a bottle")
    ![](https://git.io/JOGgZ "Steam Dynamo (Basic)")
    ![](https://git.io/JOGzB "Magmatic Dynamo (Basic)")
    ![](https://git.io/JOGzV "Compression Dynamo (Basic)")
    ![](https://git.io/JOGzy "Reactant Dynamo (Basic)")
    ![](https://git.io/JOGzp "Enervation Dynamo (Basic)")
    ![](https://git.io/JOGzC "Numismatic Dynamo (Basic)")
    ![](https://git.io/JOG2W "Enderium Turbine")
    ![](https://git.io/JOG2G "Steel Turbine")
    ![](https://git.io/JOG2C "Gold Plated Turbine")
    ![](https://git.io/JOG2n "Bronze Turbine")
    ![](https://git.io/JOG23 "Manyullyn Turbine")
    ![](https://git.io/JOG2B "Iron Turbine")
    ![](https://git.io/JOG2O "Advanced Alloy Turbine")
    ![](https://git.io/Jt8wY "Woven Mining Backpack")
    ![](https://git.io/JOGzr "Woven Digging Backpack")
    ![](https://git.io/JOGzu "Woven Foresting Backpack")
    ![](https://git.io/JOGzS "Woven Hunting Backpack")
    ![](https://git.io/JOGz5 "Woven Adventuring Backpack")
    ![](https://git.io/JOGzX "Woven Building Backpack")

  Other:
  - ![](https://git.io/JOG28 "Control Circuit")
    ![](https://git.io/JOGzP "Pressure Valve")
    ![](https://git.io/JOGz7 "Advanced Pressure Valve")
    ![](https://git.io/JOGz1 "Atomic Reconstructor")
    ![](https://git.io/JOGz9 "Pressurized Tank")
    ![](https://git.io/JOGzQ "Super Omelette")
    ![](https://git.io/JOGgs "Cheese Omelette")
    ![](https://git.io/JOGzH "Nutritious Stick")
    ![](https://git.io/JOGg3 "Bituminous Peat")
  - ![](https://git.io/JOGzN "Hydrated Coal Dust") in ![](https://git.io/JtJIt "Infinity Furnace")
  - ![](https://git.io/JOGzF "Time in a bottle") Removed as crafting method
  - ![](https://git.io/JOGgO "Steel Hoe") removed
  - ![](https://git.io/JOGgk "Propolis") No longer avaliable in Integrated Dynamics machines
  - ![](https://git.io/JtyoS "Black Death Mask") Recycle
  - ![](https://git.io/JOGrV "Block of Enderpearl") Now meltable
  - ![](https://git.io/JOG24 "Mud") in ![](https://git.io/JtTPL "Hydrator")
  - ![](https://git.io/JOGuK "Niter") in ![](https://git.io/JOG2s "Manufactory") removed
  - [Advanced Analyzer]

## 📖 Quest Book

- BetterQuesting: Quest fixes and additions
  > - Remove ![](https://git.io/JOGuo "Medkit") from loot boxes
  > - Add **Thermal Logistic** quests
  > - Twilight Forest Rewards, Fix Metadata of Magic Map quest
  > - Rework EU2 chapter
  > - Laser Gun in Getting Started quest

## 🔵 Mods

- ### 🌡️ Thermal Expansion

  - Buff Dynamos production

- ### 🏪 Requious Fracto

  - New JEI categories: **Electronics Assembler** & **XP Bottler**

- ### 🐝 Forestry

  - Fix Bees colors
  - ![](https://git.io/JOGur "Escritoire") Buff
  - ![](https://git.io/JOG2c "Wood Pile") More charcoal (not tested)
  - Misc Bee output changes
  - ![](https://git.io/JOGr0 "Adventuring Backpack") Buff

- ### 🔨 Tinker's Construct

  - Spectre Hand length fix
  - EquipGeneration add **Artifact** trait to mob's tools
    > This would prevent easy upgrading without unsealing
  - Balance tweaks, Laser Returns, +Toolkits
    > - [Laser Gun] enabled again
    >   * Increased Energy consumption
    >   * Laser Mediums craftable only with restrictions
    > - Buff ![](https://git.io/JOGzh "Katana of the End") combo
    > - Remove Durability Threshold for **Fluxed** modifier
    >   > when you insert capacitors into tools
    > - Buff **Piezoelectric** modifier
    > - Fix **Electric** modifier power transfer Devider
    > - Change **Electric** tool cost (about 4000 RF/use)
    > - **Reinforcement** modifier has 10 levels
    > - **Diamond** modifier require ![](https://git.io/JOGah "Diamatine Crystal") for armor too
    > - **Resistant** modifier require level each
    > - **Sharpness** modifier has max 20 levels

- ### 🛢️ Immersive Engineering

  - ![](https://git.io/JOG6r "Iridium Ore") not spawn in Excavator veins
  - Excavator nerf x2 less ore yeld

- ### 🛹 Integrated Dynamics

  - Fix Jungle Biomes corruption
    > Fixes `Enigmatica2Expert/issues/1895`

- ### 🛸 EnderIO

  - ![](https://git.io/JOGr2 "Power Buffer") x2 Buff
    > Now buffer is twice cheaper than Basic Capacitor Bank
    > but can be increased with good installed capacitor.

- ### 🔩 RFTools

  - ![](https://git.io/JqUJb "Simple Powercell") ![](https://git.io/JqUUU "Powercell") ![](https://git.io/JqUJz "Advanced Powercell") nerfs
    > Power Cells avaliable relatively early and totally replace all other
    > power transfer methods. This change would make difference between Powercells
    > more visible


- ### 🧙‍♂️ Cyclic

  - ![](https://git.io/JOGzg "Air Charm") Nerf durability x2

- ### 🧻 JEI

  - Return ![](https://git.io/JmVeA "Fluid Tank") category

- ### 💘 ScallingHeals

  - Dimensions: `1` `7` and `-8` dimensions have different difficulties
  - x2 slower difficulty scalling throught time
  - Pinch Beetle blacklist
  - ![](https://git.io/JOGz6 "Cursed Heart") and ![](https://git.io/JOGgt "Enchanted Heart") less values

- ### 🐤 Broken Wings

  - Broken Wings: ![](https://git.io/JOGzg "Air Charm"), ![](https://git.io/JOGra "Climbing Gloves") and ![](https://git.io/JOGgf "Hang Glider") restrictions
    > In Twilight Forest

- ### 🚀 Advanced Rocketry

  - ![](https://git.io/JOGz9 "Pressurized Tank") Buff up to **50k** buckets
  - Add Volcanoes and Craters (not tested ingame)
  - Reset config in new mod version (bugs could appears)



# 0.21

## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/189/181/256/256/636849056184187041.png" width="50"> | [**ThermalLogistics**](https://www.curseforge.com/minecraft/mc-mods/thermallogistics) <sup><sub>thermallogistics-0.3-42.jar</sub></sup> <br> The spiritual successor to Logistics Pipes | Should help players to automate things before AE2 avaliable
<img src="https://media.forgecdn.net/avatars/thumbnails/213/458/256/256/636992567658475667.png" width="50"> | [**Tinkers' Modifier Modifier**](https://www.curseforge.com/minecraft/mc-mods/tinkers-modifier-modifier) <sup><sub>tconmodmod-1.12.2-1.0.5.jar</sub></sup> <br> modify modifiers for great and good profit | Changed **Diamond** modifier for Tinker's Tool. Now it asks for ![](https://git.io/JmVuJ "Empowered Diamatine Crystal")

## 🟡 Updated Mods

- [**Tweakers Construct**](https://www.curseforge.com/minecraft/mc-mods/tweakers-construct) <sup><sub>tweakersconstruct-1.12.2-1.6.0.jar</sub></sup>
- [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker) <sup><sub>CraftTweaker2-1.12-4.1.20.626.jar</sub></sup>
- [**Better Animal Models**](https://www.curseforge.com/minecraft/mc-mods/better-animal-models) <sup><sub>betteranimals-1.12.2-5.5.0.jar</sub></sup>
- [**Hole Filler Mod**](https://www.curseforge.com/minecraft/mc-mods/hole-filler-mod) <sup><sub>hole_filler_mod-1.2.4.jar</sub></sup>
- [**UniDict**](https://www.curseforge.com/minecraft/mc-mods/unidict) <sup><sub>UniDict-1.12.2-3.0.7.jar</sub></sup>
- [**Collective**](https://www.curseforge.com/minecraft/mc-mods/collective) <sup><sub>collective-1.12.2-2.24.jar</sub></sup>
- [**CreativeCore**](https://www.curseforge.com/minecraft/mc-mods/creativecore) <sup><sub>CreativeCore_v1.10.47_mc1.12.2.jar</sub></sup>
- [**LittleTiles**](https://www.curseforge.com/minecraft/mc-mods/littletiles) <sup><sub>LittleTiles_v1.5.0-pre327_mc1.12.2.jar</sub></sup>

## 🧩 Configs

- Some block tool levels was rewritten
- ![](https://git.io/JmV4G "Staff of Traveling") disable blinking through bedrock
- More Forestry Farm Fertilizers (see JEI)
- Fluid Drawers base is **4 -> 6 buckets**

## ✏️ Recipes

- Harder:
  - ![](https://git.io/JmVvT "ME Drive")
  ![](https://git.io/JqUJ7 "ME Controller")
  ![](https://git.io/JmVvk "Crafting Unit")
  ![](https://git.io/JmVe7 "ME Storage Bus")
  ![](https://git.io/JmVvf "Gauntlet of Far Reach")
  ![](https://git.io/JmVeA "Fluid Tank")
  ![](https://git.io/JmVvU "Turbine Blade")
  ![](https://git.io/JmVvs "Turbine Rotor")
  ![](https://git.io/JmVeh "Turbine Casing")
  ![](https://git.io/JmVep "Infinite Water Source")
  ![](https://git.io/JmVBk "Frost Troll Leather")
  ![](https://git.io/JtJwK "Portable Tank (Basic)")
- Also Harder:
  * Rod Frame
  * [PSI Cell]
  * [PSI-O Cell]
  * [PSI-Dyne Cell]
  * [PSI-Force Cell]
  
- Cheaper:
  - ![](https://git.io/JmVvL "Magic Tallow")
  ![](https://git.io/JmVvY "Blood Tank Tier 1")
  ![](https://git.io/JmVve "Carbon Brick")
  ![](https://git.io/JmVvI "Dynamic Tank")
  ![](https://git.io/JmVeQ "Structural Glass")
  ![](https://git.io/JmVvJ "Spell Inscriber")
  ![](https://git.io/JmVeN "Rod Constructor")
  
  Other:
  - ![](https://git.io/JmVe5 "Fluid Collector")![](https://git.io/JmVeb "Fluid Placer")![](https://git.io/JmVvO "Phantom Liquiface")![](https://git.io/JmVe9 "Rune of Capacity")![](https://git.io/JmVed "Fluid Filter")![](https://git.io/JmVvt "Omnivoir")
    > now use ![](https://git.io/JtNTX "Flopper") in craft instead of bucket
  - ![](https://git.io/JmVeF "Metal Press Mold: Unpacking") now outputs more
  - ![](https://git.io/JmVR8 "Jungle Myrmex Resin Chunk")![](https://git.io/JmVRl "Desert Myrmex Resin Chunk") Added mana conversion
  - Changed some Liquid Interactions
  - Kiro's blocks now have crafts

## 📖 Quest Book

- Make Twilight Forest chapter with advancements
  > This fixed bug when you cant progress in TF, help with team play. 
- Enhance Armor quests
- Added to quests: 
  > ![](https://git.io/JmVRF "Terraformer")![](https://git.io/Jt8we "Scented Hive")![](https://git.io/JmV4m "Compacting Drawer")![](https://git.io/JmVeH "Habitat Former") [Bee Diversity] Alviery
- ![](https://git.io/JmVex "Cabinet") add to early rewards
- [Framed Chest] add to early rewards
- Advanced Generators now have own **Gate**
- Animal chapter entry have reward with Bull + Cow in it

## 🌍 World Generation

- Remove ![](https://git.io/JmV4s "Silver Ore") from generation completely
  > There is too much difference ores spawns in overworld.
  > Silver can be obtained as sub-product or with many other ore-generation techniques

## 🔵 Mods

- ### ☢️ NuclearCraft

  - Remove armor plating recipes (they are annoying)

- ### ⛽ Advanced Generators

  - Recipes Overhaul
    > - Removes duplications of AdvGen recipes
    > - Cheaper controllers
    > - Harder and buffed turbines
    > 
    > Before change, all tiers of turbines was abandoned, because
    > when you can craft controller, Iron, Gold and other low-tier turbines too weak.
    > Now, Controller way cheaper, but Steel tier turbines have similar gating
    > as controller had before.

- ### 🌠 Astral Sorcery

  - Neromantic Prime fluid remap
    > - Amber as main fluid
    > - Less other fluids

- ### 🌡️ Thermal Expansion

  - Buff ![](https://git.io/JtJwK "Portable Tank (Basic)") Capacity
    > Because now tank ask for TE-tier ingredients

- ### 👨‍🏭 Mekanism

  - ![](https://git.io/JmV0x "Digital Miner") x10 power consumption
  - Buff ![](https://git.io/JmVEk "Basic Fluid Tank") capacity
    > Because now first tank tier required Mekanism Ingredients

- ### 🏪 Requious Fracto

  - New machines: [Advanced Bee Analyzer] and ![](https://git.io/JtJIt "Infinity Furnace")
  - New JEI categories
    * Liquid Heat Exchanger
    * Neromantic Prime
    * Scented Hive
    * 3D Printer
    * Printer
    * Witch Water
    * Meteor
    * Turbine
    * Forestry Farm

- ### 🐝 Forestry

  - Misc Genes and outputs changes. Now custom bees have `Both 5` or such genes.

- ### 🔨 Tinker's Construct

  - ![](https://git.io/JmV4O "Alpha Yeti Fur") New material and trait
  - ![](https://git.io/JmV4Y "Spectre Ingot") New material and trait
  - Fix random modifiers, Difficulty accounting, misc balance
  - TConEvo **Electric** nerfs (x50 consumption)

- ### 🖥 OpenComputers

  - Disable Buffer config
    > Makes possible editing code from RL computer

## 🔄 Misc Changes

  * ![](https://git.io/JtDnO "Chemical Thrower") fix damage speed (try UU-matter as fuel, very cool)
  * Fixed accidentally removed drop of **bone**, **string** and ![](https://git.io/JmVEg "Rotten Flesh")
  * Betteranimalsplus got nutrition values
  * Tooltips about lag in AE
  * JEI hide recycler category
  * "Last Reward" tooltip for [Bee Diversity Store]



# 0.20

## 🟢 New Mods

Icon | Summary
------:|:------
<img src="https://media.forgecdn.net/avatars/thumbnails/183/420/256/256/636815141511404851.png" width="50"> | [**Bring Me The Rings!**](https://www.curseforge.com/minecraft/mc-mods/bring-me-the-rings) <sub><sup>BringMeTheRings-0.4.jar</sup></sub> <br> Expand the number of native ring slots in Baubles

## ✏️ Recipes

  - Changes:  
    * ![](https://git.io/JqUJS "Ball of Moss")
      ![](https://git.io/JqUJ9 "Machine Controller")
      ![](https://git.io/JtN5b "Range Addon")
      ![](https://git.io/JqUJ6 "Wind Generator")
    * +9, +10, +11[Fluid: Dark Steel]
 
  - Harder:  
    ![](https://git.io/JqUJH "Silky Cloth")
    ![](https://git.io/JqUJP "Genetics Processor")
    ![](https://git.io/JqUUJ "Upgrade Frame")
    ![](https://git.io/JqUJp "Power Module")
    ![](https://git.io/JqUJ7 "ME Controller")
    ![](https://git.io/JqUJg "Advanced Card")
    ![](https://git.io/JqUJi "Item Capability Proxy")
    ![](https://git.io/JqUJA "Climate Control Module")
    ![](https://git.io/JqUJ2 "Bee Receptacle")
    ![](https://git.io/JqUJx "Advanced mutatron")
    ![](https://git.io/JqUUe "Ender Chest")
    ![](https://git.io/JqUJj "Ender Tank")
    ![](https://git.io/JqUUf "Ender Pouch")
    ![](https://git.io/JqUJa "Reinforced Cell Frame (Empty)")
    ![](https://git.io/JtDhK "Device Frame")
    ![](https://git.io/JqUJy "Augment: Auxiliary Reception Coil")
    ![](https://git.io/JqUJd "Augment: Auxiliary Sieve")
    ![](https://git.io/JqUJF "Augment: Sapling Infuser")
    ![](https://git.io/JqUJM "Tool Casing")
    ![](https://git.io/JqUJX "Energy Cell Frame")
    ![](https://git.io/JqUJb "Simple Powercell")
    ![](https://git.io/JqUUU "Powercell")
    ![](https://git.io/JqUJz "Advanced Powercell")
    ![](https://git.io/JqUJV "Mechanical Squeezer")
    ![](https://git.io/JtyeN "Mono-Directional Connector")
    ![](https://git.io/JqUUk "Energy Battery")
    ![](https://git.io/JqUJo "Logic Cable")
    ![](https://git.io/JqUJ1 "Insulating Glass")
    ![](https://git.io/JqUUv "Diode")
    ![](https://git.io/JqUJN "Forester")
    ![](https://git.io/JqUJQ "Monster Ball")
    ![](https://git.io/JqUJr "Terrestrial Artifact")
    ![](https://git.io/JqUJK "Terrestrial Artifact Block")
    ![](https://git.io/JqUJw "Quartz Glass")
    ![](https://git.io/JqUJD "Blank Gene Sample")

  - Also Harder:  
    * [Alloy Furnace] (NC)
    * [Genetic Tempelate]
    * [Fluid: Mutagen]
    * [Fluid: Protein]
    * [Fluid: DNA]

## 🔵 Mods

- ### 🔨 Tinker's Construct

  - Remap Tool Leveling, Change lvl mult 3 -> 2

- ### 💍 Baubles

  - Add 4 fingers to Steve

- ### 🅱 Block Drops

  - Restore cached calculation to speedup initial load time

- ### ☢️ NuclearCraft

- Alloy Smelter - Descrease speed x3, x4 RF consumption

- ### 🛹 Integrated Dynamics

  - Increase energy consumption for Mechanical machines
    > Basin: 80 -> 180 RF/t  
    > Squeezer: 80 -> 400 RF/t

- ### 🛢️ Immersive Engineering

  - Slightly nerf Excavator

- ### 🧙‍♂️ Cyclic
  
  - Forester not using energy anymore

- ### ⬛ Bedrock Ore

  - Double amount of ore in one block

- ### 🐝 Forestry

  - Buff bee work cycle 550 -> 400
  - Buff vanilla bee production
  - Buff Escritoire
  - Gendustry machines consume 10x more RF
  - Gendustry upgrades buff energy consumption percentage
  - Simplify mutations of custom bees
  - New genes for custom bees
  - Better custom bees output
  - Scrappy Bee

## 🔄 Misc Changes

  - ![](https://git.io/JqUUT "Tiny Torch") light level 12 -> 9


<!-- ======================================================= -->
---
---
---
<!-- ======================================================= -->


# 0.19
 
## 🟢 New Mods

Icon | Summary
------:|:------
<img src="https://media.forgecdn.net/avatars/thumbnails/220/560/64/64/637020934015742854.png" width="50"> | [**Requious Frakto**](https://www.curseforge.com/minecraft/mc-mods/requious-frakto)  <br> This is a techmod. It contains whatever you configure it to contain.

## ✏️ Recipes

  - ![](https://git.io/JtNT1 "Vision Helmet") Remove and Hide
  - ![](https://git.io/JtNTD "V.I.E.W. X (Vaultopic Inventory Explorer Workbot eXtended)") Change recipe out from Crafting Table
  - ![](https://git.io/JLhhY "Galactic Potato") make cheaper
  - ![](https://git.io/JtNTi "Impregnated Casing") from Any Log
  - ![](https://git.io/JtNTM "Scented Paneling") from Any plank
  - ![](https://git.io/JtN5b "Range Addon") Harder (and all other range addons)
  - ![](https://git.io/JtNTy "Plant Gatherer") Harder
  - ![](https://git.io/Jtd0k "Projectile Resistance") Cheaper



## 🔵 Mods

- ### 🐝 Forestry

  - Bee Diversity initial: farm time in bottle from bees

- ### 💘 Scalling Heals

  - Disable Damage boost for blights
  - Reduce x2 speed boost for blights
  - No scalling in technical dims (Storage Cell, Spectre, etc)
  - Reduce by half health and damage scalling by difficulty, includes animals
  - Reduce distance scalling x5 times

- ### 🏪 Requious Fracto

  - JEI integration:
    > - Liquid interactions
    > - Everflow Chalice
    > - Infernal Furnace




# 0.18
 
## 🟢 New Mods

Icon | Summary
------:|:------
<img src="https://media.forgecdn.net/avatars/thumbnails/223/208/256/256/637028185320847649.png" width="50">          | [**Psio**](https://www.curseforge.com/minecraft/mc-mods/psio)  <br> nerfs vazkii's psi into the ground
<img src="https://media.forgecdn.net/avatars/thumbnails/330/801/256/256/637458866042247400.png" width="50">          | [**CraftTweaker Integration**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker-integration)  <br> CraftTweaker is not just a recipe changer.
<img src="https://media.forgecdn.net/avatars/thumbnails/330/607/256/256/637458259890755963.png" width="50">          | [**PSICaster**](https://www.curseforge.com/minecraft/mc-mods/psicaster)  <br> Makes PSI automatable.
<img src="https://media.forgecdn.net/avatars/thumbnails/226/770/256/256/637046993390542539.png" width="50">          | [**Collective**](https://www.curseforge.com/minecraft/mc-mods/collective)  <br> Collective is a shared library with common code for all of Serilum's mods.
<img src="https://media.forgecdn.net/avatars/thumbnails/336/773/256/256/637473377219739298.png" width="50">          | [**Hole Filler Mod**](https://www.curseforge.com/minecraft/mc-mods/hole-filler-mod)  <br> Automatically Fills in Holes!
<img src="https://media.forgecdn.net/avatars/thumbnails/341/410/256/256/637484195977976685_animated.gif" width="50"> | [**Recast**](https://www.curseforge.com/minecraft/mc-mods/recast)  <br> Automatically re-casts the fishing rod line for a player when an item is caught.

## 🔴 Removed Mods

Icon | Summary | Reason of removal
------:|:------|:-----
<img src="https://media.forgecdn.net/avatars/thumbnails/28/371/256/256/635826252878407531.png" width="50">           | [**(Chat) Ping!**](https://www.curseforge.com/minecraft/mc-mods/chat-ping)  <br> Notifying users when they are mentioned in chat | Useless because makes no sound or color highliting of chat messages
<img src="https://media.forgecdn.net/avatars/thumbnails/109/826/256/256/636382841953033335.png" width="50">          | [**Chat Tweaks**](https://www.curseforge.com/minecraft/mc-mods/chat-tweaks)  <br> Twitch Emotes and Image Preview. Also basically like BetterTTV but for Minecraft. | Spoiling well-known `Shift+T` functionality of Quark
<img src="https://media.forgecdn.net/avatars/thumbnails/200/715/256/256/636915307717811039.png" width="50">          | [**Redstone Control**](https://www.curseforge.com/minecraft/mc-mods/redstone-control)  <br> Point to Point Redstone wires, data-flow oriented programmable compact circuits, fancy displays, control interfaces and more ... ![](https://git.io/JtSfh "Wireless Energy Transmitter Dish Assembly") | I deamed to make this mod works in modpack, but failed. It have great and interesting redstone mechanics, but i didnt find way how to use it in addon
<img src="https://media.forgecdn.net/avatars/thumbnails/154/354/256/256/636625132573601981.png" width="50">          | [**CD4017BE Library**](https://www.curseforge.com/minecraft/mc-mods/cd4017be-library)  <br> Mod Library | Lib for Redstone Control
<img src="https://media.forgecdn.net/avatars/thumbnails/318/797/256/256/637426150328977672.png" width="50">          | [**Notify me**](https://www.curseforge.com/minecraft/mc-mods/notify-me)  <br> send windows notification when your game is ready | Notifies too early, when about 2 minutes of loading left


## ✏️ Recipes

  - ![](https://git.io/JtDhK "Device Frame") return removed
  - ![](https://git.io/Jtyeb "Output Variable Transformer") ![](https://git.io/JtyeA "Input Variable Transformer") ![](https://git.io/JtyeN "Mono-Directional Connector") harder, required ![](https://git.io/JtyxV "Cobalt Ingot")
  - ![](https://git.io/Jtyv2 "White§r Conveyor Belt") ![](https://git.io/JtTuj "Conveyor Belt") x4 cheaper recipe
  - ![](https://git.io/JtkoQ "Solar Helmet") recipe fix
  - ![](https://git.io/Jt4CI "Alveary") x14 cheaper
  - ![](https://git.io/Jtyx2 "Impregnated Stick") oredicted recipe
  - ![](https://git.io/JtTuj "Conveyor Belt") fix
  - ![](https://git.io/JtDhi "Molecular Assembler") less grindy recipe (no T3 Crafter)
  - ![](https://git.io/Jt3vK "Advanced Ring of Fire Resistance") recipe fix
  - ![](https://git.io/Jtyxa "ME Fluid Pattern: Molten FLiBe Salt Solution of Depleted HECf-249 Fluoride Fuel") added to process
  - 6 different ![](https://git.io/Jtyxr "Morb (entity.twilightforest.harbinger_cube.name§r)") from ![](https://git.io/JtUEY "Heart Crystal Shard") recipes
  - ![](https://git.io/Jtyxw "Gunpowder") shears from Creepers
  - [Liquid Concrete] craft
  - [Hole Filler] and [Throwable Hole Filler] crafts
  - [Little Blueprint] fix
  - [Compact Californium RTG] harder crafts

## 📖 Quest Book

- New and Updated entries

## 🌍 World Generation

- KELT-2ab ![](https://git.io/JtyNo "Kelp") and ![](https://git.io/JtyNr "Glowing Coral") generation
- ![](https://git.io/JtyNw "Desert Myrmex Egg") Myrmexes in Overworld generation
- Excavator ![](https://git.io/JtSJw "Black Quartz Ore") ore vein

## 🔵 Mods

- ### 🔨 Tinker's Construct

  - ![](https://git.io/Jtyj2 "Pigiron Nugget") mining level fix
  - ![](https://git.io/JtDRB "Essence-Infused Ingot") and ![](https://git.io/Jtngy "Pink Slime Crystal") new trait drafts

- ### 🛢️ Immersive Engineering

  - ![](https://git.io/JtDnO "Chemical Thrower") add Liquid Death
  - ![](https://git.io/Jtyja "Railgun") new ammo:
    ![](https://git.io/JtDpz "Flux-Infused Obsidian Rod")![](https://git.io/JtDpa "Shaft (Steel)")![](https://git.io/JtDpg "Shaft (Iron)")![](https://git.io/JtDp2 "Shaft (Bronze)")

## 🔄 Misc Changes

  - Nerf ![](https://git.io/Jt1zE "Stone Torch") light level
  - Return Ice and Fire ![](https://git.io/Jtyd1 "Sapphire") to oredict
  - Make ![](https://git.io/JLhpj "Crystallized Obsidian") harder to match its mining level
  - ![](https://git.io/Jtydj "Elevator") 2x speedup
  - ![](https://git.io/JtDho "Sunflower") added to ![](https://git.io/JtDh9 "Market")
  - Wisp from Thaumcraft blacklisted from Scalling Health damage




# 0.17

## 🟢 New Mods

Icon | Summary
------:|:------
<img src="https://media.forgecdn.net/avatars/thumbnails/134/37/256/256/636488657582083451.png" width="50"> | [**LagGoggles**](https://www.curseforge.com/minecraft/mc-mods/laggoggles) <sub><sup>LagGoggles-FAT-1.12.2-4.11-92.jar</sup></sub> <br> A minecraft forge mod which profiles and visualises lag in the world.
<img src="https://media.forgecdn.net/avatars/thumbnails/168/445/256/256/636709256650418668.png" width="50"> | [**Surge**](https://www.curseforge.com/minecraft/mc-mods/surge) <sub><sup>Surge-1.12.2-2.0.77.jar</sup></sub> <br> An open source performance enhancement mod.
<img src="https://media.forgecdn.net/avatars/thumbnails/138/255/256/256/636520464179775826.png" width="50"> | [**Born in a Barn**](https://www.curseforge.com/minecraft/mc-mods/born-in-a-barn) <sub><sup>Born In A Barn V1.8-1.12-1.1.jar</sup></sub> <br> Fixed a Village ChunkLoading Issue
<img src="https://media.forgecdn.net/avatars/thumbnails/177/555/256/256/636771733330412005.png" width="50"> | [**Tips**](https://www.curseforge.com/minecraft/mc-mods/tips) <sub><sup>Tips-1.12.2-1.0.9.jar</sup></sub> <br> This mod adds tips to loading menus. It also allows for modpacks and mods to add their own tips!
<img src="https://media.forgecdn.net/avatars/thumbnails/135/618/256/256/636501629141583847.png" width="50"> | [**Athenaeum**](https://www.curseforge.com/minecraft/mc-mods/athenaeum) <sub><sup>athenaeum-1.12.2-1.19.2.jar</sup></sub> <br> This is my Minecraft mod library. There are many like it, but this one is mine.
<img src="https://media.forgecdn.net/avatars/thumbnails/149/171/256/256/636587358046680164.png" width="50"> | [**Server Tab Info**](https://www.curseforge.com/minecraft/mc-mods/server-tab-info) <sub><sup>ServerTabInfo-1.12.2-1.2.6.jar</sup></sub> <br> A client and/or server mod that gives nice a way to view the mean tick time and ticks per second (TPS) of the game
<img src="https://media.forgecdn.net/avatars/thumbnails/109/826/256/256/636382841953033335.png" width="50"> | [**Chat Tweaks**](https://www.curseforge.com/minecraft/mc-mods/chat-tweaks) <sub><sup>ChatTweaks_1.12.2-5.1.25.jar</sup></sub> <br> Twitch Emotes and Image Preview. Also basically like BetterTTV but for Minecraft.
<img src="https://media.forgecdn.net/avatars/thumbnails/28/371/256/256/635826252878407531.png"  width="50"> | [**(Chat) Ping!**](https://www.curseforge.com/minecraft/mc-mods/chat-ping) <sub><sup>ping-1.9-3.0.9.jar</sup></sub> <br> Notifying users when they are mentioned in chat
<img src="https://media.forgecdn.net/avatars/thumbnails/26/511/256/256/635793547757043222.png"  width="50"> | [**IC2 Crop-Breeding Plugin**](https://www.curseforge.com/minecraft/mc-mods/ic2-nei-crop-plugin) <sub><sup>IC2CropBreeding Plugin V1.12-1.1.jar</sup></sub> <br> Adds a Ingame Breeding Calculator into the Game
<img src="https://media.forgecdn.net/avatars/thumbnails/282/269/256/256/637288548615817474.png" width="50"> | [**Grid**](https://www.curseforge.com/minecraft/mc-mods/grid) <sub><sup>grid-1.12-forge14.21.1.2387-1.4.jar</sup></sub> <br> Show a grid overlay that helps counting when you're building, and optionally spawn locations depending on light level
<img src="https://media.forgecdn.net/avatars/thumbnails/207/323/256/256/636965628804677340.png" width="50"> | [**🔍 Jade**](https://www.curseforge.com/minecraft/mc-mods/jade) <sub><sup>Jade-0.1.0.jar</sup></sub> <br> HWYLA fork & addons
<img src="https://media.forgecdn.net/avatars/thumbnails/159/973/256/256/636662483485973129.png" width="50"> | [**Biome Border Viewer**](https://www.curseforge.com/minecraft/mc-mods/biome-border-viewer) <sub><sup>Biome Border Viewer-1.3.0.0-1.12.2.jar</sup></sub> <br> Shows the borders of biomes.
<img src="https://media.forgecdn.net/avatars/thumbnails/328/951/256/256/637453834515190647.png" width="50"> | [**Eye of Dragons**](https://www.curseforge.com/minecraft/mc-mods/eye-of-dragons) <sub><sup>eyeofdragons-0.0.2.jar</sup></sub> <br> Adds Eye of Dragons to find Ice and Fire (and Lightning) dragons
<img src="https://media.forgecdn.net/avatars/thumbnails/324/397/256/256/637440163997600019.png" width="50"> | [**Kiro's Basic Blocks**](https://www.curseforge.com/minecraft/mc-mods/kiros-basic-blocks) <sub><sup>kirosblocks-1.1.jar</sup></sub> <br> An block texture addon for LittleTiles
<img src="https://media.forgecdn.net/avatars/thumbnails/317/970/256/256/637423409414938144.png" width="50"> | [**NuclearCraft Reactor Builder**](https://www.curseforge.com/minecraft/mc-mods/nuclearcraft-reactor-builder) <sub><sup>NC-ReactorBuilder-1.12.2-1.0.1.jar</sup></sub> <br> An automated reactor builder for NuclearCraft!
<img src="https://media.forgecdn.net/avatars/thumbnails/318/797/256/256/637426150328977672.png" width="50"> | [**Notify me**](https://www.curseforge.com/minecraft/mc-mods/notify-me) <sub><sup>notifymeonstart[1.12.2].jar</sup></sub> <br> send windows notification when your game is ready

## 🔴 Removed Mods

Icon | Summary | Reason of removal
------:|:------|:-----
<img src="https://media.forgecdn.net/avatars/thumbnails/128/511/256/256/636448328534995084.png" width="50"> | [**EnergeticSheep**](https://www.curseforge.com/minecraft/mc-mods/energeticsheep) <sub><sup>undefined</sup></sub> <br> Sheep that generate energy | Method of getting energy from wool is too unclear. For half of year playing with this mod i still dont understand how to use sheep to make energy
<img src="https://media.forgecdn.net/avatars/thumbnails/112/514/256/256/636391997555358332.png" width="50"> | [**JustTheTips**](https://www.curseforge.com/minecraft/mc-mods/justthetips) <sub><sup>justthetips-1.12-1.0.1.1.jar</sup></sub> <br> Adds some tips to loading screens. | Replaced with **Tips**
<img src="https://media.forgecdn.net/avatars/thumbnails/132/988/256/256/636479745271847923.png" width="50"> | [**JEI Villagers**](https://www.curseforge.com/minecraft/mc-mods/jei-villagers) <sub><sup>jeivillagers-1.12-1.0.2.jar</sup></sub> <br> A JEI addon that helps you to see what villagers have to offer. | **Just Anough Resources** adds same tab but better


## ✏️ Recipes

  - ![](https://git.io/JtJk9 "Beeswax") into less biomass
  - ![](https://git.io/Jt8wG "Drill") simplify
  - ![](https://git.io/Jt8wU "Ring of Growth") & ![](https://git.io/Jt8wt "Ring of Liquid Banning") simplify
  - ![](https://git.io/JtlBk "Ring of Speed"), ![](https://git.io/Jt8wL "Advanced Ring of Speed") and all other AA rings simplify
  - ![](https://git.io/JtJkM "Diamond Chisel") recipe fix
  - ![](https://git.io/Jt8wq "Inventory Charger") and other EIO chargers simplify
  - ![](https://git.io/JtqT3 "Artificial Hive") from ![](https://git.io/Jtmfo "Bee") recipe
  - ![](https://git.io/Jt3tf "Silk Wisp") to ![](https://git.io/JLjcw "String") x32 buff
  - ![](https://git.io/Jt8wY "Woven Mining Backpack") and other backpacks simplify
  - ![](https://git.io/JtYHA "Ambrosia") now stackable x64
  - ![](https://git.io/Jt342 "Morphing Tool") now content `integratedtunnels` wrench
  - ![](https://git.io/Jt8wI "Menril Sapling") removed excess recipe from ![](https://git.io/Jt8ws "Nature Essence")
  - [Potion Of Extension] ngredient changed
  - ![](https://git.io/JtJkF "Returning Block of Sticks") simplify
  - ![](https://git.io/JtLeh "Eclipsed Clock") simplify
  - ![](https://git.io/JtG7O "Experience Imbue") and other imbues way simplier
  - ![](https://git.io/JtmXk "Gem of Ratlantis") moved out of botania
  - ![](https://git.io/JtnEj "Firewood") simplify. Mid Blood Magic was too pricy
  - ![](https://git.io/Jt8wZ "Bio Reactor") simplify
  - ![](https://git.io/Jt8wm "Resonant Upgrade Kit") Thermal Expansion: remake all tiered items
    > After changing Upgrade Kits, recipes got changed, so many tiered
    > recipes had glassHardened in their recipes, which too pricy for some of them.

## 📖 Quest Book

- New entries and rearranges
  > Also type fixes from Petey

## 🔄 Misc Changes

- 🗃️ Loot table: remove Leather set and Bronze Sword
  > ![](https://git.io/JtJkH "Leather Cap") ![](https://git.io/JtJky "Leather Tunic") ![](https://git.io/JtJkD "Leather Pants") ![](https://git.io/JtJk7 "Leather Boots") ![](https://git.io/JtlWX "Bronze Sword")

## 🔵 Mods

- ### 🔨 Tinker's Construct

  - TCon: Add more melt recyclings, ![](https://git.io/Jtsg5 "Bee Smoker") for example.
  - TConEvo: Aura Syphon Buff. ![](https://git.io/Jtnz8 "Dreamwood") material
  - Tweakerconstruct: Balance changes. Some buffed, some nerfed
    > Also disable antimagic trait (wont work anyway)

- ### 🐉 Ice and Fire

  - 4x more of ![](https://git.io/Jt8w3 "Pile of Gold") in dragon nests

- ### 🦯 Thaumcraft

  - Remake aspects for some items. ![](https://git.io/Jt8wO "Triple Compressed Cobblestone") for example
  - Buff ![](https://git.io/JtkKU "Headband of Curiosity") back
  - Disable ThaumTweaks craft tweaks
    > Craft Tweaks was removed ![](https://git.io/Jt8wf "Primal Metal Ingot") recipe before
  - [Infernal Furnace] added to Benefication
    > Now this item groups would output more nuggets when smelted in Infernal Furnace
    > - ![](https://git.io/JtlW0 "Native Charged Certus Quartz Cluster") Native Clusters
    > - ![](https://git.io/JtlWR "Dirty Charged Certus Quartz") Dirty Ores
    > - Rat Nuggets

- ### 🌡️ Thermal Expansion

  - ![](https://git.io/Jt8wn "Flux Capacitor (Reinforced)") nerfs. Now way less capacity
  - ![](https://git.io/Jt8wT "Cache (Basic)") x10 buff
  - ![](https://git.io/Jt8wM "Energy Cell (Basic)") capacity buff

- ### 🌿 Patchouli

  - Patchouli: Lava added to ![](https://git.io/JtlC2 "Smeltery Controller") Fuel list

- ### 🖽 Little Tiles

  - LittleTiles: remake all recipes, make cheaper
    > Recipes was changed from recent LT update so need fixes.
    > Also, LT now comes way earlier, no matter if it still give cheat ability to
    > SilkTouch every block without consuming durability

- ### 🎲 Random Things

  - ![](https://git.io/Jt8wv "Block Destabilizer") range buff

- ### 🟨 Recurrent Complex

  - Recurrent Complex: Huge trees disabled
    > They had wrong "empty space" blocks, so when generating cut huge squares of landscape

- ### 👨‍🦯 ExNihiloCreatio
  
  - ![](https://git.io/JttBs "Eyebulb") output ![](https://git.io/Jt8wk "Spider Eye") with crook
  - ![](https://git.io/Jt8we "Scented Hive") enabled, added recipe from ![](https://git.io/Jtmfo "Bee")

- ### 🦌 Better Animals Plus

  - Remove **Eels** from Twilight forest
    > For some reasons they spawns in TF rivers like crazy in packs of 20-30 eels

- ### 🛢️ Immersive Engineering

  - Buff Dynamos (Mills) x3  
  - Also revert Crusher working time. Its still broken btw

- ### Actually Additions

  - Buffed ![](https://git.io/Jt8w9 "Leaf-Eating Generator") Energy Production

- ### Little Tiles

  - Minor ranges tweaks

----------------------------------------------------
----------------------------------------------------

# 0.16

## 🟡 Mods changes

- All Mods was updated to latest
- Removed configs for removed mods

## 🧩 Mods configs

- ExNihilio Crush charcoal always drop 1+ item
- ![](https://git.io/JtkoH "Scanner") consume **x20** more RF
- Packaged ExCrafting: **x100** energy consumption
- Packaged Auto: **x100** energy consumption
- Cooking for blockheads: **2x** size of ![](https://git.io/JtU00 "Kitchen Counter") & ![](https://git.io/JtkKJ "Kitchen Cabinet")
- JEI update item blacklist
- Scalling Health changes
- Thaum Tweaks nerf ![](https://git.io/JtkKU "Headband of curiosity")
- Random Patches removePotionGlint=true
- Tomb Many Graves - enlarge searching radius
- ![](https://git.io/JtkK3 "Traveler's Backpack") buff tank Capacity 4b -> **10b**
- Preston compressor disabled
- OpenBlocks accept Essence same as XP fluid
- Lunatriuscore checkForUpdates=false
- Findme enlarge search radius 8 -> 16

## ✏️ Recipes

- ![](https://git.io/JtJvK "Pattern Chest") with all avaliable patterns recipe
- ![](https://git.io/JtJTp "Strongbox") and ![](https://git.io/JtJwK "Portable Tank") simplified tier 2 recipe
- ![](https://git.io/Jtkwf "Fluxomagnet") Fix shapeless dye recipes
- ![](https://git.io/JtJIt "Infinity Furnace") use ![](https://git.io/JtkwU "Sequoia Wood") in craft
- ![](https://git.io/JtTuj "Conveyor Belt") fix. Also ![](https://git.io/JtJTF "Pebble") uncrafting
- ![](https://git.io/JtJH6 "Rod of Elevation") harder
- ![](https://git.io/JtJft "Waterstone") in ![](https://git.io/JtTPL "Hydrator") recipe added
- ![](https://git.io/JtJf9 "The Vat") now input / output amount of construction foam are calculated right
- ![](https://git.io/JtkKB "Soulstone") cost 50 -> 45 lvls to be automatable in ![](https://git.io/JtkwT "Auto Anvil")
- ![](https://git.io/JtJfb "Phosphor") melting in ![](https://git.io/JtkwJ "Squeezer") output 900 coal (was 800)
- ![](https://git.io/JtJ5E "Knightslime Nugget") from ![](https://git.io/JtkwI "Knightslime Ingot") return recipe
- ![](https://git.io/JtJff "Water Essence") -> ![](https://git.io/JLjcE "Water") squeeze
- ![](https://git.io/JtJTx "Dye Essence") output 4x dyes fix
- ![](https://git.io/Jtko5 "Insanium Ingot") from ![](https://git.io/Jtko9 "Block Of Insanium") return
- ![](https://git.io/JtJJk "White Alabaster") cheaper recipe
- ![](https://git.io/JtJvV "Nature Core") recipe added
- ![](https://git.io/JtJKR "Impulse Hopper") simplify
- ![](https://git.io/JtU0c "Ender Hopper") and ![](https://git.io/Jtko7 "Pearled Ender Hopper") simplify
- ![](https://git.io/JtJvr "Bramble") squeese for Potion of harming
- ![](https://git.io/JtkoQ "Solar Helmet") can be crafted with iron core
- ![](https://git.io/JtJfx "Furnace") simplify
- /dank/null MK II simplify
- Pam's candles crafts uses OreDict

## 🔵 Mods


- ### 🔨 Tinker's Construct

  - Remove all kinds of ![](https://git.io/JtTd8 "Slime Boots") completely

- ### 🐀 Rats

  - ![](https://git.io/JtJFY "Rat Upgrade: Chef") now can cook prime meat
  - ![](https://git.io/JtJ59 "Rat Upgrade: Ore Doubling") now consume hammers in craft

- ### 🦯 Thaumcraft

  - Thaumcraft recalculated aspects
