/**
 * @file Collect information about load time from Debug.log
 * and output it in .MD file
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check


import { writeFileSync } from 'fs'
import { escapeRegex, loadText, defaultHelper } from '../lib/utils.js'
import _ from 'lodash'
import numeral from 'numeral'
import Color from 'color'

import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }

//############################################################################
//############################################################################

const fml_steps = 
`Construction - 
Loading Resources - FMLFileResourcePack:
PreInitialization - 
Initialization - 
InterModComms$IMC - 
PostInitialization - 
LoadComplete - 
ModIdMapping - `
.split('\n')


/**
 * Chart with loading time
 * @type {{[mod: string]: number[]}} Time taken for each FML step
 */
const chart_obj = {}

/**
 * @type {Array<[string, number]>}
 */
let mod_loadTime_typles
function getModLoadTimeTyples() {
  if(mod_loadTime_typles) return mod_loadTime_typles

  const debug_log = loadText('logs/debug.log')

  const fml_steps_rgx = `(${fml_steps.map(l=>escapeRegex(l)).join('|')})`
  const fullSearchRgx = new RegExp(
    escapeRegex('[Client thread/DEBUG] [FML]: Bar Step: ') + fml_steps_rgx + '(.+) took (\\d+.\\d+)s'
    , 'gmi'
  )
  for (const match of debug_log.matchAll(fullSearchRgx)) {
    const [, step, mod, time] = match
    chart_obj[mod] ??= new Array(fml_steps.length).fill(0.0)
    chart_obj[mod][fml_steps.indexOf(step)] += parseFloat(time)
  }

  const chart_arr = Object.entries(chart_obj)
  chart_arr.sort(([,a],[,b])=>_.sum(b)-_.sum(a))

  return mod_loadTime_typles = chart_arr.map(([modName, steps])=>[modName, _.sum(steps)])
}
const _getModLoadTimeTyples = getModLoadTimeTyples
export { _getModLoadTimeTyples as getModLoadTimeTyples }


/** @param {string} s */
function hashCode(s) {
  for(var i = 0, h = 0; i < s.length; i++)
    h = Math.imul(31, h) + s.charCodeAt(i) | 0
  return h
}

/** @param {string|number} s */
function hashCodeColor(s) {
  return Color('yellow')
    .rotate(Math.abs(hashCode(s+'')) % 360)
    .desaturate(0.55)
    .darken(0.15)
    .hex()
    .slice(1)
}

/** @param {string | number} n */
function num(n) {
  return numeral(typeof n == 'string' ? parseFloat(n) : n).format('0.00').padStart(6)
}

export async function init(h=defaultHelper) {


  //############################################################################
  //############################################################################

  /**
   * Add output benchmark data
   * @typedef {Object<string, string>} Benchmark
   * @property {string} key Key to replace in tempelate
   * @property {string} text Text content
   */
  /**
   * @type {Benchmark} chart
   */
  const benchmark = {}

  //############################################################################
  // Numbers

  await h.begin('Parsing debug.log')
  const debug_log = loadText('logs/debug.log')
  const time_arr = getModLoadTimeTyples()

  function getTotalLoadTime() {
    return Math.max(0,...[
      ...debug_log.matchAll(/\[FML\]: Bar Finished: Loading took (.*)s/g)
    ].map(([,v])=>parseFloat(v)))
  }

  const totalTime = getTotalLoadTime()
  benchmark.TOTAL_LOAD_TIME = num(totalTime)+' sec'
  benchmark.TOTAL_LOAD_TIME_MINUTES = num(totalTime/60)+' min'
  const totalModsTime = _.sumBy(time_arr, '1')
  const totalStuffTime = totalTime - totalModsTime
  benchmark.TOTAL_MODS_TIME = num(totalModsTime)
  benchmark.TOTAL_STUF_TIME = num(totalStuffTime)

  //############################################################################
  // Chart 3
  await h.begin('Looking for JEI plugins')
  const showPlugins = 15
  const jeiPlugins = [...debug_log.matchAll(/\[jei\]: Registered +plugin: (.*) in (\d+) ms/g)]
      .map(/** @return {[string, number]} */([, pluginName, time]) => [pluginName, parseInt(time)/1000])
      .sort(([,a],[,b])=>b-a)
  benchmark.JEI_PLUGINS = '\n`\n'+
    jeiPlugins
      .slice(0,showPlugins)
      .concat([[
        'Other '+(jeiPlugins.length-showPlugins)+' Plugins',
        // @ts-ignore
        _.sumBy(jeiPlugins.slice(showPlugins),1)
      ]])
      .map(([a,b])=>num(b)+': '+a)
      .join(';\n')
    +'\n`\n'

  //############################################################################
  // Chart 1
  await h.begin('Mods loading time')
  const showTotal = 20
  const instantMods = time_arr.filter(m=>m[1]<0.1)
  const fastMods    = time_arr.filter(m=>m[1]>=0.1 && m[1]<=1.0)
  const otherMods   = time_arr.slice(showTotal).filter(m=>m[1]>1.0)
  const modLoadArray = time_arr
    .slice(0,showTotal)
    .map(/** @return {[string, number, string]} */([modName, total])=>[hashCodeColor(modName), total, modName])
    .concat([
      ['444444', _(otherMods).sumBy('1'),   otherMods.length + ' Other mods'],
      ['333333', _(fastMods).sumBy('1'),    fastMods.length  + ' \'Fast\' mods (load 1.0s - 0.1s)'],
      ['222222', _(instantMods).sumBy('1'), instantMods.length + ' \'Instant\' mods (load %3C 0.1s)'],
    ])

  /**
   * @param {string} entryName
   * @param {string} description
   * @param { number} timeReduce
   */
  function spliceModLoadArray(entryName, description, timeReduce) {
    const entry = modLoadArray.find(e=>e[2]===entryName)
    if(!entry) return

    if(!timeReduce || isNaN(timeReduce)) return
    const [eColor, eTime, eName] = entry

    modLoadArray.splice(
      modLoadArray.indexOf(entry),
      1,
      [eColor, eTime-timeReduce, eName],
      [
        Color('#'+eColor).darken(0.1).hex().slice(1),
        timeReduce,
        eName + ` (${description})`
      ]
    )
  }

  // Split JEI
  spliceModLoadArray('Just Enough Items', 'Ingredient Filter', parseFloat(
    debug_log.match(/\[jei\]: Building ingredient filter took (\d+\.\d+) s/)?.[1]
  ))
  spliceModLoadArray('Just Enough Items', 'Plugins', _.sumBy(jeiPlugins,'1'))

  // Split CraftTweaker
  const ct_scriptTime = parseFloat(
    loadText('crafttweaker.log')
    .match(/\[INITIALIZATION\]\[CLIENT\]\[INFO\] Completed script loading in: (\d+)ms/m)[1]
  ) / 1000
  spliceModLoadArray('CraftTweaker2', 'Script Loading', ct_scriptTime)

  // Split Tcon
  spliceModLoadArray(
    'Tinkers\' Construct',
    'Oredict Melting',
    parseFloat(
      debug_log.match(/Oredict melting recipes finished in (\d+\.\d+) ms/)?.[1]
    ) / 1000
  )

  benchmark.mods_loading_time = '\n`\n'+
    modLoadArray
    .map(([col, time, name])=>`${col} ${num(time)}s ${name}`)
    .join(';\n')
    +'\n`\n'


  //############################################################################
  // Chart 2
  await h.begin('FML steps details')
  const showDetails = 12
  const detailedNames = time_arr
    .map(([m])=>m)
    .filter(m=>![
      'Just Enough Items',
      'Minecraft Forge',
      'Forge Mod Loader',
    ].includes(m))
    .slice(0,showDetails)
  const maxNameLen = _.maxBy(detailedNames, 'length').length
  const detailedLines = detailedNames.map(modName=>`${
      modName.padEnd(maxNameLen)
    } |${
      chart_obj[modName].map(num).join('|')
    }`)
  // const otherDetailedMods = chart_arr.slice(showDetails).map(([,a])=>a)
  // const otherDetailsByStep = fml_steps.map(()=>0)
  // otherDetailedMods.forEach(r=>r.forEach(
  //   (v,i)=>otherDetailsByStep[i]+=v
  // ))
  // detailedLines.push(
  //   `${('Other ' + otherDetailedMods.length + ' mods').padEnd(maxNameLen)} |` +
  //   otherDetailsByStep.map(num).join('|')
  // )
  benchmark.FML_STEPS_DETAILS = '\n`\n'
    + ''.padEnd(maxNameLen+2) + fml_steps.map((_,i)=>(i+1+'  ').padStart(6)).join(' ') + ';\n'
    + detailedLines.join(';\n')
    +'\n`\n'


  //############################################################################
  // Chart ??
  await h.begin('FML stuff')
  const fmlStuffLookupsRgx = '('+
  `Loading sounds
  Loading Resource - SoundHandler
  ModelLoader: blocks
  ModelLoader: items
  ModelLoader: baking
  Applying remove recipe actions
  Applying remove furnace recipe actions
  Indexing ingredients`
  .split('\n').map(l=>escapeRegex(l)).join('|')
  +')'
  const fmlSomethingTook = [...debug_log.matchAll(/\[Client thread\/DEBUG\] \[FML\]: (.*) took (\d+\.\d+)s/g)]
  const fmlStuffBars = fmlSomethingTook
    .map(/** @return {[string, number]} */([, name, time]) => [name, parseFloat(time)])
    .filter(([name])=>name.match(new RegExp('Bar Finished: '+fmlStuffLookupsRgx)))

  const otherFmlStuffTime = totalStuffTime - _.sumBy(fmlStuffBars, '1')
  fmlStuffBars.push(['Other',otherFmlStuffTime])

  let colPointer = Color('orange').rotate(-20).darken(0.4)
  benchmark.FML_STUFF_TABLE = '\n`\n'
    + fmlStuffBars.map(([name,time],i)=>`${
      i!=fmlStuffBars.length-1
        ? (colPointer=colPointer.rotate(4)).hex().slice(1)
        : '444444'
    } ${
      num(time)+'s'
    } ${
      name.replace(/Bar Finished: /,'')
    }`)
      .join(';\n')
    +'\n`\n'

  //############################################################################
  // Chart
  const fml_steps_trimmed = fml_steps.map(s=>s.replace(/[ -:]*$| - .*$/,''))
  benchmark.FML_STEPS = '\n`\n'
    + fml_steps_trimmed.map((step,i)=>`${i+1}: ${step}`)
      .join(';\n')
    +'\n`\n'


  //############################################################################
  // Chart 4
  benchmark.JEI_ADDITIONALS = '\n`\n' +
    [...debug_log.matchAll(/\[jei\]: (.*) took (\d+\.\d+) (m?s)/g)]
      .map(([, stepName, time, tKey]) => `${stepName.padStart(29)}: ${num(parseFloat(time) * (tKey==='s'?1:0.001))}s`)
      .join(';\n')
    +'\n`\n'

  //############################################################################
  //############################################################################

  await h.begin('Writing file')
  const tempelate = loadText(relative('data/benchmark.md'))

  let benchmark_md = tempelate
  ;[...tempelate.matchAll(
    /(\/\*|<!--)(.*?)((?:\*\/|-->)\s+)(?:\S[\s\S\n]*?\S)(\s+(?:\/\*\*\/|<!---->))/gm
  )].forEach(([whole,p1,key,p2,p3])=>{
    const content = `${p1}${key}${p2}${(benchmark[key] ?? '').trim()}${p3}`
    benchmark_md = benchmark_md.replaceAll(whole, content)
  })

  writeFileSync(relative('data/benchmark.md'), benchmark_md)

  h.result(`Load Time total: ${benchmark.TOTAL_LOAD_TIME}`)
}
// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/* 

console.log(
  '\nFML timings:\n'+
  [...debug_log.matchAll(/\[Client thread\/DEBUG\] \[FML\]: (.*) took (\d+\.\d+)s/g)]
  .map(([, stepName, time]) => [stepName, parseFloat(time)])
  .filter(([,time]) => time > 0.5)
  .filter(([stepName])=>
    !stepName.match(new RegExp('Bar Step: '+fml_steps_rgx+'.*')) &&
    !stepName.match(new RegExp('Bar Finished: '+fml_steps_rgx.replace(/ - /g,'')))
  )
  .map(([stepName, time]) => `${stepName.padEnd(60)}: ${num(time)}s`)
  .join('\n')
)

// Add to lookup:
// [11:53:14] [ic2-poolthread-1/DEBUG] [ic2.Uu]: UU graph built with 19902 nodes after 26220 ms.

*/