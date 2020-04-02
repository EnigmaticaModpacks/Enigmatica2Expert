import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;


<ore:dragonsteelBoots>.add(     <iceandfire:dragonsteel_fire_boots>,      <iceandfire:dragonsteel_ice_boots>);
<ore:dragonsteelLeggings>.add(  <iceandfire:dragonsteel_fire_leggings>,   <iceandfire:dragonsteel_ice_leggings>);
<ore:dragonsteelChestplate>.add(<iceandfire:dragonsteel_fire_chestplate>, <iceandfire:dragonsteel_ice_chestplate>);
<ore:dragonsteelHelmet>.add(    <iceandfire:dragonsteel_fire_helmet>,     <iceandfire:dragonsteel_ice_helmet>);

# Arrange colored armor to OREs
function coloredArmor(armOre as IOreDictEntry[], armList as string[]){
    for i in 0 to armList.length / 4{
        for j in 0 to 4 {
            armOre[j].add(itemUtils.getItem(armList[i*4+j]));
        }
    }
}

coloredArmor([
    <ore:dragonscaleArmorBoots>,
    <ore:dragonscaleArmorChestplate>,
    <ore:dragonscaleArmorHelmet>,
    <ore:dragonscaleArmorLeggings>
] as IOreDictEntry[], [
    "iceandfire:armor_blue_boots",
    "iceandfire:armor_blue_chestplate",
    "iceandfire:armor_blue_helmet",
    "iceandfire:armor_blue_leggings",
    "iceandfire:armor_bronze_boots",
    "iceandfire:armor_bronze_chestplate",
    "iceandfire:armor_bronze_helmet",
    "iceandfire:armor_bronze_leggings",
    "iceandfire:armor_gray_boots",
    "iceandfire:armor_gray_chestplate",
    "iceandfire:armor_gray_helmet",
    "iceandfire:armor_gray_leggings",
    "iceandfire:armor_green_boots",
    "iceandfire:armor_green_chestplate",
    "iceandfire:armor_green_helmet",
    "iceandfire:armor_green_leggings",
    "iceandfire:armor_red_boots",
    "iceandfire:armor_red_chestplate",
    "iceandfire:armor_red_helmet",
    "iceandfire:armor_red_leggings",
    "iceandfire:armor_sapphire_boots",
    "iceandfire:armor_sapphire_chestplate",
    "iceandfire:armor_sapphire_helmet",
    "iceandfire:armor_sapphire_leggings",
    "iceandfire:armor_silver_boots",
    "iceandfire:armor_silver_chestplate",
    "iceandfire:armor_silver_helmet",
    "iceandfire:armor_silver_leggings",
    "iceandfire:armor_white_boots",
    "iceandfire:armor_white_chestplate",
    "iceandfire:armor_white_helmet",
    "iceandfire:armor_white_leggings"
]as string[]);


coloredArmor([
    <ore:deathwormArmorBoots>,
    <ore:deathwormArmorChestplate>,
    <ore:deathwormArmorHelmet>,
    <ore:deathwormArmorLeggings>
] as IOreDictEntry[], [
    "iceandfire:deathworm_red_boots",
    "iceandfire:deathworm_red_chestplate",
    "iceandfire:deathworm_red_helmet",
    "iceandfire:deathworm_red_leggings",
    "iceandfire:deathworm_white_boots",
    "iceandfire:deathworm_white_chestplate",
    "iceandfire:deathworm_white_helmet",
    "iceandfire:deathworm_white_leggings",
    "iceandfire:deathworm_yellow_boots",
    "iceandfire:deathworm_yellow_chestplate",
    "iceandfire:deathworm_yellow_helmet",
    "iceandfire:deathworm_yellow_leggings"
]as string[]);


coloredArmor([
    <ore:myrmexArmorBoots>,
    <ore:myrmexArmorChestplate>,
    <ore:myrmexArmorHelmet>,
    <ore:myrmexArmorLeggings>
] as IOreDictEntry[], [
    "iceandfire:myrmex_desert_boots",
    "iceandfire:myrmex_desert_chestplate",
    "iceandfire:myrmex_desert_helmet",
    "iceandfire:myrmex_desert_leggings",
    "iceandfire:myrmex_jungle_boots",
    "iceandfire:myrmex_jungle_chestplate",
    "iceandfire:myrmex_jungle_helmet",
    "iceandfire:myrmex_jungle_leggings",
]as string[]);


coloredArmor([
    <ore:tideArmorBoots>,
    <ore:tideArmorChestplate>,
    <ore:tideArmorHelmet>,
    <ore:tideArmorLeggings>
] as IOreDictEntry[], [
    "iceandfire:tide_blue_boots",
    "iceandfire:tide_blue_chestplate",
    "iceandfire:tide_blue_helmet",
    "iceandfire:tide_blue_leggings",
    "iceandfire:tide_bronze_boots",
    "iceandfire:tide_bronze_chestplate",
    "iceandfire:tide_bronze_helmet",
    "iceandfire:tide_bronze_leggings",
    "iceandfire:tide_deepblue_boots",
    "iceandfire:tide_deepblue_chestplate",
    "iceandfire:tide_deepblue_helmet",
    "iceandfire:tide_deepblue_leggings",
    "iceandfire:tide_green_boots",
    "iceandfire:tide_green_chestplate",
    "iceandfire:tide_green_helmet",
    "iceandfire:tide_green_leggings",
    "iceandfire:tide_purple_boots",
    "iceandfire:tide_purple_chestplate",
    "iceandfire:tide_purple_helmet",
    "iceandfire:tide_purple_leggings",
    "iceandfire:tide_red_boots",
    "iceandfire:tide_red_chestplate",
    "iceandfire:tide_red_helmet",
    "iceandfire:tide_red_leggings",
    "iceandfire:tide_teal_boots",
    "iceandfire:tide_teal_chestplate",
    "iceandfire:tide_teal_helmet",
    "iceandfire:tide_teal_leggings"
]as string[]);


coloredArmor([
    <ore:trollArmorBoots>,
    <ore:trollArmorChestplate>,
    <ore:trollArmorHelmet>,
    <ore:trollArmorLeggings>
] as IOreDictEntry[], [
    "iceandfire:forest_troll_leather_boots",
    "iceandfire:forest_troll_leather_chestplate",
    "iceandfire:forest_troll_leather_helmet",
    "iceandfire:forest_troll_leather_leggings",
    "iceandfire:frost_troll_leather_boots",
    "iceandfire:frost_troll_leather_chestplate",
    "iceandfire:frost_troll_leather_helmet",
    "iceandfire:frost_troll_leather_leggings",
    "iceandfire:mountain_troll_leather_boots",
    "iceandfire:mountain_troll_leather_chestplate",
    "iceandfire:mountain_troll_leather_helmet",
    "iceandfire:mountain_troll_leather_leggings"
]as string[]);
