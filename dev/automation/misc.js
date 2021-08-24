const {getCSV} = require('../lib/utils.js')
const fs = require('fs')
const replace = require('replace-in-file')


// Replace actual blocks IDs (they changing when new blocks added)
const blockID = getCSV('config/tellme/blocks-csv.csv').find(
  o => o['Registry name']=='mekanism:oreblock' && o['Display name']=='Osmium Ore'
).BlockID
replace.sync({
  files: 'config/cofh/world/01b_Bedrock.json',
  from: /(oreId: )\d+/g,
  to: '$1'+blockID,
})

// Replace Optifine item ID
const debug_log = fs.readFileSync('logs/debug.log', 'utf8')
const lootChestID = debug_log.match(/Registry: (\d+) bq_standard:loot_chest bq_standard.items.ItemLootChest/)?.[1]
if(lootChestID) {
  replace.sync({
    files: 'resourcepacks/bq_lootchests/assets/minecraft/mcpatcher/cit/loot_chest_*.properties',
    from: /(items=)\d+/gm,
    to: '$1'+lootChestID
  })
}