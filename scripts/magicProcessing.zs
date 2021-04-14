import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import thaumcraft.aspect.CTAspectStack;
import scripts.craft.grid.Grid;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.Agglomeration;
import mods.ctutils.utils.Math.abs;
import crafttweaker.data.IData;

#priority -1

static meltingExceptions as IData = ['Amber','Redstone','Coal'] as IData;


# Native clusters processing
for ore_entry in oreDict {
	val name = ore_entry.name;
	if (name.matches("cluster[A-Z]\\w+")) {
    var ore_name = name.substring(7);
    if (ore_name != 'Aluminum') {
      scripts.process.beneficiate(ore_entry, ore_name, 3, {
        exceptions: "Pulverizer StarlightInfuser", 
        meltingExceptions: meltingExceptions
      });

      # Fix gems melting recipes
      # 	Standart JAOPCA's furnace recipes for Ores that outputs
      # gems instead of ingots have empty output, so add it forced
      var smelted = utils.smelt(ore_entry);
      if (isNull(smelted)) {
        furnace.remove(<*>, ore_entry);
        var gem = utils.getSomething(ore_name, ["gem", "dust", "any"], 2);
        if(!isNull(gem)) furnace.addRecipe(gem, ore_entry);
      }

      magicProcessing(ore_entry, ore_name);
    }
	}
}


function getPoop(ore_name as string) as IItemStack {
  for poop in scripts.mods.RatsProcessing.listRatPoop {
    var oreBlockDef = D(poop.tag).getString('OreItem.id','');

    if(oreBlockDef != '') {
      var oreBlockDmg = D(poop.tag).getInt('OreItem.Damage', 0);
      var oreBlockItem = itemUtils.getItem(oreBlockDef, oreBlockDmg);

      if (!isNull(oreBlockItem)) {
        for ore in oreBlockItem.ores {
          if (ore.name.matches("ore[A-Z]\\w+") && ore.name.substring(3) == ore_name)
            return poop;
        }
      }
    }
  }
  return null;
}

static aspects as CTAspectStack[][] = [
  [<aspect:aer>,  <aspect:terra>,
  <aspect:ignis>,  <aspect:aqua>,
  <aspect:ordo>,  <aspect:perditio>],

  [<aspect:vacuos>, <aspect:lux>, <aspect:motus>, <aspect:gelum>,
  <aspect:vitreus>, <aspect:metallum>, <aspect:victus>,
  <aspect:mortuus>, <aspect:potentia>, <aspect:permutatio>],

  [<aspect:bestia>, <aspect:exanimis>, <aspect:herba>,
  <aspect:instrumentum>, <aspect:praecantatio>, <aspect:spiritus>,
  <aspect:tenebrae>, <aspect:vinculum>, <aspect:volatus>]
] as CTAspectStack[][];

function hashedAspect(tier as int, hash as int) as CTAspectStack{
  return aspects[tier][hash % aspects[tier].length];
}


static agglMultiblock as AgglomerationMultiblock = AgglomerationMultiblock
  .create().checker(<twilightforest:aurora_block>, <minecraft:diamond_block>)
  .edgeReplace(<tconstruct:metal>);

# Helper Transmutation for Cobalt -> Diamond
//mods.astralsorcery.LightTransmutation.addTransmutation(IItemStack stackIn, IItemStack stackOut, double cost);
scripts.wrap.astralsorcery.LightTransmutation.addTransmutation(<tconstruct:metal>, <minecraft:diamond_block>, 50);

function magicProcessing(nativeClusterOreEntry as IOreDictEntry, ore_name as string) {

  var hash = abs(ore_name.hashCode());
  var dirtyGem = oreDict["dirtyGem"~ore_name].firstItem;
  if (isNull(dirtyGem)) return null; # 🛑

  var currItem as IItemStack = nativeClusterOreEntry.firstItem;
  var prevItem as IItemStack = null;
  var k = 0;

  var processList = [
    oreDict["crystalAbyss"~ore_name].firstItem,
    oreDict[  "rockyChunk"~ore_name].firstItem,
    oreDict[       "chunk"~ore_name].firstItem,
    oreDict[    "dustAlch"~ore_name].firstItem,
  ] as IItemStack[];

  #  ██████╗ 
  # ██╔═████╗
  # ██║██╔██║
  # ████╔╝██║
  # ╚██████╔╝
  #  ╚═════╝ 
  scripts.process.beneficiate(dirtyGem, ore_name, 13, {meltingExceptions: meltingExceptions});

  # manual furnance
  var ingotOrGem = utils.getSomething(ore_name, ["ingot", "gem", "dust", "any"], 12);
  if(!isNull(ingotOrGem)) furnace.addRecipe(ingotOrGem, dirtyGem);

  #  ██╗
  # ███║
  # ╚██║
  #  ██║
  #  ██║
  #  ╚═╝
  prevItem = currItem;
  currItem = processList[k]; k+=1;
  if (isNull(currItem)) return null; # 🛑
  var crystalShard = oreDict["crystalShard"~ore_name].firstItem; if (isNull(crystalShard)) return null; # 🛑
  furnace.addRecipe(dirtyGem * 1, currItem);


  # mods.astralsorcery.StarlightInfusion.addInfusion(IItemStack input, IItemStack output, boolean consumeMultiple, float consumptionChance, int craftingTickTime);
  scripts.wrap.astralsorcery.StarlightInfusion.addInfusion(prevItem, crystalShard, true, 0.2, 20);
  mods.inworldcrafting.FluidToItem.transform(currItem, <fluid:astralsorcery.liquidstarlight>, [prevItem*4], true);
  craft.shapeless(currItem,   "cccc",     {c: crystalShard});
  craft.shapeless(currItem*2, "cccccccc", {c: crystalShard});

  # ██████╗ 
  # ╚════██╗
  #  █████╔╝
  # ██╔═══╝ 
  # ███████╗
  # ╚══════╝
  prevItem = currItem;
  currItem = processList[k]; k+=1;
  if (isNull(currItem)) return null; # 🛑
  furnace.addRecipe(dirtyGem * 4, currItem);

  var a_recipe = AgglomerationRecipe.create();
  a_recipe.output(currItem);
  a_recipe.color1(0x1010FF).color2(0x0FFF3F).multiblock(agglMultiblock);
  a_recipe.inputs(Grid(["qO"], {
      O: itemUtils.getItem('botania:biomestonea', hash % 8) * 2, 
      q: prevItem * 3,
    }).shapeless());
  a_recipe.manaCost(75000);
  Agglomeration.addRecipe(a_recipe);

  # ██████╗ 
  # ╚════██╗
  #  █████╔╝
  #  ╚═══██╗
  # ██████╔╝
  # ╚═════╝ 
  prevItem = currItem;
  currItem = processList[k]; k+=1;
  if (isNull(currItem)) return null; # 🛑
  var poop = getPoop(ore_name); if (isNull(poop)) return null; # 🛑
  furnace.addRecipe(dirtyGem * 10, currItem);

  //mods.bloodmagic.AlchemyTable.addRecipe(IItemStack output, IItemStack[] inputs, int syphon, int ticks, int minTier);
  scripts.wrap.bloodmagic.AlchemyTable.addRecipe(currItem, [
    prevItem, <bloodmagic:component:8>, <bloodmagic:cutting_fluid>, prevItem, poop,poop
  ], 20000, 400, 4);

  # ██╗  ██╗
  # ██║  ██║
  # ███████║
  # ╚════██║
  #      ██║
  #      ╚═╝
  prevItem = currItem;
  currItem = processList[k]; k+=1;
  if (isNull(currItem)) return null; # 🛑
  furnace.addRecipe(dirtyGem * 48, currItem);

  scripts.wrap.thaumcraft.Infusion.registerRecipe(
    "Benefication_"~prevItem.definition.id, # name
    "INFUSION", # research
    currItem, # output
    3, # instability
    [hashedAspect(0,hash) * 120, hashedAspect(1,hash) * 40, hashedAspect(2,hash) * 10], # aspects
    <thaumcraft:nugget:10>, # centralItem
    Grid(["qqOqqO"], {O: <ore:quicksilver>, 'q': prevItem}).shapeless() # recipe
  );
}