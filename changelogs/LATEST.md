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






