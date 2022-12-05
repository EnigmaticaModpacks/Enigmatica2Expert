import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#modloaded conarm

function remakeResistance(item as IItemStack, primary as IIngredient){
	craft.remake(item, ["pretty",
		"▬ B ▬",
		"B R B",
		"▬ B ▬"], {
		"B": primary,
		"R": <ore:myrmexResinGlass>, # Desert Myrmex Resin Glass
		"▬": <ore:ingotDarkSteel>,   # Dark Steel Ingot
	});
}

remakeResistance(<conarm:resist_mat>,  	    <ore:ingotHSLASteel>);
remakeResistance(<conarm:resist_mat_fire>,  <ore:itemBeeswax>);
remakeResistance(<conarm:resist_mat_proj>,  <ore:dragonscales>);
remakeResistance(<conarm:resist_mat_blast>, <ore:dustAsh>);

remake("Travel Belt Base", <conarm:travel_belt_base>, [
	[null, <ore:string>, null],
	[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>],
	[null, <ore:string>, null]]);


# [Traveller's Goggles (Base)] from [Raw Plastic][+2]
craft.remake(<conarm:travel_goggles_base>, ["pretty",
  "H O H",
  "⌃ H ⌃"], {
  "H": <harvestcraft:hardenedleatheritem>, # Hardened Leather
  "O": <ore:plastic>, # Raw Plastic
  "⌃": <appliedenergistics2:quartz_glass>, # Quartz Glass
});

# [Traveller's Goggles (Night Vision)] from [Traveller's Goggles (Base)][+1]
craft.remake(<conarm:travel_night>, [
  "PTP"], {
  "P": <endreborn:item_end_shard>,   # Purpur Shards
  "T": <conarm:travel_goggles_base>, # Traveller's Goggles (Base)
});

# [Traveller's Goggles (Soul Sight)] from [Traveller's Goggles (Base)][+1]
craft.remake(<conarm:travel_soul>, [
  "RTR"], {
  "R": <rats:ratlantean_flame>,      # Ratlantean Spirit Flame
  "T": <conarm:travel_goggles_base>, # Traveller's Goggles (Base)
});

# gauntlet base
remakeEx(<conarm:gauntlet_mat>, [
	[null, null, <ore:deathwormChitin>], 
	[<ore:ingotFakeIron>, <ore:ingotFakeIron>, <ore:deathwormChitin>], 
	[null, <ore:deathwormChitin>, <ore:deathwormChitin>]
]);

# [Traveller's Knapsack] from [Uncolossal Chest][+2]
craft.remake(<conarm:travel_sack>, ["pretty",
  "p   p",
  "R U R",
  "R R R"], {
  "p": <ore:pelt>,                        # Snowy Wolf Pelt
  "R": <ore:leather>,
  "U": <colossalchests:uncolossal_chest>, # Uncolossal Chest
});

# [Traveller's Cloak (Slow Fall)] from [Traveller's Cloak (Base)][+1]
craft.remake(<conarm:travel_slowfall>, [
  "fTf"], {
  "f": <twilightforest:raven_feather>, # Raven Feather
  "T": <conarm:travel_cloak>,          # Traveller's Cloak (Base)
});

# [Gauntlet of Far Reach] from [Gauntlet (Base)][+2]
craft.remake(<conarm:gauntlet_mat_reach>, ["pretty",
  "■ ▬ ■",
  "▬ G ▬",
  "■ ▬ ■"], {
  "■": <ore:blockLapis>,            # Lapis Lazuli Block
  "G": <conarm:gauntlet_mat>,       # Gauntlet (Base)
  "▬": <randomthings:ingredient:3>, # Spectre Ingot
});