#modloaded psi

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# *======= Recipes =======*
	
# [Spell Inscriber] from [Psidust][+1]
craft.remake(<psi:programmer>, ["pretty",
  "▬ ▲ ▬",
  "▬   ▬",
  "▬   ▬"], {
  "▲": <ore:dustPsi>,     # Psidust
  "▬": <ore:ingotCarbon>, # Carbon Brick
});

# [Rod Constructor] from [Electronics Assembler][+2]
craft.remake(<psi:cad_assembler>, ["pretty",
  "▬ ▬ ▬",
  "▬ : ▬",
  "-   -"], {
  ":": <ore:oc:assembler>,   # Electronics Assembler
  "▬": <ore:ingotCarbon>,    # Carbon Brick
  "-": <ore:ingotManasteel>, # Manasteel Ingot
});

# [Ivory Substance] from [Nether Quartz][+1]
scripts.process.alloy([
  <gendustry:honey_drop:15>, # Selfish Honey Drop
  <ore:gemQuartz>, # Nether Quartz
], <psi:material:6>, 'Only: Kiln');

# [Ebony Substance] from [Coal][+1]
scripts.process.alloy([
  <gendustry:honey_drop:15>, # Selfish Honey Drop
  <ore:coal>, # Coal
], <psi:material:5>, 'Only: Kiln');

# --------------------------------------------------
# Remake All CADs
val cads = {
	<psi:cad_assembly:0> : [<ore:ingotFakeIron> , <ore:listAllsugar>],
	<psi:cad_assembly:1> : [<ore:ingotGold>     , <ore:dirtyGemGold>],
	<psi:cad_assembly:2> : [<ore:ingotPsi>      , <ore:dirtyGemPlatinum>],
	<psi:cad_assembly:3> : [<ore:ingotEbonyPsi> , <ore:dirtyGemDimensionalShard>],
	<psi:cad_assembly:4> : [<ore:ingotIvoryPsi> , <ore:dirtyGemDimensionalShard>],
} as IIngredient[][IItemStack];

for out, inps in cads {
	craft.remake(out, ["pretty",
		"▬ ▬ A",
		"    ▬"], {
		"▬": inps[0],
		"A": inps[1],
	});
}
# --------------------------------------------------


# [Creative Rod Frame] from [Benitoite][+9]
craft.remake(<psi:cad_assembly:5>, ["pretty",
  "  п □            ",
  "D S п □ □        ",
  "  D S * □ □      ",
  "    D S * □ D    ",
  "      D S ◘ ▲ D  ",
  "        ◊ ■ ◘ F D",
  "      D ■ ■ ■ F  ",
  "      ■ ■ ■ D    ",
  "      D ■ D      "], {
  "S": utils.tryCatch("psicosts:creative_cell", <psi:cad_assembly:4>), # Star of PSI
  "F": utils.tryCatch("psicosts:flux_resonator", <enderio:item_basic_capacitor:2>), # Flux Resonator
  "◘": utils.tryCatch("psicosts:psi_cell", 3, <cyclicmagic:soulstone>), # PSI-Force Cell
  "■": <psi:psi_decorative:7>,                    # Ebony Psimetal Block
  "□": <psi:psi_decorative:6>,                    # Bright Psimetal Flow Plate
  "▲": <ore:dustAlchAmethyst>,                    # Amethyst Alchemical Ore Dust
  "D": <draconicevolution:infused_obsidian>,      # Draconium Infused Obsidian
  "*": <extendedcrafting:singularity_custom:107>, # Flux Crystal Singularity
  "◊": <ore:gemBenitoite>,                        # Benitoite
  "п": <psi:psi_decorative:4>,                    # Dark Psimetal Flow Plate
});