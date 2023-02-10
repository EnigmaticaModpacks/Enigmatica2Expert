#modloaded morphtool

# Oredict remake
recipes.remove(<morphtool:tool>);
recipes.addShaped("Morphing Tool", <morphtool:tool>, [
	[null, <ore:dyeGreen>, <ore:dyeBlue>], 
	[null, <ore:ingotFakeIron>, <ore:dyeRed>], 
	[<ore:ingotFakeIron>, null, null]]);

# Super Morph-O-Tool
val superMOT = <morphtool:tool>.withTag({"morphtool:is_morphing": 1 as byte, "morphtool:data": {
	rftools:             {id:"rftools:smartwrench",                         Count: 1 as byte, Damage: 0 as short},
	botania:             {id:"botania:twigwand",                            Count: 1 as byte, Damage: 0 as short, tag: {color1: 9, color2: 9}},
	enderio:             {id:"enderio:item_yeta_wrench",                    Count: 1 as byte, Damage: 0 as short},
	thermalfoundation:   {id:"thermalfoundation:wrench",                    Count: 1 as byte, Damage: 0 as short},
	extrautils2:         {id:"extrautils2:wrench",                          Count: 1 as byte, Damage: 0 as short},
	actuallyadditions:   {id:"actuallyadditions:item_laser_wrench",         Count: 1 as byte, Damage: 0 as short},
	ic2:                 {id:"ic2:wrench",                                  Count: 1 as byte, Damage: 0 as short},
	opencomputers:       {id:"opencomputers:wrench",                        Count: 1 as byte, Damage: 0 as short},
	integrateddynamics:  {id:"integrateddynamics:wrench",                   Count: 1 as byte, Damage: 0 as short},
	integratedtunnels:   {id:"integrateddynamics:wrench",                   Count: 1 as byte, Damage: 0 as short},
	architecturecraft:   {id:"architecturecraft:hammer",                    Count: 1 as byte, Damage: 0 as short},
	forestry:            {id:"forestry:wrench",                             Count: 1 as byte, Damage: 0 as short},
	appliedenergistics2: {id:"appliedenergistics2:network_tool",            Count: 1 as byte, Damage: 0 as short},
	teslacorelib:        {id:"teslacorelib:wrench",                         Count: 1 as byte, Damage: 0 as short},
	bloodmagic:          {id:"bloodmagic:ritual_reader",                    Count: 1 as byte, Damage: 0 as short},
	draconicevolution:   {id:"draconicevolution:crystal_binder",            Count: 1 as byte, Damage: 0 as short},
	environmentaltech:   {id:"environmentaltech:tool_multiblock_assembler", Count: 1 as byte, Damage: 0 as short},
	mekanism:            {id:"mekanism:configurator",                       Count: 1 as byte, Damage: 0 as short},
	immersiveengineering:{id:"immersiveengineering:tool",                   Count: 1 as byte, Damage: 0 as short},
	rats:                {id:"rats:cheese_stick",                           Count: 1 as byte, Damage: 0 as short},
	iceandfire:          {id:"iceandfire:dragon_stick",                     Count: 1 as byte, Damage: 0 as short},
	
	// Shift-right clicked NC blocks causing Morphing Tool turn into Multitool
	// nuclearcraft:        {id:"nuclearcraft:multitool",                      Count: 1 as byte, Damage: 0 as short},
	},
});

recipes.addShaped("Superwrench", superMOT, [
	[null, <ore:gearCopper>, null],
	[<ore:gearAluminium>, <morphtool:tool>, <ore:gearTin>], 
	[null, <ore:gearLead>, null]
]);