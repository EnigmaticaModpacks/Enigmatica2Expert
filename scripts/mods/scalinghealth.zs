#modloaded scalinghealth

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# Heart dust
val HD = <scalinghealth:heartdust>;
val HS = <scalinghealth:crystalshard>;
# [Heart Dust] from [Pestle and Mortar][+1]
craft.reshapeless(HD, 'A****', {
  "A": <ore:pestleAndMortar>,        # Pestle and Mortar
  "*": HS, # Heart Crystal Shard
});
scripts.process.crush(HS * 2, HD, "only: eu2Crusher AACrusher", [HD], [0.2f]);
scripts.process.crush(HS    , HD, "only: SagMill Pulverizer", [HD, HD, HD], [0.8f, 0.4f, 0.2f]);

// ---------------------------
function morb(mobId as string) as IItemStack {
  return <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: mobId});
}

for id, ingr in {
  "emberroot:enderminy" : <ore:enderpearl>, # Ender Pearl
  "emberroot:knight_fallen" : <tconstruct:sword_blade>.withTag({Material: "iron"}), # Iron Sword Blade
  "emberroot:hero" : <minecraft:armor_stand>,      # Armor Stand
  "emberroot:rainbow_golem" : <ore:blockSheetmetalIron>,    # Iron Sheetmetal
  "emberroot:withercat" : <ore:dustWither>,             # Wither Dust
  "quark:crab" : <ore:foodCrabraw>,            # Raw Crab
} as IIngredient[string] {
  craft.make(morb(id), ["pretty",
    "☼ ☼ ☼",
    "  □  ",
    "☼ ☼ ☼"], {
    "□": ingr,
    "☼": <scalinghealth:crystalshard>, # Heart Crystal Shard
  });
}