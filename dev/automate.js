/*

  Script to automatically evaluate all scripts in
  dev/automation and other folders

*/
const glob = require('glob')

const automationList = [
  ...glob.sync('dev/automation/*.js'),
  'dev/TCon/tweakerconstruct.js',
  'dev/Patchouli/Patchouli.js',
  'scripts/wrap/_wrapper.js'
]

for(const filePath of automationList) {
  console.log('📒', filePath)
  require.main.require('../' + filePath)
  console.log('---------------------------\n')
}
