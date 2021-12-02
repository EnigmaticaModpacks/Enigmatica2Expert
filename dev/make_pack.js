/**
 * @file Make necessary preparations to turn dev version of pack
 * into distributable one.
 * Actually its:
 *  1. Clear temporary folders and files from previous script lunch
 *  2. Creating and replacing .zip files of latest tag
 *  3. Replacing files in dedicated server folder
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
import { execSync } from 'child_process'
import fs_extra from 'fs-extra'
const { statSync, rmdirSync, mkdir, copySync, existsSync } = fs_extra
import { join, relative as _relative } from 'path'
import { write, end, globs, saveText } from './lib/utils.js'
import { init as rusificate } from './lang/rusificate.js'
import { sync as delSync } from 'del'
import chalk from 'chalk'
import yargs from 'yargs'

const argv = yargs(process.argv.slice(2))
  .alias('f', 'forced')
  .describe('f', 'Ignore all checks')

  .alias('d', 'dryRun')
  .describe('d', 'Not create .zip files')

  .alias('l', 'localSkip')
  .describe('l', 'Do not change local server files')

  .help('h')
  .alias('h', 'help')
  .argv

/**
 * @param {string} from
 * @param {string} [to]
 */
function relative(from, to) {
  return _relative(to ? from : process.cwd(), to ?? from)
}

const doTask = (/** @type {string} */ s, /** @type {() => void} */ fn) => {
  write(chalk.green(s))
  end(fn())
}

function copyFileSync(src, dest, options) {
  if(argv['dryRun']) return write(`\ncopy ${chalk.rgb(60,75,60)(src)} ${chalk.rgb(0,150,210)('=>')} ${chalk.rgb(90,60,60)(dest)}`)
  return copySync(src, dest, options)
}

function globsRelative(relativePath, globsList) {
  const oldCWD = process.cwd()
  process.chdir(relativePath)
  const result = globs(globsList)
  process.chdir(oldCWD)
  return result
}

const mcClientPath    = process.cwd()
const sZPath          = 'D:/Program Files/7-Zip/7z.exe'
const distrDir        = 'D:/MEGA_LD-LocksTO/Enigmatica/Distributable/'
const serverPath      = 'D:/mc_server/E2E-Extended-Server/'
const serverOverrides = 'D:/MEGA_LD-LocksTO/Enigmatica/server-overrides/'
const tmpDir          = 'D:/mc_tmp/'

/*
 ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗
██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝
██║     ███████║█████╗  ██║     █████╔╝ ███████╗
██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ╚════██║
╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████║
 ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝
*/

function gitExec(/** @type {string} */strCommand) {
  return execSync('git '+strCommand).toString().trim()
}

write(`\n${chalk.gray('-'.repeat(10))}\nVersion: `)
const version = gitExec('describe --tags --abbrev=0')
end(chalk.bold.yellow(version))

const zipPath_base    = `${distrDir}E2E-Extended_${version}`
const zipPath_EN      = `${zipPath_base}.zip`
const zipPath_server  = `${zipPath_base}_server.zip`
const zipPath_RU      = `${zipPath_base}_RU.zip`

function check(condition, message) {
  if(!condition) return
  if(argv['forced'])
    end(chalk.gray('SKIPPING ' + message))
  else {
    end(message)
    process.exit(1)
  }
}

check(
  (Date.now() - statSync('CHANGELOG.md').mtime.getTime()) / (1000*60*60) > 1,
  '❌ You probably forget update CHANGELOG.md'
)

check(
  parseInt(gitExec('rev-list --count HEAD'    )) - parseInt(gitExec('rev-list --count '+version)) > 1,
  '❌ There is commits after tag. You probably forget add tag'
)

const lastTagDate = gitExec('show -s --format=%cd '+version).split('\n').pop()
const lastTagHoursPassed = (Date.now() - Date.parse(lastTagDate)) / (1000*60*60)
check(
  lastTagHoursPassed > 10,
  '❌ More than 10 hours from last tag passed. You probably forget add tag'
)

check(
  !argv['dryRun'] && [zipPath_EN, zipPath_server, zipPath_RU].some(f=>existsSync(f)),
  '❌ One of resulted ZIP files already exist'
)


/*
██████╗ ██████╗ ███████╗██████╗ ███████╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
██████╔╝██████╔╝█████╗  ██████╔╝█████╗  ██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔═══╝ ██╔══██╗██╔══╝  ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║     ██║  ██║███████╗██║     ███████╗██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
*/

doTask(`🪓 Clearing tmp folder ${tmpDir} ... `, ()=>{
  rmdirSync(tmpDir, { recursive: true })
  mkdir(tmpDir, { recursive: true }, (err) => {if (err) throw err})
})

doTask(`🪓 Removing old zip files ... `, ()=>
  delSync([zipPath_EN, zipPath_server, zipPath_RU], { force: true }).length
)

//! ///////////////////////////////////////////////////////////////
// Change Working Directory
process.chdir(tmpDir)
//! ///////////////////////////////////////////////////////////////

doTask(`👬 Cloning latest tag to ${tmpDir} ... \n`, ()=>{
  execSync(`git clone --depth 1 --branch ${version} "${mcClientPath}" .`)
})

const ruOnlyList = globs([
  'resourcepacks/*',
  '!resourcepacks/Better+Gendustry*.zip',
  '!resourcepacks/bq_lootchests',
]).map(f=>relative(f))

// Files to remove from all distributable packages
const removeGlob = [
  '*',
  '.git',
  '.gitignore',
  '.gitattributes',
  'scripts/debug.zs',
  'config/tellme',
  'mods/OptiFine_*.jar',

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

  // Remove files that would be added after to RU zip
  ...ruOnlyList,

  // Remove Mod-depended files
  'config/Extended item information.cfg',
  'config/satako.cfg',
  'config/Probe.cfg',
  'config/advancementscreenshot.cfg',
  'config/sampler.ini',
]

doTask(`🧹 Removing non-release files and folders ... `, ()=>
  'removed: ' + delSync(removeGlob, {dryRun: false}).length
)

/*
███████╗██╗██████╗ 
╚══███╔╝██║██╔══██╗
  ███╔╝ ██║██████╔╝
 ███╔╝  ██║██╔═══╝ 
███████╗██║██║     
╚══════╝╚═╝╚═╝     
*/

function withZip(zipPath) {
  return (params, comand='a') => {
    if(argv['dryRun']) {
      write(`\n${comand==='d'?'➖':'➕'} ${chalk.bgRgb(10,10,10).rgb(30,30,30)(zipPath)+ ' ' + chalk.gray(params)}`)
    } else {
      const exec7z = (p) => execSync(`"${sZPath}" ${comand} -bso0 "${zipPath}" ${p}`, {stdio: 'inherit'})
      if(Array.isArray(params)) {
        const tmpPath = '_tmp_7zip.txt'
        saveText(params.join('\n'), tmpPath)
        exec7z(`@${tmpPath}`)
        delSync(tmpPath)
      } else {
        exec7z(params)
      }
    }
  }
}

/********************************************************

███████╗███╗   ██╗
██╔════╝████╗  ██║
█████╗  ██╔██╗ ██║
██╔══╝  ██║╚██╗██║
███████╗██║ ╚████║
╚══════╝╚═╝  ╚═══╝

********************************************************/

let modsExcludedFromAllPackages = [
  '!mods/Extended Item Information*.jar',
  '!mods/Satako*.jar',
  '!mods/probe-*.jar',
  '!mods/advancementscreenshot_*.jar',
  '!mods/sampler-*.jar',
  '!mods/IconExporter-*.jar',
  '!mods/clientfixer-*.jar',
]
doTask(`🏴󠁧󠁢󠁥󠁮󠁧󠁿 Create EN .zip ... `, ()=>{
  // Mods that would be copied to all packages
  process.chdir(mcClientPath)
  const zip = withZip(zipPath_EN)
  const fileList = globs(['mods/*.jar', ...modsExcludedFromAllPackages])
    .map(f=>relative(f))
  write('\n Adding mods files\n')
  zip(fileList)
  process.chdir(tmpDir)
  
  write('\n Adding all other files\n')
  zip('.')
})

/********************************************************

███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝

********************************************************/

const serverFilesList = globs([
  '*',
  '!minemenu',
  '!resourcepacks',
  // '!resources',
  // 'resources/**/*.lang',
])

const serverModsList = globsRelative(mcClientPath, [
  'mods/*',
  ...modsExcludedFromAllPackages,

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
  // '!mods/justenoughdrags-*.jar', would not working if not installed on server

  '!mods/gamestagesviewer-*.jar',

  // Not sure
/* 
  '!mods/gendustryjei*.jar',
  '!mods/jeibees*.jar',
  '!mods/jeivillagers*.jar',
  '!mods/JustEnoughReactors*.jar',
  '!mods/mekanismfluxified*.jar',
*/
])

/********************************************************
  LOCAL MACHINE
********************************************************/
doTask('💻 Installing local server ... ', ()=>{
  if(argv['localSkip']) return 'localSkip - skip local server install'
  if(!argv['dryRun']) {
    rmdirSync(`${serverPath}/mods/`   , { recursive: true }); write('.')
    rmdirSync(`${serverPath}/config/` , { recursive: true }); write('.')
    rmdirSync(`${serverPath}/scripts/`, { recursive: true }); write('.')
  }

  serverFilesList.forEach(copyToServer(process.cwd()))
  serverModsList.forEach(copyToServer(mcClientPath))

  copyFileSync(serverOverrides, serverPath, {overwrite: true})
})

/**
 * @param {string} relativeSource
 */
function copyToServer(relativeSource) { 
  return (/** @type {string} */ fPath, /** @type {number} */ i)=>{
    if(i%50==0) write('.')
    copyFileSync(
      fPath,
      join(serverPath, relative(relativeSource, fPath)), 
      {overwrite: true}
    )
  }
}

/********************************************************
  DISTRIBUTABLE
********************************************************/
doTask('📥 Create server zip ... ', ()=>{
  copyFileSync(zipPath_EN, zipPath_server, {overwrite: true})
  const zip = withZip(zipPath_server)
  const serverFilesDelete = [
    ...globs(['*', ...serverFilesList.map(f => '!'+relative(f))])     .map(f => relative(f)),
    ...globsRelative(mcClientPath, ['mods/*']).filter(f=>!serverModsList.includes(f)).map(f => relative(mcClientPath, f)),
  ]

  // Delete
  write('\n Deleting server files\n')
  zip(serverFilesDelete, 'd')
  
  // Add default Server overrites
  process.chdir(join(mcClientPath, 'server/'))
  write('\n Add server root files\n')
  zip('.')
  process.chdir(tmpDir)
})

/********************************************************

██████╗ ██╗   ██╗
██╔══██╗██║   ██║
██████╔╝██║   ██║
██╔══██╗██║   ██║
██║  ██║╚██████╔╝
╚═╝  ╚═╝ ╚═════╝ 

********************************************************/

doTask('📥 Create RU zip ... ', () => {
  copyFileSync(zipPath_EN, zipPath_RU, {overwrite: true})
  const zip = withZip(zipPath_RU)
  
  // Add TL.exe
  write('\n Russian files in archive\n')
  zip(`"${distrDir}TL.exe"`)
  
  process.chdir(mcClientPath)
  zip([
    ...ruOnlyList,
    globs([
      'mods/clientfixer-*.jar'
    ]).map(f=>relative(f))
  ])
  process.chdir(tmpDir)

  write('\n')
  zip(rusificate())
})