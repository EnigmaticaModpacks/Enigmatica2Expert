import crafttweaker.item.IItemStack;
import mods.cyclicmagic.Hydrator;

// These recipes are only temporary, used to "fix" bugs

var extraCellsItemsToRemoveAndHide as IItemStack[] = [
	<extracells:terminal.universal.wireless>.withTag({type: 0 as byte, modules: 23 as byte}),
	<extracells:terminal.gas.wireless>.withTag({}),
	<extracells:part.base:6>,
	<extracells:part.base:5>,
	<extracells:part.base:4>,
	<extracells:part.base:3>,
	<extracells:part.base:2>,
	<extracells:part.base:1>,
	<extracells:part.base>,
	<extracells:part.base:9>,
	<extracells:storage.fluid>.withTag({}),
	<extracells:storage.fluid:1>.withTag({}),
	<extracells:storage.fluid:2>.withTag({}),
	<extracells:storage.fluid:3>.withTag({}),
	<extracells:storage.component:4>,
	<extracells:storage.component:5>,
	<extracells:storage.component:6>,
	<extracells:storage.component:7>,
	<extracells:ecbaseblock>
];

for item in extraCellsItemsToRemoveAndHide {
	mods.jei.JEI.removeAndHide(item);
}