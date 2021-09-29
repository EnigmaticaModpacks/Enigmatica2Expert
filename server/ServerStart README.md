# Modpack ServerStart Scripts

   Minecraft-Forge Server install/launcher script

   Created and supported by the All The Mods Team with special thanks to @OrdinatorStouff and @Dijkstra  

   GitHub: https://github.com/AllTheMods/Server-Scripts          
   AllTheMods Discord: https://discord.gg/FdFDVWb      

   Originally created for use in "All The Mods" modpacks, but is **free for anyone to use, modify or distribute** provided the conditions of the custom license (detailed below) are met.

<br>

<br>

<br>


## Description
#### OS Batch/Script to help install/run modpack servers. Available for Windows and Linux (Bash). 

   These scripts will fetch the appropriate Forge installer and install it. This will also install Mojang's distribution-restricted Minecraft binary and the required libraries.

   After Forge/Minecraft are installed, the same script will act as a launcher to start the server, with an auto-restart-after-crash feature as well. (No need for a separate "install" script). It's also adaptable to smoothly transition to new versions of Forge *even on existing servers that have already been setup*. If the installed Forge version is different from what's supplied in the settings.cfg, the script will remove the old Forge and re-download and install the version specified. The script also performs *many* basic checks such as looking for a valid Java version installed and checking that EULA.txt has been updated.

   All relevant settings are in the easily accessible "settings.cfg" file; Modpack creators can specify their pack's Minecraft and Forge versions, and server operators can specify JVM args and RAM allocation as desired.

   IF THERE ARE ANY ISSUES
   Please make a report on the github linked above


<br>

<br>

<br>


# How To Use

#### Do not modify `ServerStart.bat` or `ServerStart.sh`
#### All settings are modified in `settings.cfg` instead.

Windows: **`ServerStart.Bat`** *(Run/Double-Click)*  
Linux: **`bash ServerStart.sh`** *(must be bash, not shell/sh)*

**OPTIONAL** There is an "install only" option that will setup all required files but NOT automatically run the server. Simply pass the option "install" after the script from a prompt. NOTE: Linux sh support for this option is still WIP (TODO):
```
ServerStart.Bat install
```

________________   

### settings.cfg   
Formatting is very important for it to load correctly: 
* `SETTING=VALUE;`
* No spaces around the equal sign
* One setting per line
* Semicolon immediately following value (no spaces)


| Setting   | Description                | Example Value | 
| ----------|----------------------------| :------------:|
| **MAX_RAM**      | How much max RAM to allow the JVM to allocate to the server  | `5G` |
| **JAVA_ARGS**      | The defaults provided should be best for most people, but can be edited if desired | *See Below* |
| **CRASH_COUNT** | The max number of consecutive crashes that each occur within so many seconds of each other. If max is reaches, the script will exit. This is to stop spamming restarts of a server with a critical issue. | `8` |
| **CRASH_TIMER** | The number of seconds to consider a crash within to be "consecutive" | `600` |
| **RUN_FROM_BAD_FOLDER** | The scripts will not run from "temp" folders or "system" folders. If you want to force allow this, change the value to `1` | `0` | 
| **IGNORE_OFFLINE** | The scripts will not run if a connection to the internet can not be found. If you want to force allow (i.e. to run a server for local/LAN only) then set to `1`. Note, however that it will need internet connection to at least perform initial download/install of the Forge binaries | `0` |
| **IGNORE_JAVA_CHECK** | By default, the script will stop/error if it can not find 64-bit Java 1.8 or 1.9. Some packs might be able to run with less than 4G or RAM or on older 1.7 java. If you want to use an older version or are limited to a 32-bit OS, setting this to `1` will let the script continue | `0` | 
| **USE_SPONGE** | Mostly unsupported and experimental. If set to `1` script will attempt to launch SpongeBootstrap but only if the bootstrap is present and SpongeForge is in Mods folder. This will not download/setup the required files either, merely launch the pack using them. **Sponge can cause undocumented errors and conflicts and therefore it's use is rarely supported by modpack developers. USE AT YOUR OWN RISK and only if you know what you're doing** | `0` |
| **HIGH_CPU_PRIORITY** | This will attempt to start the Java process in a higher priority than "normal." This shouldn't have a major negative impact on the host computer but if it's causing conflicts or taking too much CPU time you can try disabling. *Linux implementation is still WIP (TODO)* | `1` |
| **MODPACK_NAME** | Pack name to add flavor/description to script as it's running. Quotes are not needed. Can contain spaces. Technically can be very long, but will work better if short/concise (i.e. "Illumination" would be *much* better to use than "All The Mods Presents: Illumination") | `All The Mods` |
| **MCVER** | Target Minecraft version. Usually set by pack dev before distributing and not intended to be changed by end-users. Must be complete/exact and matching the version on Forge's website (i.e. `1.10` is not the same as `1.10.2`) | `1.10.2` |
| **FORGEVER** | Target Forge version. Usually set by pack dev before distributing and not intended to be changed by end-users. Requires the full version and exactly matching Forge's website. (i.e. `2254` will not work, but `12.18.3.2254` will) | `12.18.3.2281` | 
| **FORGEURL** | Direct url to a Forge "installer" jar. Mostly for debugging purposes, but if a URL is specified, the Forge installer of this link will be downloaded regardless of the previous settings.\*   | `DISABLE` |


\**NOTE: Another debug/bypass options is for modpack creators to package and redistribute the forge installer matching their desired version as long as it's name matches the format: `forge-<MinecraftVersion>-<ForgeVersion>-installer.jar` If included, none will need to be downloaded first.*  

<br>

<br>

<br>


## Optional Java Arguments

   Java can be tweaked with launch settings that can sometimes improve the performance of Minecraft over default (no launch options), especially for 1.10+ and larger packs such as All The Mods.

<br>


______________________________
**BASIC**  
These basic settings are recommended for general use for any modpack:
   ```
   -d64 -server -XX:+AggressiveOpts -XX:ParallelGCThreads=3 -XX:+UseConcMarkSweepGC -XX:+UnlockExperimentalVMOptions -XX:+UseParNewGC -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=10 -XX:GCPauseIntervalMillis=50 -XX:+UseFastAccessorMethods -XX:+OptimizeStringConcat -XX:NewSize=84m -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -Ddeployment.trace=true -Ddeployment.log=true -Ddeployment.trace.level=all -Dfml.debugNetworkHandshake=true -Dfml.badPacketCounter=10
   ```   


<br>
   
______________________________
There are many opinions on what's considered good or not-so-good to use for JVM args that change from person-to-person, and over time. The settings above were based on [this great discussion/explanation](https://www.reddit.com/r/feedthebeast/comments/5jhuk9/modded_mc_and_memory_usage_a_history_with_a/) by CPW, the lead dev of EnderIO and a prominent contributor to the Forge project.



<br>

<br>

<br>


# Background Story
Mojang's [Minecraft EULA](https://account.mojang.com/documents/minecraft_eula) is extremely open and forgiving, going so far as to "encourage you to do cool stuff." One of the very few explicit restrictions and "the one major rule" prohibits re-distributing Minecraft or any part of it (including the Minecraft server binary files):
> "In order to ensure the integrity of the Game, we need all Game downloads and updates to come from an authorized source. It's also important for us that 3rd party tools/services don't seem "official" as we can't guarantee their quality. It's part of the responsibility we have to the customers of Minecraft."

This means that any modpack team/developer that wants to provide users with a *ready-to-use* server file package can't provide all the binaries and therefore would be incomplete. This script bridges that gap by dynamically fetching and installing MinecraftForge. The forge installer conveniently fetches the Minecraft binaries from Mojang's servers as well as the required library files as well providing a seamless "install" step followed by launching/running the server after initial setup. 

From there we decided we wanted to go all-out providing as many features and configuration options as possible to make setting up and running a server as easy as possible. We want this to be more than just a simple "workaround" to the distribution restriction, but a full-featured option for server operators that don't use a control panel or management software.






_____________________

<br>

<br>

<br>


# Custom License
The *only* reason we included a license is because we wanted it to be **easier** for more people to use/share this. Some places (i.e. Curse) need some form of "official" notice allowing content to be used. Since we were making a license anyway, we thought it would be nice to add an attribution clause so others didn't try to claim our work as their own. The result is this custom license based on a combination of the [MIT license](https://opensource.org/licenses/MIT) and a couple parts from Vaskii's [Botania](http://botaniamod.net/license.php)/[Psi](http://psi.vazkii.us/license.php) license:
```
Copyright (c) 2017 All The Mods Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

You must give appropriate credit to the "All The Mods Team" as original 
creators for any parts of this Software being used. A link back to original 
content is optional but would be greatly appreciated. 

It is forbidden to charge for access to the distribution of this Software or 
gain money through it. This includes any type of inline advertisement, such 
as url shorteners (adf.ly or otherwise) or ads. This also includes 
restricting any amount of access behind a paywall. Special permission is 
given to allow this Software to be bundled or distributed with projects on 
Curse.com, CurseForge.com or their related sub-domains and subsidiaries.

Derivative works must be open source (have its source visible and allow for 
redistribution and modification).

The above copyright notice and conditions must be included in all copies or 
substantial portions of the Software, including derivative works and 
re-licensing thereof. 
```

____________________________
## DISCLAIMERS

"All The Mods Team" is not affiliated with "Mojang," "Oracle," "Curse," "Twitch," "Sponge," "Forge" or any other entity (or entity owning a referenced product) potentially mentioned in this document or relevant source code for this Software. The use of their names and/or trademarks is strictly circumstantial and assumed fair-use. All credit for their respective works, software, branding, copyrights and/or trademarks belongs entirely to them as original owners/licensers.

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```


_______________________________


<br>
<br>
<br>
<br>
<p align="center">
  <img src="https://i1.wp.com/allthepacks.com/wp-content/uploads/2017/01/Abyus4d.png" alt="All The Mods" width="400" height="400">
</p>
<br>

