#modloaded fluxnetworks

# Flux Core
recipes.remove(<fluxnetworks:fluxcore>);
recipes.addShapedMirrored("Flux Core Dupe", 
<fluxnetworks:fluxcore> * 4, 
[[<fluxnetworks:flux>, <ore:obsidian>, <fluxnetworks:flux>],
[<ore:obsidian>, <fluxnetworks:fluxcore>, <ore:obsidian>], 
[<fluxnetworks:flux>, <ore:obsidian>, <fluxnetworks:flux>]]);