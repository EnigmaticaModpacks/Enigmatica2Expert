#modloaded opencomputers

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

# Make robot easy to break and replace
<opencomputers:robot>.hardness = 0.5;
<opencomputers:cable>.hardness = 0.05;

# [Transistor]*8 from [Basalt][+3]
recipes.remove(<opencomputers:material:6>);
scripts.process.alloy([<ore:stoneBasalt>, <minecraft:redstone> * 5], <opencomputers:material:6> * 8, "except: arcFurnance AdvRockArc induction");
scripts.process.alloy([<chisel:basalt2:7>, <minecraft:redstone> * 5], <opencomputers:material:6> * 8, "only: induction");

# [Microchip (Tier 1)]*8 from [Iron Ingot][+1]
recipes.remove(<opencomputers:material:7>);
scripts.process.alloy([
  <opencomputers:material:6>, # Transistor
  <ore:ingotFakeIron>, # Iron Ingot
], <opencomputers:material:7> * 16, "except: arcFurnance AdvRockArc");

# [Microchip (Tier 2)]*4 from [Nickel Ingot][+1]
recipes.remove(<opencomputers:material:8>);
scripts.process.alloy([
  <opencomputers:material:6>, # Transistor
  <ore:ingotNickel>,           # Nickel Ingot
], <opencomputers:material:8> * 8, "except: arcFurnance AdvRockArc");

# [Microchip (Tier 3)]*2 from [Platinum Ingot][+1]
recipes.remove(<opencomputers:material:9>);
scripts.process.alloy([
  <opencomputers:material:6>, # Transistor
  <ore:ingotPlatinum>,         # Platinum Ingot
], <opencomputers:material:9> * 4, "except: arcFurnance AdvRockArc");

# [Inventory Upgrade] from [Mini Chest][+4]
craft.remake(<opencomputers:upgrade:17>, ["pretty",
  "B P B",
  ": M :",
  "B ♥ B"], {
  "B": <ore:stoneBasalt>, # Basalt
  "P": <bithop:pullhop>,        # PullHop
  ":": <ore:oc:circuitChip1>,   # Microchip (Tier 1)
  "M": <extrautils2:minichest>, # Mini Chest
  "♥": <ore:blockRedstone>,     # Block of Redstone
});

# [Inventory Controller Upgrade] from [Mini Chest][+4]
craft.remake(<opencomputers:upgrade:18>, ["pretty",
  "B I B",
  ": M :",
  "B ♥ B"], {
  "B": <ore:stoneBasalt>, # Basalt
  "I": <randomthings:inventoryrerouter>, # Inventory Rerouter
  ":": <ore:oc:circuitChip2>,            # Microchip (Tier 2)
  "M": <extrautils2:minichest>,          # Mini Chest
  "♥": <ore:blockRedstone>,              # Block of Redstone
});

# [Battery Upgrade (Tier 2)] from [Simple Machine Parts][+2]
craft.remake(<opencomputers:upgrade:2>, ["pretty",
  ": □ :",
  "□ S □",
  ": □ :"], {
  ":": <ore:oc:capacitor>,          # Capacitor
  "□": <ore:plateConstantan>,       # Constantan Plate
  "S": <ore:itemSimpleChassiParts>, # Simple Machine Parts
});

# [Battery Upgrade (Tier 3)] from [Machine Parts][+2]
craft.remake(<opencomputers:upgrade:3>, ["pretty",
  ": □ :",
  "□ C □",
  ": □ :"], {
  ":": <ore:oc:capacitor>,    # Capacitor
  "□": <ore:platePlatinum>,
  "C": <ore:itemChassiParts>, # Machine Parts
});

# [Geolyzer] from [Microchip (Tier 2)][+2]
craft.remake(<opencomputers:geolyzer>, ["pretty",
  "B : B",
  "B c B",
  "B : B"], {
  "B": <ore:stoneBasalt>, # Basalt
  ":": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
  "c": <ore:oc:circuitChip2>,                # Microchip (Tier 2)
});

# [Tractor Beam Upgrade] from [Sticky Piston][+2]
craft.remake(<opencomputers:upgrade:25>, [
  "I",
  "P",
  ":"], {
  "I": <cyclicmagic:magnet_block>,           # Item Magnet
  "P": <ore:craftingPiston>,                 # Sticky Piston
  ":": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
});

# [Chamelium]*8 from [Latex Bucket][+2]
recipes.removeByRecipeName("opencomputers:material54");
craft.make(<opencomputers:material:28> * 8, ["pretty",
  "▲ P ▲",
  "P ~ P",
  "▲ P ▲"], {
  "▲": <ore:dust>,          # Dust
  "P": <biomesoplenty:ash>, # Pile of Ashes
  "~": <fluid:latex> * 1000, # Latex Bucket
});

# [Angel Upgrade] from [Angel Block][+1]
craft.remake(<opencomputers:upgrade>, [
  ":■:"], {
  ":": <ore:oc:circuitChip1>,    # Microchip (Tier 1)
  "■": <extrautils2:angelblock>, # Angel Block
});

# [Computer Case (Tier 1)] from [Cabinet][+4]
craft.remake(<opencomputers:case1>, ["pretty",
  "I c I",
  "□ C □",
  "I : I"], {
  "I": <ore:stoneBasalt>,
  "c": <ore:oc:circuitChip1>,                # Microchip (Tier 1)
  "□": <ic2:casing:1>,                       # Copper Item Casing
  "C": <rustic:cabinet>,                     # Cabinet
  ":": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
});

# [Computer Case (Tier 2)] from [Bronze Storage Box][+4]
craft.remake(<opencomputers:case2>, ["pretty",
  "S : S",
  "□ B □",
  "S m S"], {
  "S": <ore:itemSimpleChassiParts>,          # Simple Machine Parts
  ":": <ore:oc:circuitChip2>,                # Microchip (Tier 2)
  "□": <ore:plateConstantan>,                # Constantan Plate
  "B": <ore:chest>,
  "m": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
});

# [Computer Case (Tier 3)] from [Steel Storage Box][+4]
craft.remake(<opencomputers:case3>, ["pretty",
  "C : C",
  "□ S □",
  "C m C"], {
  "C": <ore:itemChassiParts>,                # Machine Parts
  ":": <ore:oc:circuitChip3>,                # Microchip (Tier 3)
  "□": <ore:platePlatinum>,                  # Platinum Plate
  "S": <ic2:te:114>,                         # Steel Storage Box
  "m": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
});

# [Capacitor] from [Printed Circuit Board (PCB)][+3]
craft.remake(<opencomputers:capacitor>, ["pretty",
  "  m  ",
  "‚ : ‚",
  "B B B"], {
  "m": <ore:oc:materialTransistor>,          # Transistor
  "‚": <ore:nuggetGold>,                     # Gold Nugget
  ":": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
  "B": <ore:stoneBasalt>,                    # Basalt
});

# [Charger] from [Microchip (Tier 2)][+3]
craft.remake(<opencomputers:charger>, ["pretty",
  "B : B",
  "c i c",
  "B : B"], {
  "B": <ore:stoneBasalt>,                    # Basalt
  ":": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
  "c": <ore:oc:capacitor>,                   # Capacitor
  "i": <ore:oc:circuitChip2>,                # Microchip (Tier 2)
});

# [End Stone] from [Chamelium][+1]
recipes.remove(<opencomputers:endstone>);
scripts.process.alloy([
  <randomthings:ingredient:7> * 5, # Floo Powder
  <opencomputers:material:28> * 4, # Chamelium
], <opencomputers:endstone>, "except: arcFurnance AdvRockArc alloySmelter");

# [Interweb] from [Floo Powder][+1]
recipes.remove(<opencomputers:material:13>);
scripts.process.alloy([
  <randomthings:ingredient:7> * 5, # Floo Powder
  <minecraft:string> * 4,          # String
], <opencomputers:material:13>, "except: arcFurnance AdvRockArc");

# [Drone Case (Tier 1)] from [Microcontroller Case (Tier 1)][+4]
craft.remake(<opencomputers:material:23>, ["pretty",
  "B h B",
  ": m :",
  "B s B"], {
  "B": <ore:slabBasalt>,              # Basalt Slab
  "h": <ore:oc:hoverUpgrade1>,        # Hover Upgrade (Tier 1)
  ":": <ore:oc:circuitChip1>,         # Microchip (Tier 1)
  "m": <ore:oc:microcontrollerCase1>, # Microcontroller Case (Tier 1)
  "s": <ore:oc:stoneEndstone>,        # End Stone
});

# [Drone Case (Tier 2)] from [Microcontroller Case (Tier 2)][+4]
craft.remake(<opencomputers:material:24>, ["pretty",
  "B h B",
  ": m :",
  "B s B"], {
  "B": <ore:slabBasalt>,              # Basalt Slab
  "h": <ore:oc:hoverUpgrade1>,        # Hover Upgrade (Tier 1)
  ":": <ore:oc:circuitChip2>,         # Microchip (Tier 2)
  "m": <ore:oc:microcontrollerCase2>, # Microcontroller Case (Tier 2)
  "s": <ore:oc:stoneEndstone>,        # End Stone
});

/////////////////////////////////////////////////////////////////////////
// 3d Prints usage
/////////////////////////////////////////////////////////////////////////

// {shapes={2, 2, 2, 14, 14, 14,texture="rftools:items/storage/storagemodule2"}}
/*

{shapes={{0,0,0,16,16,16,texture:"draconicevolution:blocks/animated/dislocator_receptacle_inactive"}}}

*/

val itemFromPrint = {
  <thermalexpansion:frame:64> : {
    stateOff: [
      {texture: "thermalexpansion:blocks/device/device_frame_side", bounds: [15, 1, 0, 16, 15, 16] as byte[]},
      {texture: "thermalexpansion:blocks/device/device_frame_top", bounds: [0, 15, 0, 16, 16, 16] as byte[]},
      {texture: "thermalexpansion:blocks/device/device_frame_side", bounds: [0, 1, 15, 16, 15, 16] as byte[]},
      {texture: "thermalexpansion:blocks/device/device_frame_side", bounds: [0, 1, 0, 16, 15, 1] as byte[]},
      {texture: "thermalexpansion:blocks/device/device_frame_side", bounds: [0, 1, 0, 1, 15, 16] as byte[]},
      {texture: "thermalexpansion:blocks/device/device_frame_top", bounds: [0, 0, 0, 16, 1, 16] as byte[]},
    ]
  },

  <iceandfire:pixie_house> : {
    stateOff: [
      {texture: "mushroom_block_skin_stem", bounds: [3, 0, 3, 13, 10, 13] as byte[]},
      {texture: "mushroom_block_skin_brown", bounds: [0, 10, 0, 16, 13, 16] as byte[]},
    ]
  },

  <industrialwires:ic2_connector:9> : {
    stateOff: [
      {texture: "glass_white", bounds: [7, 0, 7, 9, 13, 9] as byte[]},
      {texture: "glass_white", bounds: [6, 13, 6, 10, 14, 10] as byte[]},
      {texture: "immersiveengineering:blocks/stone_decoration_insulating_glass", bounds: [5, 10, 5, 11, 12, 11] as byte[]},
      {texture: "immersiveengineering:blocks/stone_decoration_insulating_glass", bounds: [5, 6, 5, 11, 8, 11] as byte[]},
      {texture: "immersiveengineering:blocks/stone_decoration_insulating_glass", bounds: [5, 2, 5, 11, 4, 11] as byte[]},
    ]
  },

  <rftools:storage_module:2> : {
    stateOff: [
      {texture: "rftools:items/storage/storagemodule2", bounds: [2, 2, 2, 14, 14, 14] as byte[]},
    ]
  },

  <draconicevolution:dislocator_receptacle> : {
    stateOff: [
      {texture: "draconicevolution:blocks/animated/dislocator_receptacle_inactive", bounds: [0, 0, 0, 16, 16, 16] as byte[]},
    ]
  },
} as IData[IItemStack];

for output, tag in itemFromPrint {
  recipes.addShapeless(
    '3dprint_turn_'~craft.itemName(output),
    output, [<opencomputers:print>.withTag(tag)]
  );
}


/////////////////////////////////////////////////////////////////////////
