const { readdirSync, renameSync } = require('fs');

readdirSync("./")
  .filter(f => f.match(/^.*\.(csv|txt)$/))
  .forEach(f => renameSync(f, f.replace(/^([\w-]+?)_.*\.(csv|txt)$/, "$1.$2")));