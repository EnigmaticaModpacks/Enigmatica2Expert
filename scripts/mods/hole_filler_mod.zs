#modloaded hole_filler_mod

# [Throwable Hole Filler] from [Slime in a Bucket][+2]
craft.remake(<hole_filler_mod:item_throwable_hole_filler>, ["pretty",
  "  M  ",
  "B ~ B",
  "  M  "], {
  "B": <actuallyadditions:item_misc:21>, # Biomass
  "M": <ore:ballMud>,                    # Mud Ball
  "~": <ore:dustArdite>
});

# [Hole Filler] from [Throwable Hole Filler]
craft.reshapeless(<hole_filler_mod:block_hole_filler>, "T", {
  "T": <hole_filler_mod:item_throwable_hole_filler>, # Throwable Hole Filler
});
