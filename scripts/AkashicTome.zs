print("--- loading AkashicTome.zs ---");

# Super Akashic Tome
	recipes.addShaped("SuperTome", 
	<akashictome:tome>.withTag({"akashictome:data": {
	animania: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "animania:animania_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "animania"}, Damage: 0 as short},
	industrialforegoing: {id: "industrialforegoing:book_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "industrialforegoing"}, Damage: 0 as short}, 
	rftoolscontrol: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "rftoolscontrol:rftoolscontrol_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftoolscontrol"}, Damage: 0 as short}, 
	astralsorcery: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "astralsorcery:itemjournal", Count: 1 as byte, tag: {"akashictome:definedMod": "astralsorcery"}, Damage: 0 as short}, 
	immersiveengineering: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "immersiveengineering:tool", Count: 1 as byte, tag: {"akashictome:definedMod": "immersiveengineering"}, Damage: 3 as short}, 
	valkyrielib: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "valkyrielib:guide", Count: 1 as byte, tag: {"akashictome:definedMod": "valkyrielib"}, Damage: 0 as short}, 
	cookingforblockheads1: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "cookingforblockheads:recipe_book", Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads1"}, Damage: 2 as short}, 
	rftools: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "rftools:rftools_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools"}, Damage: 0 as short}, 
	rftools1: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "rftools:rftools_shape_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools1"}, Damage: 0 as short}, 
	rftools2: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "rftoolsdim:rftoolsdim_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools2"}, Damage: 0 as short}, 
	extendedcrafting: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "extendedcrafting:guide", Count: 1 as byte, tag: {"akashictome:definedMod": "extendedcrafting"}, Damage: 0 as short}, 
	guideapi: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "guideapi:cyclicmagic-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "guideapi"}, Damage: 0 as short}, 
	botania: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "botania:lexicon", Count: 1 as byte, tag: {"akashictome:definedMod": "botania"}, Damage: 0 as short}, 
	thermalfoundation: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "thermalfoundation:tome_lexicon", Count: 1 as byte, tag: {"akashictome:definedMod": "thermalfoundation"}, Damage: 0 as short}, 
	extrautils2: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "extrautils2:book", Count: 1 as byte, tag: {"akashictome:definedMod": "extrautils2"}, Damage: 0 as short}, 
	actuallyadditions: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "actuallyadditions:item_booklet", Count: 1 as byte, tag: {"akashictome:definedMod": "actuallyadditions"}, Damage: 0 as short}, 
	opencomputers: {id: "opencomputers:tool", Count: 1 as byte, tag: {"akashictome:definedMod": "opencomputers"}, Damage: 4 as short}, 
	cookingforblockheads: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "cookingforblockheads:recipe_book", Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads"}, Damage: 1 as short}, 
	xnet: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "xnet:xnet_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "xnet"}, Damage: 0 as short}}}), 
	[[<ore:paper>, <ore:bookshelf>, <ore:paper>],
	[<extrautils2:decorativesolidwood:1>, <akashictome:tome>.anyDamage(), <extrautils2:decorativesolidwood:1>], 
	[<ore:paper>, <ore:bookshelf>, <ore:paper>]]);
	
print("--- AkashicTome.zs initialized ---");