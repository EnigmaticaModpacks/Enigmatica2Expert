const { readdirSync, renameSync } = require('fs')
const { resolve } = require('path')

readdirSync(__dirname)
  .filter(f => f.match(/^.*\.(csv|txt)$/))
  .forEach(f => renameSync(resolve(__dirname, f), resolve(__dirname, 
    f.replace(/^([\w-]+?)_.*\.(csv|txt)$/, '$1.$2')
  )))