const { readdirSync, renameSync } = require('fs');
const path = require("path");

readdirSync(__dirname)
  .filter(f => f.match(/^.*\.(csv|txt)$/))
  .forEach(f => renameSync(path.resolve(__dirname, f), path.resolve(__dirname, 
    f.replace(/^([\w-]+?)_.*\.(csv|txt)$/, "$1.$2")
  )));