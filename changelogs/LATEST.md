# v1.12.0 (2023-07-14)
## Mods changes
### 🟢 Added Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/536/616/30/30/637858797561019715.png"            > |                    [**Dynamic View[Forge]**](https://www.curseforge.com/minecraft/mc-mods/dynamic-view)                 <sup><sub>dynviewdist-1.12-1.3.jar                         </sub></sup><br>Dynamically changes chunk view(and simulation) distance based on load
<img src="https://media.forgecdn.net/avatars/thumbnails/465/536/30/30/637746919080892172.png"            > |[**Villager Trade Tables - Emerald Edition**](https://www.curseforge.com/minecraft/mc-mods/villager-trade-tables-emerald-edition)<sup><sub>VillagerTrades-1.12.2-0.6.5.jar                  </sub></sup><br>Allows adding and removing villager trades and villagers
<img src="https://media.forgecdn.net/avatars/thumbnails/828/846/30/30/638216794274587308.png"            > |                             [**VintageFix**](https://www.curseforge.com/minecraft/mc-mods/vintagefix)                   <sup><sub>vintagefix-0.2.7.jar                             </sub></sup><br>Load time and RAM use improvements for Minecraft 1.12.2
-----------


### 🔴 Removed Mods

Icon | Summary|Reason
----:|:-------|----
<img src="https://media.forgecdn.net/avatars/thumbnails/401/238/30/30/637607183569439478.png"            > |                               [**Foam​Fix**](https://www.curseforge.com/minecraft/mc-mods/foamfix-optimization-mod)     <sup><sub>foamfix-0.10.15-1.12.2.jar                       </sub></sup><br>Simple, targetted optimizations for a popular block game | Replaced by VintageFix
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/142/108/30/30/636546700830987709.png"            > |                           [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker)                | <nobr>CraftTweaker2-1.12-4.1.20.689</nobr><br><nobr>CraftTweaker2-1.12-4.1.20.690</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/250/251/30/30/637177697702015228.png"            > |                   [**Immersive Technology**](https://www.curseforge.com/minecraft/mc-mods/mct-immersive-technology)    | <nobr>MCTImmersiveTechnology-1.12.2-1.9.100</nobr><br><nobr>MCTImmersiveTechnology-1.12.2-1.9.101</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/297/106/30/30/637343255955991159.png"            > |            [**Mixin 0.7-0.8 Compatibility**](https://www.curseforge.com/minecraft/mc-mods/mixin-0-7-0-8-compatibility) | <nobr>[___MixinCompat-0.8___]</nobr><br><nobr>[___MixinCompat-1.1-1.12.2___]</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/329/782/30/30/637455985217160421.png"            > |                    [**Quark: RotN Edition**](https://www.curseforge.com/minecraft/mc-mods/quark-rotn-edition)          | <nobr>QuarkRotN-r1.6-187</nobr><br><nobr>QuarkRotN-r1.6-188</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/359/974/30/30/637523163306802796.png"            > |                     [**dan's Mouse Tweaks**](https://www.curseforge.com/minecraft/mc-mods/dans-mouse-tweaks)           | <nobr>MouseTweaks-3.1.2-mc1.12.2</nobr><br><nobr>mousetweaks-3.1.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/483/123/30/30/637782695232246251.png"            > |           [**AE2 Unofficial Extended Life**](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life)           | <nobr>appliedenergistics2-rv6-stable-7-extended_life-v0.55.17</nobr><br><nobr>appliedenergistics2-rv6-stable-7-extended_life-v0.55.18</nobr>
-----------

## ✨ New Features


#### Gear

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/021234da36f844c46efed5776bbf4d142042d249)🔨TCon disassembling: consume only 1 durability of tools
  > Was 10

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0492ac6ecffd8571461a09820fa238d4b3de3dc2)👃Add few Apiarist trades

## 🐛 Fixes


#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ecd09d75b9362c13eaa3a6ef7b1d552649e65769)🧩Fix animated texture (bug since v1.10.0)

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/be79663eccdd924e751605361accdf8bfd62481d)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/contenttweaker/conglomerate_of_life__0.png "Conglomerate Of Life") fix cat chance to 25% / cat
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c181012717f3f85b31813f10243fbf7fb09639da)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/lathe__0.png "Rolling Machine") remove all Plate recipes
  > This plates recipes was too hard for such high-tech machine
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/dbe95f334f9c61f9e13872606320011347086c3c)✏️`Tungsten Dust` unify, now all Tungsten dust from QMD
  > Fixes https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/228
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f487244b1cbcf9d5044dba2ff55e951023e9ef02)✏️Remove villagers added by mod `Villager Trade Tables`
  > Removed Brewer, Redstoner and Tinkerer

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/64b77453eaed88f6eeba20c9881083dc6239d808)🦈Return all aquatic animals from BetterAnimalsPlus
  > Now they cant spawn more than 7 per definition.
  > 
  > Also, their AI is x40 times slower, so they should consume not more than vanilla squids



