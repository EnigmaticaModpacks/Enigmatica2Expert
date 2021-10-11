#modloaded betteranimalsplus

<ore:pelt>.addItems([
	<betteranimalsplus:bear_skin_black>,
	<betteranimalsplus:bear_skin_brown>,
	<betteranimalsplus:bear_skin_kermode>,
	<betteranimalsplus:wolf_pelt_arctic>,
	<betteranimalsplus:wolf_pelt_black>,
	<betteranimalsplus:wolf_pelt_brown>,
	<betteranimalsplus:wolf_pelt_red>,
	<betteranimalsplus:wolf_pelt_snowy>,
	<betteranimalsplus:wolf_pelt_timber>,
]);

# Tallow
scripts.process.squeeze([<betteranimalsplus:blubber>], <liquid:lubricant> * 50, "except: CrushingTub Squeezer MechanicalSqueezer", null);

# This crab is unobtainable
utils.rh(<betteranimalsplus:crab_meat_cooked>);
furnace.remove(<betteranimalsplus:crab_meat_cooked>);


scripts.loot.animal_drops.tweak("betteranimalsplus:deer","deer-venison","betteranimalsplus:venisonraw", <betteranimalsplus:venisonraw>, [<harvestcraft:venisonrawitem>], [1,3]);
scripts.loot.animal_drops.tweak("betteranimalsplus:reindeer","reindeer","betteranimalsplus:venisonraw", <betteranimalsplus:venisonraw>, [<harvestcraft:venisonrawitem>], [1,3]);
scripts.loot.animal_drops.tweak("betteranimalsplus:moose","moose-venison","betteranimalsplus:venisonraw", <betteranimalsplus:venisonraw>, [<harvestcraft:venisonrawitem>], [2,5]);
scripts.loot.animal_drops.tweak("betteranimalsplus:nautilus","nautilus","minecraft:fish", null, [<harvestcraft:oysterrawitem>], [1,3]);
scripts.loot.animal_drops.tweak("betteranimalsplus:hirschgeist","hirschgeist", null, null, [<randomthings:ingredient:2>], [5,15]);
scripts.loot.animal_drops.tweak("betteranimalsplus:crab","crab","betteranimalsplus:crab_meat_raw", <betteranimalsplus:crab_meat_raw>, [<harvestcraft:crabrawitem>], [1,3]);

# [Raw Turkey] from [Raw Turkey]
craft.make(<betteranimalsplus:turkey_raw>, ["pretty",
  "A A A",
  "A A A",
  "A A A"], {
  "A": <ore:listAllturkeyraw>, # Raw Turkey
});