#priority 4000

val localizationMap as string[string][string] = {
  en_us: {
    'ic2.dust.coal'            : 'Blackened Fruit',
    'ic2.dust.ender_pearl'     : 'Spectral Fruit',
    'ic2.dust.small_tin'       : 'Tiny Fruit',
    'ic2.dust.small_copper'    : 'Coppery Fruit',
    'ic2.dust.small_diamond'   : 'Gelided Fruit',
    'ic2.dust.small_gold'      : 'Golden Fruit',
    'ic2.dust.small_iron'      : 'Irony Fruit',
    'ic2.dust.small_lead'      : 'Leaden Fruit',
    'ic2.dust.small_silver'    : 'Silvery Fruit',
    'ic2.dust.sulfur'          : 'Fiery Fruit',
    'ic2.crop_res.coffee_beans': 'Arabica',
    'item.singularity.silver.name'  : '§bFur Singularity',
    'item.singularity.iron.name'    : '§7Empty Singularity',
    'item.singularity.nickel.name'  : '§eHeat Singularity',
    'item.singularity.fluxed.name'  : '§4Burn Singularity',
    'tooltips.lang.singularity.heat': '§7Intermediate ingredient.§r\nCombine with §lany burnable§r material to add a charge.\nWhen using burnable materials with different burning times, their effectiveness is §lincreased by up to %s%%§r.\nNeed §6%s§r charge.',
    'tooltips.lang.singularity.burn': 'Combine with §lany burnable§r material to add a charge.\nWhen using burnable materials with different burning times, their effectiveness is §lincreased by up to %s%%§r.\nNeed §6%s§r charge.',
    'item.contenttweaker.any_burnable.name': '§6Any burnable',
  },

  ru_ru: {
    'ic2.dust.coal'            : 'Почерневший фрукт',
    'ic2.dust.ender_pearl'     : 'Спектральный фрукт',
    'ic2.dust.small_tin'       : 'Оловяный фрукт',
    'ic2.dust.small_copper'    : 'Медный фрукт',
    'ic2.dust.small_diamond'   : 'Желированный фрукт',
    'ic2.dust.small_gold'      : 'Золотой фрукт',
    'ic2.dust.small_iron'      : 'Железный фрукт',
    'ic2.dust.small_lead'      : 'Свинцовый фрукт',
    'ic2.dust.small_silver'    : 'Серебристый фрукт',
    'ic2.dust.sulfur'          : 'Огневой фрукт',
    'ic2.crop_res.coffee_beans': 'Арабика',
    'item.singularity.silver.name'  : '§bМеховая сингулярность',
    'item.singularity.iron.name'    : '§7Пустая сингулярность',
    'item.singularity.nickel.name'  : '§eНагретая сингулярность',
    'item.singularity.fluxed.name'  : '§4Пламенная сингулярность',
    'tooltips.lang.singularity.heat': '§7Промежуточный ингредиент.§r\nСовместите с любыми горючими материалами, что бы добавить заряд.\nПри использовании сгораемых материалов с разным временем горения, их эффективность §lувеличивается до %s%%§r.\nНужно §6%s§r заряда.',
    'tooltips.lang.singularity.burn': 'Совместите с любыми горючими материалами, что бы добавить заряд.\nПри использовании сгораемых материалов с разным временем горения, их эффективность §lувеличивается до %s%%§r.\nНужно §6%s§r заряда.',
    'item.contenttweaker.any_burnable.name': '§6Любое горючее',
  }
};


for lang, entries in localizationMap {
  for k, v in entries {
    game.setLocalization(lang, k, v);
  }
}