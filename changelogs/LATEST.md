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



