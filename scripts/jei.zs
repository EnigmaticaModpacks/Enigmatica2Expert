import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

# Thanks to the FTB Interactions devs for making me aware of this feature <3
var categoriesToHide as string[] = [
	
	"minecraft.fuel",
	"thermaldynamics.covers",
	"mysticalagriculture:reprocessor_jei",
	"jehc.market",
	"thermalexpansion.furnace",
	"thermalexpansion.factorizer_combine",
	"thermalexpansion.factorizer_split",
	"Painter",
	"forestry.bottler",
	"ic2.scrapbox",
	"EIOTank",
	"xu2_machine_extrautils2:furnace",
	"xu2_machine_extrautils2:generator_survival",
	"xu2_machine_extrautils2:generator",
  "mctsmelteryio:casting_machine",
  "mctsmelteryio:fuel_controller",
	"tcomplement:high_oven_melting",
	"mekanism.energizedsmelter",
];

for category in categoriesToHide {
	mods.jei.JEI.hideCategory(category);
}

// for can in [
// 	<forestry:can:1>, 
// 	<forestry:capsule:1>, 
// 	<forestry:refractory:1>,
// ] as IItemStack[] {
// 	for liquid in game.liquids {
// 		mods.jei.JEI.hide(can.withTag({Fluid: {FluidName: liquid.name, Amount: 1000}}));
// 	}
// }

// for mobHolder in [
// 	<enderio:item_soul_vial:1>,
// ] as IItemStack[] {
// 	for o in game.entities {
// 		mods.jei.JEI.hide(o.withTag({mobName: o.name, level: 10, mobId: "minecraft:elder_guardian"}));
// 		mods.jei.JEI.hide(o.withTag({entityId: "emberroot:fairies"}));
// 	}
// }
