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
