

# Super Akashic Tome
	val superTome = <akashictome:tome>.withTag({"akashictome:data": {
	industrialforegoing:   {id: "industrialforegoing:book_manual",      Count: 1 as byte, tag: {"akashictome:definedMod": "industrialforegoing"},   Damage: 0 as short},
	rftoolscontrol:        {id: "rftoolscontrol:rftoolscontrol_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftoolscontrol"},        Damage: 0 as short},
	astralsorcery:         {id: "astralsorcery:itemjournal",            Count: 1 as byte, tag: {"akashictome:definedMod": "astralsorcery"},         Damage: 0 as short},
	immersiveengineering:  {id: "immersiveengineering:tool",            Count: 1 as byte, tag: {"akashictome:definedMod": "immersiveengineering"},  Damage: 3 as short},
	valkyrielib:           {id: "valkyrielib:guide",                    Count: 1 as byte, tag: {"akashictome:definedMod": "valkyrielib"},           Damage: 0 as short},
	cookingforblockheads1: {id: "cookingforblockheads:recipe_book",     Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads1"}, Damage: 2 as short},
	rftools:               {id: "rftools:rftools_manual",               Count: 1 as byte, tag: {"akashictome:definedMod": "rftools"},               Damage: 0 as short},
	rftools1:              {id: "rftools:rftools_shape_manual",         Count: 1 as byte, tag: {"akashictome:definedMod": "rftools1"},              Damage: 0 as short},
	rftools2:              {id: "rftoolsdim:rftoolsdim_manual",         Count: 1 as byte, tag: {"akashictome:definedMod": "rftools2"},              Damage: 0 as short},
	extendedcrafting:      {id: "extendedcrafting:guide",               Count: 1 as byte, tag: {"akashictome:definedMod": "extendedcrafting"},      Damage: 0 as short},
	guideapi:              {id: "guideapi:cyclicmagic-guide",           Count: 1 as byte, tag: {"akashictome:definedMod": "guideapi"},              Damage: 0 as short},
	botania:               {id: "botania:lexicon",                      Count: 1 as byte, tag: {"akashictome:definedMod": "botania"},               Damage: 0 as short},
	thermalfoundation:     {id: "thermalfoundation:tome_lexicon",       Count: 1 as byte, tag: {"akashictome:definedMod": "thermalfoundation"},     Damage: 0 as short},
	extrautils2:           {id: "extrautils2:book",                     Count: 1 as byte, tag: {"akashictome:definedMod": "extrautils2"},           Damage: 0 as short},
	actuallyadditions:     {id: "actuallyadditions:item_booklet",       Count: 1 as byte, tag: {"akashictome:definedMod": "actuallyadditions"},     Damage: 0 as short},
	opencomputers:         {id: "opencomputers:tool",                   Count: 1 as byte, tag: {"akashictome:definedMod": "opencomputers"},         Damage: 4 as short},
	cookingforblockheads:  {id: "cookingforblockheads:recipe_book",     Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads"},  Damage: 1 as short},
	xnet:                  {id: "xnet:xnet_manual",                     Count: 1 as byte, tag: {"akashictome:definedMod": "xnet"},                  Damage: 0 as short},
	tconstruct:            {id: "tconstruct:book",                      Count: 1 as byte, tag: {"akashictome:definedMod": "tconstruct"},            Damage: 0 as short},
	solcarrot:             {id: "solcarrot:food_book",                  Count: 1 as byte, tag: {"akashictome:definedMod": "solcarrot"},             Damage: 0 as short},
	rustic:                {id: "rustic:book",                          Count: 1 as byte, tag: {"akashictome:definedMod": "rustic"},                Damage: 0 as short},
	bloodmagic:            {id: "guideapi:bloodmagic-guide",            Count: 1 as byte, tag: {"akashictome:definedMod": "bloodmagic"},            Damage: 0 as short},
	openblocks:            {id: "openblocks:info_book",                 Count: 1 as byte, tag: {"akashictome:definedMod": "openblocks"},            Damage: 0 as short},
	forestry: 						 {id: "forestry:book_forester", 						  Count: 1 as byte, tag: {"akashictome:definedMod": "forestry"}, 							Damage: 0 as short},
	twilightforest:        {id: "patchouli:guide_book",                 Count: 1 as byte, tag: {"akashictome:definedMod": "twilightforest", "patchouli:book": "twilightforest:guide"},  Damage: 0 as short},
	draconicevolution:     {id: "draconicevolution:info_tablet",        Count: 1 as byte, tag: {"akashictome:definedMod": "draconicevolution"},                                         Damage: 0 as short},
	}});
	
	recipes.addShaped("SuperTome", superTome, [
		[<ore:paper>, <ore:bookshelf>, <ore:paper>],
		[<extrautils2:decorativesolidwood:1>, <akashictome:tome>.anyDamage(), <extrautils2:decorativesolidwood:1>], 
		[<ore:paper>, <ore:bookshelf>, <ore:paper>]]);

# Remove excess not-oredicted recipe
recipes.removeByRecipeName("akashictome:tome");