import crafttweaker.item.IItemStack;

#modloaded industrialwires

# Remake all relays to x8 (from x4)

val wireIngrs = {
  "-": <ore:ingotTin>,                            # Tin Ingot
  "R": <ore:itemRubber>,                          # Plastic
  "‗": <ore:ingotCopper>,                         # Copper Ingot
  "_": <ore:ingotGold>,                           # Gold Ingot
  "▬": <ore:ingotFakeIron>,                       # Iron Ingot
  "I": <immersiveengineering:stone_decoration:8>, # Insulating Glass
  "n": <ore:itemInsulatedGlassCable>,             # Glass Fibre Cable
  "⌃": <appliedenergistics2:material:10>,         # Pure Certus Quartz Crystal
  "■": <mekanism:plasticblock:*>,                 # Plastic Block
} as crafttweaker.item.IIngredient[string];

# [Tin Wire Relay] from [Tin Ingot][+1]
craft.remake(<industrialwires:ic2_connector:1> * 8, [" - ", "R-R"], wireIngrs);

# [Copper Wire Relay] from [Copper Ingot][+1]
craft.remake(<industrialwires:ic2_connector:3> * 8, [" ‗ ", "R‗R"], wireIngrs);

# [Gold Wire Relay] from [Gold Ingot][+1]
craft.remake(<industrialwires:ic2_connector:5> * 8, [" _ ", "R_R"], wireIngrs);

# [Universal HV Wire Relay] from [Iron Ingot][+1]
craft.remake(<industrialwires:ic2_connector:7> * 8, ["pretty",
  "  ▬  ",
  "I ▬ I",
  "I ▬ I"], wireIngrs
);

# Harder to make "switch" connections a challenge
# [Glass Fiber Wire Relay] from [Pure Certus Quartz Crystal]*2[+3]
craft.remake(<industrialwires:ic2_connector:9> * 8, ["pretty",
  "  n  ",
  "I ⌃ I",
  "I ■ I"], wireIngrs
);

# JEI visible recipes
val cables = {
  <industrialwires:ic2_wire_coil>   : <ic2:cable:4>.withTag({type: 4 as byte, insulation: 0 as byte}), # Tin Cable
  <industrialwires:ic2_wire_coil:1> : <ic2:cable>  .withTag({type: 0 as byte, insulation: 0 as byte}), # Copper Cable
  <industrialwires:ic2_wire_coil:2> : <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), # Gold Cable
  <industrialwires:ic2_wire_coil:3> : <ic2:cable:3>.withTag({type: 3 as byte, insulation: 0 as byte}), # HV Cable
  <industrialwires:ic2_wire_coil:4> : <ic2:cable:1>.withTag({type: 1 as byte, insulation: 0 as byte}), # Glass Fibre Cable
  <industrialwires:ic2_wire_coil:5> : <ic2:cable:4>.withTag({type: 4 as byte, insulation: 1 as byte}), # Insulated Tin Cable
  <industrialwires:ic2_wire_coil:6> : <ic2:cable>  .withTag({type: 0 as byte, insulation: 1 as byte}), # Insulated Copper Cable
  <industrialwires:ic2_wire_coil:7> : <ic2:cable:2>.withTag({type: 2 as byte, insulation: 2 as byte}), # 2x Ins. Gold Cable
} as IItemStack[IItemStack];

for wire, c in cables {
  recipes.addShapeless('cable to wire #' ~ wire.damage, wire.withTag({wireLength: 9}), [c,c,c,c,c,c,c,c,c]);
  recipes.addShapeless('wire recycle #' ~ wire.damage, c * 9, [
    wire.withTag({wireLength: 9}, false).marked('marked'),
    <immersiveengineering:tool:1>, // Cutters
  ],
    function(out, ins, cInfo) {
      if(isNull(ins.marked) || isNull(ins.marked.tag) || isNull(ins.marked.tag.wireLength)) return null;
      return out * max(1, min(64, ins.marked.tag.wireLength.asInt()));
  }, null);
}
