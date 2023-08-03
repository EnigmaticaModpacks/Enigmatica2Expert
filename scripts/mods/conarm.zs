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

# [Traveller's Belt (Base)] from [Red Wolf Pelt][+1]
craft.remake(<conarm:travel_belt_base>, [
  "sps"], {
  "s": <ore:string>, # String
  "p": <ore:pelt>,   # Red Wolf Pelt
});

# [Traveller's Goggles (Base)] from [Plastic][+2]
craft.remake(<conarm:travel_goggles_base>, ["pretty",
  "p R p",
  "■ p ■"], {
  "p": <ore:pelt>,       # Red Wolf Pelt
  "R": <ore:itemRubber>, # Plastic
  "■": <ore:blockGlass>, # Glass
});

# [Traveller's Goggles (Night Vision)] from [Traveller's Goggles (Base)][+1]
craft.remake(<conarm:travel_night>, [
  "PTP"], {
  "P": <ore:stonePurpur>,            # Purpur Block
  "T": <conarm:travel_goggles_base>, # Traveller's Goggles (Base)
});

# [Traveller's Goggles (Soul Sight)] from [Traveller's Goggles (Base)][+1]
craft.remake(<conarm:travel_soul>, [
  "GTG"], {
  "G": <enderio:block_holier_fog>,   # Glowstone Nano-Particles
  "T": <conarm:travel_goggles_base>, # Traveller's Goggles (Base)
});

# gauntlet base
remakeEx(<conarm:gauntlet_mat>, [
	[null, null, <ore:deathwormChitin>], 
	[<ore:ingotFakeIron>, <ore:ingotFakeIron>, <ore:deathwormChitin>], 
	[null, <ore:deathwormChitin>, <ore:deathwormChitin>]
]);

# [Traveller's Knapsack] from [Cabinet][+2]
craft.remake(<conarm:travel_sack>, ["pretty",
  "p   p",
  "l C l",
  "l l l"], {
  "p": <ore:pelt>,       # Red Wolf Pelt
  "l": <ore:leather>,    # Leather
  "C": <rustic:cabinet>, # Cabinet
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