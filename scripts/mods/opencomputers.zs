#modloaded opencomputers

# Make robot easy to break and replace
<opencomputers:robot>.hardness = 0.5;
<opencomputers:cable>.hardness = 0.05;

# [Battery Upgrade (Tier 2)] from [Simple Machine Parts][+2]
craft.remake(<opencomputers:upgrade:2>, ["pretty",
  ": □ :",
  "□ S □",
  ": □ :"], {
  ":": <ore:oc:capacitor>,          # Capacitor
  "□": <ore:plateElectrum>,         # Electrum Plate
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
