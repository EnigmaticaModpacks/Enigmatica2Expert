import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

val desc = scripts.category.tooltip_utils.desc;

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

for rod in [
	<immersiveengineering:material:1>,
	<immersiveengineering:material:3>,
	<immersiveengineering:material:2>
] as IItemStack[] {
	desc.jei(rod, "small_plate_presser");
}


for item in [
	<thaumcraft:mechanism_complex>,
	<thaumcraft:mechanism_simple>,
	<thaumcraft:mirrored_glass>,
	<thaumcraft:vis_resonator>,
	<thaumcraft:fabric>,
	<thaumcraft:seal>,
	<thaumcraft:jar_normal>,
	<thaumcraft:lamp_arcane>,
	<thaumcraft:pedestal_arcane>,
	<thaumcraft:alembic>,
	<thaumcraft:metal_alchemical>,
	<thaumcraft:mind>,
	<thaumcraft:vis_battery>,
	<thaumcraft:stabilizer>,
	<thaumcraft:inlay>,
	<thaumcraft:research_table>,
	<thaumcraft:arcane_workbench>,
	<thaumcraft:smelter_basic>,
	<thaumcraft:alumentum>,
	<thaumcraft:nitor_yellow>
] as IItemStack[] {
	desc.jei(item, "thaum_research");
}

<extrautils2:ingredients:13>.addTooltip(format.aqua(desc.local("not_consumed")));

#CheeseArray (yes, hashtag)
for cheese in [
	<animania:friesian_cheese_wheel>,
	<animania:holstein_cheese_wheel>,
	<animania:jersey_cheese_wheel>,
	<animania:goat_cheese_wheel>,
	<animania:sheep_cheese_wheel>
] as IItemStack[] {
	desc.jei(cheese, "cheese_in_mold");
}

desc.jei(<extrautils2:bagofholding>, "removed.instability"); # Bag of Holding
desc.jei(<enderio:item_material:17>, "enticing_crystal"); # Enticing Crystal
desc.jei(<extendedcrafting:crafting_core>, "maximum_allowed_input"); # Crafting Core
desc.jei(<astralsorcery:blockinfusedwood>, "wood_in_starlight"); # Infused Wood
desc.jei(<advancedrocketry:platepress>, "plate_presser"); # Small Plate Press
desc.jei(<guideapi:bloodmagic-guide>, "right_click_blood_altair"); # BM Guide
desc.jei(<thaumcraft:thaumonomicon>, "click.bookshelf"); # Thaumonomicon
desc.jei(<thaumcraft:arcane_workbench>, "click.crafting"); # Arcane Workbench
desc.jei(<thaumcraft:crucible>, "click.cauldron"); # Crucible
desc.jei(<avaritia:resource:2>, "obtained.neutron"); # Neutronium
desc.jei(Bucket("xpjuice"), "obtained.fluid_transposer"); # XP Bucket
desc.jei(<bibliocraft:biblioclipboard>, "removed.instability"); # Bibliocraft Clipboard
desc.jei(<astralsorcery:blockcustomore>, "space_gen_high"); # Rock Crystals
desc.jei(<bigreactors:ingotludicrite>, "craftable.ludictite"); # Uncraftable ingots
desc.jei(<thermalfoundation:material:136>, "obtained.mithril"); # Mana Infused Ingot
desc.jei(<thermalexpansion:frame:129>, "requires.rf", "10.000.000"); # Thermal Expansion Casings
desc.jei(<actuallyadditions:block_crystal_empowered>,   "requires.rf", "1.000.000");  # Restonia
desc.jei(<actuallyadditions:block_crystal_empowered:1>, "requires.rf", "1.000.000");  # Palis
desc.jei(<actuallyadditions:block_crystal_empowered:2>, "requires.rf", "2.000.000");  # Diamantine
desc.jei(<actuallyadditions:block_crystal_empowered:3>, "requires.rf", "10.000.000"); # Void
desc.jei(<actuallyadditions:block_crystal_empowered:4>, "requires.rf", "2.000.000");  # Emeradic
desc.jei(<actuallyadditions:block_crystal_empowered:5>, "requires.rf", "1.000.000");  # Enori
desc.jei(<harvestcraft:market>, "removed.use_market"); # Pam's Harvestcraft Market
desc.jei(<mekanism:controlcircuit:3>, "requires.rf", "2.000.000"); # Mekanism Ultimate Circuit
desc.jei(<mysticalagriculture:crafting:5>, "craftable.prosperity"); # Mystical Agriculture Block of Prosperity


desc.jei(<mekanism:machineblock:2>, "removed.dupe_ore");
desc.jei(<thermalexpansion:cache>, "crescent_hammer");
desc.jei(<mekanism:gaugedropper>, "gauge_dropper");
desc.jei(<environmentaltech:void_ore_miner_cont_6>, "miner_tier_6_specializes");
desc.jei(<wct:wct_creative>, "creative_wct");
desc.jei(<astralsorcery:blockaltar>, "astralsorcery.blockaltar");
desc.jei(<extrautils2:ingredients:13>, "not_consumed");
desc.jei(<liquid:nitrogen>, "nitrogen_collectors");

# Blood Magic Wills
desc.jei(<bloodmagic:item_demon_crystal:0>, "obtained.forsaken");
desc.jei(<bloodmagic:item_demon_crystal:1>, "obtained.resonance");
desc.jei(<bloodmagic:item_demon_crystal:2>, "obtained.resonance");
desc.jei(<bloodmagic:item_demon_crystal:3>, "obtained.resonance");
desc.jei(<bloodmagic:item_demon_crystal:4>, "obtained.resonance");

# Pumpjack
desc.jei(Bucket("oil"), "pumpjack");
desc.jei(<liquid:oil>, "pumpjack");

# Thermal Expansion Coils
desc.jei(<thermalfoundation:material:513>, "requires.redstone160");
desc.jei(<thermalfoundation:material:514>, "requires.redstone160");
desc.jei(<thermalfoundation:material:515>, "requires.redstone160");

# Reinforced Cell Frame (full)
desc.jei(<thermalexpansion:frame:146>, "reinforced_cell_frame");

# IC2 Wrenches
desc.jei(<ic2:electric_wrench>, "ic2wrench");
desc.jei(<ic2:wrench>, "ic2wrench");
desc.jei(<draconicevolution:draconium_ore>, "generates.other_planets");
desc.jei(<libvulpes:ore0:8>, "generates.other_planets.rutile");

# Thermal Expansion Resonant Machine Frame (Full)
desc.jei(<thermalexpansion:frame:148>, "requires.rf", "100.000.000");
desc.jei(<bigreactors:mineralanglesite>, "craftable");
desc.jei(<bigreactors:mineralbenitoite>, "craftable");
desc.jei(<computercraft:printout>.withTag({pages: 1}), "§fPrint with §eComputer Craft§r's §bPrinter");
desc.jei(<advgenerators:gas_input>, "ethylene_convert");

# Tool Forge
<tconstruct:toolforge>.anyDamage().addTooltip(desc.local("forge_from_metal"));
<conarm:armorforge>.anyDamage().addTooltip(desc.local("forge_from_metal"));

# Space Ores
for item in [
	<thermalfoundation:ore_fluid:4>,
	<thermalfoundation:ore_fluid:3>,
	<thermalfoundation:ore_fluid:2>,
	<libvulpes:ore0>,
	<thermalfoundation:ore:7>,
	<thermalfoundation:ore:8>,
	<rftools:dimensional_shard_ore>,
	<mysticalagriculture:prosperity_ore>,
	<draconicevolution:draconium_ore:1>,
	<draconicevolution:draconium_ore:2>,
	<thermalfoundation:material:893>,
	<thermalfoundation:material:894>,
	<thermalfoundation:material:895>
] as IItemStack[] {
	desc.jei(item, "space_gen");
}


# Mekanism Factories
desc.both(<mekanism:machineblock:5>, "mekanism_factories");
desc.both(<mekanism:machineblock:6>, "mekanism_factories");
desc.both(<mekanism:machineblock:7>, "mekanism_factories");
desc.both(<libvulpes:productingot:7>, "obtained.fabricator_or_excavator"); # Titanium Ingot
desc.both(<mekanism:tierinstaller:3>, "mekanism_t_ultimate");
desc.both(<contenttweaker:conglomerate_of_life>, "any_lamb");

# Mystical Agriculture Seeds Tier 5 -> 6
<mysticalagriculture:ender_amethyst_seeds>.addTooltip(desc.local("tier")~": §56§r");
<mysticalagriculture:enderium_seeds>.addTooltip(desc.local("tier")~": §56§r");
<mysticalagriculture:iridium_seeds>.addTooltip(desc.local("tier")~": §56§r");
<mysticalagriculture:terrasteel_seeds>.addTooltip(desc.local("tier")~": §56§r");

# Extreme Reactors Crystals
<bigreactors:mineralanglesite>.displayName = desc.local("anglesite");
<bigreactors:mineralbenitoite>.displayName = desc.local("benitoite");
<modularmachinery:itemmodularium>.displayName = desc.local("modularium_alloy");

# Solar Panels
val or_above = " " ~ desc.local("et.or_above");
for i,a in [
	[4,16,9],
	[4,24,25],
	[8,32,49],
	[8,40,81],
	[12,48,121],
	[12,56,169],
] as int[][] {
	desc.jei(
		itemUtils.getItem("environmentaltech:solar_cont_"~(i+1)),
		"solar_cont", a[0], a[1], (i+1) as string ~ (i==5?"":or_above), a[2]
	);
}

# Void Ore Miner
desc.jei(<environmentaltech:void_ore_miner_cont_1>, "et_cont_1", 24, 20, 2);

for i,a in [
	[4,32,16,3],
	[8,56,52,4],
	[12,56,56,5],
	[16,72,36,6],
	[20,92,56,6],
] as int[][] {
	desc.jei(
		itemUtils.getItem("environmentaltech:void_ore_miner_cont_"~(i+2)),
		"et_miner_cont_any", a[0], a[1], (i+2) as string ~ (i==4?"":or_above), a[2], a[3]
	);
}

# Void Resource Miner
desc.jei(<environmentaltech:void_res_miner_cont_1>, "et_cont_1", 24, 20, 2 );
for i,a in [
	[4,32,16,3],
	[8,56,52,4],
	[12,56,56,5],
	[16,72,36,6],
	[20,92,56,6],
] as int[][] {
	desc.jei(
		itemUtils.getItem("environmentaltech:void_res_miner_cont_"~(i+2)),
		"et_miner_cont_any", a[0], a[1], (i+2) as string ~ (i==4?"":or_above), a[2], a[3]
	);
}

# Nanobot Beacon
for i,a in [
	[4,20,12],
	[8,36,24],
	[12,56,40],
	[16,80,60],
	[20,108,84],
	[24,140,112],
] as int[][] {
	desc.jei(
		itemUtils.getItem("environmentaltech:nano_cont_personal_"~(i+1)),
		"nano_cont_personal", a[0], a[1], (i+1) as string ~ (i==5?"":or_above), a[2]
	);
}

# Lightning Rod
for i,a in [
	[4,3,3],
	[4,4,4],
	[4,5,5],
	[13,4,16],
	[13,6,22],
	[13,8,28],
] as int[][] {
	desc.jei(
		itemUtils.getItem("environmentaltech:nano_cont_personal_"~(i+1)),
		"nano_cont_personal", a[0], (i+1) as string ~ (i==5?"":or_above), a[1], a[2]
	);
}

# Turbine Fuel description
<advgenerators:turbine_controller>.addShiftTooltip(
	"§3Canola Oil"          ~ " §710 MJ/mB§r\n" ~
	"§3Crude Oil"           ~ " §725 MJ/mB§r\n" ~
	"§3Biomass"             ~ " §730 MJ/mB§r\n" ~
	"§3Biodiesel"           ~ " §740 MJ/mB§r\n" ~
	"§3Crystallized Oil"    ~ " §740 MJ/mB§r\n" ~
	"§3Biogas"              ~ " §750 MJ/mB§r\n" ~
	"§3Ethylene"            ~ " §780 MJ/mB§r\n" ~
	"§3Biofuel"             ~ " §790 MJ/mB§r\n" ~
	"§3Rocket Fuel (EiO)"   ~ " §795 MJ/mB§r\n" ~
	"§3Refined Fuel"       ~ " §7105 MJ/mB§r\n" ~
	"§3Rocket Fuel (AR)"   ~ " §7110 MJ/mB§r\n" ~
	"§3Empowered Oil"      ~ " §7120 MJ/mB§r"
,format.darkAqua(desc.local("fuel.shift_for_list")));

# Antimatter
Bucket("blockfluidantimatter").addTooltip(format.aqua(desc.local("strike_with_lightning")));


//Add tooltips to biome gems.
for gems, tip in {
  [<ore:gemAmber>,    <ore:oreAmber>]    : "found.forest" ,
  [<ore:gemMalachite>,<ore:oreMalachite>]: "found.swamp" ,
  [<ore:gemPeridot>,  <ore:orePeridot>]  : "found.plains" ,
  [<ore:gemRuby>,     <ore:oreRuby>]     : "found.arid" ,
  [<ore:gemSapphire>, <ore:oreSapphire>] : "found.ocean" ,
  [<ore:gemTanzanite>,<ore:oreTanzanite>]: "found.cold" ,
  [<ore:gemTopaz>,    <ore:oreTopaz>]    : "found.lush" ,
} as string[IOreDictEntry[]] {
	for gem in gems { gem.firstItem.addTooltip(desc.local(tip)); }
}

//Add Tooltips for various blocks to explain their uses
/*
Taken from: FantasTek
https://github.com/Level-5-Pidgey/FantasTek/tree/master/mods
*/
for item in [
	<quark:chain>,
	<quark:trowel>,
	<quark:rope>,
	<quark:iron_rod>,
	<quark:chute>,
	<quark:redstone_inductor>,
	<quark:gravisand>,
	<quark:grate>,
	<quark:horse_whistle>,
	<quark:slime_bucket>,
] as IItemStack[] {
	for line in desc.local(item).split("\n") {
    item.addTooltip(format.white(line));
  }
}

# Thaumcraft Curiocity
val lp = desc.local("thaum.progress").toLowerCase();
<thaumcraft:curio:0>.addTooltip("§f+ §5"~desc.local("thaum.auromancy")~"§f " ~ lp);
<thaumcraft:curio:1>.addTooltip("§f+ §5"~desc.local("thaum.alchemy")~"§f " ~ lp);
<thaumcraft:curio:2>.addTooltip("§f+ §5"~desc.local("thaum.golemancy")~"§f " ~ lp);
<thaumcraft:curio:3>.addTooltip("§f+ §5"~desc.local("thaum.eldritch")~"§f " ~ lp);
<thaumcraft:curio:4>.addTooltip("§f+ §5"~desc.local("thaum.arcane")~"§f " ~ lp);
<thaumcraft:curio:5>.addTooltip("§f+ §5"~desc.local("thaum.artifice")~"§f " ~ lp);

# 3d print tooltips
desc.jei(<opencomputers:print>);

# Blood runes helpers
desc.tooltip(<bloodmagic:blood_rune:1>);
desc.tooltip(<bloodmagic:blood_rune:3>);
desc.tooltip(<bloodmagic:blood_rune:4>);
desc.tooltip(<bloodmagic:blood_rune:5>);
desc.tooltip(<bloodmagic:blood_rune:6>);
desc.tooltip(<bloodmagic:blood_rune:7>);
desc.tooltip(<bloodmagic:blood_rune:8>);
desc.tooltip(<bloodmagic:blood_rune:9>);
desc.tooltip(<bloodmagic:blood_rune:10>);

desc.tooltip(<computercraft:printout>);
desc.tooltip(<thermalfoundation:upgrade:1>);
desc.tooltip(<thermalfoundation:upgrade:2>);
desc.tooltip(<thermalfoundation:upgrade:3>);
desc.tooltip(<ic2:te:48>); # Recycler disabled
desc.tooltip(<ic2:quantum_chestplate>);
desc.tooltip(<advgenerators:gas_input>); # Gas Intake disabled
desc.tooltip(Bucket("corium"), "fluid.corium");
desc.tooltip(<minecraft:torch>);
desc.tooltip(<thaumcraft:table_wood>);
desc.tooltip(<thaumcraft:research_table>);
desc.tooltip(<openblocks:tank>);
desc.tooltip(<actuallyadditions:item_crystal_empowered:2>, 'tcon.diamond');
desc.tooltip(<scalinghealth:heartdust>, 'tcon.speedy');
desc.tooltip(<botania:specialflower>.withTag({type: "endoflame"}), 'botania.decay1hour');
desc.tooltip(<conarm:resist_mat>, 'tcon.slot_each');
desc.tooltip(<conarm:resist_mat_fire>, 'tcon.slot_first');
desc.tooltip(<conarm:resist_mat_proj>, 'tcon.slot_first');
desc.tooltip(<conarm:resist_mat_blast>, 'tcon.slot_first');
desc.tooltip(<botania:infinitefruit>);
desc.tooltip(<botania:kingkey>);
desc.tooltip(<botania:flugeleye>);
desc.tooltip(<botania:thorring>);
desc.tooltip(<botania:odinring>);
desc.tooltip(<botania:lokiring>);


/*Inject_js(
[...loadText('config/enderio/recipes/user/capacitor_machines.xml')
.matchAll(/(enderio:block_inventory_chest_\w+)\/size"\s*base="(\d+)"/g)]
.map(([,id,size])=>`desc.tooltip(<${id}>, 'store_x_stacks', ${size});`)
)*/
desc.tooltip(<enderio:block_inventory_chest_tiny>, 'store_x_stacks', 94);
desc.tooltip(<enderio:block_inventory_chest_small>, 'store_x_stacks', 170);
desc.tooltip(<enderio:block_inventory_chest_medium>, 'store_x_stacks', 255);
desc.tooltip(<enderio:block_inventory_chest_big>, 'store_x_stacks', 358);
desc.tooltip(<enderio:block_inventory_chest_large>, 'store_x_stacks', 506);
desc.tooltip(<enderio:block_inventory_chest_huge>, 'store_x_stacks', 699);
desc.tooltip(<enderio:block_inventory_chest_enormous>, 'store_x_stacks', 973);
desc.tooltip(<enderio:block_inventory_chest_warehouse>, 'store_x_stacks', 1373);
desc.tooltip(<enderio:block_inventory_chest_warehouse13>, 'store_x_stacks', 1944);
/**/

# Modular Machine descriptions
for machineName, lang in {
	"starlight_crafting_engine"       : "mm.starlight_crafting_engine",
	"advanced_thermionic_fabricator"  : "mm.advanced_thermionic_fabricator",
	"advanced_carpenter"              : "mm.advanced_carpenter",
	"arcane_crafting_engine"          : "mm.arcane_crafting_engine",
	"advanced_scrap_factory"          : "mm.advanced_scrap_factory",
} as string[string] {
	desc.jei(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:"~machineName}), lang);
}

for lang, items in {
	ae_lag: [
		<cyclicmagic:storage_bag>,
		<extrautils2:bagofholding>,
		<forestry:adventurer_bag_t2>,
		<forestry:adventurer_bag>,
		<forestry:apiarist_bag>,
		<forestry:builder_bag_t2>,
		<forestry:builder_bag>,
		<forestry:digger_bag_t2>,
		<forestry:digger_bag>,
		<forestry:forester_bag_t2>,
		<forestry:forester_bag>,
		<forestry:hunter_bag_t2>,
		<forestry:hunter_bag>,
		<forestry:lepidopterist_bag>,
		<forestry:miner_bag_t2>,
		<forestry:miner_bag>,
		<minecraft:written_book>,
		<minecraft:skull:*>,
	], 
	dont_put_into_ae: [
		<danknull:dank_null_0>,
		<danknull:dank_null_1>,
		<danknull:dank_null_2>,
		<danknull:dank_null_3>,
		<danknull:dank_null_4>,
		<danknull:dank_null_5>,
		<danknull:dank_null_6>,
		<littletiles:recipeadvanced>,
	], 
} as IItemStack[][string] {
	for item in items {
		desc.jei(item, lang);
	}
}