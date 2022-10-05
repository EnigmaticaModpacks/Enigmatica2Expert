import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import mods.requious.GaugeDirection;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IFurnaceRecipe;

#priority -100

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var
o = <assembly:adv_bee_analyzer>;
o.setEnergySlot(4,0,ComponentFace.all(),2000000).setAccess(true,false).setGroup("energy").allowBattery(true,true,true);
o.setFluidSlot(4,1,ComponentFace.all(),20000).setAccess(true,false).setGroup("fluid_input");
o.setDecorationSlot(4,2,SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",0,8));
for _y in 0 .. 4 {
  for _x in 0 .. 4 {
    o.setItemSlot(_x,_y+1,ComponentFace.all(),64).setAccess(true,false).setGroup("input");
    o.setItemSlot(_x+5,_y+1,ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
  }
}

o.addRecipe(AssemblyRecipe.create(function(c) {
  c.addItemOutput('output', c.getItem('bee').updateTag({IsAnalyzed: 1 as byte}));
})
.requireItem("input", (<forestry:bee_queen_ge> | <forestry:bee_princess_ge> | <forestry:bee_drone_ge>).marked('bee'))
.requireFluid("fluid_input", <liquid:for.honey> * 100)
.requireEnergy('energy', 10000)
);

# [Infinity_Furnace] from [Infinity_Fuel][+4]
utils.rh(<avaritiafurnace:infinityfurnace>);
craft.remake(<requious:infinity_furnace>, ["pretty",
  "T R E R T",
  "# ▬ n ▬ #",
  "H r I r H",
  "# ▬ Ϟ ▬ #",
  "T R E R T"], {
  "R": <rats:marbled_cheese_raw>,                 # Raw Marbled Cheese
  "#": <ore:logSequoia>,                          # Sequoia
  "T": <mysticalagriculture:supremium_furnace>,
  "E": <contenttweaker:empowered_phosphor>,       # Empowered Phosphor
  "r": <rats:idol_of_ratlantis>,
  "H": <scalinghealth:heartcontainer>,            # Heart Container
  "I": <avaritiafurnace:infinityfuel>,            # Infinity Fuel
  "▬": <ore:dragonsteelIngot>,
  "n": <randomthings:spectrecoil_ender>,          # Ender Spectre Coil
  "Ϟ": <randomthings:spectreenergyinjector>       # Spectre Energy Injector
});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
o = <assembly:infinity_furnace>;
o.setItemSlot(3,2,ComponentFace.all(),64).setAccess(true,false).setGroup("input");
o.setItemSlot(5,2,ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
o.setDurationSlot(4,2).setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png",2,1,3,1,GaugeDirection.up(),false)).setGroup("duration");

o.setJEIItemSlot(3,2, 'input');
o.setJEIItemSlot(5,2, 'output');
o.setJEIDurationSlot(4,2,"duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",3,1));