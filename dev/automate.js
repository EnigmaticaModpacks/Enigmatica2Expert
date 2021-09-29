/**
 * @file Script to automatically evaluate all scripts in
 * dev/automation and other folders
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
const glob = require('glob')
const term = require('terminal-kit').terminal
const chalk = require('chalk')

const getFileName = (s) => s.replace(/^.*[\\/]/, '')

const automationList = [
  'config/tellme/!rename&update.js',
  ...glob.sync('dev/automation/*.js'),
  'dev/TCon/tweakerconstruct.js',
  'dev/Patchouli/Patchouli.js',
  'scripts/wrap/_wrapper.js',
]

/**
 * @typedef {Object} Helper
 * @property {string} prop1
 * @property {number} prop2
 * @property {number=} prop3
 * @prop {number} [prop4]
 * @prop {number} [prop5=42]
 */

async function init() {
  term.clear()
  let i = 0
  for(const filePath of automationList) {
    term.moveTo(1 , ++i)
    await startTask(filePath)
  }
}
init()

/**
 * 
 * @param {string} filePath 
 */
async function startTask(filePath) {
  const fileName = getFileName(filePath)
  term(chalk.green(fileName))
  const jsmodule = require.main.require('../' + filePath)
  if(!jsmodule) return

  // const progressBar = term.progressBar({
  //   width: 80,
  //   title: chalk.green(fileName),
  //   items: thingsToDo.length
  // })

  if(jsmodule.init) await jsmodule.init()
}