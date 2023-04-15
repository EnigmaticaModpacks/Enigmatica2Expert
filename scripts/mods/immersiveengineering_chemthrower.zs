import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.block.IBlockState;

#priority 900
#modloaded immersiveengineering alfinivia

#-----------------------------------------------------
# Basalt remake for Basalt Sediment Alt
#-----------------------------------------------------
val throwerRecipes = {
	<liquid:moltensalt> : {
		{<blockstate:ic2:resource>                       : <ic2:resource>}       : {<blockstate:advancedrocketry:basalt>                       : <advancedrocketry:basalt>},
		{<blockstate:minecraft:grass>                    : <minecraft:grass>}    : {<blockstate:biomesoplenty:grass:variant=silty>             : <biomesoplenty:grass:4>},
		{<blockstate:minecraft:dirt:variant=dirt>        : <minecraft:dirt>}     : {<blockstate:biomesoplenty:dirt:coarse=false,variant=silty> : <biomesoplenty:dirt:10>},
		{<blockstate:minecraft:dirt:variant=coarse_dirt> : <minecraft:dirt:1>}   : {<blockstate:biomesoplenty:dirt:coarse=true,variant=silty>  : <biomesoplenty:dirt:2>},
		{<blockstate:minecraft:farmland>                 : <minecraft:farmland>} : {<blockstate:biomesoplenty:farmland_1>                      : <biomesoplenty:farmland_1>},
	},
	// Somehow, recipes with other liquids not working
	// <liquid:hot_mercury> : {
	// },
} as IItemStack[IBlockState][IItemStack[IBlockState]][ILiquidStack];

for liquid, conversions in throwerRecipes {
	for inputs, outputs in conversions {
		for inB, inS in inputs {
			for outB, outS in outputs {
				scripts.jei.mod.immersiveengineering.addChemthrower(liquid, inS, outS);
			}
		}
	}

	mods.alfinivia.ImmersiveEngineering.addChemthrowerEffect(liquid, false, false, 
		# IChemEntityEffect
		function(target,shooter,throwerstack,fluid) {},

		# IChemBlockEffect
		function(world,pos,side,shooter,throwerstack,fluid) {
			if(world.remote) return;
			val blockState = world.getBlockState(pos);
			for inputs, outputs in throwerRecipes[liquid] {
				for inB, inS in inputs {
					for outB, outS in outputs {
						if(inB.matches(blockState)) {
							world.destroyBlock(pos, false);
							world.setBlockState(outB, pos);
						}
					}
				}
			}
		}
	);
}