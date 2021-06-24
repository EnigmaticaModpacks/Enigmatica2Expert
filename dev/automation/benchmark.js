/*

Collect information about load time from Debug.log
and output it

*/

const fs = require('fs')
const path = require('path')
const {escapeRegex} = require('../lib/utils.js')
const _ = require('lodash')
const numeral = require('numeral')
var Color = require('color')

//############################################################################
//############################################################################

var debug_log = fs.readFileSync('logs/debug.log', 'utf8')


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
 * @typedef {Object<string, number[]>} ChartObj
 * @property {string} mod Mod name
 * @property {number} fml_step_time Time taken for each FML step
 */
/**
 * @type {ChartObj} chart
 */
const chart_obj = {}

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

// \[\d+:\d+:\d+\] \[Client thread/TRACE\] \[FML\]: Sending event \w+Event to mod minecraft

const chart_arr = Object.entries(chart_obj)
const time_arr = chart_arr.map(([modName, steps])=>[modName, _.sum(steps)])

const entriesSorter = ([_a, a_t], [_b, b_t])=>b_t-a_t
time_arr.sort(entriesSorter)


//############################################################################
//############################################################################


String.prototype.hashCode = function() {
  var hash = 0, i, chr
  if (this.length === 0) return hash
  for (i = 0; i < this.length; i++) {
    chr   = this.charCodeAt(i)
    hash  = ((hash << 5) - hash) + chr
    hash |= 0 // Convert to 32bit integer
  }
  return hash
}

function hashCodeColor(text) {
  return Color('yellow')
    .rotate(Math.abs((text).hashCode()) % 360)
    .desaturate(0.55)
    .darken(0.15)
    .hex()
    .slice(1)
}

function num(n) {
  return numeral(parseFloat(n)).format('0.00').padStart(6)
}

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

function getTotalLoadTime() {
  return Math.max(0,...[
    ...debug_log.matchAll(/\[FML\]: Bar Finished: Loading took (.*)s/g)
  ].map(([,v])=>parseFloat(v)))
}

const totalTime = getTotalLoadTime()
benchmark.TOTAL_LOAD_TIME = num(totalTime)+' sec'
benchmark.TOTAL_LOAD_TIME_MINUTES = num(totalTime/60)+' min'
const totalModsTime = _.sumBy(time_arr,1)
const totalStuffTime = totalTime - totalModsTime
benchmark.TOTAL_MODS_TIME = num(totalModsTime)
benchmark.TOTAL_STUF_TIME = num(totalStuffTime)

//############################################################################
// Chart 3
const showPlugins = 15
const jeiPlugins = [...debug_log.matchAll(/\[jei\]: Registered +plugin: (.*) in (\d+) ms/g)]
    .map(([, pluginName, time]) => [pluginName, time/1000])
    .sort(entriesSorter)
benchmark.JEI_PLUGINS = '\n`\n'+
  jeiPlugins
    .slice(0,showPlugins)
    .concat([[
      'Other '+(jeiPlugins.length-showPlugins)+' Plugins',
      _.sumBy(jeiPlugins.slice(showPlugins),1)
    ]])
    .map(([a,b])=>num(b)+': '+a)
    .join(';\n')
  +'\n`\n'

//############################################################################
// Chart 1
const showTotal = 20
const instantMods = time_arr.filter(m=>m[1]<0.1)
const fastMods    = time_arr.filter(m=>m[1]>=0.1 && m[1]<=1.0)
const otherMods   = time_arr.slice(showTotal).filter(m=>m[1]>1.0)
const modLoadArray = time_arr
  .slice(0,showTotal)
  .map(([modName, total])=>[hashCodeColor(modName), total, modName])
  .concat([
    ['444444', _(otherMods).sumBy(1),   otherMods.length + ' Other mods'],
    ['333333', _(fastMods).sumBy(1),    fastMods.length  + ' \'Fast\' mods (load 1.0s - 0.1s)'],
    ['222222', _(instantMods).sumBy(1), instantMods.length + ' \'Instant\' mods (load %3C 0.1s)'],
  ])

function spliceModLoadArray(entryName, description, timeReduce) {
  const entry = modLoadArray.find(e=>e[2]===entryName)
  modLoadArray.splice(
    modLoadArray.indexOf(entry),
    1,
    [entry[0], entry[1]-timeReduce, entry[2]],
    [
      Color('#'+entry[0]).darken(0.1).hex().slice(1),
      timeReduce,
      entry[2] + ` (${description})`
    ]
  )
}

// Split JEI
spliceModLoadArray('Just Enough Items', 'Ingredient Filter', parseFloat(
  debug_log.match(/\[jei\]: Building ingredient filter took (\d+\.\d+) s/)?.[1] ?? 0
))
spliceModLoadArray('Just Enough Items', 'Plugins', _.sumBy(jeiPlugins,1))

// Split CraftTweaker
const ct_scriptTime = num(parseFloat(
  fs.readFileSync('crafttweaker.log', 'utf8')
  .match(/\[INITIALIZATION\]\[CLIENT\]\[INFO\] Completed script loading in: (\d+)ms/m)[1]
) / 1000)
spliceModLoadArray('CraftTweaker2', 'Script Loading', ct_scriptTime)

// Split Tcon
spliceModLoadArray(
  'Tinkers\' Construct',
  'Oredict Melting',
  num(parseFloat(
    debug_log.match(/Oredict melting recipes finished in (\d+\.\d+) ms/)[1]
  ) / 1000)
)

benchmark.mods_loading_time = '\n`\n'+
  modLoadArray
  .map(([col, time, name])=>`${col} ${num(time)}s ${name}`)
  .join(';\n')
  +'\n`\n'


//############################################################################
// Chart 2
const showDetails = 10
const detailedNames = time_arr
  .map(([m])=>m)
  .filter(m=>m!='Just Enough Items')
  .slice(0,showDetails)
const maxNameLen = _.maxBy(detailedNames, 'length').length
benchmark.FML_STEPS_DETAILS = '\n`\n'
  + ''.padEnd(maxNameLen+2) + fml_steps.map((_,i)=>(i+1+'  ').padStart(6)).join(' ') + ';\n'
  + detailedNames.map(modName=>`${
    modName.padEnd(maxNameLen)
  } |${
    chart_obj[modName].map(num).join('|')
  }`).join(';\n')
  +'\n`\n'


//############################################################################
// Chart ??
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
  .map(([, name, time]) => [name, parseFloat(time)])
  .filter(([name])=>name.match(new RegExp('Bar Finished: '+fmlStuffLookupsRgx)))

const otherFmlStuffTime = totalStuffTime - _.sumBy(fmlStuffBars, 1)
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

const tempelate = fs.readFileSync(path.resolve(__dirname, 'benchmark.md'),'utf8')

let benchmark_md = tempelate
;[...tempelate.matchAll(
  /(\/\*|<!--)(.*?)((?:\*\/|-->)\s+)(?:\S[\s\S\n]*?\S)(\s+(?:\/\*\*\/|<!---->))/gm
)].forEach(([whole,p1,key,p2,p3])=>{
  const content = `${p1}${key}${p2}${(benchmark[key] ?? '').trim()}${p3}`
  benchmark_md = benchmark_md.replaceAll(whole, content)
})

fs.writeFileSync(path.resolve(__dirname,'benchmark.md'), benchmark_md)

//############################################################################
//############################################################################
////const boxes = '▉▊▋▌▍▎▏'
////function drawBars(arr, width = 60, timeChar = 's') {
////  const max = _.maxBy(arr, 1)[1]
////
////  return [
////    'Total: '+num(_.sumBy(arr, 1)),
////  ...arr.map(([name,time])=>{
////    const len = time / max * width
////    const whole = len | 0
////    const resid = len - whole
////    const bar = '█'.repeat(whole) + (resid ? boxes[((1-resid)*(boxes.length-1))|0] : '')
////    const t = timeChar=='ms' ? (time+'').padStart(6) : num(time)
////    return bar.padEnd(width) + t + timeChar +' '+ name
////  })]
////}
////
////
//////############################################################################
//////############################################################################
////
////
////console.log(
////  '\nCraftTweaker script loading:'+
////  num(parseFloat(
////  fs.readFileSync('crafttweaker.log', 'utf8')
////  .match(/\[INITIALIZATION\]\[CLIENT\]\[INFO\] Completed script loading in: (\d+)ms/m)[1]
////  ) / 1000) + 's'
////)
////
////
////;['CraftTweaker2', 'Thaumcraft', 'Tinkers\' Construct', 'Immersive Engineering'].forEach(mod=>
////  console.log('\n'+mod+':\n'+ chart_obj[mod].map((n,i)=>numeral(n).format('0.00').padStart(7)+' '+fml_steps[i]).join('\n'))
////)
////
////function barsByRegex(rgx, len = 20, tCode = 's') {
////  return drawBars(
////  [...debug_log.matchAll(rgx)]
////  .map(([_match, pluginName, time]) => [pluginName, parseFloat(time) * (tCode==='ms'?1:0.001)])
////  .sort(entriesSorter)
////  , 30, tCode).slice(0,len).join('\n')
////}
////// console.log(
//////   '\nJEI Registered categories:\n'+
//////   barsByRegex(/\[jei\]: Registered +categories: (.*) in (\d+) ms/g, 5)
////// )
////
////console.log(
////  '\nJEI Registered Plugin:\n'+
////  barsByRegex(/\[jei\]: Registered +plugin: (.*) in (\d+) ms/g)
////)
////
////
////console.log(
////  '\nAdditional JEI info:\n'+
////  [...debug_log.matchAll(/\[jei\]: (.*) took (\d+\.\d+) (m?s)/g)]
////  .map(([_match, stepName, time, tKey]) => `${stepName.padStart(29)}: ${num(parseFloat(time) * (tKey==='s'?1:0.001))}s`)
////  .join('\n')
////)
////
////

// console.log(
//   '\nFML timings:\n'+
//   [...debug_log.matchAll(/\[Client thread\/DEBUG\] \[FML\]: (.*) took (\d+\.\d+)s/g)]
//   .map(([, stepName, time]) => [stepName, parseFloat(time)])
//   .filter(([,time]) => time > 0.5)
//   .filter(([stepName])=>
//     !stepName.match(new RegExp('Bar Step: '+fml_steps_rgx+'.*')) &&
//     !stepName.match(new RegExp('Bar Finished: '+fml_steps_rgx.replace(/ - /g,'')))
//   )
//   .map(([stepName, time]) => `${stepName.padEnd(60)}: ${num(time)}s`)
//   .join('\n')
// )