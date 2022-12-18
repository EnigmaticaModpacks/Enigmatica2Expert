# v0.85.0


## 🟢 New Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/159/374/30/30/636658415780463602.png"           > | 🟨                          [**CraftPresence**](https://www.curseforge.com/minecraft/mc-mods/craftpresence)                 <sup><sub>CraftPresence-Forge-1.12.2-Release-1.9.6.jar</sub></sup> <br> Completely Customize the way others see you play in Discord! | Replace DiscordSuite, that not working for everyone


## 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------| ------
<img src="https://media.forgecdn.net/avatars/thumbnails/141/61/30/30/636539476766896518.png"            > | 🟫                           [**Book Display**](https://www.curseforge.com/minecraft/mc-mods/book-display)                  <sup><sub>bookdisplay-1.12.2-2.0.0.jar</sub></sup> <br> Read books while moving! | Nobody used this feature ever
<img src="https://media.forgecdn.net/avatars/thumbnails/173/965/30/30/636747325401407773.png"           > | 🟫                           [**DiscordSuite**](https://www.curseforge.com/minecraft/mc-mods/discordsuite)                  <sup><sub>DiscordSuite-2.2.4.jar</sub></sup> <br> Discord Rich Presence | Replaced by **CraftPresence**
<img src="https://media.forgecdn.net/avatars/thumbnails/123/87/30/30/636414183009669862.png"            > | 🟫                           [**Diet Hoppers**](https://www.curseforge.com/minecraft/mc-mods/diet-hoppers)                  <sup><sub>diethopper-1.1.jar</sub></sup> <br> Tightens the selection box of the hopper to allow you to access visible blocks behind them. | Now included in **Universal Tweaks**
<img src="https://media.forgecdn.net/avatars/thumbnails/526/595/30/30/637846069796215011.png"           > | 🟫                      [**Entity Desync Fix**](https://www.curseforge.com/minecraft/mc-mods/entity-desync-fix)             <sup><sub>EntityDesyncFix-1.12.2-1.0.2.jar</sub></sup> <br> Fix entity motion desync (for example arrows or thrown items) | Now included in **Universal Tweaks**

## 🟡 Updated Mods

- **AE2 Unofficial Extended Life**
- **AE2 Fluid Crafting Rework**
- **Universal Tweaks**
- **CensoredASM**


## ✨New feature - Nerf Morbs ([#148](https://github.com/Krutoy242/Enigmatica2Expert-Extended/pull/148)) <img src="https://i.imgur.com/616Ckht.png" width=25% align=right>
  > Strong mobs need to be damaged first
  > 
  > Prevent some throwable stackable Entity Cells from working, if mob have lot health and not damaged.
  > 
  > Currently, mob should have less than 20 HP (10 health) or less than 80% of health.
  > 
  > Affected throwables: ![](https://is.gd/wyRUzi "Morb (Empty)")![](https://is.gd/XO5yT9 "Reusable Morb (Empty)")![](https://is.gd/L3pRMp "Monster Ball")


## ✏️ **Recipes**
  - Add ~100 entities to ![](https://is.gd/aKuCGm "Spawner") <img src="https://i.imgur.com/iz9I7Tp.png" width=25% align=right>
    > Including Pink wither and ALL the entities listed in **Mob Drops** JEI custom tab



## 🔄 **Misc Changes**
  - Fix particles not spawned in non-Overworld with custom mechanics
    > This fix related to
    > - Infuse ![](https://is.gd/NwGm8Z "Bedrock") with ![](https://is.gd/lOlPyp "Osmium Essence"). (also fixes unable to infuse in non-overworld worlds)
    > - Infuse ![](https://is.gd/qTkiFI "Sand") with ![](https://is.gd/JFYP5c "Aquamarine Essence")
    > - Scaffolding
    > - Breaking ![](https://is.gd/14VSnD "Oak Wood Slab") with ![](https://is.gd/Q0Z8LR "Stick")
  - Disable `Animated Terrain` by default
    > This optifine would increase your FPS from 30 to 200.  
    > Downside - water not animated. Modded fire not animated.
    > 
    > There is also bug that lead to items textures not animated too. Should be fixed one day.
  - Hide LittleTiles VBO varning (top-left screen corner)
  - Set default sound level to 10%
  - Random Things fix spelling: `Lubricent` -> `Lubricated`
  - add ![](https://is.gd/XoaQY3 "Infested Leaves") drops

## 📖 **Quests**
  - 📖fix typo in first quest ([#145](https://github.com/Krutoy242/Enigmatica2Expert-Extended/pull/145))
  - Fix enderium quest dependensies
  - Translate all non-translated EN for RU and CN
    > Sorry for bad `zh_cn` translation, i used machine translator.
  - Misc improvments
    > - Hint about pickaxe conversions for "Excavator" quest
    > - Change task for Ember Root mobs
    > - Fix count of materials for IE Excavator task



