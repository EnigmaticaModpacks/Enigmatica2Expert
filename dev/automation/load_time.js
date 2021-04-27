/*

Collect information about load time from Debug.log
and output it

*/

const fs = require('fs')
const {escapeRegex} = require('../lib/utils.js')
const _ = require('lodash')
const numeral = require('numeral')

function num(n) {
  return numeral(parseFloat(n)).format('0.00').padStart(7)
}

var log = fs.readFileSync('logs/debug.log', 'utf8')

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
const fml_steps_rgx = `(${fml_steps.map(l=>escapeRegex(l)).join('|')})`

const fullSearch = escapeRegex('[Client thread/DEBUG] [FML]: Bar Step: ') + fml_steps_rgx + '(.+) took (\\d+.\\d+)s'

const chart_obj = {}
for (const match of log.matchAll(new RegExp(fullSearch, 'gmi'))) {
  const [__, step, mod, time] = match
  chart_obj[mod] ??= new Array(fml_steps.length).fill(0.0)
  chart_obj[mod][fml_steps.indexOf(step)] += parseFloat(time)
}

const chart_arr = Object.entries(chart_obj)
const time_arr = chart_arr.map(([modName, steps])=>[modName, _.sum(steps)])

const entriesSorter = ([_a, a_t], [_b, b_t])=>b_t-a_t
time_arr.sort(entriesSorter)


const boxes = '▉▊▋▌▍▎▏'
function drawBars(arr, width = 60, timeChar = 's') {
  const max = _.maxBy(arr, 1)[1]

  return [
    'Total: '+num(_.sumBy(arr, 1)),
  ...arr.map(([name,time])=>{
    const len = time / max * width
    const whole = len | 0
    const resid = len - whole
    const bar = '█'.repeat(whole) + (resid ? boxes[((1-resid)*(boxes.length-1))|0] : '')
    const t = timeChar=='ms' ? (time+'').padStart(6) : num(time)
    return bar.padEnd(width) + t + timeChar +' '+ name
  })]
}

const totalTime = log.match(/\[Client thread\/INFO\] \[Surge\]: The game loaded in approximately +(.*) seconds./)?.[1] ?? '0'
console.log('MC load time: '+num(parseFloat(totalTime))+'s')
console.log(drawBars(time_arr).slice(0,10).join('\n'))

// ;['CraftTweaker2', 'Thaumcraft', 'Tinkers\' Construct', 'Immersive Engineering'].forEach(mod=>
//   console.log('\n'+mod+':\n'+ chart_obj[mod].map((n,i)=>numeral(n).format('0.00').padStart(7)+' '+fml_steps[i]).join('\n'))
// )

function barsByRegex(rgx, len = 20, tCode = 's') {
  return drawBars(
  [...log.matchAll(rgx)]
  .map(([_match, pluginName, time]) => [pluginName, parseFloat(time) * (tCode==='ms'?1:0.001)])
  .sort(entriesSorter)
  , 30, tCode).slice(0,len).join('\n')
}

console.log(
  '\nCraftTweaker script loading:'+
  num(parseFloat(
  fs.readFileSync('crafttweaker.log', 'utf8')
  .match(/\[INITIALIZATION\]\[CLIENT\]\[INFO\] Completed script loading in: (\d+)ms/m)[1]
  ) / 1000) + 's'
)

console.log(
  '\nJEI Registered categories:\n'+
  barsByRegex(/\[jei\]: Registered +categories: (.*) in (\d+) ms/g, 5)
)

console.log(
  '\nJEI Registered Plugin:\n'+
  barsByRegex(/\[jei\]: Registered +plugin: (.*) in (\d+) ms/g)
)


console.log(
  '\nAdditional JEI info:\n'+
  [...log.matchAll(/\[jei\]: (.*) took (\d+\.\d+) (m?s)/g)]
  .map(([_match, stepName, time, tKey]) => `${stepName.padStart(29)}: ${num(parseFloat(time) * (tKey==='s'?1:0.001))}s`)
  .join('\n')
)