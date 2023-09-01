import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

#ignoreBracketErrors

val desc = scripts.lib.tooltip.desc;

// Some Quark tooltips from https://github.com/Level-5-Pidgey/FantasTek/tree/master/mods
////////////////////////////////////////////////////////////////////////////////////////


//Add Tooltips for various blocks to explain their uses
for item in [
/*Inject_js(
[...loadText('resources/autotooltips/lang/en_us.lang')
.matchAll(/^tooltips\.lang\.(?<id>[^=]+)=(.*)$/gm)]
.filter(([,,text])=>!text.includes('%s'))
.map(([, id]) => `  <${id}>,`)
.sort(naturalSort)
)*/
  <actuallyadditions:block_farmer>,
  <advgenerators:gas_input>,
  <ae2stuff:visualiser>,
  <bibliocraft:fancysign>,
  <bloodmagic:blood_rune:1>,
  <bloodmagic:blood_rune:3>,
  <bloodmagic:blood_rune:4>,
  <bloodmagic:blood_rune:5>,
  <bloodmagic:blood_rune:6>,
  <bloodmagic:blood_rune:7>,
  <bloodmagic:blood_rune:8>,
  <bloodmagic:blood_rune:9>,
  <bloodmagic:blood_rune:10>,
  <botania:flugeleye>,
  <botania:infinitefruit>,
  <botania:kingkey>,
  <botania:lokiring>,
  <botania:odinring>,
  <botania:thorring>,
  <computercraft:printout>,
  <contenttweaker:conglomerate_of_life>,
  <cyclicmagic:inventory_food>,
  <exnihilocreatio:hammer_diamond>,
  <farmingforblockheads:feeding_trough>,
  <ic2:quantum_chestplate>,
  <ic2:te:48>,
  <immersivetech:stone_decoration>,
  <minecraft:torch>,
  <oeintegration:excavatemodifier>,
  <openblocks:tank>,
  <opencomputers:print>,
  <quark:archaeologist_hat>,
  <quark:chain>,
  <quark:chute>,
  <quark:grate>,
  <quark:gravisand>,
  <quark:horse_whistle>,
  <quark:iron_rod>,
  <quark:redstone_inductor>,
  <quark:rope>,
  <quark:slime_bucket>,
  <quark:trowel>,
  <randomthings:peacecandle>,
  <thaumadditions:salt_essence>,
  <thaumcraft:research_table>,
  <thaumcraft:table_wood>,
  <thermalfoundation:upgrade:1>,
  <thermalfoundation:upgrade:2>,
  <thermalfoundation:upgrade:3>,
  <twilightforest:transformation_powder>,
/**/
] as IItemStack[] {
	desc.both(item);
}

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

for rod in [
	<immersiveengineering:material:1>,
	<immersiveengineering:material:3>,
	<immersiveengineering:material:2>
] as IItemStack[] {
	desc.jei(rod, "small_plate_presser");
}


desc.tooltipRaw(<extrautils2:ingredients:13>, '§b' ~ desc.local("not_consumed"));


desc.jei(<extrautils2:bagofholding>, "removed.instability"); # Bag of Holding
desc.jei(<enderio:item_material:17>, "enticing_crystal"); # Enticing Crystal
desc.jei(<extendedcrafting:crafting_core>, "maximum_allowed_input"); # Crafting Core
desc.jei(<astralsorcery:blockinfusedwood>, "wood_in_starlight"); # Infused Wood
desc.jei(<advancedrocketry:platepress>, "plate_presser"); # Small Plate Press
desc.jei(<thaumcraft:thaumonomicon>, "click.bookshelf"); # Thaumonomicon
desc.jei(<thaumcraft:arcane_workbench>, "click.crafting"); # Arcane Workbench
desc.jei(<thaumcraft:crucible>, "click.cauldron"); # Crucible
desc.jei(Bucket("xpjuice"), "obtained.fluid_transposer"); # XP Bucket
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


desc.jei(<thermalexpansion:cache>, "crescent_hammer");
desc.jei(<mekanism:gaugedropper>, "gauge_dropper");
desc.jei(<environmentaltech:void_ore_miner_cont_6>, "miner_tier_6_specializes");
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

# Thermal Expansion Resonant Machine Frame (Full)
desc.jei(<thermalexpansion:frame:148>, "requires.rf", "100.000.000");
desc.jei(<computercraft:printout>.withTag({pages: 1}), "§fPrint with §eComputer Craft§r's §bPrinter");
desc.jei(<advgenerators:gas_input>, "ethylene_convert");

# Tool Forge
desc.tooltipRaw(<tconstruct:toolforge>.anyDamage(), desc.local("forge_from_metal"));
desc.tooltipRaw(<conarm:armorforge>.anyDamage(), desc.local("forge_from_metal"));

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

desc.tooltip(<industrialforegoing:mob_relocator>, "industrialforegoing:mob_relocator", 
/*Inject_js(config('config/industrialforegoing.cfg').machines.mob_relocator.damage)*/
100
/**/
);

# Mystical Agriculture Seeds Tier 6
desc.tooltipRaw(<mysticalagriculture:enderium_seeds>, desc.local("tier")~": §56§r");
desc.tooltipRaw(<mysticalagriculture:iridium_seeds>, desc.local("tier")~": §56§r");
desc.tooltipRaw(<mysticalagriculture:terrasteel_seeds>, desc.local("tier")~": §56§r");

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
desc.tooltipRaw(Bucket("blockfluidantimatter"), '§b' ~ desc.local("strike_with_lightning"));


# Thaumcraft Curiocity
val lp = desc.local("thaum.progress").toLowerCase();
desc.tooltipRaw(<thaumcraft:curio:0>, "§f+ §5"~desc.local("thaum.auromancy")~"§f " ~ lp);
desc.tooltipRaw(<thaumcraft:curio:1>, "§f+ §5"~desc.local("thaum.alchemy")~"§f " ~ lp);
desc.tooltipRaw(<thaumcraft:curio:2>, "§f+ §5"~desc.local("thaum.golemancy")~"§f " ~ lp);
desc.tooltipRaw(<thaumcraft:curio:3>, "§f+ §5"~desc.local("thaum.eldritch")~"§f " ~ lp);
desc.tooltipRaw(<thaumcraft:curio:4>, "§f+ §5"~desc.local("thaum.arcane")~"§f " ~ lp);
desc.tooltipRaw(<thaumcraft:curio:5>, "§f+ §5"~desc.local("thaum.artifice")~"§f " ~ lp);

desc.tooltip(Bucket("corium"), "fluid.corium");
desc.tooltip(<actuallyadditions:item_crystal_empowered:2>, 'tcon.diamond');
desc.tooltip(<scalinghealth:heartdust>, 'tcon.speedy');
desc.tooltip(<botania:specialflower>.withTag({type: "endoflame"}), 'botania.decay1hour');
desc.tooltip(<conarm:resist_mat>, 'tcon.slot_each');
desc.tooltip(<conarm:resist_mat_fire>, 'tcon.slot_first');
desc.tooltip(<conarm:resist_mat_proj>, 'tcon.slot_first');
desc.tooltip(<conarm:resist_mat_blast>, 'tcon.slot_first');
desc.tooltip(<travelersbackpack:travelers_backpack:2>,  'backpack.Bat');
desc.tooltip(<travelersbackpack:travelers_backpack:15>, 'backpack.Bookshelf');
desc.tooltip(<travelersbackpack:travelers_backpack:17>, 'backpack.Cactus');
desc.tooltip(<travelersbackpack:travelers_backpack:28>, 'backpack.Chicken');
desc.tooltip(<travelersbackpack:travelers_backpack:64>, 'backpack.Creeper');
desc.tooltip(<travelersbackpack:travelers_backpack:22>, 'backpack.Dragon');
desc.tooltip(<travelersbackpack:travelers_backpack:8>,  'backpack.Emerald');
desc.tooltip(<travelersbackpack:travelers_backpack:53>, 'backpack.Pig');
desc.tooltip(<travelersbackpack:travelers_backpack:51>, 'backpack.Pigman');
desc.tooltip(<travelersbackpack:travelers_backpack:57>, 'backpack.Rainbow');
desc.tooltip(<travelersbackpack:travelers_backpack:67>, 'backpack.Slime');
desc.tooltip(<travelersbackpack:travelers_backpack:62>, 'backpack.Squid');
desc.tooltip(<travelersbackpack:travelers_backpack:63>, 'backpack.Sunflower');
desc.tooltip(<travelersbackpack:travelers_backpack:73>, 'backpack.Wolf');
desc.tooltip(<ic2:jetpack_electric:26>, 'sponge.removed_with');
desc.tooltip(<minecraft:sponge>, 'sponge.can_remove');

desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:blaze"})            , 'trophy.blaze');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:cave_spider"})      , 'trophy.cave_spider');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:creeper"})          , 'trophy.creeper');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:enderman"})         , 'trophy.enderman');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:evocation_illager"}), 'trophy.evocation_illager');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:elder_guardian"})   , 'trophy.elder_guardian');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:llama"})            , 'trophy.llama');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:mooshroom"})        , 'trophy.mooshroom');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:shulker"})          , 'trophy.shulker');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:skeleton"})         , 'trophy.skeleton');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:snowman"})          , 'trophy.snowman');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:squid"})            , 'trophy.squid');
desc.tooltip(<openblocks:trophy>.withTag({entity_id: "minecraft:witch"})            , 'trophy.witch');



desc.both(<netherendingores:ore_nether_modded_1:7>, 'worldgen.disabled_use_sub');
desc.both(<netherendingores:ore_end_modded_1:7>, 'worldgen.disabled_use_sub');
desc.both(<thermalfoundation:ore:2>, 'worldgen.disabled_use_sub');
desc.both(<rftools:syringe>, 'syringe_craftable');
desc.both(<rftools:spawner>, 'syringe_craftable');
desc.both(<tconstruct:shard>.withTag({Material: "fusewood"}), 'tcon.fusewood');
desc.both(<tconstruct:shard>.withTag({Material: "darkwood"}), 'tcon.darkwood');
desc.both(<tconstruct:shard>.withTag({Material: "bloodwood"}), 'tcon.bloodwood');
desc.both(<tconstruct:shard>.withTag({Material: "ghostwood"}), 'tcon.ghostwood');

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
	], 
	dont_put_into_ae: [
		<danknull:dank_null_0>,
		<danknull:dank_null_1>,
		<danknull:dank_null_2>,
		<danknull:dank_null_3>,
		<danknull:dank_null_4>,
		<danknull:dank_null_5>,
		<danknull:dank_null_6>,
	],
	power_tier_5: [
		<ic2:te:24>,
		<ic2:te:22>,
	]
} as IItemStack[][string] {
	for item in items {
		desc.jei(item, lang);
	}
}
