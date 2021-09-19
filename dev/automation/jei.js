/**
 * @file Gather information about 'purged' items from crafttweaker.log
 * to add them into `jei/itemBlacklist.cfg`
 * Also, sorts and cleanup jei blacklist
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const {write, config, naturalSort, injectInFile, getCSV} = require('../lib/utils.js')
const fs = require('fs')

const init = module.exports.init = async function() {
  write('  📑 jei.js, ')

  const jeiPath = 'jei/itemBlacklist.cfg'
  const merged = [
    ...config(jeiPath).advanced.itemBlacklist, 
    ...getPurged()
  ]
  const pure = []
  const removedMods = new Set()
  const modList = getCSV('config/tellme/mod-list-csv.csv')
  merged.forEach((s,i)=>{
    // If duplicate
    const next = merged.slice(i+1)
    if (next.includes(s)) return

    // If wildcarded
    const def = s.match(/([^:]+:[^:]+)[:;].+/)?.[1]
    if (def && merged.includes(def)) return

    // If mod not exist
    const mod = s.split(':')[0]
    if (!['fluid','gas'].includes(mod) && !modList.some(m=>m.ModID===mod)) {
      removedMods.add(mod)
      return
    }

    pure.push(s)
  })

  pure.sort(naturalSort)
  write(', becomes: ' + pure.length)
  write(', removed mods:', [...removedMods])

  injectInFile('config/'+jeiPath, 
    '    S:itemBlacklist <\n',
    '\n     >',
    pure.map(s=>'        '+s).join('\n')
  )


  function getPurged() {
    const totalPurged = [...fs.readFileSync('crafttweaker.log','utf8')
      .matchAll(/^\[INITIALIZATION\]\[CLIENT\]\[INFO\] purged: (.*)$/gm)
    ]
    write(' total purged found:', totalPurged.length)

    const purgedItems = totalPurged
    .map(m=>m[1])
    .map(s=>s.match(/<([^>]+)>(.withTag\(.*\))?/)[1])
    .filter(s=>s)
    .map(s=>{
      let [,source, meta] = s.match(/([^:]+:[^:]+)(:(\d+|\*))?/)
      if(meta===':*') meta = ''
      return source + (meta ?? ':0')
    })

    write(' after filtered:', purgedItems.length)
    return purgedItems
  }
}
if(require.main === module) init()