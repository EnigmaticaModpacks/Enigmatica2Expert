
import scripts.mods.nuclearcraft.NTP.coilclasses.MagnetInfo;
import scripts.mods.nuclearcraft.NTP.coilmagnetlist.MagnetInfoList;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.AlloyFurnace;


// material , material , material 
// <ore:ingotHSLASteel> <nuclearcraft:turbine_dynamo_coil_basemagnet> <ore:ingotHSLASteel>
//material material material 

# [Basic Induction Turbine Magnet] from [Iron Item Casing][+2]
craft.remake(<nuclearcraft:turbine_dynamo_coil_basemagnet>, ["pretty",
  "⌂ ▬ ⌂",
  "▬ I ▬",
  "⌂ ▬ ⌂"], {
  "⌂": <ic2:casing:1>,       # Copper Item Casing
  "▬": <ore:ingotHSLASteel>, # HSLA Steel Ingot
  "I": <ic2:casing:3>,       # Iron Item Casing
});

recipes.addShaped("ntp antihydrogen coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_antihydrogenmagnet")*2,
	[[<ore:cellAntihydrogen>,<ore:cellAntihydrogen>,<ore:cellAntihydrogen>],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_basemagnet>, <ore:ingotHSLASteel>],
	[<ore:cellAntihydrogen>,<ore:cellAntihydrogen>, <ore:cellAntihydrogen>]]);	
Infuser.addRecipe(<nuclearcraft:turbine_dynamo_coil_basemagnet>, <liquid:nak>*1296, <nuclearcraft:turbine_dynamo_coil_nakmagnet>*2);
	

function addMagnetRecipe (info as MagnetInfo){
	var material as IIngredient;	
	if (oreDict has ("ingot"~info.name)){
	material = oreDict.get("ingot"~info.name);
	}else{
	if (oreDict has ("dust"~info.name)){
			material = oreDict.get("dust"~info.name);
			
		}else{
			material = oreDict.get("gem"~info.name);
			
		}
	}
	
	
	recipes.addShaped("ntp " ~info.name ~ " coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_" ~ (info.name).toLowerCase() ~ "magnet")*2,
	[[material,material, material],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_basemagnet>, <ore:ingotHSLASteel>],
	[material,material, material]]); 
	
}
	
for info in MagnetInfoList {
	addMagnetRecipe(info);
}










