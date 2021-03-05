
const fs = require('fs')

const cfg_path = 'config/gendustry/bees.cfg'
const bees_cfg = fs.readFileSync(cfg_path,'utf8')
const match = bees_cfg.match(/^recipes \{ \/\/ == Mutation recipes\n(.*?)\n\}/ms)

if(!match) {
  console.log('  🐝 ERROR: something wrong in ' + cfg_path)
  return
}

function C(str) {
  return str.charAt(0).toUpperCase() + str.slice(1)
}

console.log(
  match[1]
  .split('\n')
  .map(l=>{
    const g = l.match(/^.*?mutation:[^"]+?"(forestry.species|gendustry\.bee)\.?(?<first>\w+)"[^"]+?"(forestry.species|gendustry\.bee)\.?(?<second>\w+)"[^"]+?"(forestry.species|gendustry\.bee)\.?(?<result>\w+)"/m).groups
    return [`${C(g.first)} -> ${C(g.result)}`, `${C(g.second)} -> ${C(g.result)}`]
  })
  .flat()
  .sort()
  .join('\n')
)