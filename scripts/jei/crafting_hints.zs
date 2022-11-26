#priority 975
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:crafting_hints>;
x.addJEICatalyst(<minecraft:item_frame>);
scripts.jei.requious.arrow(x, 4, 1);
scripts.jei.requious.addInsOuts(x, [
        [4,0],
  [0,0],[1,0],[2,0],
  [0,1],[1,1],[2,1],
  [0,2],[1,2],[2,2],
], [
  [6,1],[7,1],[8,1],
]);
x.setJEIItemSlot(4, 0, 'input0', scripts.jei.requious.getVisSlots(0,2));
x.setJEIFluidSlot(1, 3, 'fluid_in');
x.setJEIFluidSlot(7, 2, 'fluid_out');

function add1to1(input as IIngredient, output as IItemStack, catalyst as IIngredient = null) as void {
  scripts.jei.requious.add(<assembly:crafting_hints>, {
    [catalyst, null, null, null, null, input] : [null, output]
  });
}

function addInsOutCatl(input as IIngredient[], output as IItemStack, catalyst as IIngredient = null) as void {
  scripts.jei.requious.add(<assembly:crafting_hints>, {
    [catalyst, 
    input.length > 7 ? input[7] : null,
    input.length > 3 ? input[3] : null,
    input.length > 5 ? input[5] : null,
    input.length > 2 ? input[2] : null,
    input.length > 0 ? input[0] : null,
    input.length > 1 ? input[1] : null,
    input.length > 8 ? input[8] : null,
    input.length > 4 ? input[4] : null,
    input.length > 6 ? input[6] : null,
    ] : [null, output]
  });
}

function fill(input as IIngredient, fluid as ILiquidStack, output as IItemStack, catalyst as IIngredient = null, duration as int = 0) as void {
  var rec = AssemblyRecipe.create(function(c) {c.addItemOutput('output1', output);})
    .requireFluid("fluid_in", fluid)
    .requireItem("input5", input);
  if(!isNull(catalyst)) rec = rec.requireItem("input0", catalyst);
  <assembly:crafting_hints>.addJEIRecipe(rec.requireDuration("duration", duration));
}

function special(output as IItemStack, input2d as IIngredient[][], condition as string) as void {
  val assRec = AssemblyRecipe.create(function(c) {
    c.addItemOutput("output1", output);
    c.addItemOutput("output2", 
      utils.tryCatch("engineersdecor:sign_caution", <minecraft:structure_void>)
      .withDisplayName("§e§lCondition").withLore(["§e" ~ condition]));
  });
  for y, input1d in input2d {
    for x, ingr in input1d {
      if(isNull(ingr)) continue;
      assRec.requireItem("input"~(y*3+x+1), ingr);
    }
  }
  assRec.requireItem("input0", <minecraft:crafting_table>);
  <assembly:crafting_hints>.addJEIRecipe(assRec);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------

add1to1(<thaumcraft:cluster:1>, <minecraft:gold_ingot> * 8, Soul('randomthings:goldenchicken'));
add1to1(Soul("minecraft:zombie") | Soul("minecraft:villager"), <bloodmagic:blood_shard>, <bloodmagic:bound_sword>.withTag({Unbreakable: 1 as byte, activated: 1 as byte}));

x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <liquid:canolaoil> * 80);})
  .requireItem("input0", <actuallyadditions:block_canola_press>)
  .requireItem("input5", <actuallyadditions:item_misc:13>)
);
x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <liquid:refinedcanolaoil> * 80);})
  .requireFluid("fluid_in", <liquid:canolaoil> * 80)
  .requireItem("input0", <actuallyadditions:block_fermenting_barrel>)
);
x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <liquid:blockfluidantimatter> * 1000);})
  .requireFluid("fluid_in", <liquid:lifeessence> * 1000)
  .requireItem("input0", <cyclicmagic:ender_lightning>)
);


# Myclium convert
addInsOutCatl([<exnihilocreatio:item_material:3>, <minecraft:dirt:*>], <minecraft:mycelium>);

# CC Printer
addInsOutCatl([<minecraft:paper>, <minecraft:dye:*>], <computercraft:printout>, <computercraft:peripheral:3>);

# OC 3d printer
addInsOutCatl([<opencomputers:material:28>, <ore:dye>], <opencomputers:print>, <opencomputers:printer>);

# OC Assembler
addInsOutCatl([<opencomputers:case1> | <opencomputers:case2> | <opencomputers:case3>], <opencomputers:robot>, <opencomputers:assembler>);
addInsOutCatl([<opencomputers:material:17> | <opencomputers:material:18>], <opencomputers:misc>, <opencomputers:assembler>);
addInsOutCatl([<opencomputers:material:23> | <opencomputers:material:24>], <opencomputers:misc:1>, <opencomputers:assembler>);

# XP Bottler
val xp_bottler = itemUtils.getItem("openblocks:xp_bottler");
if(!isNull(xp_bottler)) {
  for fluid in ["essence", "xpjuice", "experience",] as string[] {
    fill(<minecraft:glass_bottle>, game.getLiquid(fluid) * 160, <minecraft:experience_bottle>, xp_bottler, 20);
  }
}

# Fireflys and Cicadas
scripts.jei.requious.add(<assembly:crafting_hints>, {[null, null, null, null, null, <twilightforest:twilight_sapling:1>,] : [null, <twilightforest:firefly>]});
scripts.jei.requious.add(<assembly:crafting_hints>, {[null, null, null, null, null, <twilightforest:twilight_sapling:4>,] : [null, <twilightforest:firefly>, <twilightforest:cicada>]});

# Taint to Flux Goo
x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <fluid:flux_goo> * 1000);})
  .requireItem("input5", <thaumcraft:bottle_taint>)
);

# IC2 basalt
x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addItemOutput('output1', <ic2:resource>);})
  .requireFluid("fluid_in", <fluid:ic2pahoehoe_lava> * 1000)
);
