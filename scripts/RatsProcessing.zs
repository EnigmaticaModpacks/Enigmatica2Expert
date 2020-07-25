import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;



# Parsed list from command /ct oredict ratPoop
# dont forget to add "," at end
static listRatPoop as IItemStack[] = [
<rats:rat_nugget_ore>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 132 as short}}),
<rats:rat_nugget_ore:1>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:2>.withTag({OreItem: {id: "forestry:resources", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "forestry:apatite", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:3>.withTag({OreItem: {id: "astralsorcery:blockcustomsandore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 3 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:4>.withTag({OreItem: {id: "tconstruct:ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:5>.withTag({OreItem: {id: "twilightforest:armor_shard_cluster", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "twilightforest:knightmetal_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:6>.withTag({OreItem: {id: "actuallyadditions:block_misc", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "actuallyadditions:item_misc", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:7>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:8>.withTag({OreItem: {id: "thaumcraft:ore_cinnabar", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "thaumcraft:quicksilver", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:9>.withTag({OreItem: {id: "minecraft:coal_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:coal", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:10>.withTag({OreItem: {id: "tconstruct:ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:11>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 128 as short}}),
<rats:rat_nugget_ore:12>.withTag({OreItem: {id: "minecraft:diamond_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:diamond", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:13>.withTag({OreItem: {id: "libvulpes:ore0", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "libvulpes:productdust", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:14>.withTag({OreItem: {id: "draconicevolution:draconium_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "draconicevolution:draconium_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:15>.withTag({OreItem: {id: "minecraft:emerald_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:emerald", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:16>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 9 as short}, IngotItem: {id: "appliedenergistics2:quartz_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:17>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 10 as short}, IngotItem: {id: "appliedenergistics2:charged_quartz_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:18>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:coal_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:19>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:20>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "minecraft:diamond_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:21>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 14 as short}, IngotItem: {id: "libvulpes:ore0", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:22>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "minecraft:emerald_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:23>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "minecraft:gold_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:24>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:25>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "minecraft:iron_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:26>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "minecraft:lapis_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:27>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 3 as short}}),
<rats:rat_nugget_ore:28>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 8 as short}}),
<rats:rat_nugget_ore:29>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:30>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 11 as short}, IngotItem: {id: "mekanism:oreblock", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:31>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:32>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "minecraft:redstone_ore", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:33>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 2 as short}}),
<rats:rat_nugget_ore:34>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:35>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 12 as short}, IngotItem: {id: "immersiveengineering:ore", Count: 2 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:36>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1 as byte, Damage: 13 as short}, IngotItem: {id: "bigreactors:oreyellorite", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:37>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:38>.withTag({OreItem: {id: "minecraft:gold_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:gold_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:39>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 135 as short}}),
<rats:rat_nugget_ore:40>.withTag({OreItem: {id: "minecraft:iron_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:iron_ingot", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:41>.withTag({OreItem: {id: "minecraft:lapis_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:dye", Count: 1 as byte, Damage: 4 as short}}),
<rats:rat_nugget_ore:42>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 131 as short}}),
<rats:rat_nugget_ore:43>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:44>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 7 as short}}),
<rats:rat_nugget_ore:45>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:46>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 136 as short}}),
<rats:rat_nugget_ore:47>.withTag({OreItem: {id: "netherendingores:ore_nether_modded_1", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "immersiveengineering:ore", Count: 2 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:64>.withTag({OreItem: {id: "minecraft:quartz_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:quartz", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:70>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 133 as short}}),
<rats:rat_nugget_ore:71>.withTag({OreItem: {id: "mekanism:oreblock", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "mekanism:ingot", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:72>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 2 as short}}),
<rats:rat_nugget_ore:73>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 134 as short}}),
<rats:rat_nugget_ore:74>.withTag({OreItem: {id: "twilightforest:ironwood_raw", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "twilightforest:ironwood_ingot", Count: 2 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:75>.withTag({OreItem: {id: "minecraft:redstone_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:redstone", Count: 1 as byte, Damage: 0 as short}}),
<rats:rat_nugget_ore:76>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:77>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 6 as short}}),
<rats:rat_nugget_ore:78>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 130 as short}}),
<rats:rat_nugget_ore:79>.withTag({OreItem: {id: "astralsorcery:blockcustomore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 1 as byte, Damage: 1 as short}}),
<rats:rat_nugget_ore:80>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 4 as short}}),
<rats:rat_nugget_ore:81>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 3 as short}}),
<rats:rat_nugget_ore:82>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 129 as short}}),
<rats:rat_nugget_ore:83>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 3 as short}}),
<rats:rat_nugget_ore:84>.withTag({OreItem: {id: "immersiveengineering:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "immersiveengineering:metal", Count: 1 as byte, Damage: 5 as short}}),
<rats:rat_nugget_ore:85>.withTag({OreItem: {id: "bigreactors:oreyellorite", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "bigreactors:ingotyellorium", Count: 1 as byte, Damage: 0 as short}})
] as IItemStack[];


static jaopcaAllOre as OreEntry[]= mods.jaopca.JAOPCA.getAllOres() as OreEntry[];
static matTypes as string[] = ["ingot", "gem", "dust"] as string[];



function jaopcaGetEntry(item as IItemStack) as OreEntry{
	for testJ in jaopcaAllOre {
    for iType in matTypes {
      var getByType = testJ.getOreDictEntry(iType).firstItem;

      if (!isNull(getByType) && ((getByType has item)||(item has getByType))) {
        return testJ;
      }
    }
  }
	return null;
}

for poop in listRatPoop{
  if (!isNull(poop.tag.OreItem) && !isNull(poop.tag.IngotItem)){
    # Get what ore generates this poop
    var pooOre = itemUtils.getItem(
      poop.tag.OreItem.id.asString(),
      poop.tag.OreItem.Damage.asString() as int);
      
    # Get what resource we got after processing
    var pooResult = itemUtils.getItem(
      poop.tag.IngotItem.id.asString(),
      poop.tag.IngotItem.Damage.asString() as int);

    if(!isNull(pooResult)) {
      # Dust output
      var poopEntry   = jaopcaGetEntry(pooResult);
      
      if(!isNull(poopEntry)) { # Check if listed item exist (can happen if mod was removed)

        // scripts.process.beneficate(poop, poopEntry, "No Exceptions");

        var poopOreName = poopEntry.oreName.toLowerCase();
        var poopIngot   = poopEntry.getItemStack("ingot");
        var poopDust    = poopEntry.getItemStack("dust");
        var poopGem     = poopEntry.getItemStack("gem");

        var poopGemOrDust = (!isNull(poopGem)) ? poopGem : poopDust;
        var poopIngotOrGemOrDust = (!isNull(poopIngot)) ? poopIngot : poopGemOrDust;

        # ########################
        # Process IC2
        # ########################
        var poopCrushed = poopEntry.getItemStack("crushed");
        if(!isNull(poopCrushed)){
          # mods.ic2.Macerator.addRecipe(IItemStack output, IIngredient input);
          mods.ic2.Macerator.addRecipe(poopCrushed*3, poop*2);
        }

        # ########################
        # Process Mekanism
        # ########################
        # Oh no! Mekanism machines can't work with NBT tags for inputs!

        # ########################
        # Process Everything
        # ########################
        if(!isNull(poopIngotOrGemOrDust)){
          # mods.astralsorcery.StarlightInfusion.addInfusion(IItemStack input, IItemStack output, boolean consumeMultiple, float consumptionChance, int craftingTickTime);
          mods.astralsorcery.StarlightInfusion.addInfusion(poop, poopIngotOrGemOrDust*2, false, 0.7, 200);
        }
        
        # ########################
        # Process Gems and Dusts
        # ########################
        if(!isNull(poopGemOrDust)){
          mods.integrateddynamics.Squeezer.addRecipe(poop, 
            poopGemOrDust, 1.0f,
            poopGemOrDust, 0.25f,
            <liquid:dirt> * 100);

          mods.integrateddynamics.MechanicalSqueezer.addRecipe(poop,
            poopGemOrDust, 1.0f,
            poopGemOrDust, 0.5f,
            <liquid:dirt> * 100);

          # mods.thermalexpansion.Pulverizer.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
          // mods.thermalexpansion.Pulverizer.addRecipe(poopGemOrDust*3, poop*2, 4000, <industrialforegoing:fertilizer>, 25);

          # mods.extrautils2.Crusher.add(IItemStack output, IItemStack input, @Optional IItemStack secondaryOutput, @Optional float secondaryChance);
          mods.extrautils2.Crusher.add(poopGemOrDust*3, poop*2, <industrialforegoing:fertilizer>, 0.25f);

          # mods.immersiveengineering.Crusher.addRecipe(IItemStack output, IIngredient input, int energy, @Optional IItemStack secondaryOutput, @Optional double secondaryChance);
          mods.immersiveengineering.Crusher.addRecipe(poopGemOrDust*3, poop*2, 2048, <industrialforegoing:fertilizer>, 0.50);

          # mods.enderio.SagMill.addRecipe(IItemStack[] output, float[] chances, IIngredient input, @Optional String bonusType, @Optional int energyCost, @Optional float[] xp);
          mods.enderio.SagMill.addRecipe([poopGemOrDust, poopGemOrDust] as IItemStack[], [1.0, 0.5] as float[], poop);
        }


        # ########################
        # Process Dust
        # ########################
        if(!isNull(poopDust)){
          # mods.astralsorcery.Grindstone.addRecipe(IItemStack input, IItemStack output, float doubleChance);
          mods.astralsorcery.Grindstone.addRecipe(poop, poopDust, 0.75f);

          # Grinder.addRecipe(IItemStack output, IItemStack input, int turns, @Optional IItemStack secondary1Output, @Optional float secondary1Chance, @Optional IItemStack secondary2Output, @Optional float secondary2Chance);
          mods.appliedenergistics2.Grinder.addRecipe(poopDust, poop, 2, poopDust, 0.5);
        }


        # ########################
        # Process Ingots
        # ########################
        if(!isNull(poopIngot)){
          # Induction Smelter
          # mods.thermalexpansion.InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
          // mods.thermalexpansion.InductionSmelter.addRecipe(poopIngot*3, poop*2, <thermalfoundation:material:865>, 4000, <thermalfoundation:material:864>, 75);
          // mods.thermalexpansion.InductionSmelter.addRecipe(poopIngot*2, poop,   <thermalfoundation:material:866>, 4000, <thermalfoundation:material:865>, 50);

          # mods.immersiveengineering.ArcFurnace.addRecipe(IItemStack output, IIngredient input, IItemStack slag, int time, int energyPerTick, @Optional IIngredient[] additives, @Optional String specialRecipeType);
          mods.immersiveengineering.ArcFurnace.addRecipe(poopIngot*3, poop*2, <immersiveengineering:material:7>, 1000, 2048);
        }
        
        
        # ########################
        # Process Melting
        # ########################
        var poopMolten as ILiquidStack = poopEntry.getLiquidStack("molten");
        var altLiquid as ILiquidStack = itemUtils.getItem("liquid:" ~ poopEntry.oreName.toLowerCase());

        poopMolten = isNull(poopMolten) ? altLiquid : poopMolten;
        if(!isNull(poopMolten)){
          mods.tconstruct.Melting.addRecipe(poopMolten * (144 * 1.5), poop);	

          # mods.thermalexpansion.Crucible.addRecipe(ILiquidStack output, IItemStack input, int energy);
          // mods.thermalexpansion.Crucible.addRecipe(poopMolten * 144 * 2, poop, 8000);
        }
      }
    }
	}
}