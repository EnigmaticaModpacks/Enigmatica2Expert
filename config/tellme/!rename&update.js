import { readdirSync, renameSync } from 'fs'

import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }


readdirSync(relative())
  .filter(f => f.match(/^.*\.(csv|txt)$/))
  .forEach(f => renameSync(relative(f), relative(f.replace(/^([\w-]+?)_.*\.(csv|txt)$/, '$1.$2')
  )))