#modloaded ftbquests

val rarities = [
  'common',
  'uncommon',
  'rare',
  'epic',
  'legendary',
] as string[];

for i, rarity in rarities {
  if (i==0) continue;
  utils.compact(<ftbquests:lootcrate>.withTag({type: rarities[i - 1]}), <ftbquests:lootcrate>.withTag({type: rarity}));
}
