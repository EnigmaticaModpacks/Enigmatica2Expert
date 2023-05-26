# v1.5.0 (2023-05-26)

## Mods changes
### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.13.7</nobr><br><nobr>zenutils-1.13.10</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/358/827/30/30/637520208754289091.png"            > |                            [**CensoredASM**](https://www.curseforge.com/minecraft/mc-mods/lolasm)                      | <nobr>censoredasm5.8</nobr><br><nobr>censoredasm5.9</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/385/984/30/30/637574191414697010.png"            > |                        [**Fluidlogged API**](https://www.curseforge.com/minecraft/mc-mods/fluidlogged-api)             | <nobr>Fluidlogged-API-v2.2.1-mc1.12.2</nobr><br><nobr>Fluidlogged-API-v2.2.2-mc1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.24.6</nobr><br><nobr>HadEnoughItems_1.12.2-4.24.7</nobr>
-----------

## ✨ Features

Merge changes from original [E2E](https://github.com/EnigmaticaModpacks/Enigmatica2Expert) since `2022-11-21`.

Most of changes unrelated to `E2E-E` or already implemented (like Extreme Reactors removal). Other cahnges was tweaked a little to keep `E2E-E` balance.

- [Add IF ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/biofuel.png "Biofuel") to TE ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalexpansion/dynamo__2__6ac2a757.png "Compression Dynamo (Basic)")](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/2f483533c709c2d60d25a51a735b303b5f0130cf)
- [![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/flow_gate__0.png "Flux Gate") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/flow_gate__8.png "Fluid Gate") have easier recipe](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/d5da216f8c8fb824b57ca494f7f8d3d0ee154d94)
- <img src="https://i.imgur.com/B1X3DSX.png" align=right> [Make ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/rainbowgenerator__0.png "Rainbow Generator!") available earlier](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/20379bcd29f47596440acd7c21e63cefee7a7ae3)
- [Remove **AE2 Seeds** from ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalexpansion/machine__4__45e2e59d.png "Phytogenic Insolator (Basic)")](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/27bf10d7b9a0db0332f0003a46cee1865260ef3e)
- [![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/compressor__0.png "Quantum Compressor") reduce consumption 100k => 50k](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/2f89197aeadf905e1bbf8fd0885cb14f30c7fa88)
- [Remove invalid honey combs from TE ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalexpansion/machine__10__fecfb6d3.png "Centrifugal Separator (Basic)")](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/b1cfe2b95c73f45948a7411ae445a3aa99d42891)
- [Add warning against repaired ![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/graphite_electrode__0.png "Graphite Electrode")](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/f880c428c0d3290aff98a8ce135b192e9841c4d6)
- [Nerf Mekanism Steam Turbine](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/2f89197aeadf905e1bbf8fd0885cb14f30c7fa88)
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanismgenerators/turbineblade__0.png "Turbine Blade") Mekanism Turbine: Output reduced by 90%, now caps at 26.74M rf/t
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanismgenerators/reactor__0.png "Reactor Controller") Mekanism Fusion: Output reduced by 33%, now caps at 19.93M rf/t
- [Removal of un-unified loot](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/commit/af1d54c6a596be6748bbd0847b55aac7950a7325)
  > Removed from all loot sources (wherever applicable):
  > - IC2 copper/tin/bronze ingots, Bronze Swords
  > - I&F silver things, sapphire
  > - IE metals in IE village building
  > - Cyclic Building Scepter
  > - Vanilla Stone Axe
  > - EIO wooden and stone gears

## 🐛 Other Fixes

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0a1465c680500a5d9ab131c980dbe0cddf844b57)📖Conflux levels add correct icon
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/12be6aece58f37246910341fbe2d929c36b9dcd6)📖Fix Sharpness quest typo

#### Recipes

* <img src="https://i.imgur.com/Hv984r8.gif" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a972598a06d3d956b0f5d80b24ce9f6223ff9d35)✏️`Expire in Fire` fix not animated with geyser
  > 


