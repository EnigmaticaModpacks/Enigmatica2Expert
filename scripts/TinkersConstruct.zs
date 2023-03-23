import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI.removeAndHide as rh;
#modloaded tconstruct

# Slime Dirt -> Slime
var slimeDirts as IItemStack[][IItemStack] = {
	<minecraft:slime_ball> : [
		<tconstruct:slime_dirt>,
		<tconstruct:slime_grass:1>,
		<tconstruct:slime_grass:6>,
		<tconstruct:slime_grass:11>
	],
	<tconstruct:edible:1> : [
		<tconstruct:slime_dirt:1>,
		<tconstruct:slime_grass:2>,
		<tconstruct:slime_grass:7>,
		<tconstruct:slime_grass:12>
	],
	<tconstruct:edible:2> : [
		<tconstruct:slime_dirt:2>,
		<tconstruct:slime_grass:3>,
		<tconstruct:slime_grass:8>,
		<tconstruct:slime_grass:13>
	],
	<tconstruct:edible:4> : [
		<tconstruct:slime_dirt:3>,
		<tconstruct:slime_grass:4>,
		<tconstruct:slime_grass:9>,
		<tconstruct:slime_grass:14>
	]
};

for slime, dirts in slimeDirts {
	for dirt in dirts {
		mods.thermalexpansion.Centrifuge.addRecipe([slime % 50, <minecraft:dirt>], dirt, null, 4000);
		mods.forestry.Centrifuge.addRecipe([slime % 25, <minecraft:dirt>], dirt, 100);
	}
}

# Removing Bronze / Steel dupes
	mods.tconstruct.Melting.removeRecipe(<liquid:bronze>, <ic2:pipe>);
	mods.tconstruct.Melting.removeRecipe(<liquid:steel>, <ic2:pipe:1>);

# Prevent Smart Output from instantly breaking (setting it to same hardness as Smeltery Controllers)
	<tinker_io:smart_output>.hardness = <tconstruct:smeltery_controller>.hardness;

# Cobalt Block Unification
	mods.tconstruct.Casting.removeBasinRecipe(<chisel:blockcobalt>);
	mods.tconstruct.Casting.addBasinRecipe(<tconstruct:metal>, null, <liquid:cobalt>, 1296);
	
# Item Rack
	rh(<tconstruct:rack>);
	
# Blank Cast Resmelting
	mods.tconstruct.Melting.addRecipe(<liquid:alubrass> * 144, <tconstruct:cast>);

# Firewood
	recipes.remove(<tconstruct:firewood:1>);
	recipes.addShapedMirrored("Firewood", 
	<tconstruct:firewood:1>, 
	[[<tconstruct:firewood>, <bloodmagic:component:1>, <tconstruct:firewood>],
	[<bloodmagic:lava_crystal>, <tconstruct:firewood>, <bloodmagic:lava_crystal>], 
	[<tconstruct:firewood>, <bloodmagic:component:1>, <tconstruct:firewood>]]);

# Reinforcement Modifier
	recipes.remove(<tconstruct:materials:14>);
	recipes.addShapedMirrored("Reinforcement Modifier",
	<tconstruct:materials:14> * 2, 
	[[<ore:blockSheetmetalGold>, <ore:plateDenseObsidian>, <ore:blockSheetmetalGold>],
	[<ore:blockSheetmetalGold>, <ic2:casing:2>, <ore:blockSheetmetalGold>],
	[<ore:blockSheetmetalGold>, <ore:plateDenseObsidian>, <ore:blockSheetmetalGold>]]);

# Faster Alumite Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:alumite>);
	mods.tconstruct.Alloy.addRecipe(<liquid:alumite> * 432, [<liquid:aluminum> * 720, <liquid:iron> * 288,  <liquid:obsidian> * 288]);
	mods.tconstruct.Alloy.addRecipe(<liquid:alumite> * 864, [<liquid:aluminum> * 1440, <liquid:iron> * 576,  <liquid:obsidian> * 576]);

# Faster Osmiridium Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:osmiridium>);
	mods.tconstruct.Alloy.addRecipe(<liquid:osmiridium> * 144, [<liquid:osmium> * 72, <liquid:iridium> * 72]);

# Faster Bronze Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:bronze>);

	mods.tconstruct.Alloy.addRecipe(<liquid:bronze> * 288, [<liquid:tin> * 72, <liquid:copper> * 216]);
	mods.tconstruct.Alloy.addRecipe(<liquid:bronze> * 576, [<liquid:tin> * 144, <liquid:copper> * 432]);

	mods.tconstruct.Alloy.removeRecipe(<liquid:alubrass>);

	mods.tconstruct.Alloy.addRecipe(<liquid:alubrass> * 288, [<liquid:copper> * 72, <liquid:aluminum> * 216]);
	mods.tconstruct.Alloy.addRecipe(<liquid:alubrass> * 576, [<liquid:copper> * 144, <liquid:aluminum> * 432]);

# Tinkers' Complement Melter
	recipes.remove(<tcomplement:melter>);
	recipes.addShaped("TiC Complement", 
	<tcomplement:melter>, 
	[[<ore:blockSeared>, <tconstruct:seared_tank>, <ore:blockSeared>],
	[<ore:blockSeared>, <tconstruct:smeltery_controller>, <ore:blockSeared>], 
	[<ore:blockSeared>, <ore:blockSeared>, <ore:blockSeared>]]);	

# Large Plates in Immersive Engineering Metal Press
	#OutputStack, InputStack, MoldStack, Energy, SizeValue
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:simpledecorative:1>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "lead"}), <thermalfoundation:storage:3>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "iron"}), <minecraft:iron_block>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "electrum"}), <thermalfoundation:storage_alloy:1>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "flint"}), <excompressum:compressed_block:5>, <immersiveengineering:mold>, 16000, 1);
	
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:tool_rod>.withTag({Material: "ardite"}), <tconstruct:ingots:1>, <immersiveengineering:mold:2>, 4000, 1);

# EFLN
	recipes.remove(<tconstruct:throwball:1>);
	recipes.addShapedMirrored("EFLN", 
	<tconstruct:throwball:1> * 3, 
	[[<ore:dustSulfur>, <ore:gunpowder>, <ore:dustSulfur>],
	[<ore:gunpowder>, <excompressum:compressed_block:5>, <ore:gunpowder>], 
	[<ore:dustSulfur>, <ore:gunpowder>, <ore:dustSulfur>]]);

# Removing the ability to smelt dusts into ingots, for Signalum, Lumium, Enderium and Refined Obsidian
	mods.tconstruct.Melting.removeRecipe(<liquid:signalum>, <thermalfoundation:material:101>);
	mods.tconstruct.Melting.removeRecipe(<liquid:lumium>, <thermalfoundation:material:102>);
	mods.tconstruct.Melting.removeRecipe(<liquid:enderium>, <thermalfoundation:material:103>);
	mods.tconstruct.Melting.removeRecipe(<liquid:refinedobsidian>, <mekanism:otherdust:5>);
# Removing the ability to smelt redstone/glowstone to make EnderIO alloys
	for item in <ore:dustRedstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:redstone>, item); }
	for item in <ore:blockRedstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:redstone>, item); }
	for item in <ore:dustGlowstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:glowstone>, item); }
	for item in <ore:blockGlowstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:glowstone>, item); }
	for item in <ore:dustRedstone>.items { mods.tcomplement.Blacklist.addRecipe(<liquid:redstone>, item); }
	for item in <ore:blockRedstone>.items { mods.tcomplement.Blacklist.addRecipe(<liquid:redstone>, item); }
	for item in <ore:dustGlowstone>.items { mods.tcomplement.Blacklist.addRecipe(<liquid:glowstone>, item); }
	for item in <ore:blockGlowstone>.items { mods.tcomplement.Blacklist.addRecipe(<liquid:glowstone>, item); }
	mods.tcomplement.Overrides.removeRecipe(<liquid:redstone>, <netherendingores:ore_nether_vanilla:6>);

# Removing the ability to melt coal
val coals as IItemStack[] = [
	<minecraft:coal>,
	<minecraft:coal_block>,
	<thermalfoundation:material:768>,
	<nuclearcraft:ingot_block:8>,
	<nuclearcraft:ingot:8>,
	<nuclearcraft:dust:8>
	
];

for item in coals {
	mods.tconstruct.Melting.removeRecipe(<liquid:coal>, item);
}

# Remove Ender Pearl Melting (to remove the ability to alloy Enderium)
	mods.tconstruct.Melting.removeRecipe(<liquid:ender>);

# Missed melt recipe for Block Of Ender Pearls
	scripts.process.melt(<actuallyadditions:block_misc:6>, <liquid:ender> * 1000, "Except: Smeltery");
	
# Gear Cast
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:gold>, 288, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:alubrass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:brass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:gold>, 288, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:alubrass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:brass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:gold>, 288, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:alubrass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:brass>, 144, true);

# Slime Slings
	recipes.remove(<tconstruct:slimesling:*>);
	recipes.addShaped("Slime Sling Green", 
	<tconstruct:slimesling>, 
	[[<minecraft:lead>, <tconstruct:slime_congealed>, <minecraft:lead>],
	[<ore:slimeballGreen>, <minecraft:bow>.anyDamage(), <ore:slimeballGreen>], 
	[null, <ore:slimeballGreen>, null]]);
	
	recipes.addShaped("Slime Sling Blue", 
	<tconstruct:slimesling:1>, 
	[[<minecraft:lead>, <tconstruct:slime_congealed:1>, <minecraft:lead>],
	[<ore:slimeballBlue>, <minecraft:bow>.anyDamage(), <ore:slimeballBlue>], 
	[null, <ore:slimeballBlue>, null]]);
	
	recipes.addShaped("Slime Sling Purple", 
	<tconstruct:slimesling:2>, 
	[[<minecraft:lead>, <tconstruct:slime_congealed:2>, <minecraft:lead>],
	[<ore:slimeballPurple>, <minecraft:bow>.anyDamage(), <ore:slimeballPurple>], 
	[null, <ore:slimeballPurple>, null]]);
	
	recipes.addShaped("Slime Sling blood", 
	<tconstruct:slimesling:3>, 
	[[<minecraft:lead>, <tconstruct:slime_congealed:3>, <minecraft:lead>],
	[<ore:slimeballBlood>, <minecraft:bow>.anyDamage(), <ore:slimeballBlood>], 
	[null, <ore:slimeballBlood>, null]]);
	
	recipes.addShaped("Slime Sling Magma", 
	<tconstruct:slimesling:4>, 
	[[<minecraft:lead>, <tconstruct:slime_congealed:4>, <minecraft:lead>],
	[<ore:slimeballMagma>, <minecraft:bow>.anyDamage(), <ore:slimeballMagma>], 
	[null, <ore:slimeballMagma>, null]]);

# Recipes to remove 
	var recipesToRemove = [
	<tinker_io:fuel_input_machine>,
	<tinker_io:what_a_beautiful_block>,
	<tinker_io:ore_crusher>,
	<tinker_io:stirling_engine>,
	<tinker_io:speedupg>,
	<tinker_io:solidfuel>,
	<tinker_io:upg:6>,
	<tinker_io:cd_lonesome_avenue>,
	<tinker_io:crushed_ore>
	] as IItemStack[];
	
	for items in recipesToRemove {
		rh(items);
	}
	
# *======= Fuels =======*

	<liquid:pyrotheum>.definition.temperature = 5300;
	<liquid:xu_demonic_metal>.definition.temperature = 4000;
	<liquid:sulfuricacid>.definition.temperature = 4000;
	<liquid:refined_fuel>.definition.temperature = 4100;
	<liquid:ic2uu_matter>.definition.temperature = 9300;
	<liquid:ic2pahoehoe_lava>.definition.temperature = 3800;
	<liquid:gasoline>.definition.temperature = 3900;
	<liquid:diesel>.definition.temperature = 3900;
	<liquid:astralsorcery.liquidstarlight>.definition.temperature = 3900;
	
	#NuclearCraft Specific
	<liquid:neutron>.definition.temperature = 10300;
	<liquid:boric_acid>.definition.temperature = 4000;
	<liquid:hydrofluoric_acid>.definition.temperature = 4000;
				
	mods.tconstruct.Fuel.registerFuel(<liquid:pyrotheum> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:xu_demonic_metal> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:sulfuricacid> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:refined_fuel> * 25, 600);
	mods.tconstruct.Fuel.registerFuel(<liquid:ic2uu_matter> * 25, 800);
	mods.tconstruct.Fuel.registerFuel(<liquid:ic2pahoehoe_lava> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:gasoline> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:diesel> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:astralsorcery.liquidstarlight> * 25, 600);
	
	#NuclearCraft Specific
	mods.tconstruct.Fuel.registerFuel(<liquid:neutron> * 25, 1200);
	mods.tconstruct.Fuel.registerFuel(<liquid:boric_acid> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:hydrofluoric_acid> * 25, 400);
	
# Liquid blue slimy items
scripts.process.squeeze([<tconstruct:slime_dirt:1>],        <liquid:blueslime>*2000, null,  <biomesoplenty:mudball>);
scripts.process.squeeze([<tconstruct:slime_leaves>],        <liquid:blueslime>*500,  null, null);
scripts.process.squeeze([<tconstruct:slime_grass_tall>],    <liquid:blueslime>*200,  null, null);
scripts.process.squeeze([<tconstruct:slime_grass_tall:1>],  <liquid:blueslime>*200,  null, null);
scripts.process.squeeze([<tconstruct:slime_sapling>],       <liquid:blueslime>*1000, null, null);
scripts.process.squeeze([<tconstruct:slime_vine_blue_end>], <liquid:blueslime>*200,  null, null);
scripts.process.squeeze([<tconstruct:slime_vine_blue_mid>], <liquid:blueslime>*200,  null, <tconstruct:slime_vine_blue_end>);
scripts.process.squeeze([<tconstruct:slime_vine_blue>],     <liquid:blueslime>*200,  null, <tconstruct:slime_vine_blue_mid>);

# Liquid purple slimy items
scripts.process.squeeze([<tconstruct:slime_dirt:2>],          <liquid:purpleslime>*2000, null,  <biomesoplenty:mudball>);
scripts.process.squeeze([<tconstruct:slime_leaves:1>],        <liquid:purpleslime>*500,  null,  null);
scripts.process.squeeze([<tconstruct:slime_grass_tall:4>],    <liquid:purpleslime>*200,  null,  null);
scripts.process.squeeze([<tconstruct:slime_grass_tall:5>],    <liquid:purpleslime>*200,  null,  null);
scripts.process.squeeze([<tconstruct:slime_sapling:1>],       <liquid:purpleslime>*1000, null,  null);
scripts.process.squeeze([<tconstruct:slime_vine_purple_end>], <liquid:purpleslime>*200,  null,  null);
scripts.process.squeeze([<tconstruct:slime_vine_purple_mid>], <liquid:purpleslime>*200,  null,  <tconstruct:slime_vine_purple_end>);
scripts.process.squeeze([<tconstruct:slime_vine_purple>],     <liquid:purpleslime>*200,  null,  <tconstruct:slime_vine_purple_mid>);

# Clay bucket use for casts
val bkt = <claybucket:unfiredclaybucket:*>;
mods.tconstruct.Casting.addTableRecipe(<tcomplement:cast_clay>, bkt, <liquid:clay>, 288, true);
mods.tconstruct.Casting.addTableRecipe(<tcomplement:cast>, bkt, <liquid:gold>, 288, true);
mods.tconstruct.Casting.addTableRecipe(<tcomplement:cast>, bkt, <liquid:alubrass>, 144, true);
mods.tconstruct.Casting.addTableRecipe(<tcomplement:cast>, bkt, <liquid:brass>, 144, true);

# Cast slimes from liquids (only blood have recipe now)
mods.tconstruct.Casting.addTableRecipe(<tconstruct:edible:2>, null, <liquid:purpleslime>, 250);
mods.tconstruct.Casting.addTableRecipe(<tconstruct:edible:1>, null, <liquid:blueslime>  , 250);

# Slime blocks
mods.tconstruct.Casting.addBasinRecipe(<tconstruct:slime_congealed:2>, null, <liquid:purpleslime>, 1000);
mods.tconstruct.Casting.addBasinRecipe(<tconstruct:slime_congealed:1>, null, <liquid:blueslime>  , 1000);

# Molten Quartz and Lapis to blocks
mods.tconstruct.Casting.addBasinRecipe(<minecraft:quartz_block>, null, <liquid:quartz>, 2664);
mods.tconstruct.Casting.addBasinRecipe(<minecraft:lapis_block> , null, <liquid:lapis> , 5994);


# Clearing
utils.clearFluid(<tconstruct:seared_tank:0>);
utils.clearFluid(<tconstruct:seared_tank:1>);

########################################################################################
# Chest with all avaliable patterns

# generate all possible patterns
var dataList_allPatterns = [] as IData;
var k = 0 as byte;
for item in loadedMods["tconstruct"].items {
	if (!item.definition.id.startsWith("tconstruct:pattern")) continue;
	if(isNull(item.tag) || isNull(item.tag.PartType)) continue;

	dataList_allPatterns += [{
		Slot: k,
		id: "tconstruct:pattern",
		Count: 1 as byte,
		Damage: 0 as short,
		tag: item.tag
	}] as IData; 
	k += 1;
}

# [Pattern_Chest] from [Oak_Chest][+4]
recipes.removeByRecipeName("tconstruct:tools/table/chest/pattern");
craft.make(<tconstruct:tooltables:4>.withTag({
		inventory: {Items: dataList_allPatterns},
		enchantmentColor:10057489,CustomPotionColor:10057489 // Colored shimmer
	} + <enchantment:enderio:shimmer>.makeEnchantment(1).makeTag()), ["pretty",
  "# a #",
  "p c p",
  "# a #"], {
  "p": <ore:pattern>,        # Blank Pattern
  "a": <tconstruct:book>,    # Materials and You
  "#": <forestry:wood_pile>, # Wood Pile
  "c": <ore:chest>,          # Oak Chest
});
########################################################################################

# Add meltables
//mods.tconstruct.Melting.addRecipe(ILiquidStack output, IIngredient input, @Optional int temp);
	mods.tconstruct.Melting.addRecipe(<liquid:blueslime> * 250,<tconstruct:edible:1>);