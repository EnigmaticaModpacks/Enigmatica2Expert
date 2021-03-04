/*

All about Bees, Bees products and beekeeping

*/

#modloaded forestry gendustry

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;
import scripts.craft.grid.Grid;

// 🟠🟡🟢🟣🟤🟥🟦🟧🟨🟩🟪🟫

# Common ingredients
static g as IItemStack[string] = {
	'🟡' : <forestry:beeswax>,
	'💛' : <forestry:honey_drop>,
	'🤎' : <forestry:honeydew>,
	'🟤' : <forestry:propolis>,
	'🟠' : <forestry:propolis:1>, # Sticky Propolis
	'🔴' : <forestry:refractory_wax>,
	'🟫' : <forestry:mulch>,
	'🔷' : <forestry:phosphor>,
	'💜' : <randomthings:ingredient:1>,
	'🤍' : <minecraft:ghast_tear>,
	'⚪' : <thaumcraft:nugget:5>,
} as IItemStack[string];


# ----------------------------------------------
# Bees rework
# ----------------------------------------------

# Phosphor as melting mechannics
for input,output in {
	<ore:dustPyrotheum>      : <fluid:pyrotheum> * 250,
	<ore:dustCryotheum>      : <fluid:cryotheum> * 250,
	<ore:dustAerotheum>      : <fluid:aerotheum> * 250,
	<ore:dustPetrotheum>     : <fluid:petrotheum> * 250,
	<ore:blockRedstone>      : <fluid:redstone> * 900,
	<ore:glowstone>          : <fluid:glowstone> * 1000,
	<ore:materialEnderPearl> : <fluid:ender> * 250,
	
	<ore:blockCoal>
	|<ore:blockGraphite>     : <fluid:coal> * 900,
} as ILiquidStack[IIngredient]  {
	scripts.processWork.work(["ForestrySqueezer"], null, [g['🔷'], input], null, null,  [output], null, null);
}

# Buff silk
recipes.removeByRecipeName("forestry:silk_to_string");
recipes.addShapeless("silk to string", <minecraft:string> * 32, [<forestry:crafting_material:2>]);


# Buff Pulsating mesh output
mods.forestry.Carpenter.removeRecipe(<minecraft:ender_pearl>);
scripts.wrap.forestry.Carpenter.addRecipe(<actuallyadditions:block_misc:6> * 4, 
	Grid(["AA","AA"], {A:<forestry:crafting_material:1>}).shaped(), 60);

# Buff propolis to slime (was 1 poor slime ball)
# [Knightslime_Nugget*3] from [Pollen_Cluster][+1]
recipes.removeByRecipeName("forestry:propolis_to_slime");
craft.make(<tconstruct:nuggets:3> * 3, ["pretty",
  "P o P",
  "P o P",
  "P o P"], {
  "P": <forestry:propolis:*>, # Propolis
  "o": <forestry:pollen>      # Pollen Cluster
});


# ---------------------------
# Remake old combs
function reprocessComb(comb as IItemStack, outputs as WeightedItemStack[]) as void {
	mods.forestry.Centrifuge.removeRecipe(comb);
	scripts.wrap.forestry.Centrifuge.addRecipe(outputs, comb, 60);

	if(!comb.matches(<forestry:bee_combs:9>))
		mods.thermalexpansion.Centrifuge.removeRecipe(comb);
	scripts.wrap.thermalexpansion.Centrifuge.addRecipe(outputs, comb, null, 2000);
}

# [Cocoa_Comb]
reprocessComb(<forestry:bee_combs:1>, [
  g['🟡'] % 80, # Beeswax
  <minecraft:dye:3> % 50, # Cocoa
  <nuclearcraft:milk_chocolate> % 20,
]);

# [Stringy_Comb]
reprocessComb(<forestry:bee_combs:3>, [
	g['🟠'],
	g['💛'] % 40,  # Honey Drop
]);

# [Frozen_Comb]
reprocessComb(<forestry:bee_combs:4>, [
	g['🟡'] % 80,     # Beeswax
	g['💛'] % 70,  # Honey Drop
	<forestry:pollen:1> % 20,     # Crystalline Pollen Cluster
	<mctsmelteryio:iceball> % 80, # Iceball
]);

# [Dripping_Comb]
reprocessComb(<forestry:bee_combs:5>, [
	g['🤎'] % 100, # Honeydew
	g['💛'] % 40, # Honey Drop
	<thermalfoundation:material:1> % 20, # Gold Dust
]);

# [Parched_Comb]
reprocessComb(<forestry:bee_combs:7>, [
	(<minecraft:blaze_powder> * 2) % 45, # Blaze Powder
	g['🟡'] % 100,  # Beeswax
	g['💛'] % 90, # Honey Drop
]);

# [Powdery_Comb]
reprocessComb(<forestry:bee_combs:10>, [
	g['🟡'] % 20,     # Beeswaxer
	g['💛'] % 20,  # Honey Drop
	(<minecraft:gunpowder> * 4) % 100, # Gunpowder
]);

# [Mossy_Comb]
reprocessComb(<forestry:bee_combs:15>, [
	g['🟡'] % 100, # Beeswax
	g['💛'] % 90, # Honey Drop
	<tconstruct:materials:18> % 100,
]);

# [Irradiated_Comb]
reprocessComb(<forestry:bee_combs:9>, [
  g['🟡'] % 50, # Beeswax
  <nuclearcraft:plutonium:14> % 20, # Tiny Clump of Plutonium-242
  <nuclearcraft:uranium:10> % 80,  # Tiny Clump of Uranium-238
]);

# [Wheaten_Comb]
reprocessComb(<forestry:bee_combs:14>, [
  g['🟡'] % 80, # Beeswax
  (<harvestcraft:flouritem> * 3) % 100,
  <nuclearcraft:graham_cracker> % 80, # Graham Cracker
]);

# [Mellow_Comb]
reprocessComb(<forestry:bee_combs:16>, [
	g['🟡'] % 20, # Beeswax
	g['🤎'] % 60, # Honeydew
	<ore:dustSoularium>.firstItem % 40,
]);

# Add missed beecombs to JEI (Why they even missed??)
val bee_comb_def = <forestry:bee_combs>.definition;
for i in [1, 8, 9 ,10] as int[] {
  mods.jei.JEI.addItem(bee_comb_def.makeStack(i));
}

# ---------------------------




/*

New Bees mutations

Generated with https://arthursonzogni.com/Diagon/
by data from config/gendustry/bees.cfg

: ┌────────┐┌───────┐┌─────┐┌────────┐┌──────┐┌──────┐┌──────┐┌──────────┐
: │Derpious││GLACIAL││BOGGY││AGRARIAN││EDENIC││TRICKY││HEROIC││PHANTASMAL│
: └┬────┬──┘└┬───┬──┘└┬┬┬──┘└┬┬─────┬┘└┬────┬┘└┬─────┘└┬─────┘└┬─────────┘
:  │    │    │   │    │││    ││   ┌─│──│────│──│───────┘       │          
:  │    │    │   │   ┌│││────┘│   │┌│──│────│──┘               │          
: ┌┘   ┌│────┘  ┌│───│┘││ ┌───┘   ││└─┐│    │ ┌────────────────┘          
: │    ││       ││ ┌─│─┘│ │┌──────││──│┘    │ │                           
: │┌───vv┐┌─────vv┐│┌v──v┐││┌─────vv┐┌v─────v┐│                           
: ││Wacky││Chilled│││Oozy││││Gallant││Elysian││                           
: │└──┬─┬┘└┬──────┘│└┬──┬┘││└┬┬───┬┬┘└┬──────┘│                           
: │   │ │  │ ┌─────│─│──│─││─┘│   ││  │       │                           
: │   │ │  │ │┌────│─│──│─┘│  │   ││  │       │                           
: │  ┌│─│──┘ ││ ┌──┘ │ ┌│──┘  │   ││┌─┘       │                           
: └┐ ││ └────││─│──┐ │ │└──┐  │   │└│─┐     ┌─┘                           
:  │ ││      ││┌│──│─┘ │┌──│──┘   │ │ │     │                             
: ┌v─vv┐┌────vvvv┐┌v───vv┐┌v──────v┐│┌v─────v┐                            
: │Dull││Deformed││Potter││Tinsmith│││Paughty│                            
: └─┬┬┬┘└─┬─┬┬───┘└──────┘└────────┘│└┬┬─────┘                            
:   │││   │ ││    ┌─────────────────│─┘│                                  
:   └││───│─││────│───┐    ┌────────│──┘                                  
:    └│───│─││─┐  │ ┌─│────│────────┘                                     
: ┌───v───v┐││┌v──v┐│┌v────v┐                                             
: │Egoistic││││Vain│││Tinker│                                             
: └────────┘││└┬─┬┬┘│└──────┘                                             
:       ┌───││─┘ ││ └─┐                                                   
:       │┌──┘│   └│──┐│                                                   
: ┌─────vv┐┌─v────v┐┌vv──────────┐                                        
: │Artisan││Selfish││Narcissistic│                                        
: └───────┘└───────┘└────────────┘                                        
*/

/*

	Helper class to make several new Bees recipes at once

*/
zenClass BeeHelper {

	# Bees final production
	val beesOutputs as IItemStack[][] = null; 

	# Current bee index
	var index as int = -1 as int;
	var beesNames as string[] = [];

	# Constructor should be called once to register all recipes
	zenConstructor(g as IItemStack[string]) {
		beesOutputs = [
				#Wax,Honeydrop, Main output
				[g['🟡'] ,g['💛'], <enderio:item_alloy_nugget:9>],
				[g['🟡'] ,g['💛'], <thermalfoundation:material:770>, <ic2:dust:25>],
				[g['🟡'] ,g['🤎'], <immersiveengineering:material:17>, <actuallyadditions:item_misc:10>],
				[g['🟡'] ,g['🤎'], <extendedcrafting:material:37>],
				[g['🟡'] ,g['⚪'], <appliedenergistics2:material:5>],
				[g['🔴'] ,g['🤍'], <extrautils2:ingredients:3>],
				[g['🟫'] ,g['💛'], <thermalfoundation:material:865>],
				[g['🔴'] ,g['🤎'], shard("psigem"), shard("dreamwood"), shard("flux_crystal"), shard("amethyst")],
				[g['🔴'] ,g['🤎'], shard("desert_myrmex"), shard("jungle_myrmex"), shard("plague_metal")],
				[g['🔷'] ,g['💛'], <botania:manaresource:1>],
				[g['🟡'] ,g['💛'], <actuallyadditions:item_crystal_empowered:2>],
				[g['🟡'] ,g['💛'], <botania:blacklotus>],
				[g['🔴'] ,g['🤎'], shard("litherite"), shard("erodium"), shard("kyronite"), shard("lonsdaleite")],
				[g['🔴'] ,g['🤎'], shard("pladium"), shard("ionite"), shard("aethium"), shard("boron_nitride")],
				[g['🟡'] ,g['💜'], <extendedcrafting:material:49>],
				[g['🟡'] ,g['💛'], <avaritia:resource>],
			] as IItemStack[][];
	}

	function build() {
			next("Wacky"   ); scripts.process.melt(c['💧'], <fluid:construction_alloy> * 16, "No exceptions");
			next("Chilled" ); /* Defined in bees.cfg */
			next("Oozy"    ); scripts.process.crush(c['💧'], c['🍯'], "No exceptions", [currOutList()[3]], [0.25]);
			next("Elysian" ); scripts.process.compress(c['💧'] * 3, c['🍯'], "No exceptions");
			next("Gallant" ); furnace.addRecipe(c['🍯'], c['💧']);
			next("Dull"    ); scripts.process.saw(c['⚙️'], c['🍯'] * 6, "except: shapeless");
			next("Deformed"); craft.shapeless(c['🍯'], "AAA", {A: c['💧']});
			next("Potter"  ); addTinkersCentrifuges();
			next("Tinsmith"); addTinkersCentrifuges();
			next("Рaughty" ); mods.botania.ManaInfusion.addInfusion(c['🍯'], c['💧'], 6000/2);
			next("Egoistic"); scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(c['🍯'], c['💧'], 10000);
			next("Vain"    ); craft.make(c['🍯'], [" B ","BHB"," B "], {B: <botania:petal:15>, H: c['💧']});
			next("Tinker"  ); addTinkersCentrifuges();
			next("Artisan" ); addTinkersCentrifuges();
			next("Selfish" ); scripts.process.compress(c['💧'] * 3, c['🍯'], "only: Compactor");
			next("Narcissistic"); mods.modularmachinery.RecipeBuilder.newBuilder("amf_diamond_lattice", "advanced_metallurgic_fabricator", 10)
			.addEnergyPerTickInput(100000)
			.addItemOutput(c['🍯'])
			.addItemInput(c['💧'] * 4)
			.addFluidInput(<liquid:diamond> * 666)
			.build();

		# Add missed centrifuge recipes
		for drop in <gendustry:honey_drop>.definition.subItems {
			val i = drop.damage;
			if(i >= beesOutputs.length) continue;
			val comb = <gendustry:honey_comb>.definition.makeStack(i);

			val beeOuts = beesOutputs[i];
			scripts.processWork.work(["Centrifuge"], null, [comb], null, [drop], null, [beeOuts[0], beeOuts[1]], [beeHash(i, 1), beeHash(i, 2)]);
		}
	}

	function beeHash(i as int, n as int) as float {
		val nameHash = beesNames[i % beesNames.length].hashCode();
		val variation = ((nameHash / n) % 10) as float; // -9 .. 9
		return 0.5f + variation * 0.05f;
	}

	# TConshard helper
	function shard(mat as string) as IItemStack {
		return <tconstruct:shard>.withTag({Material: mat});
	}

  val c as IItemStack[string] = {
    '🍯': null, # Current output
    '💧': null, # Current honey
    '⚙️': null, # Current Comb
  } as IItemStack[string];

	# Bee combs, honeydrops and outputs based on current index
	function next(s as string) {
    index += 1;
    beesNames += s;
    c['🍯'] = currOut();
    c['💧'] = currHeneyDrop();
    c['⚙️'] = currComb();
  }
	function   currOutList() as IItemStack[] { return beesOutputs[index]; }
	function       currOut() as IItemStack   { return currOutList()[2]; }
	function      currComb() as IItemStack   { return <gendustry:honey_comb>.definition.makeStack(index + 1); }
	function currHeneyDrop() as IItemStack   { return <gendustry:honey_drop>.definition.makeStack(index + 1); }

	function addTinkersCentrifuges() {
		var cuttedArr = [] as IItemStack[];
		for i in 2 to currOutList().length { cuttedArr += currOutList()[i]; }
		scripts.processWork.work(["Centrifuge", "TECentrifuge"], null, [currComb()], null, null, null, cuttedArr, [0.9, 0.8, 0.7, 0.6]);
	}
}

BeeHelper(g).build();