const fs = require('fs')
const replace = require('replace-in-file')


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