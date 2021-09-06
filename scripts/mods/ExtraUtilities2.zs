import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#modloaded extrautils2
	
# Bag of Holding
	recipes.remove(<extrautils2:bagofholding>);
	
# Diamond Spike
	recipes.remove(<extrautils2:spike_diamond>);
	recipes.addShapedMirrored("Diamond Spike", 
	<extrautils2:spike_diamond>, 
	[[null, <redstonearsenal:tool.sword_flux>.anyDamage(), null],
	[<immersiveengineering:metal_decoration1_slab:5>, <ore:itemCompressedDiamond>, <immersiveengineering:metal_decoration1_slab:5>], 
	[<ore:itemCompressedDiamond>, <ore:itemCompressedDiamond>, <ore:itemCompressedDiamond>]]);

# Redstone Clock
	recipes.remove(<extrautils2:redstoneclock>);
	recipes.addShaped("XU2 Redstone Clock", 
	<extrautils2:redstoneclock>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <randomthings:advancedredstonetorch_on>, <appliedenergistics2:smooth_sky_stone_block>],
	[<randomthings:advancedredstonetorch_on>, <ore:gemRedstone>, <randomthings:advancedredstonetorch_on>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <randomthings:advancedredstonetorch_on>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Melting Ender Lilies
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:ender> * 2000, <extrautils2:enderlilly>, 100000);

# Removing Easy Moon Stone recipe
	recipes.remove(<extrautils2:ingredients:5>);
	recipes.addShaped("Moon Stone", 
	<extrautils2:ingredients:5>, 
	[[<ore:dustLunar>, <ore:dustLunar>, <ore:dustLunar>],
	[<ore:dustLunar>, <ore:ingotUnstable>, <ore:dustLunar>], 
	[<ore:dustLunar>, <ore:dustLunar>, <ore:dustLunar>]]);

# Fixing the Slime generator recipe (something went wrong with the oredict)
	recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}),true);
	recipes.addShaped("SlimeGen", 
	<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), 
	[[<ore:slimeball>, <ore:slimeball>, <ore:slimeball>],
	[<ore:slimeball>, <ore:blockSlime>, <ore:slimeball>], 
	[<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);

# Wireless RF Transmitter
	recipes.remove(<extrautils2:powertransmitter>);
	recipes.addShapedMirrored("Wireless RF Transmitter", 
	<extrautils2:powertransmitter>, 
	[[null, <extrautils2:ingredients>, null],
	[null, <appliedenergistics2:material:42>, null], 
	[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>]]);

# Wireless RF Battery
	recipes.remove(<extrautils2:powerbattery>);
	recipes.addShapedMirrored("Wireless RF Battery", 
	<extrautils2:powerbattery>, 
	[[<extrautils2:decorativesolid:3>, <ore:blockRedstone>, <extrautils2:decorativesolid:3>],
	[<ore:gemRedstone>, <immersiveengineering:metal_decoration0:3>, <ore:gemRedstone>], 
	[<extrautils2:decorativesolid:3>, <ore:blockRedstone>, <extrautils2:decorativesolid:3>]]);

# Rainbow Generator
	recipes.remove(<extrautils2:rainbowgenerator>);
	recipes.addShaped("Rainbow Generator", 
	<extrautils2:rainbowgenerator>, 
	[[<extrautils2:opinium:4>, <extrautils2:rainbowgenerator:2>, <extrautils2:opinium:4>],
	[<extrautils2:ingredients:16>, <draconicevolution:draconium_capacitor:1>, <extrautils2:ingredients:16>], 
	[<extrautils2:opinium:4>, <extrautils2:rainbowgenerator:1>, <extrautils2:opinium:4>]]);
	
# Transper Pipe
	recipes.remove(<extrautils2:pipe>);
	recipes.addShaped("Transfer Pipe", 
	<extrautils2:pipe> * 32, 
	[[<minecraft:stone_slab>, <minecraft:stone_slab>, <minecraft:stone_slab>],
	[<xnet:netcable:*>, <ore:blockRedstone>, <xnet:netcable:*>], 
	[<minecraft:stone_slab>, <minecraft:stone_slab>, <minecraft:stone_slab>]]);

# Analog Crafter
	recipes.remove(<extrautils2:analogcrafter>);
	recipes.addShaped("Analog Crafter",
	<extrautils2:analogcrafter>, 
	[[<ore:workbench>, <ore:workbench>, <ore:workbench>],
	[<ore:workbench>, <minecraft:lever>, <ore:workbench>], 
	[<ore:workbench>, <ore:workbench>, <ore:workbench>]]);

# Resonator
	recipes.remove(<extrautils2:resonator>);
	recipes.addShaped("Resonator",
	<extrautils2:resonator>, 
	[[<ore:circuitAdvanced>, <extrautils2:machine>, <ore:circuitAdvanced>],
	[<ore:plateSteel>, <chisel:glass:1>, <ore:plateSteel>], 
	[<ore:plateSteel>, <ore:blockCoalCoke>, <ore:plateSteel>]]);

# Machine Block
	recipes.remove(<extrautils2:machine>, true);
	
	var polishedStone = <extrautils2:decorativesolid:2>;
# IC2
	recipes.addShaped("ExtraUtilities2 Machine Block IC2", 
	<extrautils2:machine>, 
	[[polishedStone, <ic2:resource:11>, polishedStone],
	[<ic2:resource:11>, <ic2:resource:12>, <ic2:resource:11>], 
	[polishedStone, <ic2:resource:11>, polishedStone]]);
# IE
	recipes.addShapedMirrored("ExtraUtilities2 Machine Block IE", 
	<extrautils2:machine>, 
	[[polishedStone, <ore:blockSheetmetalIron>, polishedStone],
	[<ore:blockSheetmetalIron>, <ore:electronTube>, <ore:blockSheetmetalIron>], 
	[polishedStone, <ore:blockSheetmetalIron>, polishedStone]]);
# Forestry
	recipes.addShaped("ExtraUtilities2 Machine Block Forestry", 
	<extrautils2:machine> * 3, 
	[[polishedStone, <forestry:thermionic_tubes:3>, polishedStone],
	[<forestry:thermionic_tubes:3>, <forestry:sturdy_machine>, <forestry:thermionic_tubes:3>], 
	[polishedStone, <forestry:thermionic_tubes:3>, polishedStone]]);

# [Sun Crystal (Empty)] from [Pure Certus Quartz Crystal][+1]
recipes.remove(<extrautils2:suncrystal:*>);
craft.remake(<extrautils2:suncrystal:250>, ["pretty",
  "◊ ◊ ◊",
  "◊ ⌃ ◊",
  "◊ ◊ ◊"], {
  "⌃": <appliedenergistics2:material:10>, # Pure Certus Quartz Crystal
  "◊": <ore:gemAmber>, # Amber
});

# Not sure if this would work:
vanilla.seeds.removeSeed(<extrautils2:enderlilly>);

# Remake Chunk loader recipe
remakeEx(<extrautils2:chunkloader>, [
	[<ore:stickTreatedWood>, <ore:eyeofredstone>, <ore:stickTreatedWood>],
	[<ore:stickTreatedWood>, <extrautils2:goldenlasso>.withTag({Animal: {id:"minecraft:villager"}}), <ore:stickTreatedWood>],
	[null, <ore:stickTreatedWood>, null]]);

# Fix generator (probably ench table is invisible because of Quark ench changes)
remakeEx(<extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}), [
	[<ore:blockMagicalWood>, <ore:blockMagicalWood>, <ore:blockMagicalWood>],
	[<ore:blockMagicalWood>, <minecraft:enchanting_table>, <ore:blockMagicalWood>],
	[<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);

# Cut enderpearl into pieces
scripts.process.mash(<minecraft:ender_pearl> , <extrautils2:endershard> * 16, null);

# Blue quartz as ultimate grid user
//mods.extrautils2.Resonator.add(IItemStack output, IItemStack input, int energy, @Optional boolean addOwnerTag);
scripts.wrap.extrautils2.Resonator.add(<extrautils2:decorativesolid:6>, <botania:quartztypemana>, 600 * 100);

# Make quartzburnt harder (was 8 GP)
mods.extrautils2.Resonator.remove(<extrautils2:decorativesolid:7>);
scripts.wrap.extrautils2.Resonator.add(<extrautils2:decorativesolid:7>, <minecraft:quartz_block>, 80 * 100);

# Upgrade base from demonic ingot
mods.extrautils2.Resonator.remove(<extrautils2:ingredients:9>);
scripts.wrap.extrautils2.Resonator.add(<extrautils2:ingredients:9>, <extrautils2:ingredients:11> * 2, 8 * 100);

# Harder Player Chest (was most easy player interface)
craft.remake(<extrautils2:playerchest>, ["pretty",
	"A A A",
	"A C A",
	"A B A"], {
	A: <extrautils2:decorativesolid:7>,
	B: <extrautils2:ingredients:12>,
	C: <enderstorage:ender_storage>,
});

# [Deep_Dark_Portal] from [Black_Iron_Lamp][+3]
craft.remake(<extrautils2:teleporter:1>, ["pretty",
  "░ ☺ ░",
  "◊ B ◊",
  "░ ☺ ░"], {
  "░": <ore:compressed5xCobblestone>, # Sextuple Compressed Cobblestone
  "B": <extendedcrafting:lamp:1>,     # Black Iron Lamp
  "◊": <extrautils2:decorativesolid:6>, # Blue Quartz
  "☺": <contenttweaker:blasted_coal>  # Blasted Coal
});

# [Ender_Porcupine] from [Indexer][+2]
craft.remake(<extrautils2:interactionproxy>, ["pretty",
  "E T E",
  "T I T",
  "E T E"], {
  "T": <ore:dustDimensional>,
  "E": <extrautils2:enderlilly>, # Ender Lilly
  "I": <extrautils2:indexer>     # Indexer
});

# [Redstone Gear] from [Magical Planks][+1]
craft.remake(<extrautils2:ingredients:1>, ["pretty",
  "  ♥  ",
  "♥ M ♥",
  "  ♥  "], {
  "♥": <ore:gemRedstone>,                 # Resonating Redstone Crystal
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# *======= Ring Of The Flying Squid =======*
remake("Ring Of The Flying Squid",
<extrautils2:chickenring:1>, 
[[<extrautils2:ineffableglass>, <actuallyadditions:item_misc:19>, <extrautils2:ineffableglass>],
[<ore:plateDenseGold>, <extrautils2:chickenring>, <ore:plateDenseGold>], 
[<minecraft:golden_apple>, <extrautils2:goldenlasso>.withTag({Animal: {id: "minecraft:squid"}}), <minecraft:golden_apple>]]);

# *======= Angel Ring =======*
for i in 0 to 6 {
	recipes.removeByRecipeName("extrautils2:angel_ring_" ~ i); # Remove shaped
}
recipes.addShaped("Angel Ring", 
	<extrautils2:angelring>, [
	[<ore:plateDenseGold>, <botania:flighttiara:*>, <ore:plateDenseGold>], 
	[<environmentaltech:modifier_creative_flight>, <extendedcrafting:material:40>, <environmentaltech:modifier_creative_flight>], 
	[<ore:plateDenseGold>, <extrautils2:chickenring:1>, <ore:plateDenseGold>]
]);

# [Dragon Egg Mill] from [Redstone Gear][+3]
craft.remake(<extrautils2:passivegenerator:8>, ["pretty",
  "Q e Q",
  "S ♥ S",
  "Q e Q"], {
  "Q": <extrautils2:decorativesolid:7>, # Quartzburnt
  "S": <ore:netherStar>,                # Nether Star
  "e": <ore:eyeofredstone>,             # Eye of Redstone
  "♥": <ore:gearRedstone>,              # Redstone Gear
});

val coreToolIngrs = {
  "⌃": <extrautils2:decorativesolid:6>, # Blue Quartz
  "#": <ore:stickWood>,                 # Stick
  "s": <ore:string>,                    # String
  "O": <extrautils2:opinium:8>,         # Opinium Core (Perfected)
} as IIngredient[string];

# [Kikoku] from [Blue Quartz][+1]
craft.remake(<extrautils2:lawsword>, ["O","O","⌃"], coreToolIngrs);

# [Compound Bow] from [Blue Quartz][+2]
craft.remake(<extrautils2:compoundbow>, ["pretty",
  "  O s",
  "O ⌃  ",
  "s    "], coreToolIngrs
);

# [Fire Axe] from [Blue Quartz][+2]
craft.remake(<extrautils2:fireaxe>, ["pretty",
  "O ⌃",
  "O #",
  "  #"], coreToolIngrs
);


# Harder Flat Transfer Nodes
recipes.remove(<extrautils2:flattransfernode:*>);
mods.mechanics.addCrushingBlockRecipe(<extrautils2:grocket:0>, [<extrautils2:flattransfernode:0>], [1.0d]);
mods.mechanics.addCrushingBlockRecipe(<extrautils2:grocket:2>, [<extrautils2:flattransfernode:1>], [1.0d]);

# Netherstar Generator
static generator_netherstar as extrautilities2.Tweaker.IMachine
	= extrautilities2.Tweaker.IMachineRegistry.getMachine("extrautils2:generator_netherstar");
generator_netherstar.removeRecipe({"input": <minecraft:nether_star>});

# Old energy amount from 1 nether star: 9,600,000 RF
# Old time: 2400
# Old RF/T: 4000
function addNetherStarGen(input as IIngredient, mult as double) {
	val new_rate = 1000.0d;
	generator_netherstar.addRecipe({"input": input}, {}, (new_rate * mult * 2400.0d) as int, 2400); # Default
}

addNetherStarGen(<minecraft:nether_star>                   , 1    ); # Default
addNetherStarGen(<ore:blockNetherStar>                     , 6.0  ); # Block of Nether Stars
addNetherStarGen(<extendedcrafting:material:40>            , 1.2  ); # Ender Star
addNetherStarGen(<extendedcrafting:material:41>            , 0.12 ); # Ender Star Nugget
addNetherStarGen(<mysticalagradditions:nether_star_seeds>  , 100.0); # Nether Star Seeds
addNetherStarGen(<mysticalagradditions:stuff>              , 0.5  ); # Nether Star Shard
addNetherStarGen(<ore:foodNetherstartoast>                 , 1.1  ); # Nether Star on Toast
addNetherStarGen(<mysticalagradditions:nether_star_essence>, 0.06 ); # Nether Star Essence
addNetherStarGen(<ore:nuggetNetherStar>                    , 0.11 ); # Nether Star Nugget
addNetherStarGen(<mysticalagradditions:special>            , 3.0  ); # Nether Star Crux

# [Mechanical User] from [Player Simulator][+4]
craft.remake(<extrautils2:user>, ["pretty",
  "□ ◊ □",
  "M P M",
  "Q Q Q"], {
  "P": <integratedtunnels:part_player_simulator_item>, # Player Simulator
  "Q": <extrautils2:decorativesolid:7>, # Quartzburnt
  "□": <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), # Demonic Large Plate
  "◊": <ore:gemMoon>,                   # Moon Stone
  "M": <tconstruct:materials:19>,       # Mending Moss
});

# [Klein Bottle] from [Xorcite Shard][+3]
craft.remake(<extrautils2:klein>, ["pretty",
  "C X C",
  "M □ M",
  "M □ M"], {
  "□": <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), # Demonic Large Plate
  "C": <minecraft:web>,                   # Cobweb
  "X": <endreborn:death_essence>,         # Xorcite Shard
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# [Stone Drum] from [Omnivoir][+1]
recipes.removeByRecipeName("extrautils2:drum_16");
craft.make(<extrautils2:drum>, [
  "S",
  "O",
  "S"], {
  "S": <extrautils2:decorativesolid:3>, # Stoneburnt
  "O": <enderio:block_omni_reservoir>,  # Omnivoir
});

# [Iron Drum] from [Quartzburnt][+3]
recipes.removeByRecipeName("extrautils2:drum_256");
craft.make(<extrautils2:drum:1>, ["pretty",
  "п Q п",
  "S S S",
  "□ Q □"], {
  "Q": <extrautils2:decorativesolid:7>, # Quartzburnt
  "□": <ore:plateIron>,                 # Iron Plate
  "S": <extrautils2:drum>,              # Stone Drum
  "п": <ore:plateDenseIron>,            # Dense Iron Plate
});

# [Reinforced Large Drum] from [Klein Bottle][+3]
recipes.removeByRecipeName("extrautils2:drum_4096");
craft.make(<extrautils2:drum:2>, ["pretty",
  "R K R",
  "I I I",
  "□ K □"], {
  "□": <ore:plateLumium>,         # Lumium Plate
  "R": <tconstruct:materials:14>, # Reinforcement
  "I": <extrautils2:drum:1>,      # Iron Drum
  "K": <extrautils2:klein>,       # Klein Bottle
});

# [Demonically Gargantuan Drum] from [High Pressure Steam Bucket][+3]
recipes.removeByRecipeName("extrautils2:drum_65536");
craft.make(<extrautils2:drum:3>, ["pretty",
  "K ~ K",
  "R R R",
  "⌃ ~ ⌃"], {
  "R": <extrautils2:drum:2>,            # Reinforced Large Drum
  "⌃": <extrautils2:decorativesolid:6>, # Blue Quartz
  "K": <extrautils2:klein>,             # Klein Bottle
  "~": Bucket("high_pressure_steam"), # High Pressure Steam Bucket
});

function getCreativeHarvest(item as IItemStack) as IItemStack{
	return <extrautils2:creativeharvest>.withTag({creative_block: {meta: item.damage, block: item.definition.id}, display_stack: {id: item.definition.id, Count: 1 as byte, Damage: item.damage as short}});
}

# Infinity item sources
val BQ = <extrautils2:decorativesolid:6>; # Blue Quartz
scripts.wrap.extrautils2.Resonator.add(getCreativeHarvest(BQ), BQ, 1300 * 100);

for item in [
	<minecraft:dirt>,
	<minecraft:concrete:7>,
] as IItemStack[] {
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0,
		getCreativeHarvest(item),
		scripts.craft.grid.Grid(["pretty",
		"d d d",
		"d * d",
		"d d d"], {
		"d": item,
		"*": <actuallyadditions:block_crystal_empowered:4>, # Empowered Emeradic Crystal Block
	}).shaped());
}