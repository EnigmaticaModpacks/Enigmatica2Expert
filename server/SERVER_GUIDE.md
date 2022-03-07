## Installing

1) **Download** the zipfile.
2) **Extract** it to an empty folder.
3) If you want to **change RAM** usage, Java arguments etc, see the "settings" file.
4) If you want to play **Skyblock** 🌌, in file `./server.properties` set `level-type=voidworld`. Then overwrite [this configs](https://github.com/Krutoy242/Enigmatica2Expert-Extended/tree/master/dev/skyblock_overrides) on your server (they would disable some generation in void world, like Slime Islands).
5) Double click "**ServerStart**" or "ServerStartLinux", whichever is appropriate.
	On Linux you cannot run the script via sh directly
5) **Set** EULA=true
6) **Pregenerate** the world - See below for instructions.



## Updating

1) **Backup** your world.
2) **Backup** your custom configs. This is usually `./server.properties` file and some configs, like *Discord Integration* options.
3) **Delete** all the folders from the server that are in the archive.
4) **Extract** `.zip` into server folder with overwrite.
7) **Reapply** your custom configs. I recommend that you keep all changes in a seperate archive, so you can just **unarchive** them over after updating.
	
	
	
## Pregeneration


> ⚠️ Warning!
> 
> From version `v0.43.0` and higher, there is a bug that messed up chunks when using pregenerator.  
> This leads to a possible ocean biome in the Nether and a Lich Tower in the Hydra Swamp in the Twilight Forest.   
> Do not use pregen until this bug fixed.


Run these commands:

Pregenerates a circle of terrain, with radius of 300 chunks, centered on 0 0
```r
/pregen gen startradius circle 0 0 300 0
```

Pregenerates a circle of terrain, with radius of 50 chunks, centered on 0 0 in the Twilight Forest
Only applicable for modpacks with the Twilight Forest
```r
/pregen gen startradius circle 0 0 50 7
```

This process will take a while, so I suggest you speed it up:
Increases speed drastically
```r
/pregen timepertick 250
```

Allocates most of the servers resources to the pregenerator.
```r
/pregen utils setPriority Pregenerator
```


While the server pregens, no one should play on it.
It can take several hours to finish. When it has completed,
restart the server.

Feel free to contact me if you need any help, preferably on Discord.