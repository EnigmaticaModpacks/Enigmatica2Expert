import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#modloaded environmentaltech

# commit #a0a88bb
# Personal Nano Beacon tier 5 + 6 harder recipes, to limit access to Resistance 5 (100% damage reduction)
recipes.remove(<environmentaltech:nano_cont_personal_6>);
recipes.addShapedMirrored("enigmatica_nano_cont_personal_6", <environmentaltech:nano_cont_personal_6>, 
[[<ore:blockCosmicNeutronium>, <ore:blockDraconiumAwakened>, <ore:blockCosmicNeutronium>],
[<ore:blockAethium>, <environmentaltech:nano_cont_personal_5>, <ore:blockAethium>], 
[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>]]);

recipes.remove(<environmentaltech:nano_cont_personal_5>);
recipes.addShapedMirrored("enigmatica_nano_cont_personal_5", <environmentaltech:nano_cont_personal_5>, 
[[<ore:blockCrystaltine>, <draconicevolution:draconium_block:1>, <ore:blockCrystaltine>],
[<ore:blockIonite>, <environmentaltech:nano_cont_personal_4>, <ore:blockIonite>], 
[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>]]);

# Resistance Modifier harder recipe
recipes.remove(<environmentaltech:modifier_resistance>);
recipes.addShapedMirrored("enigmatica_modifier_resistance", 
<environmentaltech:modifier_resistance>, 
[[<ore:blockPladium>, <thaumcraft:charm_undying>, <ore:blockPladium>],
[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>], 
[<minecraft:potion>.withTag({Potion: "cofhcore:resistance"}), <ore:crystalLonsdaleite>, <minecraft:potion>.withTag({Potion: "cofhcore:resistance"})]]);
	

	var cell4 = <environmentaltech:solar_cell_pladium>;
	var cell5 = <environmentaltech:solar_cell_ionite>;
	var cell6 = <environmentaltech:solar_cell_aethium>;
	
	var blockPladium = <ore:blockPladium>;
	var blockIonite = <ore:blockIonite>;
	var blockAethium = <ore:blockAethium>;
	
	var mekSolar = <mekanismgenerators:generator:5>;

# Light Gray Alabaster
	recipes.addShaped("Light Gray Alabaster", 
	<environmentalmaterials:alabaster:8> * 8, 
	[[<ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>],
	[<ore:emcraftingAlabasterNormal>, <ore:dyeLightGray>, <ore:emcraftingAlabasterNormal>], 
	[<ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>]]);

# Environmental Tech Guide
	recipes.addShapeless("Environmental Tech Guide", 
	<valkyrielib:guide>, 
	[<minecraft:book>,<ore:crystalLitherite>]);

# Nanobot Beacon
	recipes.remove(<environmentaltech:nano_cont_personal_1>);
	recipes.addShapedMirrored("Nanobot Beacon", 
	<environmentaltech:nano_cont_personal_1>, 
	[[<ore:blockLonsdaleite>, <environmentaltech:mica>, <ore:blockLonsdaleite>],
	[<ore:blockErodium>, <cyclicmagic:beacon_potion>, <ore:blockErodium>], 
	[<environmentaltech:interconnect>, <environmentaltech:diode>, <environmentaltech:interconnect>]]);

# Lonsdaleite
	recipes.addShapedMirrored("Lonsdaleite", 
	<environmentaltech:lonsdaleite_crystal> * 3, 
	[[<ore:gemQuartzBlack>, <ore:dustWither>, <ore:gemQuartzBlack>],
	[<ore:dustWither>, <ore:ingotBlackIron>, <ore:dustWither>], 
	[<ore:gemQuartzBlack>, <ore:dustWither>, <ore:gemQuartzBlack>]]);

# Connector
	recipes.remove(<environmentaltech:connector>);
	recipes.addShapedMirrored("Environmental Tech Connector", 
	<environmentaltech:connector>, 
	[[<thermalfoundation:material:165>, <ore:blockTin>, <thermalfoundation:material:165>],
	[<ore:blockTin>, <ore:ingotAlubrass>, <ore:blockTin>], 
	[<thermalfoundation:material:165>, <ore:blockTin>, <thermalfoundation:material:165>]]);

# [Diode] from [Energy Cell Frame][+4]
craft.remake(<environmentaltech:diode>, ["pretty",
  "I ☼ I",
  "M Ϟ M",
  "I r I"], {
  "r": <ic2:crafting:4>,             # Iridium Reinforced Plate
  "I": <mctsmelteryio:iceball>,      # Iceball
  "☼": <actuallyadditions:block_crystal_empowered:3>, # Empowered Void Crystal Block
  "M": <ore:gearMithril>,            # Mana Infused Gear
  "Ϟ": <thermalexpansion:frame:128>, # Energy Cell Frame
});

# [Diode*2] from [Energy Cell Frame][+4]
craft.remake(<environmentaltech:diode> * 2, ["pretty",
  "I ☼ I",
  "M Ϟ M",
  "I r I"], {
  "r": <ic2:crafting:4>,               # Iridium Reinforced Plate
  "I": <forestry:crafting_material:5>, # Ice Shard
  "☼": <actuallyadditions:block_crystal_empowered:3>, # Empowered Void Crystal Block
  "M": <ore:gearMithril>,              # Mana Infused Gear
  "Ϟ": <thermalexpansion:frame:128>,   # Energy Cell Frame
});

# Litherite
	recipes.remove(<environmentaltech:litherite_crystal>);
	recipes.addShapeless("Litherite Block -> Crystal", 
	<environmentaltech:litherite_crystal> * 9, 
	[<ore:blockLitherite>]);

# Remove unused items
utils.rh(<environmentaltech:laser_lens_crystal>);
utils.rh(<valkyrielib:modifier_component>);
utils.rh(<valkyrielib:modifier_speed>);

# [Interconnect] from [Connector][+1]
craft.remake(<environmentaltech:interconnect>, ["pretty",
  "⌃ C ⌃",
  "C ⌃ C",
  "⌃ C ⌃"], {
  "⌃": <ore:blockQuartzBlack>,        # Block of Black Quartz
  "C": <environmentaltech:connector>, # Connector
});

remake("environmentaltech modifier_speed", 
	<environmentaltech:modifier_speed>, [
		[<ore:blockRedstone>, <environmentaltech:erodium_crystal>, <ore:blockRedstone>], 
		[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>], 
		[<fluid:low_pressure_steam> * 1000, <environmentaltech:lonsdaleite_crystal>, <fluid:low_pressure_steam> * 1000]]);

remake("environmentaltech modifier_accuracy", 
	<environmentaltech:modifier_accuracy>, [
		[<ore:blockDiamond>, <environmentaltech:pladium_crystal>, <ore:blockDiamond>], 
		[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>], 
		[<fluid:low_pressure_steam> * 1000, <environmentaltech:lonsdaleite_crystal>, <fluid:low_pressure_steam> * 1000]]);

# Nanobot Oredict for Quest book
<ore:nanoBotBeacon>.addItems([
<environmentaltech:nano_cont_personal_1>,
<environmentaltech:nano_cont_personal_2>,
<environmentaltech:nano_cont_personal_3>,
<environmentaltech:nano_cont_personal_4>,
<environmentaltech:nano_cont_personal_5>,
<environmentaltech:nano_cont_personal_6>,
<environmentaltech:nano_cont_ranged_1>,
<environmentaltech:nano_cont_ranged_2>,
<environmentaltech:nano_cont_ranged_3>,
<environmentaltech:nano_cont_ranged_4>,
<environmentaltech:nano_cont_ranged_5>,
<environmentaltech:nano_cont_ranged_6>
]);

# Remove recipe with one concrete
recipes.removeByRecipeName("environmentaltech:m_multiblocks/interconnect");


# ######################################################################
#
# Solar panels 1-6
#
# ######################################################################

/* Patchouli_js('Energy/Environmental Tech',
  evtTechSolarCalc.getRfT()
  .map((r,k)=>({
		icon:	"environmentaltech:solar_cont_1",
    type:	"item_list",
    title: "Solar Array Tier "+(k+1),
    ...item$i(r, m=>`environmentaltech:solar_cell_${m[0]}#${m[2]}`),
    ...text$i(r, m=>numeral(m[1]).format('0,0').padStart(11) + " RF/t")
  }))
)*/

# Blocks of main EvT materials
static evt as IIngredient[][string] = {
	block: [
		<ore:blockLitherite>, 
		<ore:blockErodium>, 
		<ore:blockKyronite>, 
		<ore:blockPladium>, 
		<ore:blockIonite>, 
		<ore:blockAethium>,
	],
	crystal: [
		<ore:crystalLitherite>, 
		<ore:crystalErodium>, 
		<ore:crystalKyronite>,
		<ore:crystalPladium>, 
		<ore:crystalIonite>, 
		<ore:crystalAethium>,
	],
	panel: [
		<environmentaltech:solar_cell_litherite>,
		<environmentaltech:solar_cell_erodium>,
		<environmentaltech:solar_cell_kyronite>,
		<environmentaltech:solar_cell_pladium>,
		<environmentaltech:solar_cell_ionite>,
		<environmentaltech:solar_cell_aethium>,
	],
} as IIngredient[][string];

# Photovoltatic cell Hard earlier recipe
craft.remake(<environmentaltech:photovoltaic_cell>, [
	"ABA",
	"ACA",
	"ABA"], {
	A: <ore:plateSilicon>,
	B: <ore:plateDenseLapis>,
	C: <ore:plateEnderium>
	});

# ######################################################################
#
# Void Ore Miner Tier 1-6
#
# ######################################################################

# "Core" material
static evtCores as IIngredient[] = [
	<ore:blockEmerald>,
	<extendedcrafting:storage:5>,
	<extendedcrafting:storage:7>,
	<extendedcrafting:storage:6>,
	<ore:blockLuminessence>,
	<ore:blockCrystaltine>,
] as IIngredient[];


# Additional Ingredients for each level
static evtSolarCores as IIngredient[] = [
	<environmentaltech:photovoltaic_cell>,
	<ore:nuggetUUMatter>,
	<ore:nuggetCrystaltine>,
	<ore:nuggetStellarAlloy>,
	<ore:nuggetUltimate>,
	<ore:nuggetChaoticMetal>,
] as IIngredient[];



# Iterate each level
for i in 0 .. 6 {
	# Additional Ingredients for each level
	var evtIngrs as IIngredient[string] = {
		H: <ore:etLaserLens>,
		I: <environmentaltech:interconnect>,
		D: <environmentaltech:diode>,
		R: <ic2:iridium_reflector>,
		E: <ic2:nuclear:10>,
		L: <ore:blockLudicrite>,
	"╱": <tconstruct:clear_glass:*>,
	} as IIngredient[string];

	#-------------------------------------------
	# Ore Miner Controllers
	#-------------------------------------------
	evtIngrs["B"] = evt.block[i];
	evtIngrs["C"] = evtCores[i];
	evtIngrs["P"] = (i==0) ? evtIngrs.D : itemUtils.getItem("environmentaltech:void_ore_miner_cont_" ~ (i));
	var void_miner = itemUtils.getItem("environmentaltech:void_ore_miner_cont_" ~ (i+1));

	if (i<=2) { craft.remake(void_miner ,["𝓹",
			"B C B",
			"B P B",
			"I H I", ], evtIngrs); 
	} else {

		if (i==3) {
			recipes.remove(void_miner);
			mods.extendedcrafting.TableCrafting.addShaped(0, void_miner, Grid(["𝓹",
				"B C B",
				"R P R",
				"I H I"], evtIngrs).shaped()); }

		if (i==4) {
			craft.remake(void_miner, ["𝓹",
				"B B C B B",
				"B ╱ C ╱ B",
				"R R P R R",
				"B E H E B",
				"I I H I I"], evtIngrs); }

		if (i==5) {
			craft.remake(void_miner, ["𝓹",
				"B B B C B B B",
				"B ╱ ╱ C ╱ ╱ B",
				"B ╱ ╱ C ╱ ╱ B",
				"B R R P R R B",
				"B E E H E E B",
				"B L L H L L B",
				"I I I H I I I"], evtIngrs); }
	}


	#-------------------------------------------
	# Solar Panels
	#-------------------------------------------
	var solPanel = evt.panel[i].itemArray[0];
	evtIngrs["Y"] = evt.crystal[i];
	evtIngrs["y"] = evt.crystal[max(0, i - 1)];
	evtIngrs["#"] = evtSolarCores[i];
	evtIngrs["_"] = <environmentaltech:interconnect>;
	evtIngrs["▂"] = solPanel;
	evtIngrs["p"] = evt.panel[max(0, i - 1)];

	recipes.remove(solPanel);

	if (i==0) {craft.make(solPanel * 2, [
		"Y#Y",
		"╱_╱"], evtIngrs);
	} else {craft.make(solPanel * 2, [
		"YYY",
		"y#y",
		"ppp"], evtIngrs);
	}

	#-------------------------------------------
	# Solar Controllers
	#-------------------------------------------
	var solController = itemUtils.getItem("environmentaltech:solar_cont_" ~ (i+1));
	evtIngrs["_"] = <actuallyadditions:block_quartz_slab>;
	evtIngrs["c"] = (i==0) ? <actuallyadditions:block_crystal:1> : itemUtils.getItem("environmentaltech:solar_cont_" ~ (i));
	evtIngrs["▄"] = <ore:blockQuartzBlack>;
	evtIngrs["▆"] = <extendedcrafting:storage>;
	evtIngrs["█"] = <actuallyadditions:block_crystal_empowered:3>;


	recipes.remove(solController);

	if (i<=2) {craft.make(solController, ["𝓹",
		"_ _ _",
		"Y ▂ Y",
		"Y c Y"], evtIngrs);
	} else
	if (i==3) {
		evtIngrs["T"] = <mekanismgenerators:generator:5>;
		evtIngrs["□"] = <thermalexpansion:frame:128>;
		evtIngrs["▣"] = <thermalexpansion:frame:129>;
		
		craft.make(solController, ["𝓹",
		"T ▄ ▄ . .",
		"╲ B □ . .",
		"▂ ╲ c . .",
		". . ▣ . .",
		". . . . ."], evtIngrs);
	} else
	if (i==4) {
		evtIngrs["T"] = <nuclearcraft:solar_panel_du>;
		evtIngrs["▫"] = <nuclearcraft:part:2>;
		evtIngrs["▢"] = <compactsolars:compact_solar_block:1>;
		evtIngrs["▣"] = <thermalexpansion:frame:146>;
		evtIngrs["■"] = <thermalexpansion:frame:147>;

		craft.make(solController, ["𝓹",
		"▢ ▆ ▆ Y . . .",
		"╲ B T ▂ . . .",
		"╲ ╲ ▫ ▣ . . .",
		"╲ ╲ ╲ c . . .",
		". . . ■ . . .",
		". . . . . . .",
		". . . . . . ."], evtIngrs);
	} else
	if (i==5) {
		evtIngrs["T"] = <enderio:block_solar_panel:3>;
		evtIngrs["▫"] = <nuclearcraft:part:3>;
		evtIngrs["▢"] = <compactsolars:compact_solar_block:2>;
		evtIngrs["▣"] = <thermalexpansion:frame:147>;
		evtIngrs["■"] = <thermalexpansion:frame:148>;
		evtIngrs["╳"] = <ore:blockDraconiumAwakened>;
		evtIngrs["◒"] = <extendedcrafting:singularity:22>;
		evtIngrs["◓"] = <extendedcrafting:singularity_custom:102>;
		evtIngrs["◑"] = <extendedcrafting:singularity:16>;
		evtIngrs["◐"] = <extendedcrafting:singularity:5>;

		craft.make(solController, ["𝓹",
		"▢ █ █ T T . . . .",
		"╲ Y ▂ ▂ Y . . . .",
		"╲ ╲ Y ▫ ◓ . . . .",
		"╲ ╲ ╲ ╳ ▣ . . . .",
		"╲ B ◐ ╲ c . ◑ . .",
		". . . . ■ . . . .",
		". . . . ◒ . . . .",
		". . . . . . . . .",
		". . . . . . . . ."], evtIngrs);
	}
}

# Remake alabaster from cobblestone instead of stone
# Because alabaster is yet another building colored stone and should be a bit less pricy
recipes.removeByRecipeName("environmentalmaterials:m_alabaster/normal/alabaster_c_white_temp");
craft.make(<environmentalmaterials:alabaster> * 20, ["pretty",
  "░ d ░",
  "d ░ d",
  "░ d ░"], {
  "░": <ore:cobblestone>, # Cobblestone
  "d": <ore:dyeWhite>
});

# [Flight Speed Modifier] from [Null Modifier][+4]
craft.remake(<environmentaltech:modifier_flight_speed>, ["pretty",
  "* ╳ *",
  "m N m",
  "* U *"], {
  "╳": <ore:crystalIonite>,               # Ionite Crystal
  "U": <ore:xuUpgradeSpeed>,              # Upgrade Speed
  "*": <ore:crystalLonsdaleite>,          # Lonsdaleite Crystal
  "m": <ore:mica>,                        # Mica
  "N": <environmentaltech:modifier_null>, # Null Modifier
});

# [Clear Laser Lens] from [Hardened Enderium Glass]
recipes.removeByRecipeName("environmentaltech:m_multiblocks/m_void/lens_clear");
craft.make(<environmentaltech:laser_lens>, ["pretty",
  "■   ■",
  "■ ■ ■",
  "■   ■"], {
  "■": <thermalfoundation:glass_alloy:*>, # Hardened Enderium Glass
});
