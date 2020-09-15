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
import mods.jei.JEI.removeAndHide as rh;

#priority -1

// static listUsedItems as IItemStack[] = [] as IItemStack[];
static meltingExceptions as IData = ['Amber','Redstone','Coal'] as IData;

# Native clusters processing
for ore_entry in oreDict {
	val name = ore_entry.name;
	if (name.matches("cluster[A-Z]\\w+")) {
    var ore_name = name.substring(7);
    if (ore_name != 'Aluminum') {
      scripts.process.beneficiate(ore_entry, ore_name, 3, {exceptions: "Pulverizer", meltingExceptions: meltingExceptions});
      // listUsedItems = listUsedItems + ore_entry.firstItem;

      magicProcessing(ore_entry, ore_name);
    }
	}
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
  .create().checker(<twilightforest:aurora_block>, <cyclicmagic:crystal>)
  .consumeEdge();


function magicProcessing(nativeClusterOreEntry as IOreDictEntry, ore_name as string) {

  var hash = abs(ore_name.hashCode());

  var rockyChunk = oreDict["rockyChunk"~ore_name].firstItem;
  var dirtyGem = oreDict["dirtyGem"~ore_name].firstItem;

  if (isNull(rockyChunk) || isNull(dirtyGem)) return null;
  // listUsedItems = listUsedItems + rockyChunk;
  // listUsedItems = listUsedItems + dirtyGem;

  # ⚙️
  scripts.process.beneficiate(dirtyGem, ore_name, 8, {meltingExceptions: meltingExceptions});

  # manual furnance
  var ingotOrGem = utils.getSomething(ore_name, ["ingot", "gem"]);
  if(!isNull(ingotOrGem)) furnace.addRecipe(ingotOrGem * 7, dirtyGem);

  # ------------------------------------
  # ------------------------------------
  /*mods.thaumcraft.Infusion.registerRecipe(
    String name,
    String research,
    IItemStack output,
    int instability,
    CTAspectStack[] aspects,
    IIngredient centralItem,
    IIngredient[] recipe);
  */
  mods.thaumcraft.Infusion.registerRecipe(
    "Benefication_"~nativeClusterOreEntry.name,
    "INFUSION",
    rockyChunk,
    2,
    [hashedAspect(0,hash) * 20, hashedAspect(1,hash) * 5, hashedAspect(2,hash)],
    nativeClusterOreEntry,
    Grid(["qqqOqqqO"], {O: <ore:quicksilver>, 'q': nativeClusterOreEntry}).shapeless()
  );

  # 🔥
  furnace.addRecipe(dirtyGem * 3, rockyChunk);

  # ------------------------------------
  # ------------------------------------
  var chunk = oreDict["chunk"~ore_name].firstItem;
  if (isNull(chunk)) return null;
  // listUsedItems = listUsedItems + chunk;

  # mods.astralsorcery.StarlightInfusion.addInfusion(IItemStack input, IItemStack output, boolean consumeMultiple, float consumptionChance, int craftingTickTime);
  mods.astralsorcery.StarlightInfusion.addInfusion(rockyChunk, chunk, true, 0.9, 60);

  # 🔥
  furnace.addRecipe(dirtyGem * 4, chunk);

  # ------------------------------------
  # ------------------------------------
  var crystalAbyss = oreDict["crystalAbyss"~ore_name].firstItem;
  if (isNull(crystalAbyss)) return null;
  // listUsedItems = listUsedItems + crystalAbyss;

  var a_recipe = AgglomerationRecipe.create();
  a_recipe.inputs(Grid(["qqq12r"], {
        r: <thaumcraft:nugget:10>, 
      '1': itemUtils.getItem('botania:biomestonea', hash % 8), 
      '2': itemUtils.getItem('botania:biomestonea', hash % 8), 
      'q': chunk
    }).shapeless());
  a_recipe.output(crystalAbyss * 3);
  a_recipe.manaCost(50000);
  a_recipe.color1(0x1010FF);
  a_recipe.color2(0x0FFF3F);
  // a_recipe.multiblock(agglMultiblock);
  Agglomeration.addRecipe(a_recipe);

  # 🔥
  furnace.addRecipe(dirtyGem * 5, crystalAbyss);

  # ------------------------------------
  # ------------------------------------
  var dustAlch = oreDict["dustAlch"~ore_name].firstItem;
  if (isNull(dustAlch)) return null;
  // listUsedItems = listUsedItems + dustAlch;

  var poop = getPoop(ore_name);
  if (isNull(poop)) return null;

  //mods.bloodmagic.AlchemyTable.addRecipe(IItemStack output, IItemStack[] inputs, int syphon, int ticks, int minTier);
  mods.bloodmagic.AlchemyTable.addRecipe(dustAlch, [crystalAbyss, <bloodmagic:component:8>, <bloodmagic:cutting_fluid>,poop,poop,poop], 5000, 400, 4);

  # 🔥
  furnace.addRecipe(dirtyGem * 7, dustAlch);
}

function getPoop(ore_name as string) as IItemStack {
  for poop in scripts.RatsProcessing.listRatPoop {
    var oreBlockDef = Dd(poop.tag, 'OreItem.id',{d:''}).asString();

    if(oreBlockDef != '') {
      var oreBlockDmg = Dd(poop.tag, 'OreItem.Damage',{d:0}).asInt();
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

// for item in listUsedItems {
//   print('list of used mats: <'~item.definition.id~'>');
// }

// function removeUnused(item as IItemStack) {
//   if(!(listUsedItems has item)) {
//     print('Removing unused ore process material: <'~item.definition.id~'>');
//     rh(item);
//   } else {
//     print('  This ore material was used, skip: <'~item.definition.id~'>');
//   }
// }

// for item in itemUtils.getItemsByRegexRegistryName("thaumcraft:cluster.*") {
//   removeUnused(item);
// }
// for item in itemUtils.getItemsByRegexRegistryName(
//   "jaopca:item_(cluster|rockychunk|dirtygem|chunk|crystalabyss|dustalch)\\w+"
// ) {
//   removeUnused(item);
// }