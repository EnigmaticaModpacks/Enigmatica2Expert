const {write, config, naturalSort, injectInFile} = require('../lib/utils.js')
const fs = require('fs')
const _ = require('lodash')

write('  📑 jei.js, ')

const purged = [...
fs.readFileSync('crafttweaker.log','utf8')
  .matchAll(/^\[INITIALIZATION\]\[CLIENT\]\[INFO\] purged: (.*)$/gm)
]
.map(m=>m[1])
.map(s=>s.match(/<([^>]+)>(.withTag\(.*\))?/)[1])
write(purged.length + ' is purged, ')

const jeiPath = 'jei/itemBlacklist.cfg'
let itemBlacklist = config(jeiPath).advanced.itemBlacklist
const filtered = purged
.filter(s=>!itemBlacklist.includes(s) && !s.includes('*'))
.map(l=>{
  const [__, source, meta] = l.match(/([^:]+:[^:]+)(:\d+)?/)
  return source + (meta || ':0')
})

write(itemBlacklist.length + ' was, ')

itemBlacklist.push(...filtered)
itemBlacklist = _.uniq(itemBlacklist.sort(naturalSort))

write(itemBlacklist.length + ' becomes, ')

injectInFile('config/'+jeiPath, 
  '    S:itemBlacklist <\n',
  '\n     >',
  itemBlacklist.map(s=>'        '+s).join('\n')
)

write(filtered.length, 'new items blacklisted\n')