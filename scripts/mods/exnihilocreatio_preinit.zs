#loader contenttweaker
#modloaded exnihilocreatio

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
/*

// This code can add lot of items https://i.imgur.com/TINWhLn.png
// https://docs.blamejared.com/1.12/en/Mods/Ex_Nihilo_Creatio/Ores/

mods.exnihilocreatio.Ore.addRecipe(
  "id_name", # Name would be used for ids. <crafttweaker:item_ore_id_name>
  "EEEEEE", # HEX Color
  <ore:oreRockCrystal>.firstItem,
  {
    "en_us": "Display Name", # Display Name
    "ru_ru": "Клиентское Имя",
  },
  "BaseName" # Ore BASE name. From uppercase. <ore:oreBaseName>
);

*/

mods.exnihilocreatio.Ore.addRecipe(
  "tungsten",
  "2B2C2A",
  <ore:oreTungsten>.firstItem,
  {
    "en_us": "Tungsten",
    "ru_ru": "Вольфрам",
  },
  "Tungsten"
);