
remake("buildinggadgets destructiontool", <buildinggadgets:destructiontool>, [
	[null, <actuallyadditions:item_crystal_empowered:3>, null],
	[<ore:plateSignalum>, <opencomputers:misc>, <ore:plateSignalum>], 
	[null, <capabilityproxy:ranged_capability_proxy>, null]]);

remake("buildinggadgets copypastetool", <buildinggadgets:copypastetool>, 	   [
	[null, <actuallyadditions:item_crystal_empowered:4>, null],
	[<ore:plateEnderium>, <opencomputers:misc>, <ore:plateEnderium>], 
	[null, <capabilityproxy:ranged_capability_proxy>, null]]);

remake("buildinggadgets exchangertool", <buildinggadgets:exchangertool>,     [
	[null, <actuallyadditions:item_crystal_empowered:2>, null],
	[<ore:plateLumium>, <opencomputers:misc>, <ore:plateLumium>], 
	[null, <capabilityproxy:ranged_capability_proxy>, null]]);

remake("buildinggadgets buildingtool", <buildinggadgets:buildingtool>,       [
	[null, <actuallyadditions:item_crystal_empowered:5>, null],
	[<ore:platePlatinum>, <opencomputers:misc>, <ore:platePlatinum>], 
	[null, <capabilityproxy:ranged_capability_proxy>, null]]);

# [Creative Paste Container] from [Mana Dust][+4]
craft.remake(<buildinggadgets:constructionpastecontainercreative>, ["pretty",
  "  L ▲ L",
  "  ▬ P ▬",
  "  ▬ P ▬",
  "  ▬ P ▬",
  "  C C C"], {
  "P": <buildinggadgets:constructionpastecontainert3>.withTag({amount: 8192}), # Paste Container T3
  "▲": <ore:dustMana>,                      # Mana Dust
  "C": <integratedterminals:chorus_glass>,  # Chorus Glass
  "▬": <ore:ingotDraconium>,                # Draconium Ingot
  "L": <integrateddynamics:logic_director>, # Logic Director
});
