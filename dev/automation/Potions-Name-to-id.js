/*

  Potion Names to ID

  This scripts required for megapotion.zs to work
  There is no way to get Potion ID in game, so
  static list should be generated outside

  Required command before running
  /tellme dump-csv potions

*/

const {injectInFile, begin, end, getCSV} = require('../lib/utils.js')

begin('  Renaming and updating config/tellme/')
require('../../config/tellme/!rename&update.js')
end()

const potionsRegnameTag = getCSV('config/tellme/potions-csv.csv').map(l=>({
  regName: l['Registry name'],
  tag: {Id: parseInt(l['ID'])}
}))

const potions = []
let elixirNameID = []

getCSV('config/tellme/potiontypes-csv.csv').forEach(pot => {
  const found = potionsRegnameTag.find(o => {
    if ( pot.Effects == '') return false
    const match = pot.Effects.match(/^.*Potion:\[reg:(.*?),.*$/)[1]
    return o.regName === match
  })

  if (!found) return

  const normTag = eval(`({${ pot['Effects'].replace(/Potion:\[[^\]]*\],/, '') }})`)
  const potEffect = normTag.PotionEffect

  // Push potion tags
  potions.push({
    name: pot['Registry name'],
    tag: {
      Id: found.tag.Id,
      Amplifier: potEffect.amplifier,
      Duration : potEffect.duration,
    }
  })

  // Push Elixir IDs
  elixirNameID.push({
    name: found.regName,
    Id: found.tag.Id,
  })
})

// Remove duplicates
elixirNameID = elixirNameID.filter((o, i, self) =>
  i === self.findIndex(t => (t.name === o.name && t.Id === o.Id))
)
elixirNameID.sort((a,b)=>a.Id - b.Id)


begin(`  Found potions: ${potions.length}, elixirs: ${elixirNameID.length}. Injecting in zs files.`)

injectInFile('scripts/omegapotion.zs', 
  'static potNameTag as IData[string] = {\n',
  '\n} as IData[string];',
  potions.map(p => {
    const pad = (member, padStart) => `${member}:${p.tag[member].toString().padStart(padStart)}`
    return `  "${(p.name+'"').padEnd(40)}: {${pad('Id',3)}, ${pad('Amplifier',3)}, ${pad('Duration',5)}},`
  }).join('\n')
)

begin('.')

injectInFile('scripts/omegapotion.zs', 
  'static elixirNameId as int[string] = {\n',
  '\n} as int[string];',
  elixirNameID.map(p => `  "${(p.name+'"').padEnd(40)}: ${p.Id},`).join('\n')
)

end()