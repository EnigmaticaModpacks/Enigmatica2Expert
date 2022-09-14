/**
 * @file Disable mods by givn lists
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { renameSync } from 'fs'

import chalk from 'chalk'
import escapeGlob from 'glob-escape'
import _ from 'lodash'
import terminal_kit from 'terminal-kit'
import fast_glob from 'fast-glob'

const { terminal: term } = terminal_kit

const alreadyDisabled = fast_glob.sync('mods/*.jar.disabled', { dot: true })
const allEnabledMods = fast_glob.sync('mods/*.jar', { dot: true })
const totalModsLength = allEnabledMods.length + alreadyDisabled.length

/** @type {Array<string>} */
const registeredMods = []

/** @type {{name:string,description:string,files:string[],disabledFiles:string[],}[]} */
const reduceLevel = []

const nonexistingEntries = []
const severalVariations = []

/**
 * @param {string} name
 * @param {string} description
 * @param {string} modListText
 */
function addReduceLevel(name, description, modListText) {
  const lines = _.uniq(modListText
    .trim()
    .split('\n')
    .filter(s => s.trim())
    .map((entry) => {
      const files = fast_glob.sync(`mods/${escapeGlob(entry)}*.jar?(.disabled)`, { dot: true })
      if (files.length > 1) severalVariations.push({ entry, files })
      return { entry, path: files[0] }
    }))

  const [exist, nonexist] = _.partition(lines, o => !!o.path)

  nonexistingEntries.push(...nonexist.map(o => o.entry))

  const [disabledFiles, files] = _.partition(exist.map(o => o.path), o => o.endsWith('.disabled'))

  registeredMods.push(...files)
  registeredMods.push(...disabledFiles)
  reduceLevel.push({
    name,
    description,
    files,
    disabledFiles,
  })
}

const getLevelText = i =>
  chalk.rgb(
    244,
    (255 - (255 / reduceLevel.length) * i) | 0,
    59
  )(reduceLevel[i].name)
const getFileName = s => s.replace(/^.*[\\/]/, '')

function exit() {
  // term`\nDone!`
  process.exit()
}

async function init() {
  term.clear()

  const unregMods = _.difference(allEnabledMods, _.uniq(registeredMods))
    .map(getFileName)
  if (unregMods.length) {
    console.warn(
      'This mods unregistered in lists. Add them first :>> ',
      unregMods
    )
  }

  if (nonexistingEntries.length) {
    console.warn(
      'This lines have no files :>> ',
      nonexistingEntries
    )
  }

  if (severalVariations.length) {
    console.warn(
      'This lines have several variations :>> ',
      severalVariations
    )
  }

  term`\nSelect `.brightYellow`Reduce Level`.styleReset()` for `.green(
    totalModsLength
  )` mods`.styleReset()`\n`

  let cumulativeReduction = 0
  const reduceIndex = (
    await term.singleColumnMenu(
      reduceLevel.map(
        (l, i) =>
          `${i + 1}: `
          + `${getLevelText(i)} `
          + `(${chalk.red.dim(
            `-${
              cumulativeReduction += l.files.length + l.disabledFiles.length}`
          )}) `
          + `${chalk.rgb(100, 100, 100)(l.description)}`
      )
    ).promise
  ).selectedIndex

  term('\n')

  const enableBlacklist = _.uniq(
    reduceLevel
      .slice(0, reduceIndex + 1)
      .map(r => r.disabledFiles)
      .flat()
  )
  await renameMods(
    'Enabling Mods',
    _.difference(alreadyDisabled, enableBlacklist),
    false
  )
  await renameMods(
    'Disabling Mods',
    _.uniq(
      reduceLevel
        .slice(0, reduceIndex + 1)
        .map(r => r.files)
        .flat()
    ),
    true
  )

  exit()
}

async function renameMods(actionName, list, toDisable) {
  if (!list.length) return

  const progressBar = term.progressBar({
    title   : actionName.padEnd(15),
    width   : 80,
    syncMode: true,
    items   : list.length,
  })

  const updateBit = 1 / list.length
  let progress = -updateBit
  for (const oldPath of list) {
    const fileName = getFileName(oldPath)
    progressBar.startItem(fileName)

    const newPath = toDisable
      ? `${oldPath}.disabled`
      : oldPath.replace(/\.disabled$/, '')
    renameSync(oldPath, newPath)
    // console.log('old, new :>> ', chalk.yellow(getFileName(oldPath)), chalk.green(getFileName(newPath)))

    progressBar.update((progress += updateBit))
    await new Promise(resolve => setTimeout(resolve, 500 / list.length))
  }
  progressBar.update(1)
  term('\n\n')
}

addReduceLevel('Everything', 'All Mods included', '')

addReduceLevel(
  'Soft',
  'Remove client-only mods, that has impact on performance. Could save ~20 seconds on load time and some FPS.',
  `
betteranimals-
DynamicSurroundings
OreLib
Sound-Physics-
CustomLoadingScreen-
`
)

addReduceLevel(
  'Server Safe',
  'Remove all client-only mods, still multiplayer safe.',
  `
SmoothFont-
simplelogin-
CustomSkinLoader_ForgeLegacy-
moredefaultoptions-
Triumph-
BNBGamingCore-
BNBGamingLib-

EntityCulling-
particleculling-
RenderLib-

Nimble-
Biome Border Viewer
blockdrops-
ChunkAnimator
DiscordSuite
DiscordIntegration-
ears-forge-
grid-
IconExporter
InvMove

potiondescriptions-
NetherPortalFix_
tellme-
DefaultWorldGenerator-port-
bookdisplay-
bogosorter-
CraftingTweaks_
modularui-
LagGoggles-
TickCentral-
smooth-scrolling-everywhere-
scalingguis-
`
)

addReduceLevel(
  'Maximum Speedup',
  'Items and blocks would be removed\nQuest Rewards and Requirments would be replaced to placeholders\nLoot Boxes would output placeholders',
  `
pointer-
tweakedpetroleum-
tweakedpetroleumgas-
betterbiomeblend-
Fluidlogged-API-
lootr-
spectral_edge-forge-
WirelessFluidTerminal-
WirelessInterfaceTerminal-
WirelessPatternTerminal-
Fluid Craft for AE2-
cloche-profit-peripheral-
Xtones-
NotEnoughEnergistics-
thaumtweaks-
TS2K16-
thaumicwonders-
ping-
LetMeSleep-
GamblingStyle-
betterp2p-
AquaAcrobatics-
VillageNames-
ThermalInnovation-
PotionCore-
BiomeTweaker-
thaumicenergistics-
randomtweaks-

BetterMineshaftsForge-
LittleTiles_
QuarkOddities-
MineMenu-
bettercaves-

betteranimalsplus-
JustEnoughCalculation-
ServerTabInfo-
Born In A Barn
spark-
Tinkers' Addons-
TravelersBackpack-
IntegratedCrafting-
SqueezerPatch-
IntegratedTerminals-
Ping-
ThaumicAugmentation-

BiomeTweakerCore-
ido-
thermallogistics-
ThaumicAdditions-
MCTImmersiveTechnology-
PackagedAuto-
PackagedExCrafting-
materialchanger
netherportalspread
deepmoblearningbm
dwmh
keywizard-
tinkersoc
DamageTilt-
hole_filler_mod
Floralchemy
framedcompactdrawers
dcintegration-forge
smallernetherportals
HarderBranchMining
lazy-ae2-
RedstoneRepository-
sampler-
IC2CropBreeding Plugin


avaritiaio
notenoughrtgs-
CookingForBlockheads_
BetterHurtTimer-
BringMeTheRings-
treetweaker-
cryingghasts_
EnableCheats-
animania-1.12.2-base-
animania-1.12.2-extra-
animania-1.12.2-farm-
handoveryouritems_
ae2fc-
MysticalCreations-
MineralTracker-
armorcurve-
fluiddrawers-
tconmodmod-
advancementscreenshot_
Biome Border Viewer-
mekanismfluxified-
Alfinivia-
psio-
scalingfeast-
IndustrialWires-
NC-ReactorBuilder-
kirosblocks-
bilingualname-
ic2patcher-
psicaster-
conditionoverload-
justenoughdrags-
dynamistics-
RFTDimTweak-
portabledrill-
IconExporter-
miningspeed2-
Blood-Smeltery-
uberconduitprobe-
YouDroppedThis-
CoTRO-
gamestagesviewer-
Nutrition-
EmberRootZoo-
clientfixer-`
    // Non-extended mods:
    + `
BetterBuildersWands-
OpenBlocks-
NaturesCompass-
stg-
ae2stuff-
rftoolsctrl-
Patchouli-
CosmeticArmorReworked-
AkashicTome-
RecurrentComplex-
jeibees-
AIImprovements-
diethopper-
Morph-o-Tool-
AttributeFix-
sonarcore-
solcarrot-
architecturecraft-
Scannable-
Pregenerator-
capabilityadapter-

environmentalmaterials-
torohealth-
engineers_doors-
armoreablemobs-
brokenwings-
integratednbt-
PrettyBeaches_
jetif-
ProjectIntelligence-
lootcapacitortooltips-
gendustryjei-
jepb-
plethora-
HorseTweaks_
MemoryTester-
villager-market-
ThaumicComputers-
angermanagement-
JustSleep-
supersoundmuffler-revived_
ModularController-
engineersdecor-
MmmMmmMmmMmm-
ThaumcraftResearchPatcher-
`
)

addReduceLevel(
  'CraftTweaker test',
  'Main mods disabled. Most stuff erroring. Unplayable.',
  `
NoAdvancements-
FantasticLib-
EntityDesyncFix-
ModularAssembly-
ConsoleFilter-
maleksinfinitygauntlet
VanillaFix-
TinkersOreDictCache-
mod-director-launchwrapper-
persistency-
loliasm-
AIReducer-
oauth-
journeymap-
StorageDrawers-
Mantle-
TConstruct-
Chisel-
ironchest-
CoFHCore-
AppleSkin-
CodeChickenLib-
ImmersiveEngineering-
mcjtylib-
CTM-
appliedenergistics2-
AutoRegLib-
extrautils2-
ThermalFoundation-
Botania 
Forgelin-
bdlib-
ThermalExpansion-
Chameleon-
FTBLib-
BiomesOPlenty-
EnderCore-
EnderIO-
reauth-
Placebo-
FTBUtilities-
ThermalDynamics-
Pam's HarvestCraft
QuarkRotN-
Quark-
RebornCore-
JustEnoughResources-
EnderStorage-
twilightforest-
BloodMagic-
CyclopsCore-
industrialforegoing-
ActuallyAdditions-
AppleCore-
DarkUtils-
Draconic-Evolution-
BrandonsCore-
DefaultOptions_
MysticalAgriculture-
valkyrielib-
OpenModsLib-
rftools-
Cucumber-
AdvancedRocketry-
astralsorcery-
CoFHWorld-
cc-tweaked-
BiblioCraft
Cyclic-
ExtremeReactors-
forestry_
industrialcraft-2-
CompactSolars-
JustEnoughReactors-
OpenComputers-

#######################################
Dependent mods
#######################################

zentoolforge-
xnet-
WirelessCraftingTerminal-
tweakersconstruct-
Toast Control-
Tesla-
tesla-core-lib-
rockytweaks-
rftoolsdim-
RedstoneArsenal-
Psi-
PlaneFix-
MysticalAgradditions-
tinker_io-
MCTSmelteryIO-
JustEnoughEnergistics-
harvestcrafttweaker-
WailaHarvestability-
just-enough-harvestcraft-
IntegrationForegoing-
IntegratedTunnels-
IntegratedDynamics-
integrated_proxy-
immersivepetroleum-
ImmersiveCables-
generators-
gendustry-
Flopper-
ExtendedCrafting-
exnihilocreatio-
environmentaltech-
EnderIO-endergy-
EnderTweaker-
DimensionStages-
YNot-
mystagradcompat-
conarm-
CommonCapabilities-
ColossalChests-
CapabilityProxy-
botaniatweaks-
Avaritia-
avaritiaio-
Avaritia_furnace-
Animus-
AEAdditions-
ActuallyBaubles-
AE2WTLib-
armoryexpansion-
JustEnoughPetroleum-
TinkersExtras-
ExCompressum_
NuclearCraft-
compactmachines3-

#######################################
## All other Mods ##
#######################################


Additional-Compression-
Atlas-Lib-
bedpatch-
Bedrock Ores-MC1.12-
BetterAdvancements-
BuildingGadgets-
carryon-
Chunk Pregenerator-V1.12-
ClayBucket-
Clumps-


collective-
colytra-
Controlling-
CraftStudioAPI-universal-
CreativeCore_
culinaryconstruct-
CustomBackgrounds-MC1.12-
CustomMainMenu-MC1.12.2-
deepmoblearning-
demagnetize-
Ding-
dropt-
EndReborn
Extended Item Information-
eyeofdragons-
FarmingForBlockheads_1.12.2-
fencejumper-
findme-
FluxNetworks-
FpsReducer-mc1.12.2-
FTBBackups-
Guide-API-
GunpowderLib-
HammerLib-
horsestandstill-
Hwyla-
ic2-tweaker-
iceandfire-


inworldcrafting-
IvToolkit-
Jade-
JAOPCA-
JAOPCACustom-
KleeSlabs_1.12.2-
libnine-
LibVulpes-
llibrary-
LootTableTweaker-
LootTweaker-
LunatriusCore-
mechanics-
Mekanism-
MekanismGenerators-
mekatweaker-
mia-
modularmachinery-
moreoverlays-
Neat
Netherending-Ores-
NoMobSpawningOnTrees-
obfuscate-
oeintegration-
OldJavaWarning-
OreExcavation-
overloadedarmorbar-
p455w0rdslib-
rats-
Schematica-
zz_DankNull-


phosphor-forge-mc1.12.2-
plustweaks-
questbook-
QuickLeafDecay-MC1.12.1-
randompatches-
RandomThings-MC1.12.2-
Requious Frakto-
ResourceLoader-MC1.12.1-
rttweaker-
rustic-
Satako 1.12-
ScalingHealth-
SilentLib-
simpletrophies-
Surge-
terracartreloaded-
Thaumcraft-
ThaumicInventoryScanning_1.12.2-
ThaumicJEI-
thaumicspeedup-
thaumictinkerer-
Tips-
TipTheScales-
TombManyGraves-
toughnessbar-
u_team_core-
UniDict-
useful_railroads-
vaultopic-
voidislandcontrol-
WanionLib-
WrapUp-
zerocore-
athenaeum-
Baubles-
BetterQuesting-
StandardExpansion-
matc-
plustic-
tconevo-
TinkersComplement-
TinkerToolLeveling-
AE-Net-Vis-Tool-
baubley-heart-canisters-
FTBQuests-
give-me-back-my-hp-
ItemFilters-
JEIExporter-
ocsensors-
tinkersjei-
tmel-
`
)

addReduceLevel(
  'Remove Everything',
  'Every single mod disabled. But what for?',
  `
_bansoukou-
[___MixinCompat-
!mixinbooter-
_MixinBootstrap-
OptiFine_
GameStages-
Bookshelf-
BetterFps-
ContentTweaker-
CraftTweaker2-
crafttweakerutils-
ctintegration-
FastFurnace-
FastWorkbench-
foamfix-
incontrol-
InventoryTweaks-
jei_1.12.2-
HadEnoughItems_
JustEnoughIDs-
modtweaker-
MouseTweaks-
MTLib-
RedstoneFlux-
toolprogression-
unloader-
Wawla-
zenutils-
base-
`
)

init()
