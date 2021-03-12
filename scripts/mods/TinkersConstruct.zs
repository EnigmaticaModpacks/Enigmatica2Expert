import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.liquid.ILiquidDefinition;
import mods.jei.JEI.removeAndHide as rh;
import mods.tcomplement.highoven.HighOven;
import mods.tcomplement.highoven.MixRecipeBuilder;
import crafttweaker.data.IData;

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
		scripts.wrap.thermalexpansion.Centrifuge.addRecipe([slime % 50, <minecraft:dirt>], dirt, null, 4000);
		scripts.wrap.forestry.Centrifuge.addRecipe([slime % 25, <minecraft:dirt>], dirt, 100);
	}
}


# Removing Bronze / Steel dupes
	mods.tconstruct.Melting.removeRecipe(<liquid:bronze>, <ic2:pipe>);
	mods.tconstruct.Melting.removeRecipe(<liquid:steel>, <ic2:pipe:1>);

# Cobalt Block Unification
	mods.tconstruct.Casting.removeBasinRecipe(<chisel:blockcobalt>);
	scripts.wrap.tconstruct.Casting.addBasinRecipe(<tconstruct:metal>, null, <liquid:cobalt>, 1296);
	
# Item Rack
	rh(<tconstruct:rack>);

# Stone stick
	rh(<tconstruct:stone_stick>);
	
# Blank Cast Resmelting
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:alubrass> * 144, <tconstruct:cast>);

# Reinforcement Modifier
	recipes.remove(<tconstruct:materials:14>);
	recipes.addShapedMirrored("Reinforcement Modifier",
	<tconstruct:materials:14> * 2, 
	[[<ore:blockSheetmetalGold>, <ore:plateDenseObsidian>, <ore:blockSheetmetalGold>],
	[<ore:blockSheetmetalGold>, <ic2:casing:2>, <ore:blockSheetmetalGold>],
	[<ore:blockSheetmetalGold>, <ore:plateDenseObsidian>, <ore:blockSheetmetalGold>]]);

# Faster Alumite Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:alumite>);
	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:alumite> * 432, [<liquid:aluminum> * 720, <liquid:iron> * 288,  <liquid:obsidian> * 288]);
	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:alumite> * 864, [<liquid:aluminum> * 1440, <liquid:iron> * 576,  <liquid:obsidian> * 576]);

# Faster Osmiridium Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:osmiridium>);
	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:osmiridium> * 144, [<liquid:osmium> * 72, <liquid:iridium> * 72]);

# Faster Bronze Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:bronze>);

	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:bronze> * 288, [<liquid:tin> * 72, <liquid:copper> * 216]);
	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:bronze> * 576, [<liquid:tin> * 144, <liquid:copper> * 432]);

	mods.tconstruct.Alloy.removeRecipe(<liquid:alubrass>);

	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:alubrass> * 288, [<liquid:copper> * 72, <liquid:aluminum> * 216]);
	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:alubrass> * 576, [<liquid:copper> * 144, <liquid:aluminum> * 432]);

# Tinkers' Complement Melter
	recipes.remove(<tcomplement:melter>);
	recipes.addShaped("TiC Complement", 
	<tcomplement:melter>, 
	[[<ore:blockSeared>, <tconstruct:seared_tank>, <ore:blockSeared>],
	[<ore:blockSeared>, <tconstruct:smeltery_controller>, <ore:blockSeared>], 
	[<ore:blockSeared>, <ore:blockSeared>, <ore:blockSeared>]]);	

# Large Plates in Immersive Engineering Metal Press
	#OutputStack, InputStack, MoldStack, Energy, SizeValue
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:simpledecorative:1>, <immersiveengineering:mold>, 16000, 1);
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "lead"}), <thermalfoundation:storage:3>, <immersiveengineering:mold>, 16000, 1);
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "iron"}), <minecraft:iron_block>, <immersiveengineering:mold>, 16000, 1);
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "electrum"}), <thermalfoundation:storage_alloy:1>, <immersiveengineering:mold>, 16000, 1);
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "flint"}), <excompressum:compressed_block:5>, <immersiveengineering:mold>, 16000, 1);
	
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<tconstruct:tool_rod>.withTag({Material: "ardite"}), <tconstruct:ingots:1>, <immersiveengineering:mold:2>, 4000, 1);

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

# Removing the ability to melt coal
val coals as IItemStack[] = [

	<bigreactors:ingotgraphite>,
	<bigreactors:dustgraphite>,
	<minecraft:coal>,
	<minecraft:coal_block>,
	<thermalfoundation:material:768>,
	<bigreactors:blockgraphite>,
	<nuclearcraft:ingot_block:8>,
	<nuclearcraft:ingot:8>,
	<nuclearcraft:dust:8>
	
];

for item in coals {
	mods.tconstruct.Melting.removeRecipe(<liquid:coal>, item);
}

# Remove Ender Pearl Melting (to remove the ability to alloy Enderium)
	mods.tconstruct.Melting.removeRecipe(<liquid:ender>);
	
# Gear Cast
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:gold>, 288, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:alubrass>, 144, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:brass>, 144, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:gold>, 288, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:alubrass>, 144, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:brass>, 144, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:gold>, 288, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:alubrass>, 144, true);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:brass>, 144, true);

# Add Cyanite melting recipe
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:cyanite> * (144*9), <ore:blockCyanite>, 700);
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:cyanite> * 144, <ore:ingotCyanite> | <ore:dustCyanite>, 450);

# Add recipes from liquids
	scripts.wrap.tconstruct.Casting.addBasinRecipe(<bigreactors:blockblutonium>, null, <liquid:plutonium>, 1296);
	scripts.wrap.tconstruct.Casting.addBasinRecipe(<bigreactors:blockcyanite>, null, <liquid:cyanite>, 1296);
	scripts.wrap.tconstruct.Casting.addTableRecipe(<bigreactors:ingotcyanite>, <tconstruct:cast_custom>, <liquid:cyanite>, 144, false);


# Slime Boots remove and hide (replaced by Conarm)
	for i in 0 to 6 {
		rh(itemUtils.getItem("tconstruct:slime_boots", i));
	}

# Slime Slings
	recipes.remove(<tconstruct:slimesling:*>);
	function remakeSlimeSlings(name as string, item as IItemStack, primary as IIngredient){
		recipes.addShaped("Slime Sling " ~ name, item, [
			[<ore:slimeball>, null, <ore:slimeball>], 
			[<ore:slimeball>, <cyclicmagic:slingshot_weapon>.anyDamage(), <ore:slimeball>], 
			[null, primary, null]
		]);
	}

	remakeSlimeSlings("Green",  <tconstruct:slimesling>,   <tconstruct:slime_congealed>);
	remakeSlimeSlings("Blue",   <tconstruct:slimesling:1>, <tconstruct:slime_congealed:1>);
	remakeSlimeSlings("Purple", <tconstruct:slimesling:2>, <tconstruct:slime_congealed:2>);
	remakeSlimeSlings("Red",    <tconstruct:slimesling:3>, <tconstruct:slime_congealed:3>);
	remakeSlimeSlings("Magma",  <tconstruct:slimesling:4>, <tconstruct:slime_congealed:4>);

# *======= Fuels =======*

/* Patchouli_js("Liquids/Smeltery Fuels", {
	item: "tconstruct:smeltery_controller",
	_text: `
		$(l)Smeltery/$ melting temperatures was tweaked. Some metals $(l)require/$ better fuels than $(#d31)lava/$.
		All fuels consume $(l)50/$mb.
		$(l)Temperature/$ of fuel affect melting speed.
		$(l)Time/$ is number of ticks fuel will burn.`});

Patchouli_js("Liquids/Smeltery Fuels",
  paged({
    item: "tconstruct:smeltery_controller",
    type: "item_list"
  }, 7, 
  from_crafttweaker_log(/Register Smeltery fuel. Temp: (?<temp>\d+), Burn time: (?<time>\d+), Name: (?<name>.*)/gm)
  .map(o=>o.groups)

	// Default fuels
	.concat([{temp:1300, time:80, name:"lava"}])

  .sort((a,b)=>b.temp*b.time - a.temp*a.time)
  .map(o=>[wrap_bucket(o.name), `${o.temp}°К, ${o.time} ticks`])
))*/

for pos, names in utils.graph([
# ↑ Duration
	"                                                          l           o        p",
	"       a              f  g                      k                               ",
	"                                        m  n                                    ",
	"                                                                                ",
	"                   e         h   i                                              ",
	"     q   b c    d                                                               ",
	"                                                                                ",
	"*                                    j                                          ",
	"1 2      3            4                     5                         6         ",
# ┣━━━━─━━━━┷━━━━─━━━━┻━━━━─━━━━┷━━━━─━━━━╋╋━━━━─━━━━┷━━━━─━━━━┻━━━━─━━━━┷━━━━─━━━━┫
# |500     2300      4100      5900      7800      9600      11400     13200  15000| Temp --->
],{
	x: {min: 500, max: 15000, step: 100},
	y: {min:   0, max:  1200, step: 100}
},{
	# Fuels
"*": ["steam"],
	q: ["canolaoil", "creosote"],
	a: ["ic2pahoehoe_lava"],
	b: ["biodiesel", "biofuel"],
	c: ["diesel", "ic2biogas", "refinedcanolaoil"],
	d: ["gasoline", "crystaloil"],
	e: ["boric_acid", "napalm", "refined_biofuel"],
	f: ["hydrofluoric_acid"],
	g: ["sulfuricacid"],
	h: ["bio.ethanol", "rocket_fuel"],
	i: ["refined_fuel"],
	j: ["pyrotheum"],
	m: ["rocketfuel"],
	k: ["ic2uu_matter"],
	l: ["neutron"],
	n: ["empoweredoil"],
	o: ["plasma"],
	p: ["infinity_metal"],

	# Non-fuel Metals
	"1": [],
	"2": [],
	"3": ["osmium", "obsidian", "vibrant_alloy", "pulsating_iron", "end_steel"],
	"4": ["xu_demonic_metal", "mirion", "signalum", "lumium", "crystalline_alloy", "melodic_alloy", "crystalline_pink_slime"],
	"5": ["xu_enchanted_metal", "xu_evil_metal"],
	"6": ["stellar_alloy", "osgloglas", "enderium"],
}) {
	for name in names {
		var temp = pos.x as int;
		var time = pos.y as int;
		var liquid = game.getLiquid(name);
		
		liquid.definition.temperature = temp;

		if (time != 0) {
			utils.log("Register Smeltery fuel. Temp: "~temp~", Burn time: "~time~", Name: "~name);
			mods.tconstruct.Fuel.registerFuel(liquid * 50, time);
		}
	}
}

# Easter Egg fuel
mods.tconstruct.Fuel.registerFuel(<liquid:seed_fluid> * 10, 500000);

# Remake some metals to able be melted only under amplyfiing tube
mods.mechanics.addTubeRecipe([<thaumcraft:amber_block>] as IItemStack[], <liquid:amber> * 1000);
mods.mechanics.addTubeRecipe([<biomesoplenty:crystal>] as IItemStack[], <liquid:crystal> * 1000);

# Remove cyclic recipes
mods.cyclicmagic.Melter.removeShapedRecipe("amber", 100);
mods.cyclicmagic.Melter.removeShapedRecipe("amber", 1000);
mods.cyclicmagic.Melter.removeShapedRecipe("crystal", 1000);

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

# Remove cheap steel recipe
HighOven.removeMixRecipe(<liquid:steel>);

# More Scorched bricks recipes
scripts.wrap.immersiveengineering.ArcFurnace.addRecipe(<tcomplement:materials:1>, <minecraft:brick>, <immersiveengineering:material:7>, 10, 512);

# Clay bucket use for casts
val bkt = <claybucket:claybucket>;
scripts.wrap.tconstruct.Casting.addTableRecipe(<tcomplement:cast_clay>, bkt, <liquid:clay>, 288, true);
scripts.wrap.tconstruct.Casting.addTableRecipe(<tcomplement:cast>, bkt, <liquid:gold>, 288, true);
scripts.wrap.tconstruct.Casting.addTableRecipe(<tcomplement:cast>, bkt, <liquid:alubrass>, 144, true);
scripts.wrap.tconstruct.Casting.addTableRecipe(<tcomplement:cast>, bkt, <liquid:brass>, 144, true);

# Cast slimes from liquids (only blood have recipe now)
scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:edible:2>, null, <liquid:purpleslime>, 250);
scripts.wrap.tconstruct.Casting.addTableRecipe(<tconstruct:edible:1>, null, <liquid:blueslime>  , 250);

# Slime blocks
scripts.wrap.tconstruct.Casting.addBasinRecipe(<tconstruct:slime_congealed:2>, null, <liquid:purpleslime>, 1000);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<tconstruct:slime_congealed:1>, null, <liquid:blueslime>  , 1000);

# Mud balls smelted into TCon bricks
furnace.remove(<biomesoplenty:mud_brick>);
furnace.addRecipe(<tconstruct:materials:1>, <biomesoplenty:mudball>);

# Mud bricks from TCon bricks
recipes.remove(<biomesoplenty:mud_brick_block>);
recipes.addShaped(<biomesoplenty:mud_brick_block> * 2, [
	[<tconstruct:materials:1>, <tconstruct:materials:1>, <tconstruct:materials:1>],
	[<tconstruct:materials:1>, null, <tconstruct:materials:1>], 
	[<tconstruct:materials:1>, <tconstruct:materials:1>, <tconstruct:materials:1>]
]);

# Osgloglas recipe after moving to tconevo
scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:osgloglas> * 144, [<liquid:osmium> * 144, <liquid:refined_obsidian> * 144,  <liquid:refined_glowstone> * 144]);

# Molten Quartz and Lapis to blocks
scripts.wrap.tconstruct.Casting.addBasinRecipe(<minecraft:quartz_block>, null, <liquid:quartz>, 2664);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<minecraft:lapis_block> , null, <liquid:lapis> , 5994);

# Replace Plustick's Infinity -> TConEvo
mods.nuclearcraft.melter.removeRecipeWithOutput([<fluid:infinity> * 144]);
mods.nuclearcraft.melter.removeRecipeWithOutput([<fluid:infinity> * (144*9)]);
mods.nuclearcraft.melter.addRecipe(<ore:ingotInfinity>, <fluid:infinity_metal> * 144);
mods.nuclearcraft.melter.addRecipe(<ore:blockInfinity>, <fluid:infinity_metal> * (144*9));
mods.nuclearcraft.ingot_former.addRecipe([<liquid:infinity_metal>*144, <avaritia:resource:6>]);

# Clearing
utils.clearFluid(<tconstruct:seared_tank:0>);
utils.clearFluid(<tconstruct:seared_tank:1>);

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

# Chest with all avaliable patterns
# [Pattern_Chest] from [Oak_Chest][+4]
recipes.removeByRecipeName("tconstruct:tools/table/chest/pattern");
craft.make(<tconstruct:tooltables:4>.withTag({
		inventory: {Items: dataList_allPatterns},
		ench:[{lvl:1,id:36}],enchantmentColor:10057489,CustomPotionColor:10057489 // Colored shimmer
	}), ["pretty",
  "# a #",
  "p c p",
  "# M #"], {
  "p": <ore:pattern>,        # Blank Pattern
  "a": <tconstruct:book>,    # Materials and You
  "#": <forestry:wood_pile>, # Wood Pile
  "c": <ore:chest>,          # Oak Chest
  "M": <conarm:book>         # Materials and You - Armory Addendum
});

# [Firewood] from [Pahoehoe_Lava_Bucket][+2]
craft.remake(<tconstruct:firewood:1>, ["pretty",
	"L B L",
	"B ~ B",
	"L B L"], {
	"B": <forestry:bituminous_peat>, # Bituminous Peat
	"L": <tconstruct:firewood>,      # Lavawood
	"~": Bucket("ic2pahoehoe_lava")  # Pahoehoe Lava Bucket
});

# Nerf stone torch light level
<tconstruct:stone_torch>.asBlock().definition.lightLevel = 0.75f;

# [Silky Cloth] from [Pulverized Gold][+1]
craft.reshapeless(<tconstruct:materials:15>, "S▲", {
  "▲": <ore:dustGold>,                 # Pulverized Gold
  "S": <forestry:crafting_material:2>, # Silk Wisp
});

# Remake to avoid recipe conflict with Compressed Mossy Stone
# [Ball of Moss] from [Moss Stone]
craft.remake(<tconstruct:materials:18>, ["pretty",
  "□ □ □",
  "□   □",
  "□ □ □"], {
  "□": <ore:blockMossy>, # Moss Stone
});

# Molten Spectre
scripts.process.melt(<ore:ingotSpectre>, <liquid:spectre> * 144, "No Exceptions");
scripts.wrap.tconstruct.Casting.addTableRecipe(<randomthings:ingredient:3>, <tconstruct:cast_custom>, <liquid:spectre>, 144, false);