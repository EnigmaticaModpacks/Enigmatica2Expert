const {getCSV} = require('../lib/utils.js') // eslint-disable-line no-unused-vars


const ores = getCSV('config/tellme/items-csv.csv')
.map(it=>[
  it['Registry name']+':'+it['Meta/dmg'],
  it['Ore Dict keys'].split(','),
  it['Display name']
])
.filter(([,ore])=>ore.length>0 && ore[0] != '')

const ingots = ores.filter(([_,ore,display]) => {
  if(!display.includes('Ingot')) return false
  for (const o of ore) {
    const m = o.match(/(ingot)([A-Z]\w+)/)
    if(!m) continue
    const [,,name] = m
    if(
      ores.some(([,r])=>r.some(s=>s==='block'+name))
    ) return true
  }
})

console.log('total ingots :>> ', ingots.length)

ingots.forEach(([id,ore,name]) => {
  console.log(`${name}: ${id} : ${ore}`)
})