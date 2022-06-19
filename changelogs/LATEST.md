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



