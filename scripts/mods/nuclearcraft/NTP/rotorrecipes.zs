import scripts.mods.nuclearcraft.NTP.rotorclasses.StatorInfo;
import scripts.mods.nuclearcraft.NTP.rotorclasses.BladeInfo;
import scripts.mods.nuclearcraft.NTP.rotorclasses.qmdBladeInfo;
import scripts.mods.nuclearcraft.NTP.rotorlist.StatorInfoList;
import scripts.mods.nuclearcraft.NTP.rotorlist.BladeInfoList;
import scripts.mods.nuclearcraft.NTP.rotorlist.qmdBladeInfoList;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.AlloyFurnace;







function addStatorRecipe (info as StatorInfo){
	var material as IIngredient;	
	if (oreDict has ("ingot"~info.item)){
	material = oreDict.get("ingot"~info.item);
	}else{
	if (oreDict has ("dust"~info.item)){
			material = oreDict.get("dust"~info.item);
			
		}else{
			material = oreDict.get("gem"~info.item);
			
		}
	}
	
	
	recipes.addShaped("ntp " ~info.name ~ " stator", itemUtils.getItem("nuclearcraft:turbine_rotor_stator_" ~ (info.name).toLowerCase())*4,
	[[<nuclearcraft:turbine_rotor_stator>,material, <nuclearcraft:turbine_rotor_stator>],
	[material, <ore:ingotHSLASteel>, material],
	[<nuclearcraft:turbine_rotor_stator>,material, <nuclearcraft:turbine_rotor_stator>]]); 
	
}
	
function addBladeRecipe (info as BladeInfo){
	var material as IIngredient;	
	if (oreDict has ("ingot"~info.item)){
	material = oreDict.get("ingot"~info.item);
	}else{
	if (oreDict has ("dust"~info.item)){
			material = oreDict.get("dust"~info.item);
			
		}else{
			material = oreDict.get("gem"~info.item);
			
		}
	}
	
	var bladed = oreDict.get("tblade"~ info.blade);			
	recipes.addShaped("ntp " ~info.name ~ " blade", itemUtils.getItem("nuclearcraft:turbine_rotor_blade_" ~ (info.name).toLowerCase())*4,
	[[bladed,material, bladed],
	[material, <ore:ingotHSLASteel>, material],
	[bladed,material,bladed]]); 
	
}	
	
	
function addqmdBladeRecipe (info as qmdBladeInfo){
	var material1 as IIngredient;	
	if (oreDict has ("ingot"~info.item1)){
	material1 = oreDict.get("ingot"~info.item1);
	}else{
	if (oreDict has ("dust"~info.item1)){
			material1 = oreDict.get("dust"~info.item1);
			
		}else{
			material1 = oreDict.get("gem"~info.item1);
			
		}
	}
	var material2 as IIngredient;	
	if (oreDict has ("ingot"~info.item2)){
	material2 = oreDict.get("ingot"~info.item2);
	}else{
	if (oreDict has ("dust"~info.item2)){
			material2 = oreDict.get("dust"~info.item2);
			
		}else{
			material2 = oreDict.get("gem"~info.item2);
			
		}
	}
	
	
	var bladed = oreDict.get("tblade"~ info.blade);			
	recipes.addShaped("ntp " ~info.name ~ " blade", itemUtils.getItem("nuclearcraft:turbine_rotor_blade_" ~ (info.name).toLowerCase())*4,
	[[bladed,material1, bladed],
	[material2, <ore:ingotElektron60>, material2],
	[bladed,material1,bladed]]); 
	
}		
	
	
	
	
	
for info in StatorInfoList {
	addStatorRecipe(info);
}
for info in BladeInfoList {
	addBladeRecipe(info);
}		
		
for info in qmdBladeInfoList {
	addqmdBladeRecipe(info);		
}		