const fs = require('fs')
const {injectInFile, begin} = require('../lib/utils.js')

function loadText(filename, encoding = 'utf8') {
  return fs.readFileSync(filename, encoding)
}

let crafttweaker_log = loadText('crafttweaker.log')
let recipes = crafttweaker_log.match(/^Recipes:$.*/ms)[0]

let matchesCount = 0
let resultArr = []

let whitelist = [
  '<minecraft:anvil>',
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
  '<excompressum:auto_sieve>',
  '<extendedcrafting:table_basic>',
  '<rustic:condenser_advanced>',
  '<draconicevolution:crafting_injector>',
  '<cyclicmagic:ender_eye_orb>',
  '<cyclicmagic:fluid_drain>',
  '<cyclicmagic:dehydrator>',
]

for (const match of recipes.matchAll(/^(?<function>recipes\.addShape(?<postfix>d|less))\((?<name>".*?") *, *(?<output>[^, ]*?)(?<count> \* \d+)?, (?<grid>.*)\);$/gm)) {
  let g = match.groups

  let regex = /<(minecraft:iron_|ore:)(ingot|block|nugget)(?:Iron)?>/gi
  if(
    !whitelist.includes(g.output) ||
    !g.grid.match(new RegExp('.*' + regex.source + '.*'))
  ) continue

  let replacedGrid = g.grid.replaceAll(regex, (...args) => args[2].substring(0,1).toUpperCase())
  let line = `remakeShape${g.postfix}(${g.name}, ${g.output}${g.count??''}, ${replacedGrid});`
  resultArr.push(line)
  matchesCount++
  if(matchesCount%100==0) begin('.')
}
console.log('matchesCount :>> ', matchesCount)

injectInFile('scripts/fakeIron.zs', 
  '# Start of automatically generated recipes:\n',
  resultArr.sort().join('\n'),
  '\n# End of automatically generated recipes'
)