#modloaded fluxnetworks


# Flux (fire recipe is disabled)
recipes.addShaped("Flux Networks Flux", 
<fluxnetworks:flux> * 8, 
[[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>],
[<ore:dustRedstone>, <ore:blockBlackQuartz>, <ore:dustRedstone>], 
[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]]);

# Flux Point/Plug NBT Clear 
recipes.addShapeless("Flux Point NBT Clear", 
<fluxnetworks:fluxpoint>, 
[<fluxnetworks:fluxpoint>.anyDamage()]);
recipes.addShapeless("Flux Plug NBT Clear", 

<fluxnetworks:fluxplug>, 
[<fluxnetworks:fluxplug>.anyDamage()]);

# Flux Core
recipes.remove(<fluxnetworks:fluxcore>);
recipes.addShapedMirrored("Flux Core Dupe", 
<fluxnetworks:fluxcore> * 4, 
[[<fluxnetworks:flux>, <ore:obsidian>, <fluxnetworks:flux>],
[<ore:obsidian>, <fluxnetworks:fluxcore>, <ore:obsidian>], 
[<fluxnetworks:flux>, <ore:obsidian>, <fluxnetworks:flux>]]);

