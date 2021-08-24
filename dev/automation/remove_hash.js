const del = require('del')

console.log('  💘 Removing cached files: ',
del.sync([
  'config/thaumicjei_itemstack_aspects.json',
  'config/thaumicspeedup/cache.lock',
], {dryRun: false})
)