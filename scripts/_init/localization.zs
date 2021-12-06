#priority 4000

val localizationMap as string[string][string] = {
  en_us: {

  },

  ru_ru: {

  }
};


for lang, entries in localizationMap {
  for k, v in entries {
    game.setLocalization(lang, k, v);
  }
}