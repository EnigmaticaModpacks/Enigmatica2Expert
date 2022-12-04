## Installing

1) **Download** the zipfile.
2) **Extract** it to an empty folder.
3) If you want to **change RAM** usage, Java arguments etc, see the "settings" file.
4) If you want to play **Skyblock** 🌌, in file `./server.properties` set `level-type=voidworld`. Then overwrite [this configs](https://github.com/Krutoy242/Enigmatica2Expert-Extended/tree/master/dev/skyblock_overrides) on your server (they would disable some generation in void world, like Slime Islands).
5) Double click "**ServerStart**" or "ServerStartLinux", whichever is appropriate.
	On Linux you cannot run the script via sh directly.
5) **Set** EULA=true
6) On first server load write `/defaultworldgenerator-port 1` when it ask.
7) **Pregenerate** the world - See below for instructions.



## Updating

1) **Backup** your world.
2) **Backup** your custom configs. This is usually `./server.properties` file and some configs, like *Discord Integration* options.
3) **Delete** all the folders from the server that are in the archive.
4) **Extract** `.zip` into server folder with overwrite.
7) **Reapply** your custom configs. I recommend that you keep all changes in a seperate archive, so you can just **unarchive** them over after updating.
