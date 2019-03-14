#Compatibility for Immersive Engineering <liquid:ethanol>
	
for item in <ore:listAllveggie>.items {
	mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 80, item, 500);
}

for item in <ore:listAllseed>.items {
	mods.immersiveengineering.Squeezer.addRecipe(null, <liquid:plantoil> * 80, item, 500);
}