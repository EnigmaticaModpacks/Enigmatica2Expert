import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#priority -200


// static replExcept as IItemStack[] = [
// 	<extrautils2:sickle_diamond>,
// 	<minecraft:diamond_axe>,
// 	<minecraft:diamond_block>,
// 	<minecraft:diamond_hoe>,
// 	<minecraft:diamond_pickaxe>,
// 	<minecraft:diamond_shovel>,
// 	<minecraft:diamond_sword>,
// 	<thermalfoundation:material:16>
// ] as IItemStack[];


// # More uses for Rat Diamond
// recipes.replaceAllOccurences(<ore:gemDiamond>, gemDiamondRat, <*>.only(function(item) {
// 	if(isNull(item)){ return false; }
// 	for ii in replExcept {
// 		if (ii.anyDamage().matches(item)){ return false; }
// 	}
// 	return true;
// }));
// recipes.replaceAllOccurences(<minecraft:diamond>, gemDiamondRat, <*>.only(function(item) {
// 	if(isNull(item)){ return false; }
// 	for ii in replExcept {
// 		if (ii.anyDamage().matches(item)){ return false; }
// 	}
// 	return true;
// }));