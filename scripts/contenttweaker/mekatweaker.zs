
/*
Code and textures from: https://github.com/Redfire75369/Nucleon
*/

#loader contenttweaker
#priority -0007

import crafttweaker.item.IItemStack;
import mods.contenttweaker.Block;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Item;
import mods.contenttweaker.VanillaFactory;

val types = [
	"glowstone",
	"ender"
] as string[];

for type in types {
	val item = VanillaFactory.createItem("compressed_" ~ type) as Item;
	item.register();
}
