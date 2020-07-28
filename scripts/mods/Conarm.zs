import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#modloaded conarm

function remakeResistance(name as string, item as IItemStack, primary as IIngredient){
	remake(name, item, 
		[[<ore:blockDarkSteel>, primary, <ore:blockDarkSteel>],
		[primary, <ore:myrmexResinGlass>, primary], 
		[<ore:blockDarkSteel>, primary, <ore:blockDarkSteel>]]);
}

remakeResistance("conarm_resist_mat", 	    <conarm:resist_mat>,	   <ore:dragonsteelIngot>);
remakeResistance("conarm_resist_mat_fire",  <conarm:resist_mat_fire>,  <ore:dragonscaleBlock>);
remakeResistance("conarm_resist_mat_proj",  <conarm:resist_mat_proj>,  <ore:deathwormChitin>);
remakeResistance("conarm_resist_mat_blast", <conarm:resist_mat_blast>, <ore:seaSerpentScaleBlock>);

remake("Travel Belt Base", <conarm:travel_belt_base>, [
	[null, <ore:string>, null],
	[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>],
	[null, <ore:string>, null]]);


# Night goggles
recipes.remove(<conarm:travel_night>);
recipes.addShapeless(<conarm:travel_night>, [<conarm:travel_goggles_base>, <ic2:nightvision_goggles:26>.anyDamage()]);
recipes.addShapeless(<conarm:travel_night>, [<conarm:travel_goggles_base>, <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:enabled": 1 as byte})]);

# Soul goggles
remakeEx(<conarm:travel_soul>, [
	[null, <rats:ratlantean_flame>, null], 
	[<ore:ingotRefinedGlowstone>, <conarm:travel_goggles_base>, <ore:ingotRefinedGlowstone>], 
	[null, <rats:ratlantean_flame>, null]
]);

# Goggles base
remakeEx(<conarm:travel_goggles_base>, [
	[<ore:string>, <rats:rat_toga>, <ore:string>], 
	[<ore:blockGlassColorless>, <ore:string>, <ore:blockGlassColorless>], 
	[null, null, null]
]);

# gauntlet base
remakeEx(<conarm:gauntlet_mat>, [
	[null, null, <ore:deathwormChitin>], 
	[<ore:ingotIron>, <ore:ingotIron>, <ore:deathwormChitin>], 
	[null, <ore:deathwormChitin>, <ore:deathwormChitin>]
]);

# Travel sack
remakeEx(<conarm:travel_sack>, [
	[<rats:rat_toga>, <minecraft:rabbit_hide>, <rats:rat_toga>], 
	[<minecraft:rabbit_hide>, <actuallyadditions:block_giant_chest>, <minecraft:rabbit_hide>], 
	[<minecraft:rabbit_hide>, <minecraft:rabbit_hide>, <minecraft:rabbit_hide>]
]);
