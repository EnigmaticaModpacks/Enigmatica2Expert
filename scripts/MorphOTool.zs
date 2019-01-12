print("--- loading MorphOTool.zs ---");

# Super Morph-O-Tool
	recipes.addShaped("Superwrench", 
	<morphtool:tool>.withTag({"morphtool:is_morphing": 1 as byte, "morphtool:data": {
	rftools: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "rftools:smartwrench", Count: 1 as byte, Damage: 0 as short}, 
	bigreactors: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "bigreactors:wrench", Count: 1 as byte, Damage: 0 as short}, 
	botania: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "botania:twigwand", Count: 1 as byte, tag: {color1: 9, color2: 9}, Damage: 0 as short}, 
	enderio: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "enderio:item_yeta_wrench", Count: 1 as byte, Damage: 0 as short}, 
	thermalfoundation: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "thermalfoundation:wrench", Count: 1 as byte, Damage: 0 as short}, 
	extrautils2: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "extrautils2:wrench", Count: 1 as byte, Damage: 0 as short}, 
	actuallyadditions: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "actuallyadditions:item_laser_wrench", Count: 1 as byte, Damage: 0 as short}, 
	chiselsandbits: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "chiselsandbits:wrench_wood", Count: 1 as byte, Damage: 0 as short}, 
	ic2: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "ic2:wrench", Count: 1 as byte, Damage: 0 as short}, 
	opencomputers: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "opencomputers:wrench", Count: 1 as byte, Damage: 0 as short}, 
	integrateddynamics: {id: "integrateddynamics:wrench", Count: 1 as byte, Damage: 0 as short}, 
	architecturecraft: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "architecturecraft:hammer", Count: 1 as byte, Damage: 0 as short}, 
	forestry: {id: "forestry:wrench", Count: 1 as byte, Damage: 0 as short}, 
	appliedenergistics2: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "appliedenergistics2:network_tool", Count: 1 as byte, Damage: 0 as short}, 
	teslacorelib: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "teslacorelib:wrench", Count: 1 as byte, Damage: 0 as short}, 
	bloodmagic: {id: "bloodmagic:ritual_reader", Count: 1 as byte, Damage: 0 as short}, 
	draconicevolution: {id: "draconicevolution:crystal_binder", Count: 1 as byte, Damage: 0 as short}, 
	environmentaltech: {id: "environmentaltech:tool_multiblock_assembler", Count: 1 as byte, Damage: 0 as short},
	mekanism: {id: "mekanism:configurator", Count: 1 as byte, Damage: 0 as short}}}),
	[[null, <ore:gearCopper>, null],
	[<ore:gearSilver>, <morphtool:tool>, <ore:gearTin>], 
	[null, <ore:gearLead>, null]]);
	
print("--- MorphOTool.zs initialized ---");