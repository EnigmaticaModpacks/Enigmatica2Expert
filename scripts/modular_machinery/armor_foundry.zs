import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;

# All armor data from table
static armorStaged as IData[string] = scripts.equipment.armorData.armorStaged;

# How much items need for each armor part [helmet, chest, legs, feet]
static armorCostBySlot as int[] = [5, 8, 7, 4] as int[];

# ######################################################################
#
# Helpers
#
# ######################################################################

# Iterate recursively all parent tiers to get list of ingredients
function dive(setName as string) as string[]  {
	val curr = armorStaged[setName];
	if (isNull(curr)) return null;

	val ins = curr.material;
	if (!isNull(ins)) {
		val insStr = ins.asString();
		if (!isNull(curr.prev)) { # Something in "previous" data field

			if (curr.prev.asString().startsWith("[")) {
				# Seems like we have list
				var result = [] as string[];
				for v in curr.prev.asList() {
					val deeplist = dive(v);
					if (!isNull(deeplist)) {
						for s in deeplist {result = result + s;}
					}
				}
				return result + insStr;
			} else {
				# We have only one element
				val deeplist = dive(curr.prev);
				if (!isNull(deeplist)) {
					return deeplist + insStr;
				}
			}
		}
		return [insStr];
	}
	return null;
}


# ######################################################################
#
# Generate armor
#
# ######################################################################
var machineName = "armor_foundry";


# Iterate over all avaliable armor
for id, stage in armorStaged { if(!D(stage).check("recipe.noFoundry")) {

	# Each armor part as ItemStacks (in case if string is empty or wrong)
	val p_h = <betterquesting:placeholder>;
	var armorItems as IItemStack[] = [p_h, p_h, p_h, p_h];
	var armCost = 0;

	# Iterate over each armor part to create itemstacks
	for i in 0 to 4 {
		var listedItem = stage.list[i];
		var itemNoNBT as IItemStack = getIngredientFromString(listedItem.id.asString());
		if(!isNull(itemNoNBT)) {
			var item = itemNoNBT;#.withTag(isNull(listedItem.tag) ? {} : listedItem.tag);
			armorItems[i] = item;
			armCost = armCost + armorCostBySlot[i];
		}
	}
	
	# Material for this armor set
	val mats = dive(id);
	
	# Check if armor and material is real
	if (armCost > 0 && !isNull(mats) && mats.length > 0){
		val tierFactor as float = stage.tier.asFloat() / 10.0f;
		val tierFactorEx = pow(tierFactor, 2.0f);
		val pricesstingTime = (20.0f + 500.0f * tierFactorEx) as int;
		val priority = !isNull(stage.tier) ? stage.tier.asInt() : 0;
		val recipe = mods.modularmachinery.RecipeBuilder.newBuilder(
			machineName ~ "_" ~ id, machineName, pricesstingTime)
			.addEnergyPerTickInput(800000)
			#.addFuelItemInout((34.0f * 64.0f * tierFactorEx) as int * 10000) # 345600 is Burn Time for Supremium coal block
			.addFluidInput(<liquid:lava> * ((59.0f * tierFactorEx) as int * 1000 + 1000));

		// # Calculate amount of materials needed
		// var matData = {} as int[string];
		// var matCount = 0;
		// for m in mats {
		// 	if (!isNull(matData[m])) {
		// 		matData[m] = matData[m] + 1;
		// 	} else {
		// 		matData[m] = 1;
		// 		matCount += 1;
		// 	}
		// }
		// var maxI = min(9, matCount);
		// var k = 0;
		// # Add Oredict or ItemStack
		// for mat, count in matData {
		// 	if(k < maxI) {
		// 		var cost = min(64, count * 24);
		// 		if (mat.matches("^ore:.*")) {
		// 			recipe.addItemInput(getOredictFromString(mat), cost /* armCost */);
		// 		} else {
		// 			recipe.addItemInput(getItemstackFromString(mat) * cost /* armCost */);
		// 		}
		// 		k += 1;
		// 	}
		// }
		# Add Oredict or ItemStack
		val maxI = min(9, mats.length);
		for i in 0 to maxI {
			val mat = mats[mats.length - i - 1];
			if (mat.matches("^ore:.*")) {
				recipe.addItemInput(getOredictFromString(mat), 24 /* armCost */);
			} else {
				recipe.addItemInput(getItemstackFromString(mat) * 24 /* armCost */);
			}
		}

		# Add armor to output
		for i in 0 to 4 {
			if (!(armorItems[i] has p_h)) {
				recipe.addItemOutput(armorItems[i]);
			}
		}
		recipe.build();
	}
}}