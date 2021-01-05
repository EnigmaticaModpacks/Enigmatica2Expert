/*

  Make necessary preparations to turn dev version of pack
  into distributable one

*/
const { execSync } = require('child_process')
const fs = require('fs-extra')
const path = require('path')
const AdmZip = require('adm-zip')
const {write, end, globs} = require('./lib/utils.js')
const glob = require('glob')
const del = require('del')
const copyfiles = require('copyfiles')
const replace = require('replace-in-file')

const dot=()=>write('.')

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

const modsToCopy = globs([
  'mods/*.jar',
  '!mods/Extended Item Information*.jar',
  '!mods/Satako*.jar',
  '!mods/probe-*.jar',
])


// Remove old tmp folder
write(`Clearing ${tmpDir} ... `)
fs.rmdirSync(tmpDir, { recursive: true })
fs.mkdir(tmpDir, { recursive: true }, (err) => {if (err) throw err})
end()

// Get all files from latest Git commit (current branch)
write(`git archive ${zipPath} ... `)
execSync(`git archive --output=${zipPath} head`)
end()

// Extract to folder
write(`extractAllTo ${unzipDir} ... `)
new AdmZip(zipPath).extractAllTo(unzipDir, true)
end()

const removeGlob = [
  '*',
  '.gitignore',
  'scripts/debug.zs',
  '!config',
  '!minemenu',
  '!patchouli_books',
  '!resourcepacks',
  '!resources',
  '!schematics',
  '!scripts',
  '!structures',
]

// Change Working Directory
process.chdir(unzipDir)// eslint-disable-line no-undef

write(`removing files&folders ${unzipDir} ... `)
end('removed:', del.sync(removeGlob, {dryRun: false}).length)

function addToPack(fPath, dirPath = './') {
  fs.copySync(fPath, path.join(dirPath, path.basename(fPath)))
}

write('Copy mods ')
modsToCopy.forEach((fPath, i) => {
  if(i%50==0) write('.')
  // zip.addFile(fPath, path.join('mods', path.basename(fPath)))
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

makeZip(`${distrDir}~E2E-Extended_${version}.zip`)

/********************************************************

  Server

********************************************************/

write('Installing server. Removing mods ')
fs.rmdirSync(`${serverPath}/mods/`   , { recursive: true })
dot()
fs.rmdirSync(`${serverPath}/scripts/`, { recursive: true })
end()

write('copying files ')
globs([
  '*',
  '!minemenu',
]).forEach((fPath, i)=>{
  if(i%50==0) dot()
  fs.copySync(
    fPath,
    path.join(serverPath, path.relative(process.cwd(), fPath)), // eslint-disable-line no-undef
    {overwrite: true}
  )
})
end()

write('copying overrides ... ')
fs.copySync(serverOverrides, serverPath, {overwrite: true})
end()

/********************************************************

  RU client

********************************************************/

// Add TL.exe
addToPack(`${distrDir}TL.exe`)

replace.sync({
  files: 'config/defaultoptions/options.txt',
  from: /^lang:\w+$/,
  to: 'lang:ru_ru',
})

fs.copySync(ruOverrides, './', {overwrite: true})

makeZip(`${distrDir}~E2E-Extended_RU_${version}.zip`)