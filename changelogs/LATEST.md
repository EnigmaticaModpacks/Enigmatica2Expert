# v1.2.0


## 🟡 Updated Mods

- **Aqua Acrobatics [Forge]**
- **LagGoggles**
- **Not Enough Energistics**
- **Recurrent Complex**
- **Zen Utils**

## ✏️ **Recipes**
  - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rustic/dust_tiny_iron__0.png "Tiny Pile of Iron Dust") fix combined into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__0.png "Pulverized Iron")

## 🔵 **Mods updates**
  - ### ☢️ **NuclearCraft**: Return ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/fission_shield_manager__0.png "Fission Neutron Shield Manager (WIP)") despite being WIP



## 🔄 **Misc Changes**
  - `Chester` add to CarryOn blacklist to prevent dupes
  - Remove `EmberRootZoo` Fairies
    > Since Fairies cause crashes on AMD cards, remove their spawn and their drops from JEI.
  - add script that prevent `Tomb Many Graves` to void items on death
    > Sometimes, when there is a lot of items with NBT in player inventory, when player dies, they lost some of items forever.
  - Add new screenshots to main menu
  - ### 📖 **Quests**: Questbook improvments
    > - fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/machineblock2__5.png "Precision Sawmill") Plank Count Text
    > - add Note That ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/ingots__5.png "Aluminum Brass Ingot") Cant Be Repeated With Ingots




## 🌌 Skyblock
  - do not generate new islands for new players in skyblock
  - fix spawn of enderman and other mobs in skyblock
    > Since Skyblock is dim 3 now, some mobs dimension whitelist should be configured to accept dim 3 too.
    > Also change black/white lists for some Quark generators
  - fixes to old save loading, void world (#207)
    > 
    > By https://github.com/git-confused
    > 
    > - Fixes:
    >   - https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/206
    >   - https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/205
    >   - https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/204
    > 
    > > The main thing is that old saves should now load without any save editing.
    > > 
    > > Islands are once again spawned by voidislandcontrol (because with the fix to #205, JED can't remember it already spawned the island)
    > 
    > - Removes void teleport to overworld from skyblock
    > 
    > - Skyblock instructions are simplified (it is harmless, but not necessary to set the world type)
    > 
    > - Also, hide alien jungle, +otg config version, remove seed



