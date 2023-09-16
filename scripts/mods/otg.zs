#reloadable
#modloaded openterraingenerator

static biomeIdToName as string[][int] = {
/*Inject_js(
Object.entries(_.groupBy(getCSV('config/tellme/biomes-csv.csv'), 'ID'))
    .map(([id, list]) => {
      return [id, list
        .map(v => [v['Registry name'], `"${v['Biome name']}"`])
        .filter(([reg]) => reg.startsWith('openterraingenerator:'))]
    })
    .filter(ID => ID[1].length)
    .map(([id, names]) => [`  ${id}:`, `[${names.map(([,b]) => b).join(', ')}],`])
)*/
  0:  ["AlienOcean", "Ocean", "OceanKelpForest"],
  1:  ["AlienRiver", "BirchGrove", "BirchGroveBorder", "Plains", "TemperatePlains", "Tropical Savanna Edge", "Void"],
  2:  ["Desert", "DesertFlats", "DesertLowlands", "DesertLowlandsEdge", "DesertMountain", "DesertRed", "Mesa Sandstone", "Mesa Sandstone Edge", "Mesa Sandstone Peak", "MesaPaintedCanyon", "RedMountain", "RiverDesert"],
  3:  ["AlpsEdge", "ColdForestFirThicket", "ColdTaigaBorder", "Extreme Hills", "ForestFir", "ForestFirMountain", "ForestFirMountainEdge1", "ForestFirMountainEdge2", "Mountain Peak", "Mountain Peak2", "Mountain Peak3", "OceanRocks", "OceanRocksDiorite", "OceanRocksM", "Rocks", "SnowyMountainsEdge", "SnowyPlainsEdge"],
  4:  ["Extreme Hills Jungle Edge", "FloatingEdge", "FloatingHole", "FloatingIslands", "Forest M", "ForestFirThicketEdge", "ForestPeak", "ForestPlateau", "ForestWoodland", "Mesa River", "Monument", "MonumentM", "MonumentSmall", "MonumentValley", "MonumentValleyFir", "RainforestTropicalEdge"],
  5:  ["MountainStepsGlacier", "TaigaPlateau", "TaigaPlateauEdge"],
  6:  ["RiverSwampland", "Swampland"],
  7:  ["IsleRiver", "River", "RiverBirchForest", "RiverClay", "RiverForest", "RiverRocky", "RiverSandy", "RiverTaiga", "RiverVerde"],
  8:  ["Hell"],
  9:  ["Sky"],
  10: ["FrozenOcean"],
  11: ["FrozenRiver"],
  12: ["Glacier", "GlacierM", "Ice Plains", "IceWall", "IcyMountains", "SnowyMountains", "SnowyPlains", "SnowyPlainsM"],
  14: ["GiantMushroomIsland", "MushroomIsland"],
  15: ["MushroomIslandShore"],
  16: ["Beach", "Beach Desert"],
  17: ["DesertHills"],
  19: ["TaigaHills"],
  20: ["Extreme Hills Edge"],
  21: ["Archipelago", "ArchipelagoHigh", "ArchipelagoMid", "DesertCliffsOasis", "DesertCliffsOasisEdge", "DesertLowlandsOasis", "DesertLowlandsOasisEdge", "Jungle", "JungleAncient", "JungleAncientMountain", "JungleAncientMountainTall", "JungleAncientMushrooms", "JungleAncientRocks", "JungleHighlands", "JungleLonePeak", "JungleLowlands", "JungleMonument", "JungleMountainPeak", "JungleMountainRange", "JunglePlateau", "JunglePlateauLow", "Mesa Verde", "Mesa Verde Edge", "Mesa Verde Forest", "Mesa Verde Mountain", "MesaVerdeCanyon", "MesaVerdeCanyonHigh", "MesaVerdeCanyonMid", "Rainforest M", "Rainforest Plateau M", "RainforestBog", "RainforestTropical", "RainforestTropicalMountain", "RainforestTropicalMountainPeak", "RiverTropical"],
  22: ["JungleHills"],
  23: ["JungleEdge"],
  25: ["Stone Beach"],
  26: ["Cold Beach"],
  27: ["Birch Forest", "Birch Forest Peak", "BirchForestTropical", "BirchForestTropicalIsle", "BirchForestTropicalIsle2", "BirchForestTropicalIsle3", "OceanRockyIsland", "OceanRockyIslandPeak"],
  28: ["Birch Forest Hills"],
  29: ["OceanIslandRoofedForest", "RiverRoofedForest", "Roofed Forest", "RoofedForestFlat"],
  30: ["AlpineConiferMountain", "AlpineForest", "AlpineM", "Cold Plains", "Cold Taiga", "RiverAlpine"],
  31: ["Cold Taiga Hills"],
  32: ["Mega Taiga"],
  33: ["Mega Taiga Hills", "Mega Taiga Mountains"],
  34: ["Extreme Hills+"],
  35: ["Desert Cliffs", "Desert Cliffs Edge", "ForestDryEdge", "MesaWhite", "MesaWhiteEdge1", "MesaWhiteEdge2", "MesaWhiteLow", "MesaWhitePeak", "RiverSavanna", "Savanna", "SavannaHills", "SavannaSmall"],
  36: ["Savanna Plateau"],
  37: ["Mesa", "Mesa Desert", "Mesa Rock", "Mesa Small", "Mesa Small Edge", "Mesa Small M", "MesaCanyon", "MesaPeak"],
  38: ["Mesa Plateau F"],
  39: ["Mesa Plateau"],
  43: ["Alps", "AlpsMountain1", "AlpsMountain2", "AlpsMountain3", "AlpsMountainEdge2", "AlpsMountainHighlands", "AlpsMountainPeak", "AlpsMountainPeak2"],
  44: ["TropicalPillarLarge", "TropicalPillarSmall"],
  45: ["Forest Wetland", "ForestWetlandM", "RiverWetland"],
  46: ["Marsh", "MarshBorder", "SwamplandRuins"],
  47: ["ForestConifer", "ForestConiferEdge", "ForestConiferMountain", "Mountain Range", "TemperateHillsForest"],
  48: ["ForestCliffs", "TemperatePlainsDarkMeadow"],
  49: ["TemperateHills", "TemperateHillsBorder", "TemperatePlainsMeadow", "TemperatePlainsMeadowBorder"],
  50: ["ForestSakura", "ForestSakuraHills"],
  52: ["ForestPinyon", "MountainSteps", "MountainStepsEdge1", "MountainStepsEdge2", "RiverForestConifer", "TaigaSmall"],
  53: ["ForestLarch", "ForestLarchPeak"],
  55: ["SwamplandBorder"],
  56: ["ForestHills"],
  57: ["ForestCliffsBorder", "ForestCliffsLowlands", "ForestCliffsMountain", "ForestCliffsMountainEdge", "ForestFirThicket", "ForestGrandFir", "ForestGrandFirSmall"],
  59: ["Pumpkin Plains", "TemperateLowlandsEdge"],
  60: ["DioriteCliffs", "DioriteCliffsM", "DioriteCliffsPeak", "ForestPoplar", "RiverDiorite", "TemperatePlainsCypresshill"],
  61: ["BirchForestMountain", "BirchForestMountainRange"],
  62: ["ForestBaldCypress", "ForestBaldCypressSmall"],
  63: ["RockyPlains", "RockyPlainsM", "RockyPlainsSmall", "TemperateLowlands"],
  64: ["CliffsSmall", "CliffsSmallEdge", "CliffsSmallForest", "CliffsSmallForest2", "CliffsSmallMountain", "CliffsSmallMountainEdge", "CliffsSmallPlateau", "CliffsSmallPlateau2", "CliffsSmallPlateau3", "DesertTropical", "DesertTropicalEdge", "DesertTropicalM", "DesertTropicalPlateau", "Rainforest"],
  65: ["JungleSwampy", "Swampland Bushes", "SwamplandLarge", "TropicalPillars"],
  66: ["Mangrove Forest"],
  67: ["Highlands", "HighlandsPeaks", "RockyMountainPeak1", "RockyMountainPeak2", "RockyMountains", "RockyMountainsPeakEdge", "WoodlandBorder"],
  69: ["Birch Meadow", "TemperatePlainsMeadowM"],
  71: ["BirchForestHighlands", "OceanPlateau", "OceanPlateauLow", "OceanPlateauM", "Taiga", "TemperateLonePeak"],
  72: ["ForestEnchanted", "ForestEnchantedBorder", "ForestEnchantedCaves", "ForestEnchantedGrove", "RiverEnchantedForest", "RoofedForestEnchanted"],
  73: ["RiverSpooky", "SpookyGrove", "SpookyGroveEdge", "SwamplandSpooky"],
  74: ["Forest"],
  75: ["DesertCanyon", "DesertCanyonHigh", "DesertCanyonMid", "DesertRedConifer", "DesertSmallRed", "DesertSmallRedEdge", "ForestDry", "MonumentValleyEdge"],
  76: ["Caverns", "Caverns+", "Caverns+ M", "Caverns Edge", "Caverns M", "ForestPlateauRoofed", "JungleCliffs", "JungleCliffsCanyon", "JungleCliffsCanyonHigh", "JungleCliffsCanyonMid", "JungleCliffsEdge", "JungleCliffsVolcano", "TropicalMountain"],
  77: ["TemperatePlainsM"],
  78: ["SwamplandSmall"],
  79: ["FloatingJungle", "FloatingJungleEdge", "FloatingJungleHole", "JungleFlat", "Rainforest Plateau", "Rainforest Plateau Low"],
  80: ["Redwood Forest", "RedwoodSmall"],
  81: ["FloatingPlains", "RockyHills", "RockyHillsCliff", "RockyHillsEdge"],
  82: ["Autumnal Woods", "Autumnal Woods Hills", "Autumnal Woods M", "Ocean Island", "OceanIslandForest", "RiverAutumnal", "TemperatePlainsAutumnal"],
  83: ["ForestPlateauEdge", "ForestPlateauThicket", "MonumentMountains", "MonumentMountainsPeak1", "MonumentMountainsPeak2", "PlainsCliff", "PlainsCliffM", "RiverUplands", "Uplands", "UplandsBlackSpruce", "UplandsEdge"],
  84: ["TemperatePlainsHeathland"],
  85: ["Alpine", "AlpineConiferSnow", "ForestConiferSnow", "ForestConiferSnow2", "MountainStepsGlacierEdge1", "MountainStepsGlacierEdge2"],
  86: ["Frozen Forest Edge", "TaigaHighlands", "TaigaHighlandsPeak"],
  87: ["RiverSteppe", "Steppe", "SteppeHeathland", "SteppeHill", "SteppeRocks"],
  88: ["Canyon", "CanyonHigh", "CanyonMid", "ForestMountain", "ForestMountainRange", "ForestMountainRangeEdge", "High Cliffs", "HighCliffsEdge", "HighCliffsSummit", "HighCliffsThicket", "HighCliffsThicketMountain"],
  89: ["Extreme Hills Jungle"],
  90: ["ColdForestFirThicketEdge", "ForestGiantSpruceSmall", "RiverTundra", "Tundra", "TundraCliffs", "TundraEdge", "TundraForest"],
  91: ["Dry Plains", "DryPlainsM"],
  92: ["Swampland M"],
  93: ["ForestOakSmall"],
  94: ["Desert M", "DesertBaobabs", "DesertSmall", "Mesa Sandstone M", "OceanIslandDesert"],
  95: ["AlpsForest", "AlpsMountainEdge"],
  98: ["TemperatePlainsOakgrove", "TemperatePlainsOakgroveBorder"],
  99: ["Ice Mountains"],
  100:["DesertOasis", "DesertOasisBorder"],
  101:["Drylands", "DrylandsEdge1", "DrylandsEdge2", "DrylandsIsle"],
  102:["Deep Ocean", "OceanCoral"],
  104:["BirchForestRocky", "ForestHighlands", "OceanForestHighlands", "OceanForestHighlandsBorder"],
  105:["OceanDesertIsland", "OceanForestIsland"],
  107:["Birch Forest M", "FlyingForest"],
  109:["Roofed Fungi Forest"],
  115:["Greatwood", "Greatwood Edge", "Greatwood Lake"],
  127:["The Void"],
  129:["Sunflower Plains"],
  131:["Extreme Hills M"],
  132:["Flower Forest"],
  133:["Taiga M"],
  140:["Arctic", "ArcticEdge", "Ice Plains Spikes", "SnowyLonePeak", "SnowyMesa", "SnowyMesaEdge", "SnowyMesaForest", "SnowyMesaRocks"],
  149:["Jungle M"],
  151:["JungleEdge M"],
  156:["Birch Forest Hills M"],
  157:["Roofed Forest M"],
  158:["Cold Taiga M", "IcyMountainPeak1", "IcyMountainPeak2"],
  160:["Mega Spruce Taiga"],
  161:["Mega Spruce Taiga Hills"],
  162:["Extreme Hills+ M"],
  163:["Savanna M"],
  164:["Savanna Plateau M"],
  165:["Mesa (Bryce)", "Mesa (Bryce) Edge", "Mesa (Bryce) Forest", "Mesa (Bryce) Rocks"],
  166:["Mesa Plateau F M"],
  167:["Mesa Plateau M"],
  182:["DrySavanna", "DrySavannaBorder", "SavannaEdge"],
  183:["RiverHaunted", "Webbed Forest", "Webbed Forest Grove", "Webbed Hills", "Webbed Hills Edge"],
  184:["ForestMeneglin", "ForestMeneglinIsland"],
  185:["Tropical Savanna", "Tropical Savanna Canyon", "Tropical Savanna Canyon High", "Tropical Savanna Canyon Mid", "Tropical Savanna Summit"],
  186:["ForestEnder", "ForestEnderMountain", "ForestEnderValley", "RiverEnder"],
  187:["Frozen Forest"],
  188:["Alien Flower Forest Edge"],
  189:["Alien Hell Edge"],
  190:["Alien Flower Forest"],
  191:["Alien Bamboo Forest"],
  192:["Alien Hell"],
  193:["Alien Bamboo Forest Edge"],
  194:["Alien Bubbles", "Alien Coral", "Alien Jungle", "Alien Lanterns"],
/**/
} as string[][int];

events.onPlayerRightClickItem(function(e as crafttweaker.event.PlayerRightClickItemEvent){
  if(e.player.world.remote) return;
  if(isNull(e.item)) return;

  val id = e.item.definition.id;
  if(id != "biomesoplenty:biome_finder") return;

  val tag = e.item.tag;
  if(isNull(tag)) return;
  
  val biomeIdData = e.item.tag.biomeIDToFind;
  if(isNull(biomeIdData)) return;

  val biomeId = biomeIdData.asInt();

  val biomeList = biomeIdToName[biomeId];
  if(isNull(biomeList)) {
    e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(
      "e2ee.otg.not_otg_biome", biomeId
    ));
    return;
  }

  val biomeName = biomeList[e.player.world.getRandom().nextInt(biomeList.length)];

  e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(
    "e2ee.otg.tp_to", biomeName
  ));
  mods.contenttweaker.Commands.call("/otg tp "~biomeName, e.player, e.player.world, false, true);
  e.cancel();
  e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(
    "e2ee.otg.tp_finished"
  ));
});

//<biomesoplenty:biome_finder>.withTag({found: 0 as byte, biomeIDToFind: 61})
