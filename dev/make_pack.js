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
const { statSync, rmSync, mkdirSync, copySync, existsSync, renameSync } = fs_extra

import { join, relative as _relative, resolve } from 'path'
import { write, end, saveText, loadText } from './lib/utils.js'
import { init as rusificate } from './lang/rusificate.js'
import { sync as delSync } from 'del'
import parseGitignore from 'parse-gitignore'
import _ from 'lodash'
import fast_glob from 'fast-glob'
const { sync: globs } = fast_glob

import chalk from 'chalk'

import simpleGit from 'simple-git'
const git = simpleGit()

import git_describe from 'git-describe'
const { gitDescribeSync } = git_describe

import yargs from 'yargs'
const argv = yargs(process.argv.slice(2))
  .alias('f', 'forced')   .describe('f', 'Ignore all checks')
  .alias('d', 'dryRun')   .describe('d', 'Not create .zip files')
  .alias('l', 'localSkip').describe('l', 'Do not change local server files')
  .alias('o', 'old').describe('o', 'Do not clear previous files in TMP folder, and not clone')
  .alias('h', 'help')
  .argv

;(async ()=>{

/**
 * @param {string} from
 * @param {string} [to]
 */
function relative(from, to) {
  return _relative(to ? from : process.cwd(), to ?? from)
}

const doTask = (/** @type {string} */ s, /** @type {() => void} */ fn, /** @type {string} */ relative) => {
  const oldCwd = process.cwd()
  if(relative) process.chdir(relative)
  write(chalk.green(s))
  end(fn())
  if(relative) process.chdir(oldCwd)
}

function copyFileSync(src, dest, options) {
  if(argv['dryRun']) return write(`\ncopy ${chalk.rgb(60,75,60)(src)} ${chalk.rgb(0,150,210)('=>')} ${chalk.rgb(90,60,60)(dest)}`)
  return copySync(src, dest, options)
}

const mcClientPath    = process.cwd()
const sZPath          = 'D:/Program Files/7-Zip/7z.exe'
const distrDir        = 'D:/MEGA_LD-LocksTO/Enigmatica/Distributable/'
const localServerPath = 'D:/mc_server/Primary E2E-E server Skyblock/'
const serverOverrides = 'D:/MEGA_LD-LocksTO/Enigmatica/server-overrides/'
const serverRoot      = resolve(mcClientPath, 'server/')
const tmpDir          = 'D:/mc_tmp/'
const tmpOverrides    = resolve(tmpDir, 'overrides/')

/*
 ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗
██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝
██║     ███████║█████╗  ██║     █████╔╝ ███████╗
██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ╚════██║
╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████║
 ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝
*/

// function gitExec(/** @type {string} */strCommand) {
//   return execSync('git '+strCommand).toString().trim()
// }

write(`\n${chalk.gray('-'.repeat(10))}\nVersion: `)
// const version = gitExec('describe --tags --abbrev=0')
const version = gitDescribeSync().tag
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
  (await git.log({from:version, to:'HEAD'})).total > 1,
  '❌ There is commits after tag. You probably forget add tag'
)

const lastTagDate = await git.show(['-s', '--format=%cd', version])
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

doTask(`🪓 Removing old zip files ... `, ()=>
  delSync([zipPath_EN, zipPath_server, zipPath_RU], { force: true }).length
)

if(!argv['old']) {
  doTask(`🪓 Clearing tmp folder ${tmpDir} ... `, ()=>{
    try { rmSync(tmpDir, { recursive: true }) } catch(err) {}
    mkdirSync(tmpOverrides, { recursive: true })
  })

  doTask(`👬 Cloning latest tag to ${tmpOverrides} ... \n`, ()=>{
    execSync(`git clone --depth 1 "file://${mcClientPath}" .`, {stdio: 'inherit'})
  }, tmpOverrides)
}

const devonlyIgnore = parseGitignore(loadText('dev/.devonly.ignore'))
doTask(`🧹 Removing non-release files and folders ... `, ()=>{
  const removeFromEveryPackage = globs(devonlyIgnore, {dot: true, onlyFiles: false})
  return 'removed: ' + delSync(removeFromEveryPackage, {dryRun: false}).length
}, tmpOverrides)

if(!argv['old']) {
  doTask(`⬅️ Move manifest.json ... `, ()=>
    renameSync('manifest.json', resolve(tmpDir, 'manifest.json'))
  , tmpOverrides)
}

/*
███████╗██╗██████╗ 
╚══███╔╝██║██╔══██╗
  ███╔╝ ██║██████╔╝
 ███╔╝  ██║██╔═══╝ 
███████╗██║██║     
╚══════╝╚═╝╚═╝     
*/

/**
 * @param {string} zipPath
 */
function withZip(zipPath) {
  return (/** @type {string | string[]} */ params, comand='a') => {
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

doTask(`🏴󠁧󠁢󠁥󠁮󠁧󠁿 Create EN .zip ... \n`, ()=>{
  const zip = withZip(zipPath_EN)
  zip('.')
}, tmpDir)

/********************************************************

███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝

********************************************************/

const serveronlyIgnore = parseGitignore(loadText('dev/.serveronly.ignore'))
const serverFilesList = globs(serveronlyIgnore, { cwd: tmpOverrides, dot: true, onlyFiles: false })
const serverModsList = globs(serveronlyIgnore, { ignore: devonlyIgnore, dot: true, onlyFiles: false }).filter(f=>f.startsWith('mods/'))

/********************************************************
  LOCAL MACHINE
********************************************************/
doTask('💻 Installing local server ... ', ()=>{
  if(argv['localSkip']) return 'localSkip - skip local server install'
  if(!argv['dryRun']) {
    write('\n Deleting old server directories: '+chalk.gray([...serverFilesList, 'mods']))
    delSync(serverFilesList, { cwd: localServerPath })
    delSync(['mods'], { cwd: localServerPath })
  }

  write('\n Copying new files and mods ')
  serverFilesList.forEach(copyToServerFrom(tmpOverrides))
  serverModsList.forEach(copyToServerFrom(mcClientPath))
  
  // TODO: handle server override files
  // Add default Server overrites
  // write('\n Add server root files\n')
  // process.chdir(serverRoot)
  // zip('.')

  // Copy secrets overrides like Discord Integration configs
  copyFileSync(serverOverrides, localServerPath, {overwrite: true})

  // Automatically override files if server set to voidworld
  if(loadText(join(localServerPath, 'server.properties')).match(/level-type\s*=\s*voidworld/gmi)) {
    write('\n Copying skyblock overrides ')
    copyFileSync('dev/skyblock_overrides', localServerPath, {overwrite: true})
  }
})

/**
 * @param {string} relativeSource
 */
function copyToServerFrom(relativeSource='./') { 
  return (/** @type {string} */ fPath, /** @type {number} */ i)=>{
    if(i%50==0) write('.')
    const from = join(relativeSource, fPath)
    const to   = join(localServerPath, fPath)
    copyFileSync(from,to,{overwrite: true})
  }
}

/********************************************************
  DISTRIBUTABLE
********************************************************/


doTask('📥 Create server zip ... \n', ()=>{
  const zip = withZip(zipPath_server)
  zip('.')

  // Delete
  write('\n Deleting excess server files\n')
  const serverRemoveList = globs('*', { ignore: serverFilesList, cwd: tmpOverrides, dot: true, onlyFiles: false })
  zip(serverRemoveList, 'd')

  // Add default Server overrites
  write('\n Add server root files\n')
  process.chdir(serverRoot)
  zip('.')

  // Add mods
  write('\n Add server mods\n')
  process.chdir(mcClientPath)
  zip(serverModsList)
}, tmpOverrides)

/********************************************************

██████╗ ██╗   ██╗
██╔══██╗██║   ██║
██████╔╝██║   ██║
██╔══██╗██║   ██║
██║  ██║╚██████╔╝
╚═╝  ╚═╝ ╚═════╝ 

********************************************************/
/* 
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
 */
})()