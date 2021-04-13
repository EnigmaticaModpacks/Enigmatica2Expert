/*

  Fake iron automatic recipes

  Inspecting all recipes to automatically change some of them  

  Required command before running
  /ct recipes

*/

const fs = require('fs')
const {injectInFile, write, end} = require('../lib/utils.js')

const crafttweaker_log = fs.readFileSync('crafttweaker.log','utf8')
const globMatch = crafttweaker_log.match(/^Recipes:$.*/ms)

if(!globMatch) {
  console.log('  🧥 ERROR: no /ct recipes found in crafttweaker.log')
  return
}

const recipes = globMatch[0]

let matchesCount = 0
const resultArr = []

const whitelist = [
  '<extrautils2:opinium>',
  '<extrautils2:opinium:1>',
  '<immersiveengineering:drillhead:1>',
  '<excompressum:auto_compressor>',
  '<integrateddynamics:squeezer>',
  '<ic2:crafting:18>',
  '<extrautils2:spike_iron>',
  '<valkyrielib:modifier_component>',
  '<environmentaltech:lightning_rod>',
  '<environmentaltech:lightning_cont_6>',
  '<environmentaltech:lightning_cont_5>',
  '<environmentaltech:lightning_cont_4>',
  '<environmentaltech:lightning_cont_3>',
  '<environmentaltech:lightning_cont_2>',
  '<environmentaltech:lightning_cont_1>',
  '<extendedcrafting:table_basic>',
  '<rustic:condenser_advanced>',
  '<draconicevolution:crafting_injector>',
  '<cyclicmagic:ender_eye_orb>',
  '<cyclicmagic:fluid_drain>',
  '<cyclicmagic:dehydrator>',
]

// Add already exist remakes
const fakeIron_zs = fs.readFileSync('scripts/category/fakeIron.zs','utf8')
const remakes = fakeIron_zs.match(/^# Start of automatically generated recipes:$.*/ms)[0]
for (const match of remakes.matchAll(/^remakeShape.{1,4}\("[^"]+", (?<output><[^>]+>).*$/gm)) {
  if(whitelist.includes(match.groups.output))
    resultArr.push(match[0])
}

// Add new
write('  Inspecting recipes ')
for (const match of recipes.matchAll(/^(?<function>recipes\.addShape(?<postfix>d|less))\((?<name>".*?") *, *(?<output>[^, ]*?)(?<count> \* \d+)?, (?<grid>.*)\);$/gm)) {
  const g = match.groups
  matchesCount++
  if(matchesCount%1000==0) write('.')

  const regex = /<(minecraft:iron_|ore:)(ingot|block|nugget)(?:Iron)?>/gi
  if(
    !whitelist.includes(g.output) ||
    !g.grid.match(new RegExp('.*' + regex.source + '.*'))
  ) continue

  const replacedGrid = g.grid.replaceAll(regex, (...args) => args[2].substring(0,1).toUpperCase())
  const line = `remakeShape${g.postfix}(${g.name}, ${g.output}${g.count??''}, ${replacedGrid});`
  resultArr.push(line)
}
end()


injectInFile('scripts/category/fakeIron.zs', 
  '# Start of automatically generated recipes:\n',
  '\n# End of automatically generated recipes',
  resultArr.sort().join('\n')
)

console.log(`  Saved ${resultArr.length} recipes to scripts/category/fakeIron.zs`)