/**
 * @file Gather information about 'purged' items from crafttweaker.log
 * to add them into `jei/itemBlacklist.cfg`
 * Also, sorts and cleanup jei blacklist
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const {config, naturalSort, injectInFile, getCSV, loadText} = require('../lib/utils.js')

const init = module.exports.init = async function(h=require('../automate').defaultHelper) {

  await h.begin('Get files')
  const jeiConfigPath = 'config/jei/itemBlacklist.cfg'
  const purged = getPurged()
  const merged = [
    ...config(jeiConfigPath).advanced.itemBlacklist, 
    ...purged
  ]
  const pure = []
  const removedMods = new Set()
  const modList = getCSV('config/tellme/mod-list-csv.csv')

  await h.begin(`Fixing blacklist with ${merged.length} entries`)
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

  injectInFile(jeiConfigPath, 
    '    S:itemBlacklist <\n',
    '\n     >',
    pure.map(s=>'        '+s).join('\n')
  )


  function getPurged() {
    const totalPurged = [...loadText('crafttweaker.log')
      .matchAll(/^\[INITIALIZATION\]\[CLIENT\]\[INFO\] purged: (.*)$/gm)
    ]

    const purgedItems = totalPurged
    .map(m=>m[1])
    .map(s=>s.match(/<([^>]+)>(.withTag\(.*\))?/)[1])
    .filter(s=>s)
    .map(s=>{
      let [,source, meta] = s.match(/([^:]+:[^:]+)(:(\d+|\*))?/)
      if(meta===':*') meta = ''
      return source + (meta ?? ':0')
    })

    return purgedItems
  }

  h.result(`Purged / Manually Blacklisted: ${purged.length} / ${pure.length - purged.length}`)
}
if(require.main === module) init()