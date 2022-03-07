# Enigmatica2Expert-Extended v0.48.0⟶Enigmatica2Expert-Extended v0.49.0

## Updated

### [AE2 Unofficial Extended Life](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life) ([appliedenergistics2-rv6-stable-7-extended_life-v50f.jar](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life/files/3661725)⟶[appliedenergistics2-rv6-stable-7-extended_life-v50l.jar](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life/files/3676375))

#### [appliedenergistics2-rv6-stable-7-extended_life-v50l.jar](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life/files/3676375)
  > 
  > fixed fluid dupe bug
  > 
#### [appliedenergistics2-rv6-stable-7-extended_life-v50k.jar](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life/files/3676013)
  > 
  > g)removed crafting calculation penalties due to crafting failures from interfaces and export busses
  > 
  > h)some more crafting tree rework. should be able to request a substitute craft if theres no pattern set for that item and substitutions are on.
  > 
  > j)removed leftover debugging log
  > 
  > delay container item return while simulating crafting to when items "should" actually be available to be used again
  > 
  > (fix recipes using more than 1 bucket while substitute is on not working if you have less than the actual amount of buckets already crafted)
  > 
  > k)fix remaing issues i found, and some small cleanups
  > 
### [Entity Culling](https://www.curseforge.com/minecraft/mc-mods/entity-culling) ([EntityCulling-1.12.2-5.1.1.jar](https://www.curseforge.com/minecraft/mc-mods/entity-culling/files/3656259)⟶[EntityCulling-1.12.2-5.2.0.jar](https://www.curseforge.com/minecraft/mc-mods/entity-culling/files/3668442))

#### [EntityCulling-1.12.2-5.2.0.jar](https://www.curseforge.com/minecraft/mc-mods/entity-culling/files/3668442)
  > 
  > v1.12.2-5.2.0:
  > 
  > * Add temporal bounding box correction
  > * Improve opengl culling performance slightly
  > * Improve raytrace culling performance slightly
  > 
### [Had Enough Items](https://www.curseforge.com/minecraft/mc-mods/had-enough-items) ([HadEnoughItems_1.12.2-4.16.1.jar](https://www.curseforge.com/minecraft/mc-mods/had-enough-items/files/3568778)⟶[HadEnoughItems_1.12.2-4.18.1.jar](https://www.curseforge.com/minecraft/mc-mods/had-enough-items/files/3671148))

#### [HadEnoughItems_1.12.2-4.18.1.jar](https://www.curseforge.com/minecraft/mc-mods/had-enough-items/files/3671148)
  > 
  > * Mouse-click to see recipe/usages now toggleable via config
  > * API: FluidStack ISubtypeInterpreters
  > 
#### [HadEnoughItems_1.12.2-4.18.0.jar](https://www.curseforge.com/minecraft/mc-mods/had-enough-items/files/3669867)
  > 
  > * Backported mezz's substring PR and added further optimizations
  > 
  > Dev stuff:
  > 
  > * Fixes #2
  > * Interns substrings for further memory save
  > * Use `ReferenceOpenHashSet` instead of Set-wrapped `IdentityHashMap`
  > * Use `T[]` instead of `Collection<T>`, `contains` performance isn't worth much to optimize, can introduce a config option if further tests finds it awful
  > 
#### [HadEnoughItems_1.12.2-4.17.1.jar](https://www.curseforge.com/minecraft/mc-mods/had-enough-items/files/3669679)
  > 
  > 4.17.1 - fix and restore cheat-mode item deletion behaviour
  > 
#### [HadEnoughItems_1.12.2-4.17.0.jar](https://www.curseforge.com/minecraft/mc-mods/had-enough-items/files/3668746)
  > 
  > * Ability to change default fluid container in config
  > * Ability to fill containers with fluids when holding it and clicking on a fluid ingredient
  > * New API:
  > * `IIngredientHelper#replaceWithCheatItemStack`
  > * `IClickedIngredient#replaceWithCheatItemStack`
  > 
  > Demo over on our discord.
  > 
### [Modular Controller](https://www.curseforge.com/minecraft/mc-mods/modular-controller) ([ModularController-1.4.1.jar](https://www.curseforge.com/minecraft/mc-mods/modular-controller/files/3652605)⟶[ModularController-1.4.2.jar](https://www.curseforge.com/minecraft/mc-mods/modular-controller/files/3672149))

#### [ModularController-1.4.2.jar](https://www.curseforge.com/minecraft/mc-mods/modular-controller/files/3672149)
  > 
  > [fix potential NPE](https://github.com/ProjectHDS/ModularController/commit/0937293ee02b8829d909aee67d1af134527f69a6)
  > 
  > [change controller in blueprint gui 2D hover](https://github.com/ProjectHDS/ModularController/commit/54d5a15e5b832549952ad5ce4a82ecd4cf8b467a)
  > 
  > [Machine activated event](https://github.com/ProjectHDS/ModularController/commit/01b00ed4e2d59cfd6a9eb6797a8354d75b0e5010)
  > 
### [Zen Utils](https://www.curseforge.com/minecraft/mc-mods/zenutil) ([zenutils-1.10.1.jar](https://www.curseforge.com/minecraft/mc-mods/zenutil/files/3627721)⟶[zenutils-1.10.2.jar](https://www.curseforge.com/minecraft/mc-mods/zenutil/files/3668460))

#### [zenutils-1.10.2.jar](https://www.curseforge.com/minecraft/mc-mods/zenutil/files/3668460)
  > 
  > Journey map waypoint support.
  > 

Generated using [ChangelogGenerator 2.0.0-pre10](https://github.com/TheRandomLabs/ChangelogGenerator).
  > 