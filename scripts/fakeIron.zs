import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

val N = <ore:nuggetFakeIron>;
val I = <ore:ingotFakeIron>;
val B = <ore:blockFakeIron>;

function remakeShaped(name as string, output as IItemStack, grid as IIngredient[][]) {
  recipes.removeByRecipeName(name);
  recipes.addShaped(name.replaceAll(':', '_'), output, grid);
}

function remakeShapeless(name as string, output as IItemStack, grid as IIngredient[]) {
  recipes.removeByRecipeName(name);
  recipes.addShapeless(name.replaceAll(':', '_'), output, grid);
}

# Start of automatically generated recipes:
remakeShaped("cyclicmagic:item.ender_eye_orb_1", <cyclicmagic:ender_eye_orb>, [[<minecraft:ender_eye>, <minecraft:ender_eye>, <minecraft:ender_eye>], [<minecraft:ender_eye>, B, <minecraft:ender_eye>], [<minecraft:ender_eye>, <minecraft:ender_eye>, <minecraft:ender_eye>]]);
remakeShaped("cyclicmagic:tile.dehydrator_1", <cyclicmagic:dehydrator>, [[<ore:dustRedstone>, null, <ore:dustRedstone>], [<minecraft:clay:*>, B, <minecraft:clay:*>], [<ore:logWood>, <ore:logWood>, <ore:logWood>]]);
remakeShaped("cyclicmagic:tile.fluid_drain_1", <cyclicmagic:fluid_drain>, [[<minecraft:piston:*>, <minecraft:dropper:*>, <minecraft:piston:*>], [<minecraft:gunpowder:*>, B, <minecraft:gunpowder:*>], [<minecraft:hardened_clay:*>, <minecraft:hardened_clay:*>, <minecraft:hardened_clay:*>]]);
remakeShaped("draconicevolution:crafting_injector", <draconicevolution:crafting_injector>, [[<ore:gemDiamond>, <draconicevolution:draconic_core:*>, <ore:gemDiamond>], [<ore:stone>, B, <ore:stone>], [<ore:stone>, <ore:stone>, <ore:stone>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_cont_1", <environmentaltech:lightning_cont_1>, [[<environmentaltech:interconnect>, <environmentaltech:lightning_rod_insulated>, <environmentaltech:interconnect>], [<ore:blockLitherite>, <environmentaltech:lightning_rod_insulated>, <ore:blockLitherite>], [<ore:blockLitherite>, B, <ore:blockLitherite>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_cont_2", <environmentaltech:lightning_cont_2>, [[B, <environmentaltech:lightning_rod_insulated>, B], [<ore:blockErodium>, <environmentaltech:lightning_cont_1>, <ore:blockErodium>], [<ore:blockErodium>, B, <ore:blockErodium>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_cont_3", <environmentaltech:lightning_cont_3>, [[B, <environmentaltech:lightning_rod_insulated>, B], [<ore:blockKyronite>, <environmentaltech:lightning_cont_2>, <ore:blockKyronite>], [<ore:blockKyronite>, B, <ore:blockKyronite>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_cont_4", <environmentaltech:lightning_cont_4>, [[B, <environmentaltech:lightning_rod_insulated>, B], [<ore:blockPladium>, <environmentaltech:lightning_cont_3>, <ore:blockPladium>], [<ore:blockPladium>, B, <ore:blockPladium>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_cont_5", <environmentaltech:lightning_cont_5>, [[B, <environmentaltech:lightning_rod_insulated>, B], [<ore:blockIonite>, <environmentaltech:lightning_cont_4>, <ore:blockIonite>], [<ore:blockIonite>, B, <ore:blockIonite>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_cont_6", <environmentaltech:lightning_cont_6>, [[B, <environmentaltech:lightning_rod_insulated>, B], [<ore:blockAethium>, <environmentaltech:lightning_cont_5>, <ore:blockAethium>], [<ore:blockAethium>, B, <ore:blockAethium>]]);
remakeShaped("environmentaltech:m_multiblocks/m_lightning/lightning_rod", <environmentaltech:lightning_rod> * 3, [[null, B, null], [null, B, null], [null, B, null]]);
remakeShaped("excompressum:auto_compressor", <excompressum:auto_compressor>, [[<ore:workbench>, I, <ore:workbench>], [I, B, I], [<ore:workbench>, I, <ore:workbench>]]);
remakeShaped("excompressum:auto_sieve", <excompressum:auto_sieve>, [[B, <ore:paneGlassColorless>, B], [<ore:paneGlassColorless>, <exnihilocreatio:block_sieve:*>, <ore:paneGlassColorless>], [I, <ore:paneGlassColorless>, I]]);
remakeShaped("extendedcrafting:table_basic", <extendedcrafting:table_basic>, [[<extendedcrafting:material:14>, <extendedcrafting:material:8>, <extendedcrafting:material:14>], [<minecraft:crafting_table>, B, <minecraft:crafting_table>], [<extendedcrafting:material:14>, <extendedcrafting:material:2>, <extendedcrafting:material:14>]]);
remakeShaped("extrautils2:opinium_0", <extrautils2:opinium>, [[null, <extrautils2:ingredients:4>, null], [<extrautils2:ingredients:4>, B, <extrautils2:ingredients:4>], [null, <extrautils2:ingredients:4>, null]]);
remakeShaped("extrautils2:opinium_1", <extrautils2:opinium:1>, [[null, <extrautils2:opinium>, null], [B, <minecraft:gold_block>, B], [null, <extrautils2:opinium>, null]]);
remakeShaped("extrautils2:spike_iron", <extrautils2:spike_iron> * 4, [[null, <minecraft:iron_sword:*>, null], [<minecraft:iron_sword:*>, I, <minecraft:iron_sword:*>], [I, B, I]]);
remakeShaped("immersiveengineering:tool/drillhead_iron", <immersiveengineering:drillhead:1>, [[I, I, null], [B, B, I], [I, I, null]]);
remakeShaped("integrateddynamics:squeezer", <integrateddynamics:squeezer>, [[<ore:stickWood>, B, <ore:stickWood>], [<ore:stickWood>, null, <ore:stickWood>], [<ore:plankWood>, I, <ore:plankWood>]]);
remakeShaped("minecraft:anvil", <minecraft:anvil>, [[B, B, B], [null, I, null], [I, I, I]]);
remakeShaped("rustic:condenser_advanced", <rustic:condenser_advanced>, [[null, <minecraft:netherbrick>, null], [<minecraft:netherbrick>, <minecraft:bucket>, <minecraft:netherbrick>], [<minecraft:netherbrick>, B, <minecraft:netherbrick>]]);
remakeShaped("valkyrielib:modifier_component", <valkyrielib:modifier_component> * 4, [[<minecraft:concrete_powder:15>, <ore:dustRedstone>, <minecraft:concrete_powder:15>], [<ore:dustRedstone>, B, <ore:dustRedstone>], [<minecraft:concrete_powder:15>, <ore:dustRedstone>, <minecraft:concrete_powder:15>]]);
# End of automatically generated recipes


# Manual recipes
mods.mekanism.infuser.removeRecipe(<mekanism:enrichedalloy>);
mods.mekanism.infuser.addRecipe("REDSTONE", 10, <ore:ingotFakeIron>, <mekanism:enrichedalloy>);