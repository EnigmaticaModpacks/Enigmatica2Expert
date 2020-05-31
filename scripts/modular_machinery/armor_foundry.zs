import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

var machineName = "armor_foundry";

# All armor data from table
static armorStaged as IData[string] = scripts.DataTables.armorStaged;

# How much items need for each armor part [helmet, chest, legs, feet]
val armorCostBySlot = [5, 8, 7, 4] as int[];

# Iterate over all avaliable armor
for id, stage in armorStaged {

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
	val cmd = stage.material.asString();
	val material as IIngredient = getIngredientFromString(cmd);
	
	# Check if armor and material is real
	if (armCost > 0 && !isNull(material)){
		val tierFactor as float = stage.tier.asFloat() / 10.0f;
		val tierFactorEx = pow(tierFactor, 2.0f);
		val pricesstingTime = (20.0f + 500.0f * tierFactorEx) as int;
		val recipe = mods.modularmachinery.RecipeBuilder.newBuilder(
			machineName ~ "_" ~ id, machineName, pricesstingTime)
			.addEnergyPerTickInput(80000)
			#.addFuelItemInout((34.0f * 64.0f * tierFactorEx) as int * 10000) # 345600 is Burn Time for Supremium coal block
			.addFluidInput(<liquid:lava> * ((59.0f * tierFactorEx) as int * 1000 + 1000));

		# Add Oredict or ItemStack
		if (cmd.matches("^ore:.*")) {
			recipe.addItemInput(getOredictFromString(cmd), armCost);
		} else {
			recipe.addItemInput(getItemstackFromString(cmd) * armCost);
		}

		# Add armor to output
		for i in 0 to 4 {
			if (!(armorItems[i] has p_h)) {
				recipe.addItemOutput(armorItems[i]);
			}
		}
		recipe.build();
	}
}