# 1.93

When loading an existing world, you'll get a warning that Extreme Reactors blocks and items are missing. It's both safe and intentional 👍

## Mods added

- Aerial Affinity
- LittleTiles
- Tinker's JEI
- BloodMagic Meteor Support

## Mods removed

- ZeroCore2
- ExtremeReactors (remove quest icon)

## Improvements:

- Ex Nihilo Ore Piece recipes are now reversible
  - You can use compacting drawers to make/unmake ore pieces
  - Highly recommend using locked compacting drawers for sieve setups for optimal tps performance
- Global Dynamo changes
  - Increased dynamo augment slots to 1/2/4/6/9 slots per tier respectfully
  - Increased crafting cost of many dynamo augments
  - As a whole, dynamos are significantly buffed and should have many viable early-to-mid power options
- Rebalanced Compression Dynamo and Combustion Generator Fuels (significantly buffed)
  - Reduced base power rate of Dynamo
  - Increased fuel efficiency of compression dynamo fuels and coolants
  - Increased crafting cost of the EnderIO Combustion Generator
  - Rebalanced eio combustion generator fuels to be the same as compression dynamo, but more efficient
  - Increase max power io of combustion generator
  - Change power scaling of combustion generator with capacitor level to be linear per level (level 3 cap = 3x power rate and total power)
  - Remove water from combustion generator coolants
- Buffed Magmatic Dynamos base output rate from 320 -> 800
- Rebalanced Numismatic Dynamo
  - Reduced base output rate from 640 -> 480
  - Buffed some fuels, both coins and gems should now be valid options for power
  - Buffed alloy based coins such as enderium
  - Buffed rarer metal coins such as platinum/iridium
  - Added some gem fuels
- Rebalanced Reactant Dynamo
  - Buffed "elemental" reactions fuel output by 200%
  - Reduced base output rate from 800 -> 480
- Industrial Foregoing biofuel and protein
  - Bioreactor increased base biofuel created from 100 to 125
  - Biofuel generator increased power generation from 160 to 4800 rf/t
  - Protein generator increased power generation from 160 to 6400 rf/t
  - Biofuel and protein generators has ~6x fuel efficiency of compression dynamo running biofuel/protein respectfully, but less rf/t
  - Increased crafting cost of biofuel generator
  - Added JEI info tabs about protein/biofuel reactors and generators
- Slime Dirt: Added renewable recipes for slime dirt variants
- Added JEI info tabs for thermal elemental materials pointing to dolls
- Lategame Mending Moss recipe in Thermal Arcane Ensorcellator
- Magical Wood Large Plate can now be automated
- Added Woven Silk recipe
- Added Iodine Capsule recipe
- Added Dissipation Charge recipe
- ModularMachinery requires blueprints again
- Remove Void Seeds' temporary recipe.
- Added Void Seed to Arcane Crafting Engine
- Added Essentia Buffer to Arcane Crafting Engine
- Clathrates can now be mined using the IF Laser Drill on certain planets
- The Orbital Laser Drill is now much more effective at drilling certain rare metals and crystals (Including Rutile)
- Decreased Slime/Magma island spawn rate by 50%, in an effort to decrease lag
- Better JEI descriptions on several items, including Rutile Ore and Titanium Ingot
- Rock Crystal can now be processed in the EnderIO SAG Mill for a chance at bonus Celestial Crystals
- Added Crystal Sword recipe: infuse a Diamond Sword in the Astral Sorcery Starlight Infuser

## Bugs fixed:

- Dilithium Ore shows up as material.dilithium.name
- Batteries show up as item.battery1.name
- Corrected Immersive Tech shematics [#2179](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/pull/2179/changes)
- Change EmberRoot Zoo Deer to drop Venison[#2184](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/pull/2184)
- Fix Immersive Engineering Conveyor Belt Redstone Recipes [#2183](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/pull/2183)
- Change Gourmet Patty recipes from Mustard Seed to Mustard Crop [#2182](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/pull/2182)
- _Actually_ Change Pork Rinds and Cracklins recipes [#2181](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/pull/2181)
- Fixed planet KELT-6a (dim 121) having incorrect biomes - It's now alien forest and marsh as intended.
  - For the fix to take effect in existing worlds, you need to:
    - Remove the `advRocketry/planetDefs.xml` file (just that 1 file)
    - Join the world
    - Run the command `advRocketry planet delete 121`
- You can craft mekanism gas tanks with any tank instead of just the tank in the recipe
  [\#2228 ](https://github.com/EnigmaticaModpacks/Enigmatica2Expert/issues/2228)

---

# 1.92

## Mods added:

- XU2 Patcher
- IC2 Patcher
- Adv Backups

## Mods removed:

- FTB Backup
- TexFix (TCon tools are white with it)

# 1.91

## Mods added:

- BH Menu
- VanillaFix
- TexFix
- X EntityCulling (doesn't work with vanillafix)
- X MixinSomething (doesn't work with vanillafix)

## Updated (None)

- Storage Drawers
- Thaumic JEI
- Rustic
- Packaged Auto
- Advanced Rocketry
- Controlling
- Recurrent Complex
- JEI
- JourneyMap
