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
	scripts.processWork.work(["ForestrySqueezer"], null, [<forestry:phosphor>, input], null, null,  [output], null, null);
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

# [Frozen_Comb]
reprocessComb(<forestry:bee_combs:4>, [
	<forestry:beeswax> % 80,     # Beeswax
	<forestry:pollen:1> % 20,    # Crystalline Pollen Cluster
	<forestry:honey_drop> % 70,  # Honey Drop
	<mctsmelteryio:iceball> % 40 # Iceball
]);

# [Dripping_Comb]
reprocessComb(<forestry:bee_combs:5>, [
	<thermalfoundation:material:1> % 20, # Gold Dust
	<forestry:honeydew> % 100,  # Honeydew
	<forestry:honey_drop> % 40  # Honey Drop
]);

# [Parched_Comb]
reprocessComb(<forestry:bee_combs:7>, [
	<minecraft:blaze_powder> % 25, # Blaze Powder
	<forestry:beeswax> % 100,  # Beeswax
	<forestry:honey_drop> % 90 # Honey Drop
]);

# [Powdery_Comb]
reprocessComb(<forestry:bee_combs:10>, [
	<forestry:beeswax> % 20,     # Beeswaxer
	(<minecraft:gunpowder> * 4) % 100, # Gunpowder
	<forestry:honey_drop> % 20   # Honey Drop
]);

# [Mossy_Comb]
reprocessComb(<forestry:bee_combs:15>, [
	<forestry:beeswax> % 100,  # Beeswax
	<ic2:crafting:20> % 100,   # Plantball
	<forestry:honey_drop> % 90 # Honey Drop
]);

# [Mellow_Comb]
reprocessComb(<forestry:bee_combs:16>, [
	<minecraft:glowstone_dust> % 40, # Glowstone Dust
	<forestry:beeswax> % 20,   # Beeswax
	<forestry:honeydew> % 60   # Honeydew
]);

# [Cocoa_Comb]
reprocessComb(<forestry:bee_combs:1>, [
  <forestry:beeswax> % 80, # Beeswax
  <minecraft:dye:3> % 50, # Cocoa
  <nuclearcraft:dark_chocolate> % 20 # Dark Chocolate
]);

# [Irradiated_Comb]
reprocessComb(<forestry:bee_combs:9>, [
  <forestry:beeswax> % 50, # Beeswax
  <nuclearcraft:plutonium:14> % 2, # Tiny Clump of Plutonium-242
  <nuclearcraft:uranium:10> % 40   # Tiny Clump of Uranium-238
]);

# [Wheaten_Comb]
reprocessComb(<forestry:bee_combs:14>, [
  <forestry:beeswax> % 80, # Beeswax
  <harvestcraft:flouritem> % 100,
  <nuclearcraft:graham_cracker> % 20 # Graham Cracker
]);

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

	val bw as IItemStack = <forestry:beeswax>;
	val rw as IItemStack = <forestry:refractory_wax>;
	val mh as IItemStack = <forestry:mulch>;
	val ph as IItemStack = <forestry:phosphor>;
	val hd as IItemStack = <forestry:honey_drop>;
	val hw as IItemStack = <forestry:honeydew>;
	val tr as IItemStack = <randomthings:ingredient:1>;
	val gt as IItemStack = <minecraft:ghast_tear>;
	val qs as IItemStack = <thaumcraft:nugget:5>;

	# Constructor should be called once to register all recipes
	zenConstructor() {
		beesOutputs = [
				#Wax,Honeydrop, Main output
				[bw ,hd, <enderio:item_alloy_nugget:9>],
				[bw ,hd, <thermalfoundation:material:770>, <ic2:dust:25>],
				[bw ,hw, <immersiveengineering:material:17>, <actuallyadditions:item_misc:10>],
				[bw ,hw, <extendedcrafting:material:37>],
				[bw ,qs, <appliedenergistics2:material:5>],
				[rw ,gt, <extrautils2:ingredients:3>],
				[mh ,hd, <thermalfoundation:material:865>],
				[rw ,hw, shard("psigem"), shard("dreamwood"), shard("flux_crystal"), shard("amethyst")],
				[rw ,hw, shard("desert_myrmex"), shard("jungle_myrmex"), shard("plague_metal")],
				[ph ,hd, <botania:manaresource:1>],
				[bw ,hd, <actuallyadditions:item_crystal_empowered:2>],
				[bw ,hd, <botania:blacklotus>],
				[rw ,hw, shard("litherite"), shard("erodium"), shard("kyronite"), shard("lonsdaleite")],
				[rw ,hw, shard("pladium"), shard("ionite"), shard("aethium"), shard("boron_nitride")],
				[bw ,tr, <extendedcrafting:material:49>],
				[bw ,hd, <avaritia:resource>],
			] as IItemStack[][];
	}

	function build() {
			frst(       "Wacky"); scripts.process.melt(currHeneyDrop(), <fluid:construction_alloy> * 16, "No exceptions");
			next(     "Chilled"); // Defined in bees.cfg
			next(        "Oozy"); scripts.process.crush(currHeneyDrop(), currOut(), "No exceptions", [currOutList()[3]], [0.25]);
			next(     "Elysian"); scripts.process.compress(currHeneyDrop() * 3, currOut(), "No exceptions");
			next(     "Gallant"); furnace.addRecipe(currOut(), currHeneyDrop());
			next(        "Dull"); scripts.process.saw(currComb(), currOut() * 6, "except: shapeless");
			next(    "Deformed"); craft.shapeless(currOut(), "AAA", {A: currHeneyDrop()});
			next(      "Potter"); addTinkersCentrifuges();
			next(    "Tinsmith"); addTinkersCentrifuges();
			next(     "Рaughty"); mods.botania.ManaInfusion.addInfusion(currOut(), currHeneyDrop(), 6000/2);
			next(    "Egoistic"); mods.actuallyadditions.AtomicReconstructor.addRecipe(currOut(), currHeneyDrop(), 10000);
			next(        "Vain"); craft.make(currOut(), [" B ","BHB"," B "], {B: <botania:petal:15>, H: currHeneyDrop()});
			next(      "Tinker"); addTinkersCentrifuges();
			next(     "Artisan"); addTinkersCentrifuges();
			next(     "Selfish"); scripts.process.compress(currHeneyDrop() * 3, currOut(), "only: Compactor");
			next("Narcissistic"); mods.modularmachinery.RecipeBuilder.newBuilder("amf_diamond_lattice", "advanced_metallurgic_fabricator", 10)
			.addEnergyPerTickInput(100000)
			.addItemOutput(currOut())
			.addItemInput(currHeneyDrop() * 4)
			.addFluidInput(<liquid:diamond> * 666)
			.build();

		# Add missed centrifuge recipes
		for drop in <gendustry:honey_drop>.definition.subItems {
			val i = drop.damage;
			val comb = <gendustry:honey_comb>.definition.makeStack(i);

			val beeOuts = beesOutputs[(i - 1 + beesOutputs.length*100) % beesOutputs.length];
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

	# Bees final production
	val beesOutputs as IItemStack[][] = null; 

	# Current bee index
	var index as int = 0;
	var beesNames as string[] = [];

	# Bee combs, honeydrops and outputs based on current index
	function frst(s as string) {index = 0;  beesNames += s;}
	function next(s as string) {index += 1; beesNames += s;}
	function   currOutList() as IItemStack[] { return beesOutputs[index]; }
	function       currOut() as IItemStack   { return currOutList()[2]; }
	function      currComb() as IItemStack   { return <gendustry:honey_comb>.definition.makeStack(index + 1); }
	function currHeneyDrop() as IItemStack   {
		val it = <gendustry:honey_drop>.definition.makeStack(index + 1);
		return it;
	}

	function addTinkersCentrifuges() {
		var cuttedArr = [] as IItemStack[];
		for i in 2 to currOutList().length { cuttedArr += currOutList()[i]; }
		scripts.processWork.work(["Centrifuge", "TECentrifuge"], null, [currComb()], null, null, null, cuttedArr, [0.9, 0.8, 0.7, 0.6]);
	}
}

BeeHelper().build();