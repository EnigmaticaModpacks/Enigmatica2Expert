#priority 4000

val localizationMap as string[string][string] = {
  en_us: {
    'ic2.dust.coal'            : 'Blackened Fruit',
    'ic2.dust.ender_pearl'     : 'Spectral Fruit',
    'ic2.dust.small_copper'    : 'Coppery Fruit',
    'ic2.dust.small_diamond'   : 'Gelided Fruit',
    'ic2.dust.small_gold'      : 'Golden Fruit',
    'ic2.dust.small_iron'      : 'Irony Fruit',
    'ic2.dust.small_lead'      : 'Leaden Fruit',
    'ic2.dust.small_silver'    : 'Silvery Fruit',
    'ic2.dust.sulfur'          : 'Fiery Fruit',
    'ic2.crop_res.coffee_beans': 'Arabica',
  },

  ru_ru: {
    'ic2.dust.coal'            : 'Почерневший фрукт',
    'ic2.dust.ender_pearl'     : 'Спектральный фрукт',
    'ic2.dust.small_copper'    : 'Медный фрукт',
    'ic2.dust.small_diamond'   : 'Желированный фрукт',
    'ic2.dust.small_gold'      : 'Золотой фрукт',
    'ic2.dust.small_iron'      : 'Железный фрукт',
    'ic2.dust.small_lead'      : 'Свинцовый фрукт',
    'ic2.dust.small_silver'    : 'Серебристый фрукт',
    'ic2.dust.sulfur'          : 'Огневой фрукт',
    'ic2.crop_res.coffee_beans': 'Арабика',
  }
};


for lang, entries in localizationMap {
  for k, v in entries {
    game.setLocalization(lang, k, v);
  }
}