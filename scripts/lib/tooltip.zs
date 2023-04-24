#priority 2
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.addDescription;
import mods.zenutils.I18n;

zenClass Descriptor {
	var langPrefix as string = "";
	zenConstructor(newPrefix as string) {
		langPrefix = newPrefix;
	}

	/*
		Add both: tooltip and description
	*/
	function both(item as IItemStack) as void { both(item, autoLang(item)); }
	function both(item as IItemStack, lang as string, a1 as string = null, a2 as string = null) as void {
		if (isNull(a1)) { tooltip(item, lang); jei(item, lang); }
		else if (isNull(a2)) { tooltip(item, lang, a1); jei(item, lang, a1); }
		else { tooltip(item, lang, a1, a2); jei(item, lang, a1, a2); }
	}

	/*
		Add tooltip
	*/
	function tooltip(item as IItemStack) as void { tooltip(item, autoLang(item)); }
	function tooltip(item as IItemStack, lang as string) as void { tooltipRaw(item, local(lang)); }
	function tooltip(item as IItemStack, lang as string, a1 as string) as void { tooltipRaw(item, I18n.format(local(lang), a1)); }
	function tooltip(item as IItemStack, lang as string, a1 as string, a2 as string) as void { tooltipRaw(item, I18n.format(local(lang), a1, a2)); }

	/*
		Add tooltip helper
	*/
	function tooltipRaw(item as IIngredient, localized as string) as void {
		if(localized.startsWith(langPrefix)) return;
		if(isNull(item)) return;
		for line in localized.split('\\\\n') {
			item.addTooltip(line);
		}
	}

	/*
		Add JEI description tab
	*/
	function jei(item as IItemStack) as void { jei(item, autoLang(item)); }
	function jei(item as ILiquidStack, lang as string) as void { describe(item, local(lang)); }
	function jei(item as IItemStack,
		lang as string,
		a1 as string = null,
		a2 as string = null,
		a3 as string = null,
		a4 as string = null,
		a5 as string = null
	) as void {
		if(isNull(a1)) return describe(item, local(lang));
		if(isNull(a2)) return describe(item, I18n.format(local(lang), a1));
		if(isNull(a3)) return describe(item, I18n.format(local(lang), a1, a2));
		if(isNull(a4)) return describe(item, I18n.format(local(lang), a1, a2, a3));
		if(isNull(a5)) return describe(item, I18n.format(local(lang), a1, a2, a3, a4));
		describe(item, I18n.format(local(lang), a1, a2, a3, a4, a5));
	}

	/*
		Add JEI description tab helper
	*/
	function describe(item as IItemStack, localized as string) as void {
		if(localized.startsWith(langPrefix)) return;
		if(localized.contains("\n")) 
			addDescription(item, localized.split("\n"));
		else
			addDescription(item, localized);
	}
	function describe(item as ILiquidStack, localized as string) as void {
		if(localized.startsWith(langPrefix)) return;
		if(localized.contains("\n")) 
			addDescription(item, localized.split("\n"));
		else
			addDescription(item, localized);
	}

	/*
		Other functions
	*/
	function autoLang(item as IItemStack) as string { return item.commandString.replaceAll("[<>]", ""); }
	function local(lang as string) as string { return game.localize(prefix(lang)); }
	function local(item as IItemStack) as string { return local(autoLang(item)); }
	function prefix(lang as string) as string { return langPrefix ~ lang; }
}
static desc as Descriptor = Descriptor("tooltips.lang.");
