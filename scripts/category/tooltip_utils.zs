#priority 2

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
	function both(item as IItemStack, lang as string) as void {
		tooltip(item, lang);
		jei(item, lang);
	}

	/*
		Add tooltip
	*/
	function tooltip(item as IItemStack) as void { tooltip(item, autoLang(item)); }
	function tooltip(item as IItemStack, lang as string) as void {
		val loc = local(lang);
		if(loc.startsWith(langPrefix)) return;
		item.addTooltip(loc);
	}

	/*
		Add JEI description tab
	*/
	function jei(item as IItemStack) as void { jei(item, autoLang(item)); }
	function jei(item as ILiquidStack, lang as string) as void {
		val localized = local(lang);
		describe(item, localized);
	}
	function jei(item as IItemStack, lang as string) as void {
		val localized = local(lang);
		describe(item, localized);
	}
	function jei(item as IItemStack, lang as string, arg1 as string) as void {
		describe(item, I18n.format(local(lang), arg1));
	}
	function jei(item as IItemStack, lang as string, a1 as string, a2 as string, a3 as string) as void { describe(item, I18n.format(local(lang), a1, a2, a3)); }
	function jei(item as IItemStack, lang as string, a1 as string, a2 as string, a3 as string, a4 as string) as void { describe(item, I18n.format(local(lang), a1, a2, a3, a4)); }
	function jei(item as IItemStack, lang as string, a1 as string, a2 as string, a3 as string, a4 as string, a5 as string) as void { describe(item, I18n.format(local(lang), a1, a2, a3, a4, a5)); }

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
