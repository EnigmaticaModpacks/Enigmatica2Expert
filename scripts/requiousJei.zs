import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#priority 1000
#modloaded requious

function add(ass as Assembly, map as IItemStack[][IIngredient[]][]) {
  for chunk in map {
    for inputs, outputs in chunk {
      val assRec = AssemblyRecipe.create(function(container) {
        for i, output in outputs {
          container.addItemOutput("output" ~ i, output);
        }
      });
      for i, input in inputs {
        assRec.requireItem("input"~i, input);
      }
      ass.addJEIRecipe(assRec);
    }
  }
}

// -----------------------------------------------------------------------
// infernal_furnace
// -----------------------------------------------------------------------
<assembly:infernal_furnace>.addJEICatalyst(<thaumcraft:infernal_furnace>);
<assembly:infernal_furnace>.setJEIItemSlot(0,0,"input0");
<assembly:infernal_furnace>.setJEIItemSlot(3,0,"output0");
<assembly:infernal_furnace>.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
<assembly:infernal_furnace>.setJEIDurationSlot(2,0,"duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",1,13));


function add_infernal_furnace(input as IIngredient, out as IItemStack) {
  add(<assembly:infernal_furnace>, [{[input] as IIngredient[] : [out]}]);
}


// -----------------------------------------------------------------------
// infernal_furnace
// -----------------------------------------------------------------------
val flowDown = SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",0,6);
<assembly:liquid_interaction>.addJEICatalyst(<minecraft:bucket>);
<assembly:liquid_interaction>.setJEIItemSlot(0,0,"input0");
<assembly:liquid_interaction>.setJEIItemSlot(2,0,"input1");
<assembly:liquid_interaction>.setJEIItemSlot(1,1,"output0");
<assembly:liquid_interaction>.setJEIDurationSlot(1,0,"duration", flowDown);

function add_liquid_interaction(input1 as IIngredient, input2 as IIngredient, out as IItemStack) {
  add(<assembly:liquid_interaction>, [{[input1, input2] : [out]}]);
}

// -----------------------------------------------------------------------
// infernal_furnace
// -----------------------------------------------------------------------
<assembly:everflow_chalice>.addJEICatalyst(<astralsorcery:blockchalice>);
<assembly:everflow_chalice>.setJEIItemSlot(0,0,"input0");
<assembly:everflow_chalice>.setJEIItemSlot(2,0,"input1");
<assembly:everflow_chalice>.setJEIItemSlot(1,1,"output0");
<assembly:everflow_chalice>.setJEIItemSlot(0,2,"output1");
<assembly:everflow_chalice>.setJEIItemSlot(2,2,"output2");
<assembly:everflow_chalice>.setJEIDurationSlot(1,0,"duration", flowDown);

function add_everflow_chalice(input1 as IIngredient, input2 as IIngredient, out as IItemStack[]) {
  add(<assembly:everflow_chalice>, [{[input1, input2] : out}]);
}