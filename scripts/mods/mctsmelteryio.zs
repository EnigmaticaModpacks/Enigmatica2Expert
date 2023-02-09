
#modloaded mctsmelteryio

// Remove unused upgrades
utils.rh(<mctsmelteryio:upgrade:1>);
utils.rh(<mctsmelteryio:upgrade:2>);
utils.rh(<mctsmelteryio:upgrade:3>);

<mctsmelteryio:upgrade:4>.maxStackSize = 16;
<mctsmelteryio:upgrade:6>.maxStackSize = 64;

# Recipes to remove 
utils.rh(<mctsmelteryio:powdered_fuel>);

# Ice balls
scripts.process.mash(<biomesoplenty:hard_ice>, <mctsmelteryio:iceball> * 8, "No Exceptions");

# [Base Upgrade]*10 from [Elixir of ][+2]
craft.remake(<mctsmelteryio:upgrade> * 10, ["pretty",
  "□ □ □",
  "п E п",
  "□ □ □"], {
  "□": <ore:plateLapis>,    # Lapis Lazuli Plate
  "п": <ore:plateAluminum>, # Aluminum Plate
  "E": <rustic:elixir>,     # Elixir
});

# [Speed Upgrade] from [Base Upgrade][+1]
craft.reshapeless(<mctsmelteryio:upgrade:6>, "BAA", {
  "B": <mctsmelteryio:upgrade>, # Base Upgrade
  "A": <ore:listAllsugar>,      # Sugar
});

# [Slot Size Upgrade 4] from [Base Upgrade][+2]
craft.remake(<mctsmelteryio:upgrade:4>, ["pretty",
  "  c  ",
  "‚ B ‚",
  "  ‚  "], {
  "c": <ore:chest>, # Oak Chest
  "‚": <ore:nuggetKnightslime>, # Knightslime Nugget
  "B": <mctsmelteryio:upgrade>, # Base Upgrade
});

# [Casting_Machine] from [Casting_Table][+3]
craft.remake(<mctsmelteryio:machine:1>, ["pretty",
  "□ S □",
  "i C i",
  "□ i □"], {
  "□": <ore:blockSeared>,        # Seared Stone
  "C": <tconstruct:casting>,     # Casting Table
  "S": <tconstruct:smeltery_io>, # Smeltery Drain
  "i": <ore:ice>                 # Ice
});
