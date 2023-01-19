#modloaded darkutils

// Wither Dust
recipes.remove(<darkutils:material>);
recipes.addShapeless('Wither Dust1', <darkutils:material> * 6, [<ore:boneWither>, <ore:boneWither>]);
recipes.addShapeless('Wither Dust2', <darkutils:material> * 9, [<minecraft:skull:1>]);
recipes.addShapeless('Wither Dust3', <darkutils:material> * 4, [<ore:blockWither>]);

# [Player Trap] from [Rat Diamond]*2[+2]
craft.remake(<darkutils:trap_tile:7>, ["pretty",
  "  h  ",
  "⌃ ◊ ⌃",
  "⌃ ⌃ ⌃"], {
  "h": <ore:itemSkull>,      # Head
  "⌃": <ore:gemQuartzBlack>, # Black Quartz
  "◊": <rats:rat_diamond>,   # Rat Diamond
});
craft.make(<darkutils:trap_tile:7>, ["pretty",
  "  h  ",
  "⌃ ◊ ⌃",
  "⌃ ⌃ ⌃"], {
  "h": <ore:itemSkull>,      # Head
  "⌃": <ore:gemQuartzBlack>, # Black Quartz
  "◊": <ore:itemCompressedDiamond>,
});


# Cheaper. Work too slow and short radius
# [Ender_Hopper] from [Hopper][+2]
craft.remake(<darkutils:ender_hopper>, ["pretty",
  "  ▲  ",
  "V □ V"], {
  "□": <ore:blockHopper>, # Hopper
  "▲": <ore:dustWither>,  # Wither Dust
  "V": <chisel:voidstone:*> # Voidstone
});

# [Pearled_Ender_Hopper] from [Shulker_Pearl][+1]
craft.reshapeless(<darkutils:ender_pearl_hopper>, "E◊", {
  "E": <darkutils:ender_hopper>, # Ender Hopper
  "◊": <ore:gemPearl>            # Shulker Pearl
});

# Buuf resistance to be possible use in vanilla-like spawners
<darkutils:grate>.asBlock().definition.resistance = 60;

# [Maim Trap] from [Exhausting Ingot][+2]
craft.remake(<darkutils:trap_tile:6>, ["pretty",
  "▬ - ▬",
  "◊ ◊ ◊"], {
  "▬": <ore:ingotDemonicMetal>, # Demon Ingot
  "-": <ore:ingotAlubrass>,
  "◊": <ore:gemPearl>,          # Shulker Pearl
});
