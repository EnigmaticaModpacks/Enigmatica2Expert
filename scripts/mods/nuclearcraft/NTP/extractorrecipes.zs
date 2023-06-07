import scripts.mods.nuclearcraft.NTP.coilclasses.ExtractorInfo;
import scripts.mods.nuclearcraft.NTP.coilextractorlist.ExtractorInfoList;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.AlloyFurnace;

var smore = <nuclearcraft:smore>;
var smored = <ore:ingotSmore>;
smored.add(smore);

var radio = <trinity:salted_sand>;
var radiod = <ore:blockRadioactiveEarth>;
radiod.add(radio);

# [Basic Energy Extractor] from [Emeradic Crystal][+3]
craft.remake(<nuclearcraft:turbine_dynamo_coil_baseextractor>, ["pretty",
  "□ ⌂ □",
  "▬ * ▬",
  "⌂ ⌂ ⌂"], {
  "□": <ore:plateLapis>,       # Lapis Lazuli Plate
  "⌂": <ic2:casing:2>,         # Gold Item Casing
  "▬": <ore:ingotHSLASteel>,   # HSLA Steel Ingot
  "*": <ore:crystalEmeraldic>, # Emeradic Crystal
});
	
recipes.addShaped("ntp antihelium coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_antiheliumextractor")*2,
	[[<ore:cellAntihelium>,<ore:cellAntihelium>,<ore:cellAntihelium>],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_baseextractor>, <ore:ingotHSLASteel>],
	[<ore:cellAntihelium>,<ore:cellAntihelium>, <ore:cellAntihelium>]]);	

recipes.addShaped("ntp antihelium3 coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_antihelium3extractor")*2,
	[[<ore:cellAntihelium3>,<ore:cellAntihelium3>,<ore:cellAntihelium3>],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_baseextractor>, <ore:ingotHSLASteel>],
	[<ore:cellAntihelium3>,<ore:cellAntihelium3>, <ore:cellAntihelium3>]]);	



function addExtractorRecipe (info as ExtractorInfo){
	var oring as string[] = ["ingot","dust","gem","stone"];
	var material as IIngredient;	
	
	if (oreDict has ("ingot"~info.name)){
	material = oreDict.get("ingot"~info.name);	
		}else{
	if (oreDict has ("dust"~info.name)){
			material = oreDict.get("dust"~info.name);
					}else{ 
					if (oreDict has ("gem"~info.name)){
					material = oreDict.get("gem"~info.name);
						}else{					
					if (oreDict has ("stone"~info.name)){
					material = oreDict.get("stone"~info.name);}
						else{material = oreDict.get("block"~info.name);}
				}
			}			
		}
	
		
	recipes.addShaped("ntp " ~info.name ~ " coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_" ~ (info.name).toLowerCase() ~ "extractor")*2,
	[[material,material, material],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_baseextractor>, <ore:ingotHSLASteel>],
	[material,material, material]]); 
	
}
	
for info in ExtractorInfoList {
	addExtractorRecipe(info);
}
