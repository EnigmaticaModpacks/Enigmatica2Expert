#modloaded sonarcore

val stn = <sonarcore:stablestone_normal>;

remakeEx(stn * 8                               ,[[stn ,stn ,stn] ,[stn ,<ore:dyeLightGray> ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_lightgrey> * 8 ,[[stn ,stn ,stn] ,[stn ,<ore:dyeWhite>     ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_plain> * 8     ,[[stn ,stn ,stn] ,[stn ,null               ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_lime> * 8      ,[[stn ,stn ,stn] ,[stn ,<ore:dyeLime>      ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_blue> * 8      ,[[stn ,stn ,stn] ,[stn ,<ore:dyeBlue>      ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_cyan> * 8      ,[[stn ,stn ,stn] ,[stn ,<ore:dyeCyan>      ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_magenta> * 8   ,[[stn ,stn ,stn] ,[stn ,<ore:dyeMagenta>   ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_pink> * 8      ,[[stn ,stn ,stn] ,[stn ,<ore:dyePink>      ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_yellow> * 8    ,[[stn ,stn ,stn] ,[stn ,<ore:dyeYellow>    ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_purple> * 8    ,[[stn ,stn ,stn] ,[stn ,<ore:dyePurple>    ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_lightblue> * 8 ,[[stn ,stn ,stn] ,[stn ,<ore:dyeLightBlue> ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_green> * 8     ,[[stn ,stn ,stn] ,[stn ,<ore:dyeGreen>     ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_orange> * 8    ,[[stn ,stn ,stn] ,[stn ,<ore:dyeOrange>    ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_red> * 8       ,[[stn ,stn ,stn] ,[stn ,<ore:dyeRed>       ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_black> * 8     ,[[stn ,stn ,stn] ,[stn ,<ore:dyeBlack>     ,stn] ,[stn ,stn ,stn]]);
remakeEx(<sonarcore:stablestone_brown> * 8     ,[[stn ,stn ,stn] ,[stn ,<ore:dyeBrown>     ,stn] ,[stn ,stn ,stn]]);

# [Reinforced Stone]*36 from [Single Compressed Wood][+1]
craft.shapeless(<sonarcore:reinforcedstoneblock> * 36, "░#", {
  "░": <ore:compressed1xCobblestone>, # Compressed Cobblestone
  "#": <ore:compressedLogWood1x>, # Single Compressed Wood
});

// Same resistance as Obsidian
<sonarcore:reinforcedstoneblock>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonestairs>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonefence>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonegate>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonebrick>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonebrickstairs>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonebrickfence>.asBlock().definition.resistance = 180;
<sonarcore:reinforcedstonebrickgate>.asBlock().definition.resistance = 180;
