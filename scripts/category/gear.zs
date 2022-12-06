import crafttweaker.item.IItemStack;

val gearsToRemove = [
	<appliedenergistics2:material:40>,
	<thermalfoundation:material:22>,
	<thermalfoundation:material:23>,
	<thermalfoundation:material:24>,
	<thermalfoundation:material:25>,
	<thermalfoundation:material:26>,
	<thermalfoundation:material:27>,
	<thermalfoundation:material:256>,
	<thermalfoundation:material:257>,
	<thermalfoundation:material:258>,
	<thermalfoundation:material:259>,
	<thermalfoundation:material:260>,
	<thermalfoundation:material:261>,
	<thermalfoundation:material:262>,
	<thermalfoundation:material:263>,
	<thermalfoundation:material:264>,
	<thermalfoundation:material:288>,
	<thermalfoundation:material:289>,
	<thermalfoundation:material:290>,
	<thermalfoundation:material:291>,
	<thermalfoundation:material:292>,
	<thermalfoundation:material:293>,
	<thermalfoundation:material:294>,
	<thermalfoundation:material:295>,
	<redstonearsenal:material:96>,
	<jaopca:item_geardraconium>,
] as IItemStack[];

for items in gearsToRemove {
	recipes.remove(items);
}


