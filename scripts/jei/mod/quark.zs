#priority 950
#modloaded quark

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:beacon_effects>;
x.addJEICatalyst(<minecraft:beacon>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[0,0], [0,1]], [[2,0],[3,0]]);

val glyphs = {
  '1': <openblocks:glyph:49>,
  '2': <openblocks:glyph:50>,
  '3': <openblocks:glyph:51>,
  '4': <openblocks:glyph:52>,
} as IItemStack[string];

/*Inject_js(
config('config/quark.cfg')
.misc['extra potions']['Beacon Replacements'].map((l) => l.split(','))
.sort(([,,a1,a2],[,,b1,b2])=>(+a1)-(+b1)||(+a2)-(+b2))
.map(
  ([id, meta, level, pos, potion]) => {
    const item = id === 'immersiveengineering:conveyor'
      ? `<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"})`
      : `<${id}:${meta == -1 ? '*' : meta}>`
    return `addRecipe(x, {[${item.padStart(40)}, glyphs['${
      Number(level) + 1
    }']] : [${pos==1?'null, ':''}<minecraft:potion>.withTag({Potion: "${potion.replace('minecraft:health_boost','potioncore:health_boost')}"})]});`
}))*/
addRecipe(x, {[   <draconicevolution:draconium_block:0>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"})]});
addRecipe(x, {[            <minecraft:redstone_block:*>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:extension"})]});
addRecipe(x, {[        <twilightforest:block_storage:0>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:solid_core"})]});
addRecipe(x, {[              <thaumcraft:metal_brass:*>, glyphs['1']] : [null, <minecraft:potion>.withTag({Potion: "minecraft:absorption"})]});
addRecipe(x, {[  <endreborn:block_decorative_lormyte:*>, glyphs['1']] : [null, <minecraft:potion>.withTag({Potion: "potioncore:step_up"})]});
addRecipe(x, {[          <tconstruct:slime_congealed:0>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "potioncore:recoil"})]});
addRecipe(x, {[              <thaumcraft:amber_block:*>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "potioncore:health_boost"})]});
addRecipe(x, {[        <scalingfeast:exhaustingblock:*>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "scalingfeast:hungerplus"})]});
addRecipe(x, {[    <twilightforest:knightmetal_block:*>, glyphs['2']] : [null, <minecraft:potion>.withTag({Potion: "potioncore:repair"})]});
addRecipe(x, {[           <twilightforest:huge_stalk:*>, glyphs['2']] : [null, <minecraft:potion>.withTag({Potion: "cyclicmagic:slowfall"})]});
addRecipe(x, {[        <twilightforest:block_storage:4>, glyphs['3']] : [<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"})]});
addRecipe(x, {[          <endreborn:block_wolframium:*>, glyphs['3']] : [<minecraft:potion>.withTag({Potion: "potioncore:archery"})]});
addRecipe(x, {[<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"}), glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:climb"})]});
addRecipe(x, {[              <plustic:osgloglasblock:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "cyclicmagic:potion.magnet"})]});
addRecipe(x, {[  <contenttweaker:conglomerate_of_sun:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:flight"})]});
addRecipe(x, {[ <contenttweaker:conglomerate_of_life:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:revival"})]});
addRecipe(x, {[ <contenttweaker:conglomerate_of_coal:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:reach"})]});
/**/
