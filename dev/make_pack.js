/**
 * @file Make necessary preparations to turn dev version of pack
 * into distributable one
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const { execSync } = require('child_process')
const fs = require('fs-extra')
const path = require('path')
const AdmZip = require('adm-zip')
const {write, end, globs} = require('./lib/utils.js')
const del = require('del')
const replace = require('replace-in-file')

const dot=()=>write('.')

const mcClientPath    = process.cwd()
const ruOverrides     = path.join(mcClientPath, 'dev/lang/ru_ru/')
const distrDir        = 'D:/MEGA_LD-LocksTO/Enigmatica/Distributable/'
const serverPath      = 'D:/mc_server/E2E-Extended-Server/'
const serverOverrides = 'D:/MEGA_LD-LocksTO/Enigmatica/server-overrides/'
const tmpDir          = 'D:/mc_tmp/'
const zipPath         = `${tmpDir}tmp.zip`
const unzipDir        = `${tmpDir}unzip/`

write('Version: ')
const version = execSync('git describe --tags --abbrev=0').toString().trim()
end(version)

const hoursReadmeUpdated = (Date.now() - fs.statSync('CHANGELOG.md').mtime.getTime()) / (1000*60*60)
if(hoursReadmeUpdated > 1) {
  end('❌ You probably forget update CHANGELOG.md')
  // @ts-ignore
  return
}
const comittsAfterTag = 
  parseInt(execSync('git rev-list --count HEAD'    ).toString().trim()) -
  parseInt(execSync('git rev-list --count '+version).toString().trim())
if(comittsAfterTag > 1) {
  end('❌ There is commits after tag. You probably forget add tag')
  // @ts-ignore
  return
}
const lastTagDate = execSync('git show -s --format=%cd '+version).toString().trim().split('\n').pop()
const lastTagHoursPassed = (Date.now() - Date.parse(lastTagDate)) / (1000*60*60)
if(lastTagHoursPassed > 10) {
  end('❌ More than 10 hours from last tag passed. You probably forget add tag')
  // @ts-ignore
  return
}


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
  '.gitattributes',
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

//! ///////////////////////////////////////////////////////////////
// Change Working Directory
process.chdir(unzipDir)
//! ///////////////////////////////////////////////////////////////

write(`removing files&folders ${unzipDir} ... `)
end('removed:', del.sync(removeGlob, {dryRun: false}).length)

/**
 * @param {string} fPath
 */
function addToPack(fPath, dirPath = './') {
  fs.copySync(fPath, path.join(dirPath, path.basename(fPath)))
}

write('Copy mods ')
modsToCopy.forEach((fPath, i) => {
  if(i%50==0) write('.')
  addToPack(fPath, 'mods')
})
end()

/**
 * @param {string} zipPath
 */
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

makeZip(`${distrDir}E2E-Extended_${version}.zip`)

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
  
  // List of client side mods only
  // Get from debug.log by "client side only." search
  '!mods/BetterAdvancements*.jar',
  '!mods/betteranimals-*.jar',
  '!mods/BetterFps*.jar',
  '!mods/bilingualname*.jar',
  '!mods/Biome Border Viewer*.jar',
  '!mods/blockdrops-*.jar',
  '!mods/BQTweaker*.jar',
  '!mods/ChatTweaks_*.jar',
  '!mods/ChunkAnimator*.jar',
  '!mods/Controlling-*.jar',
  '!mods/CTM-MC1*.jar',
  '!mods/CustomBackgrounds-*.jar',
  '!mods/CustomMainMenu*.jar',
  '!mods/DamageTilt*.jar',
  '!mods/DefaultOptions*.jar',
  '!mods/Ding-*.jar',
  '!mods/DiscordSuite*.jar',
  '!mods/DynamicSurroundings*.jar',
  '!mods/dynamistics-*.jar',
  '!mods/ears-forge-*.jar',
  '!mods/FpsReducer*.jar',
  '!mods/grid-*.jar',
  '!mods/IconExporter*.jar',
  '!mods/InvMove*.jar',
  '!mods/jetif-*.jar',
  '!mods/just-enough-harvestcraft-*.jar',
  '!mods/JustEnoughPetroleum-*.jar',
  '!mods/JustEnoughResources-*.jar',
  '!mods/justthetips*.jar',
  '!mods/keywizard*.jar',
  '!mods/lootcapacitortooltips-*.jar',
  '!mods/MemoryTester*.jar',
  '!mods/MineMenu*.jar',
  '!mods/moreoverlays-*.jar',
  '!mods/MouseTweaks*.jar',
  '!mods/Neat*.jar',
  '!mods/NoNVFlash*.jar',
  '!mods/notifymeonstart*.jar',
  '!mods/OldJavaWarning-*.jar',
  '!mods/OreLib*.jar', // Dynamic Surroundings lib
  '!mods/overloadedarmorbar-*.jar',
  '!mods/ping-*.jar',
  '!mods/potiondescriptions-*.jar',
  '!mods/ReAuth*.jar',
  '!mods/ReBind*.jar',
  '!mods/ShoulderSurfing*.jar',
  '!mods/Sound-Physics-*.jar',
  '!mods/ThaumicJEI-*.jar',
  '!mods/Tips-*.jar',
  '!mods/TipTheScales-*.jar',
  '!mods/Toast Control-*.jar',
  '!mods/torohealth*.jar',
  '!mods/toughnessbar*.jar',
  '!mods/WailaHarvestability-mc*.jar',

  // Not sure
/* 
  '!mods/gendustryjei*.jar',
  '!mods/jeibees*.jar',
  '!mods/jeivillagers*.jar',
  '!mods/JustEnoughReactors*.jar',
  '!mods/mekanismfluxified*.jar',
*/
])
.forEach(copyToServer(process.cwd()))
serverOnlyFiles.forEach(copyToServer(mcClientPath))

/**
 * @param {string} relativeSource
 */
function copyToServer(relativeSource) { 
  return (/** @type {string} */ fPath, /** @type {number} */ i)=>{
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
  from: /^\s+"dim": "(?<name>.*)(?<id> \(-?\d+\))"$/,
  to: (/** @type {*[]} */ ...args)=>{
    /** @type {Object<string, string>} */
    const groups = args[args.length - 2]
    return '    "dim": "' + (planetNames[groups.name] ?? groups.name) + groups.id + '"'
  },
})

// Override files
try{fs.copySync(ruOverrides, './', {overwrite: true})}
catch(e){} // eslint-disable-line no-empty

makeZip(`${distrDir}E2E-Extended_${version}_RU.zip`)