import scripts.mods.nuclearcraft.NTP.coilclasses.StabilizerInfo;
import scripts.mods.nuclearcraft.NTP.coilstabilizerlist.StabilizerInfoList;
import scripts.mods.nuclearcraft.NTP.coilclasses.LiquidStabilizerInfo;
import scripts.mods.nuclearcraft.NTP.coilstabilizerlist.LiquidStabilizerInfoList;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.AlloyFurnace;



# [Basic Redstone Field Stabilizer] from [HSLA Steel Ingot][+2]
craft.remake(<nuclearcraft:turbine_dynamo_coil_basestabilizer>, ["pretty",
  "♥ ⌂ ♥",
  "⌂ ▬ ⌂",
  "♥ ⌂ ♥"], {
  "♥": <ore:nuggetRedstoneAlloy>, # Redstone Alloy Nugget
  "⌂": <ic2:casing:2>,            # Gold Item Casing
  "▬": <ore:ingotHSLASteel>,      # HSLA Steel Ingot
});
	
recipes.addShaped("ntp antideuterium coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_antideuteriumstabilizer")*2,
	[[<ore:cellAntideuterium>,<ore:cellAntideuterium>,<ore:cellAntideuterium>],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_basestabilizer>, <ore:ingotHSLASteel>],
	[<ore:cellAntideuterium>,<ore:cellAntideuterium>, <ore:cellAntideuterium>]]);	

function addStabilizerRecipe (info as StabilizerInfo){
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
	if (info.name == "Slimeball"){
		material = oreDict.get("slimeball");
	}
	
	recipes.addShaped("ntp " ~info.name ~ " coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_" ~ (info.name).toLowerCase() ~ "stabilizer")*2,
	[[material,material, material],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_basestabilizer>, <ore:ingotHSLASteel>],
	[material,material, material]]); 
	
}
	
for info in StabilizerInfoList {
	addStabilizerRecipe(info);
}
	
function addLiquidRecipe (core as LiquidStabilizerInfo){
	var stab = itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_" ~ (core.name).toLowerCase() ~ "stabilizer");
	Infuser.addRecipe(<nuclearcraft:turbine_dynamo_coil_basestabilizer>, (core.inliquid)*1296, stab*2);
}
	
for core in LiquidStabilizerInfoList {
	addLiquidRecipe(core);
}	

	

	