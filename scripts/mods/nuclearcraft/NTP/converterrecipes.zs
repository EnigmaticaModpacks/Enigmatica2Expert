import scripts.mods.nuclearcraft.NTP.coilclasses.ConverterInfo;
import scripts.mods.nuclearcraft.NTP.coilconverterlist.ConverterInfoList;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.AlloyFurnace;

var purpur = <minecraft:purpur_block>;
var purped = <ore:stonePurpur>;
purped.add(purpur);

var barat = <trinity:solid_baratol>;
var barared = <ore:stoneBaratol>;
barared.add(barat);


# [Basic Redstone Field Converter] from [HSLA Steel Ingot][+2]
craft.remake(<nuclearcraft:turbine_dynamo_coil_baseconverter>, ["pretty",
  "□ п □",
  "п ▬ п",
  "□ п □"], {
  "□": <ore:plateElectrumFlux>, # Fluxed Electrum Plate
  "п": <ore:plateSilver>,       # Silver Plate
  "▬": <ore:ingotHSLASteel>,    # HSLA Steel Ingot
});
	
recipes.addShaped("ntp antitritium coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_antitritiumconverter")*2,
	[[<ore:cellAntitritium>,<ore:cellAntitritium>,<ore:cellAntitritium>],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_baseconverter>, <ore:ingotHSLASteel>],
	[<ore:cellAntitritium>,<ore:cellAntitritium>, <ore:cellAntitritium>]]);	

function addConverterRecipe (info as ConverterInfo){
	var oring as string[] = ["ingot","dust","gem","stone"];
	var material as IIngredient;	
	
	if (oreDict has ("ingot"~info.name)){
	material = oreDict.get("ingot"~info.name);	
		}else{
	if (oreDict has ("dust"~info.name)){
			material = oreDict.get("dust"~info.name);
					}else{ 
					if (oreDict has ("gem"~info.name)){
					material = oreDict.get("gem"~info.name);}
						else{material = oreDict.get("stone"~info.name);}
			}			
		}
	
		
	recipes.addShaped("ntp " ~info.name ~ " coil", itemUtils.getItem("nuclearcraft:turbine_dynamo_coil_" ~ (info.name).toLowerCase() ~ "converter")*2,
	[[material,material, material],
	[<ore:ingotHSLASteel>, <nuclearcraft:turbine_dynamo_coil_baseconverter>, <ore:ingotHSLASteel>],
	[material,material, material]]); 
	
}
	
for info in ConverterInfoList {
	addConverterRecipe(info);
}
