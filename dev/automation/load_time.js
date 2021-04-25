/*

Collect information about load time from Debug.log
and output it

*/

const fs = require('fs')
const {escapeRegex} = require('../lib/utils.js')
const _ = require('lodash')
const numeral = require('numeral')

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

time_arr.sort(([_a, a_t], [_b, b_t])=>b_t-a_t)


const boxes = '▉▊▋▌▍▎▏'
function drawBars(arr) {
  const width = 50
  const max = _.maxBy(arr, 1)[1]

  return arr.map(([name,time])=>{
    const len = time / max * width
    const whole = len | 0
    const resid = len - whole
    const bar = '█'.repeat(whole) + (resid ? boxes[((1-resid)*(boxes.length-1))|0] : '')
    const t = numeral(time).format('0.00').padStart(7)
    return bar.padEnd(width) + t +' '+ name
  })
}

console.log(drawBars(time_arr).slice(0,10).join('\n'))

;['Thaumcraft', 'Tinkers\' Construct', 'Immersive Engineering'].forEach(mod=>
  console.log('\n'+mod+':\n'+ chart_obj[mod].map((n,i)=>numeral(n).format('0.00').padStart(7)+' '+fml_steps[i]).join('\n'))
)