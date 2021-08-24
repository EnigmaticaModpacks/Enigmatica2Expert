#modloaded travelersbackpack



# *======= Traveler's Backpacks =======*
recipes.remove(<travelersbackpack:hose>);
recipes.addShaped(<travelersbackpack:hose>, [
	[<travelersbackpack:hose_nozzle>, <ore:itemRubber>, <ore:itemRubber>],
	[null, null, <ore:itemRubber>],
	[null, null, <ore:dyeGreen>]]);

recipes.remove(<travelersbackpack:backpack_tank>);
recipes.addShaped(<travelersbackpack:backpack_tank>, [
	[<ic2:casing:3>],
	[<enderio:block_omni_reservoir>],
	[<ic2:casing:3>]]);

# Remake Sleeping bag (prevent conflict)
remakeEx(<travelersbackpack:sleeping_bag_bottom>, [[<quark:quilted_wool:14>, <quark:quilted_wool:14>, <quark:quilted_wool>]]);

