#priority 950
#modloaded netherportalspread

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:nether_portal_spread>;
x.addJEICatalyst(<minecraft:obsidian>);
x.setJEIDurationSlot(5,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[4,0],[3,0],[2,0],[1,0],[0,0]], [[6,0],[7,0],[8,0]]);

/*Inject_js{
const fluids = getCSV('config/tellme/fluids-csv.csv')

const toStack=([__, mod, id, amount], isWildcard)=>{
  const def = `${mod||'minecraft'}:${id}`
  const fluid = fluids.find(o=>o.Block === def)
  const count = parseInt(amount)>1?' * '+Math.min(64,amount):''
  return (fluid
    ? `Bucket("${fluid.Name}")`
    : `<${def + (isWildcard===true ? ':*' : '')}>`)
  + count
}

return loadText('config/netherportalspread/spreadsettings.txt')
.split('\n')
.filter(l=>l.match(/\S+/))
.map(l=>l.match(/(?:([^:\s]+):)?([^:\s]+); \[([^\]]+)\],/))
.map(m=>[
  toStack(m, true),
  [...m[3].matchAll(/(?:([^:\s]+):)?([^:\s]+)>(\d+)/g)].map(toStack).join(', '),
]).reduce((acc,[inp, out])=>{
  const arr = acc.find(o=>o[1]===out)?.[0]
  if(arr) arr.push(inp)
  else acc.push([[inp], out])
  return acc
}, [])
.map(([inps, out])=>`addRecipe(x, {[${inps.join(', ')}] : [${out}]});`)
.join('\n')
}*/
addRecipe(x, {[<minecraft:cobblestone:*>, <quark:slate:*>, <minecraft:stone_stairs:*>] : [<quark:biome_cobblestone>]});
addRecipe(x, {[<minecraft:stone:*>, <minecraft:dirt:*>, <minecraft:grass:*>, <minecraft:grass_path:*>, <minecraft:farmland:*>, <biomesoplenty:grass:*>, <biomesoplenty:dirt:*>] : [<minecraft:netherrack> * 64, <minecraft:quartz_ore> * 4, <netherendingores:block_nether_netherfish>]});
addRecipe(x, {[<minecraft:leaves:*>, <minecraft:leaves2:*>, <advancedrocketry:alienleaves:*>, <exnihilocreatio:block_infesting_leaves:*>, <exnihilocreatio:block_infested_leaves:*>, <extrautils2:ironwood_leaves:*>, <biomesoplenty:leaves_0:*>, <biomesoplenty:leaves_1:*>, <biomesoplenty:leaves_2:*>, <biomesoplenty:leaves_3:*>, <biomesoplenty:leaves_4:*>, <biomesoplenty:leaves_5:*>, <forestry:leaves.decorative.0:*>, <forestry:leaves.decorative.1:*>, <forestry:leaves.decorative.2:*>, <minecraft:gravel:*>, <minecraft:clay:*>, <rustic:leaves:*>] : [<biomesoplenty:ash_block>]});
addRecipe(x, {[<minecraft:gold_ore:*>, <minecraft:iron_ore:*>, <minecraft:lapis_ore:*>, <appliedenergistics2:quartz_ore:*>, <thaumcraft:ore_cinnabar:*>, <thaumcraft:ore_amber:*>] : [<netherendingores:ore_nether_modded_1>]});
addRecipe(x, {[<appliedenergistics2:charged_quartz_ore:*>, <minecraft:diamond_ore:*>, <minecraft:emerald_ore:*>] : [<tconstruct:ore>]});
addRecipe(x, {[<minecraft:redstone_ore:*>, <minecraft:coal_ore:*>, <thermalfoundation:ore:*>] : [<minecraft:quartz_ore>]});
addRecipe(x, {[<appliedenergistics2:sky_stone_block:*>] : [<minecraft:quartz_block>]});
addRecipe(x, {[<biomesoplenty:white_sand:*>] : [<quark:jasper>]});
addRecipe(x, {[<chisel:basalt2:*>] : [<tconstruct:seared>]});
addRecipe(x, {[<chisel:bricks:*>] : [<minecraft:red_nether_brick>]});
addRecipe(x, {[<chisel:limestone:*>, <minecraft:sandstone:*>] : [<mysticalagriculture:soulstone>]});
addRecipe(x, {[<chisel:marble2:*>, <astralsorcery:blockmarble:*>] : [<thaumictinkerer:black_quartz_block> * 10, <botania:quartztypedark>]});
addRecipe(x, {[<iceandfire:ash:*>] : [<chisel:block_coal_coke>]});
addRecipe(x, {[<minecraft:brick_block:*>] : [<minecraft:nether_brick>]});
addRecipe(x, {[<minecraft:diamond_block:*>] : [<minecraft:gold_block>]});
addRecipe(x, {[<minecraft:emerald_block:*>] : [<tconstruct:metal>]});
addRecipe(x, {[<minecraft:fence:*>] : [<minecraft:nether_brick_fence>]});
addRecipe(x, {[<minecraft:hardened_clay:*>] : [<tcomplement:scorched_block>]});
addRecipe(x, {[<minecraft:log:*>, <minecraft:log2:*>] : [<advancedrocketry:charcoallog>]});
addRecipe(x, {[<minecraft:melon_block:*>, <minecraft:hay_block:*>] : [<minecraft:nether_wart_block>]});
addRecipe(x, {[<minecraft:mossy_cobblestone:*>] : [<minecraft:magma>]});
addRecipe(x, {[<minecraft:mycelium:*>] : [<extrautils2:cursedearth>]});
addRecipe(x, {[<minecraft:planks:*>] : [<tconstruct:firewood>]});
addRecipe(x, {[<minecraft:prismarine:*>, <minecraft:piston:*>] : [<minecraft:glowstone>]});
addRecipe(x, {[<minecraft:redstone_block:*>] : [<quark:smoker>]});
addRecipe(x, {[<minecraft:ice:*>] : [<minecraft:obsidian>]});
addRecipe(x, {[<minecraft:sand:*>] : [<minecraft:soul_sand>]});
addRecipe(x, {[<minecraft:slime:*>] : [<minecraft:bone_block>]});
addRecipe(x, {[<minecraft:stonebrick:*>] : [<quark:magma_bricks>]});
addRecipe(x, {[<thaumcraft:stone_porous:*>] : [<additionalcompression:dustgunpowder_compressed>, <forestry:ash_block_1> * 5]});
addRecipe(x, {[<minecraft:yellow_flower:*>, <minecraft:red_flower:*>] : [<minecraft:fire>]});
addRecipe(x, {[<biomesoplenty:flower_0:*>, <biomesoplenty:flower_1:*>, <botania:flower:*>, <minecraft:snow_layer:*>] : [<biomesoplenty:blue_fire>]});
addRecipe(x, {[Bucket("water")] : [Bucket("blood")]});
addRecipe(x, {[<additionalcompression:meatfish_compressed:*>, <additionalcompression:meatchicken_compressed:*>, <additionalcompression:meatbeef_compressed:*>, <additionalcompression:meatporkchop_compressed:*>] : [<thaumcraft:flesh_block>]});
addRecipe(x, {[<minecraft:wool:*>] : [<quark:color_slime>]});
addRecipe(x, {[<minecraft:stone_slab:*>] : [<quark:fire_stone_slab>]});
addRecipe(x, {[<minecraft:wooden_slab:*>] : [<appliedenergistics2:sky_stone_slab>]});
addRecipe(x, {[<minecraft:glass_pane:*>] : [<chisel:glasspane1>]});
addRecipe(x, {[<minecraft:cobblestone_wall:*>] : [<mysticalagriculture:cobbled_soulstone_wall>]});
addRecipe(x, {[<minecraft:spruce_stairs:*>, <minecraft:oak_stairs:*>] : [<quark:basalt>]});
addRecipe(x, {[<rats:garbage_pile:*>] : [<tconstruct:soil>]});
addRecipe(x, {[<floralchemy:hedge:*>] : [<twilightforest:thorns>]});
addRecipe(x, {[<minecraft:wooden_door:*>] : [<minecraft:iron_bars>]});
addRecipe(x, {[<minecraft:glass:*>] : [<chisel:glassdyedred>]});
/**/
