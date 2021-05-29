/*

  Make necessary preparations to turn dev version of pack
  into distributable one

*/
const { execSync } = require('child_process')
const fs = require('fs-extra')
const path = require('path')
const AdmZip = require('adm-zip')
const {write, end, globs} = require('./lib/utils.js')
const del = require('del')
const replace = require('replace-in-file')

const dot=()=>write('.')

const mcClientPath = process.cwd()
const distrDir = 'D:/MEGA_LD-LocksTO/Enigmatica/Distributable/'
const serverPath = 'D:/mc_server/E2E-Extended-Server/'
const serverOverrides = 'D:/MEGA_LD-LocksTO/Enigmatica/server-overrides/'
const ruOverrides = path.join(process.cwd(), 'dev/lang/ru_ru/') 
const tmpDir = 'D:/mc_tmp/'
const zipPath = `${tmpDir}tmp.zip`
const unzipDir = `${tmpDir}unzip/`

write('Version: ')
const version = execSync('git describe --tags --abbrev=0').toString().trim()
end(version)

// Mods that would be copied to all packages
const modsToCopy = globs([
  'mods/*.jar',
  '!mods/Extended Item Information*.jar',
  '!mods/Satako*.jar',
  '!mods/probe-*.jar',
  '!mods/advancementscreenshot_*.jar',
  '!mods/sampler-*.jar',
  '!mods/IconExporter-*.jar',
])

// Server only files
const serverOnlyFiles = globs([
  'mods/sampler-*.jar',
  'config/sampler.ini',
])


// Remove old tmp folder
write(`Clearing ${tmpDir} ... `)
fs.rmdirSync(tmpDir, { recursive: true })
fs.mkdir(tmpDir, { recursive: true }, (err) => {if (err) throw err})
end()

// Get all files from latest Git commit (current branch)
write(`git archive ${zipPath} ... `)
// execSync(`git archive --output=${zipPath} head`)
execSync(`git archive --output=${zipPath} tags/${version}`)
end()

// Extract to folder
write(`extractAllTo ${unzipDir} ... `)
new AdmZip(zipPath).extractAllTo(unzipDir, true)
end()

// Files to remove from all distributable packages
const removeGlob = [
  '*',
  '.gitignore',
  'scripts/debug.zs',
  'config/tellme',

  // Folders to keep
  '!config',
  '!minemenu',
  '!patchouli_books',
  '!resourcepacks',
  '!shaderpacks',
  '!resources',
  '!schematics',
  '!scripts',
  '!structures',

  // Mod-depended files
  'config/Extended item information.cfg',
  'config/satako.cfg',
  'config/Probe.cfg',
  'config/advancementscreenshot.cfg',
  'config/sampler.ini',
]

// Change Working Directory
process.chdir(unzipDir)

write(`removing files&folders ${unzipDir} ... `)
end('removed:', del.sync(removeGlob, {dryRun: false}).length)

function addToPack(fPath, dirPath = './') {
  fs.copySync(fPath, path.join(dirPath, path.basename(fPath)))
}

write('Copy mods ')
modsToCopy.forEach((fPath, i) => {
  if(i%50==0) write('.')
  addToPack(fPath, 'mods')
})
end()

function makeZip(zipPath) {
  const interval = setInterval(()=>write('.'), 500)

  write('Create zip ... ')
  const zip = new AdmZip()
  zip.addLocalFolder('./')
  write(' writing zip ... ')
  zip.writeZip(zipPath)
  clearInterval(interval)
  end()
}

/********************************************************

  EN client

********************************************************/

makeZip(`${distrDir}E2E-Extended_latest.zip`)

/********************************************************

  Server

********************************************************/

write('Installing server. Removing mods ')
fs.rmdirSync(`${serverPath}/mods/`   , { recursive: true }); dot()
fs.rmdirSync(`${serverPath}/scripts/`, { recursive: true }); end()


write('copying files ')
globs([
  '*',
  '!minemenu',
  '!resourcepacks',
  'mods/*',
  '!mods',
  
  // Im sure
  '!mods/ShoulderSurfing*.jar',
  '!mods/IconExporter*.jar',
  '!mods/MouseTweaks*.jar',
  '!mods/InvMove*.jar',
  '!mods/DynamicSurroundings*.jar',
  '!mods/OreLib*.jar', // Dynamic Surroundings lib
  '!mods/ChunkAnimator*.jar',
  '!mods/CustomMainMenu*.jar',
  '!mods/DamageTilt*.jar',
  '!mods/DefaultOptions*.jar',
  '!mods/DiscordSuite*.jar',
  '!mods/FpsReducer*.jar',
  '!mods/MineMenu*.jar',
  '!mods/NoNVFlash*.jar',
  '!mods/keywizard*.jar',
  '!mods/BetterFps*.jar',
  '!mods/betteranimals-*.jar',
  '!mods/Biome Border Viewer*.jar',
  '!mods/notifymeonstart*.jar',
  '!mods/Tips-*.jar',
  '!mods/ChatTweaks_*.jar',
  '!mods/grid-*.jar',
  '!mods/ping-*.jar',
  '!mods/torohealth*.jar',
  '!mods/toughnessbar*.jar',
  '!mods/badwithernocookiereloaded*.jar',
  '!mods/BQTweaker*.jar',
  '!mods/ReAuth*.jar',
  '!mods/ReBind*.jar',
  '!mods/MemoryTester*.jar',
  '!mods/Neat*.jar',
  '!mods/bilingualname*.jar',

  // Not sure
/* 
  '!mods/BetterAdvancements*.jar',
  '!mods/Controlling-*.jar',
  '!mods/dynamistics*.jar',
  '!mods/enough-harvestcraft*.jar',
  '!mods/gendustryjei*.jar',
  '!mods/jeibees*.jar',
  '!mods/jeivillagers*.jar',
  '!mods/jetif*.jar',
  '!mods/JustEnoughPetroleum*.jar',
  '!mods/JustEnoughReactors*.jar',
  '!mods/JustEnoughResources*.jar',
  '!mods/justthetips*.jar',
  '!mods/lootcapacitortooltips*.jar',
  '!mods/mekanismfluxified*.jar',
  '!mods/moreoverlays*.jar',
  '!mods/overloadedarmorbar*.jar',
  '!mods/potiondescriptions*.jar',
  '!mods/TipTheScales*.jar',
  '!mods/Toast Control*.jar',
*/
  // Sure not
  // '!mods/Hwyla*.jar',
  // '!mods/WailaHarvestability*.jar',
  // '!mods/Wawla*.jar',
])
.forEach(copyToServer(process.cwd()))
serverOnlyFiles.forEach(copyToServer(mcClientPath))

function copyToServer(relativeSource) { 
  return (fPath, i)=>{
    if(i%50==0) dot()
    fs.copySync(
      fPath,
      path.join(serverPath, path.relative(relativeSource, fPath)), 
      {overwrite: true}
    )
  }  
}

end()

write('copying overrides ... ')
fs.copySync(serverOverrides, serverPath, {overwrite: true})
end()

/********************************************************

  RU client

********************************************************/

// Add TL.exe
addToPack(`${distrDir}TL.exe`)

// Set Russian Language in default options
replace.sync({
  files: 'config/defaultoptions/options.txt',
  from: /^lang:\w+$/,
  to: 'lang:ru_ru',
})

// Replace world names
const planetNames = {
  'Overworld'       : 'Надмир',
  'Nether'          : 'Ад',
  'The End'         : 'Энд',
  'Twilight Forest' : 'Сумеречный Лес',
  'Ratlantis'       : 'Ратландия',
  'Deep Dark'       : 'Глубокая Тьма',
  'Luna'            : 'Луна',
  'Mercury'         : 'Меркурий',
  'Venus'           : 'Венера',
  'Mars'            : 'Марс',
  'Io'              : 'Ио',
  'Europa'          : 'Европа',
  'Titan'           : 'Титан',
  'Uranus'          : 'Уран',
  'Neptune'         : 'Нептун',
  'Proxima B'       : 'Проксима Б',
  'Terra Nova'      : 'Терра Нова',
  'Novus'           : 'Новус',
  'Stella'          : 'Стелла',
  // 'KELT-2ab'        : 'КЕЛЬТ-2ab',
  // 'KELT-3'          : 'КЕЛЬТ-3',
  // 'KELT-4ab'        : 'КЕЛЬТ-4ab',
  // 'KELT-6a'         : 'КЕЛЬТ-6a',
  'Kepler 0118'     : 'Кеплер 0118',
  'Kepler 0119'     : 'Кеплер 0119',
}
replace.sync({
  files: 'config/jeresources/world-gen.json',
  from: /^    "dim": "(?<name>.*)(?<id> \(\))"$/, // eslint-disable-line no-regex-spaces
  to: (...args)=>{
    const groups = args[args.length - 2]
    return '    "dim": "' + (planetNames[groups.name] ?? groups.name) + groups.id + '"'
  },
})

// Override files
try{fs.copySync(ruOverrides, './', {overwrite: true})}
catch(e){} // eslint-disable-line no-empty

makeZip(`${distrDir}E2E-Extended_RU_latest.zip`)