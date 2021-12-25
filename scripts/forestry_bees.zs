/*

All about Bees, Bees products and beekeeping

*/

#modloaded forestry gendustry

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.liquid.ILiquidStack;
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
	'🔷' : <forestry:phosphor>,
	'💜' : <randomthings:ingredient:1>,
	'🤍' : <minecraft:ghast_tear>,
	'⚪' : <thaumcraft:quicksilver>,
} as IItemStack[string];




/*

New Bees mutations

Generated with https://arthursonzogni.com/Diagon/
by data from config/gendustry/bees.cfg

┌─────┐┌────────┐┌──────┐┌────────┐┌────────┐┌──────┐┌────┐┌──────┐┌──────────┐┌─────┐┌────────┐┌──────┐┌───────┐
│Boggy││Agrarian││Frugal││Derpious││Farmerly││Heroic││Miry││Modest││Phantasmal││Rural││Sinister││Wintry││Valiant│
└┬────┘└┬───────┘└┬─────┘└┬┬──────┘└┬┬──────┘└┬┬───┬┘└┬┬─┬┘└┬─────┘└┬─────────┘└┬────┘└┬───────┘└┬─────┘└┬┬─────┘
 │      │         │       ││      ┌─││────────││───│──││─│──│───────┘           │      │         │       ││
┌┘      │ ┌───────┘┌──────┘│      │ ││      ┌─││───│──│┘ │  │                   │      │         │       ││
│┌──────┘ │       ┌│───────│──────│─││──────│─││───│──│──│──│───────────────────┘      │         │       ││
││┌───────│───────││───────┘     ┌│─││──────│─││───│──│──│──│──────────────────────────┘         │       ││
│││      ┌│───────││─────────────││─┘│     ┌│─││───│──│──│──│────────────────────────────────────┘       ││
│││      ││       ││     ┌───────││──┘     ││ ││   │┌─│──│──│────────────────────────────────────────────┘│
│││      ││  ┌────││─────│───────││────────││─┘│   ││ │  │  │ ┌───────────────────────────────────────────┘
│││      ││ ┌│────││─────│───────││────────││──┘   ││ │  │  │ │
│││      ││ ││    ││    ┌│───────││────────││──────││─┘  │  │ │
│││      ││ ││    ││    ││ ┌─────│┘┌───────││──────││────│──┘ │
│││┌─────vv┐││┌───vv┐┌──vv┐│┌────v─v┐┌─────vv┐┌────vv┐┌──v────v┐
││││Elysian││││Wacky││Oozy│││Gallant││Chilled││Potter││Tinsmith│
│││└─┬─────┘││└─┬───┘└┬───┘│└┬┬─────┘└┬──────┘└──────┘└────────┘
│││  │      │└──│─┐   │    │ ││       │
││└──│──────│┐  │ │   │    │ ││       │
│└──┐│   ┌──││──│─│───│────│─┘│       │
└──┐││   │┌─││──│─│───┘   ┌┘  │       │
┌──││┘   ││ ││  │ │      ┌│───┘       │
│┌─││────││─┘│ ┌│─│──────││───────────┘
││┌vv────vv┐┌v─vv┐│┌─────vv┐
│││Scrappy ││Dull│││Paughty│
││└──────┬┬┘└┬──┬┘│└┬────┬─┘
││      ┌││──┘  │ │ │    │
││      ││└┐   ┌│─│─┘    │
│└──────││─│───││─│─┐    │
│┌──────vv┐│┌──vv┐│┌v────v┐
││Egoistic│││Vain│││Tinker│
│└────────┘│└┬─┬┬┘│└──────┘
│          │┌┘ └│─│─────┐
└┐         └│──┐│ └─────│┐
┌v──────────v┐┌vv─────┐┌vv─────┐
│Narcissistic││Selfish││Artisan│
└────────────┘└───────┘└───────┘
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
				#  Wax  ,Honeydrop, Main output
				[g['🟡'] ,g['💛'], <enderio:item_alloy_nugget:9>],
				[g['🟡'] ,g['💛'], <thermalfoundation:material:770>, <ic2:dust:25>],
				[g['🟡'] ,g['🤎'], <immersiveengineering:material:18>, <nuclearcraft:dust:8>],
				[g['🟡'] ,g['🤎'], <extendedcrafting:material:37>],
				[g['🟡'] ,g['⚪'], <appliedenergistics2:material:5>],
				[g['🔴'] ,g['🤍'], <libvulpes:productnugget:7>],
				[g['🟡'] ,g['💛'], <ic2:crafting:23> * 64],
				[g['🔴'] ,g['🤎'], shard("psigem"), shard("emeradic_actadd_plustic"), shard("integrationforegoing.plastic"), shard("amethyst")],
				[g['🔴'] ,g['🤎'], shard("desert_myrmex"), shard("jungle_myrmex"), shard("steeleaf")],
				[g['🔷'] ,g['💛'], <botania:manaresource:16>, <botania:manaresource:1>, <botania:manaresource:2>],
				[g['🟡'] ,g['💛'], <actuallyadditions:item_crystal_empowered:2>],
				[g['🟡'] ,g['💛'], <mysticalagradditions:insanium:5>],
				[g['🔴'] ,g['🤎'], shard("litherite"), shard("erodium"), shard("kyronite"), shard("wyvern_plustic")],
				[g['🔴'] ,g['🤎'], shard("pladium"), shard("ionite"), shard("aethium"), shard("boron_nitride")],
				[g['🟡'] ,g['💜'], <extendedcrafting:material:49>],
				[g['🟡'] ,g['💛'], <storagedrawers:upgrade_storage:3>],
			] as IItemStack[][];
	}

	function build() {
			next("Wacky"   ); scripts.process.melt(c['💧'], <fluid:construction_alloy> * 144, "No exceptions");
			next("Chilled" ); /* Defined in bees.cfg */
			next("Oozy"    ); scripts.process.crush(c['💧'], c['🍯'], "No exceptions", [currOutList()[3]], [0.25], {bonusType: "MULTIPLY_OUTPUT"});
			next("Elysian" ); scripts.process.compress(c['💧'], c['🍯'], "No exceptions");
			next("Gallant" ); furnace.addRecipe(c['🍯'] * 2, c['💧']);
			next("Dull"    ); scripts.process.saw(c['⚙️'], c['🍯'] * 7, "except: shapeless");
			next("Scrappy" ); scripts.process.crush(c['💧'], c['🍯'], "No exceptions", [c['🍯'], c['🍯'], c['🍯']], [0.50, 0.25, 0.10], {bonusType: "MULTIPLY_OUTPUT"});
			next("Potter"  ); addTinkersCentrifuges();
			next("Tinsmith"); addTinkersCentrifuges();
			next("Рaughty" ); mods.botania.ManaInfusion.addInfusion(currOutList()[2], c['💧'], 100); mods.botania.ManaInfusion.addAlchemy(currOutList()[3], c['💧'], 200); mods.botania.ManaInfusion.addConjuration(currOutList()[4], c['💧'], 500); 
			next("Egoistic"); mods.actuallyadditions.AtomicReconstructor.addRecipe(c['🍯'], c['💧'], 10000);
			next("Vain"    ); scripts.process.fill(c['💧'],  <liquid:base_essence>,  c['🍯'],  "Except: Casting DryingBasin MechanicalDryingBasin");
			next("Tinker"  ); mods.thermalexpansion.Centrifuge.removeRecipe(c['⚙️']); addTinkersCentrifuges();
			next("Artisan" ); mods.thermalexpansion.Centrifuge.removeRecipe(c['⚙️']); addTinkersCentrifuges();
			next("Selfish" ); scripts.process.compress(c['💧'], c['🍯'], "only: Compactor");
			next("Narcissistic"); craft.make(c['🍯'], ["HsH","sUs","HsH"], {s: <ore:stickWood>, U: <storagedrawers:upgrade_template>, H: c['💧']});

		#-----------------------------------
		# Add missed centrifuge recipes

		val removeBlacklist = [1,3,4,5,7] as int[];
		// val makeTERecipeBlacklist = [10, 9, 12] as int[];

		for i in [1, 3, 4, 5, 7, 10, 11, 12, 15, 16] as int[] {
			if(i >= beesOutputs.length) continue;
			val drop = <gendustry:honey_drop>.definition.makeStack(i);
			val comb = <gendustry:honey_comb>.definition.makeStack(i);
			val beeOuts = beesOutputs[i];
			val honey_drop = i==7 ? drop * 3 : drop;
			if(!(removeBlacklist has i)) {
				mods.thermalexpansion.Centrifuge.removeRecipe(comb);
			}
			scripts.processWork.work(["Centrifuge", "TECentrifuge"], null, [comb], null, [honey_drop], null, [beeOuts[0], beeOuts[1]], [beeHash(i, 1), beeHash(i, 2)]);
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