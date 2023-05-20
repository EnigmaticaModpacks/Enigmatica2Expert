#priority 950
#modloaded quark
#ignoreBracketErrors

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


function add(chunk as IItemStack[][IIngredient[]]) as void {
  for inputs, outputs in chunk {
    if (inputs.length < 1 || isNull(inputs[0])) return;
  }
  addRecipe(<assembly:beacon_effects>, chunk);
}

/*Inject_js(
config('config/quark.cfg')
.misc['extra potions']['Beacon Replacements'].map((l) => l.split(','))
.sort(([,,a1,a2],[,,b1,b2])=>(+a1)-(+b1)||(+a2)-(+b2))
.map(
  ([id, meta, level, pos, potion]) => {
    const item = id === 'immersiveengineering:conveyor'
      ? `<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"})`
      : `<${id}:${meta == -1 ? '*' : meta}>`
    return `add({[${item.padStart(40)}, glyphs['${
      Number(level) + 1
    }']] : [${pos==1?'null, ':''}<minecraft:potion>.withTag({Potion: "${potion.replace('minecraft:health_boost','potioncore:health_boost')}"})]});`
}))*/
add({[   <draconicevolution:draconium_block:0>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"})]});
add({[        <twilightforest:block_storage:0>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:solid_core"})]});
add({[              <thaumcraft:metal_brass:*>, glyphs['1']] : [null, <minecraft:potion>.withTag({Potion: "minecraft:absorption"})]});
add({[  <endreborn:block_decorative_lormyte:*>, glyphs['1']] : [null, <minecraft:potion>.withTag({Potion: "potioncore:step_up"})]});
add({[          <tconstruct:slime_congealed:0>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "potioncore:recoil"})]});
add({[              <thaumcraft:amber_block:*>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "potioncore:health_boost"})]});
add({[    <twilightforest:knightmetal_block:*>, glyphs['2']] : [null, <minecraft:potion>.withTag({Potion: "potioncore:repair"})]});
add({[           <twilightforest:huge_stalk:*>, glyphs['2']] : [null, <minecraft:potion>.withTag({Potion: "cyclicmagic:slowfall"})]});
add({[        <twilightforest:block_storage:4>, glyphs['3']] : [<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"})]});
add({[          <endreborn:block_wolframium:*>, glyphs['3']] : [<minecraft:potion>.withTag({Potion: "potioncore:archery"})]});
add({[<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"}), glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:climb"})]});
add({[              <plustic:osgloglasblock:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "cyclicmagic:potion.magnet"})]});
add({[  <contenttweaker:conglomerate_of_sun:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:flight"})]});
add({[ <contenttweaker:conglomerate_of_life:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:revival"})]});
add({[ <contenttweaker:conglomerate_of_coal:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:reach"})]});
/**/
