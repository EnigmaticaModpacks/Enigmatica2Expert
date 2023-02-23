#modloaded modularcontroller

import crafttweaker.item.IIngredient;

val modIngrs = {
  advanced_thermionic_fabricator: [<appliedenergistics2:molecular_assembler>                , <forestry:hardened_machine>],
  starlight_crafting_engine     : [<astralsorcery:itemshiftingstar>                         , <astralsorcery:itemcraftingcomponent:4>],
  advanced_carpenter            : [<thermaldynamics:duct_16:6> | <thermaldynamics:duct_16:7>, <forestry:carpenter>],
  advanced_scrap_factory        : [Bucket("ic2pahoehoe_lava")                               , <ore:gearVibrant>],
  hydroponics                   : [<appliedenergistics2:quartz_growth_accelerator>          , <actuallyadditions:block_greenhouse_glass>],
} as IIngredient[][string];

for name, ingrs in modIngrs {
  val controller = itemUtils.getItem("modularcontroller:"~name~"_controller");
  if(isNull(controller)) continue;

  // Oredict for other recipes
  <ore:controllerModular>.add(controller);

  # [Machine Controller] from [Machine Frame][+5]
  craft.make(controller, ["pretty",
    "⌂ M ⌂",
    "▬ ◙ ▬",
    "C I C"], {
    "M": ingrs[0],
    "⌂": ingrs[1],
    "▬": <ore:ingotModularium>,            # Modularium Alloy
    "◙": <rftools:machine_frame>,          # Machine Frame
    "C": <advancedrocketry:ic:3>,          # Control Circuit Board
    "I": <advancedrocketry:ic:4>,          # Item IO Circuit Board
  });
}

# [Machine Projector] from [Silicon Plate][+1]
craft.make(<modularcontroller:machine_projector>, ["pretty",
  "    □",
  "  /  ",
  "/    "], {
  "□": <ore:plateSilicon>,                # Silicon Plate
  "/": <ore:rodStone> | <ore:stickStone>, # Stone Rod
});
