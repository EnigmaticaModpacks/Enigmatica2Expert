#loader preinit
import mods.treetweaker.TreeFactory;

//Due to the sheer size of this lad, it can be slow to generate
//Don't over use very tall versions of this
var helix = TreeFactory.createTree("swirlytree");
helix.setTreeType("BRAIDED");
helix.setLog("advancedrocketry:alienwood");
helix.setLeaf("advancedrocketry:alienleaves");
helix.setGenBiome("advancedrocketry:alien_forest");
helix.setMinHeight(50); //this tree is meant to be tall
helix.setExtraHeight(30);
helix.setGenFrequency(6); //make it not so frequent 
helix.register();