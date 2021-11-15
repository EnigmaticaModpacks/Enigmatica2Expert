/**
 * @file Script to automatically evaluate all scripts in
 * dev/automation and other folders
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
import glob from 'glob'
import cli_progress from 'cli-progress'
import { defaultHelper } from './lib/utils.js'
import chalk from 'chalk'
const { Format, MultiBar } = cli_progress
const { gray, green, dim } = chalk
const {ValueFormat} = Format

const getFileName = (/** @type {string} */ s) => s.replace(/^.*[\\/]/, '')
const write = (s) => process.stdout.write(s)

const automationList = [
  'config/tellme/!rename&update.js',
  ...glob.sync('dev/automation/*.js'),
  'dev/TCon/tweakerconstruct.js',
  'dev/Patchouli/Patchouli.js',
  'scripts/wrap/_wrapper.js',
]

const automationOrder = [
  'config/tellme/!rename&update.js',      // 262
  'dev/automation/entities.js',           // 435
  'scripts/wrap/_wrapper.js',             // 1649
  'dev/automation/BQ_lang.js',            // 2020
  'dev/automation/errors.js',             // 2114
  'dev/automation/recipe_conflicts.js',   // 2443
  'dev/automation/jei.js',                // 2444
  'dev/automation/tips.js',               // 2452
  'dev/automation/Inject_JS.js',          // 4621
  'dev/automation/XML.js',                // 5154
  'dev/automation/misc.js',               // 5304
  'dev/Patchouli/Patchouli.js',           // 5321
  'dev/automation/EvenBetterQuesting.js', // 5892
  'dev/automation/changelog.js',          // 5936
  'dev/automation/benchmark.js',          // 5956
  'dev/TCon/tweakerconstruct.js',         // 6883
  'dev/automation/modsDiff.js',           // 16091
]

// create new container
const multibar = new MultiBar({
  format: '{fileName} '+gray('[{bar}] | {value}/{total} | {ms} |')+' {task}',
  hideCursor: true,
  // fps: 30,
  // forceRedraw: true,
  formatValue: (...args) => `${ValueFormat(...args)}`.padStart(3)
})

let starttime = 0
const timings = []
async function init() {
  const promises = automationOrder
  .filter(f=>automationList.includes(f))
  .concat(automationOrder
    .filter(f=>!automationList.includes(f))
  ).map(startTask)

  // promises.forEach((p,i)=>p.then(() =>
  //   timings[i] = [automationList[i], new Date().getTime() - starttime - i*10]
  // ))

  starttime = new Date().getTime()
  await Promise.all(promises)
  await new Promise(r => setTimeout(r, 100))

  write('\nSucces!')
  // console.log('sortList :>> ', timings
  //   .sort(([,a],[,b])=>a-b)
  //   .map(([f,ms])=>`'${f}', // ${ms}`)
  // )
  process.exit(0)
}
// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/**
 * @param {string} filePath
 */
async function startTask(filePath, i) {
  const fileName = getFileName(filePath)

  /**
   * @type {import ("./TCon/tweakerconstruct")}
   */
  const jsmodule = await import('../' + filePath)
  if(!jsmodule) return

  const progressBar = multibar.create(0, 0, {
    fileName: green(fileName.padStart(24)),
    task: '',
    ms: '     '
  })

  let hasResult = false

  /** @type {typeof defaultHelper} */
  const h = progressBar ? {
    begin: async (task, steps) => {
      progressBar.update(progressBar.getTotal(), {task})
      progressBar.setTotal(progressBar.getTotal() + (steps??1))
      await new Promise(r => setTimeout(r, 1))
    },
    done : (task='')=>{
      progressBar.increment()
      if(task) progressBar.update({task})
    },
    step : () => {
      progressBar.increment()
    },
    result : (s) => {
      progressBar.update({task: `✔️  ${s.replace(/\b(\d+)\b/g, dim.yellow('$1'))}`})
      hasResult = true
    },
    warn : (s='?') =>  progressBar.update({task: `⚠️ ${chalk.dim.yellow(`${s}`)}`}),
    error: (s='!') => (progressBar.update({task: `🛑 ${chalk.dim.red   (`${s}`)}`}), hasResult = true),
  } : defaultHelper

  // const result = jsmodule.init ? jsmodule.init(h) : runSimpleFile(fileName)
  const result = jsmodule.init 
    ? (async () => {
      await new Promise(r => setTimeout(r, i*10))
      return jsmodule.init(h)
    })()
    : runSimpleFile(/* fileName */)

  result.then(()=>{
    const timeTook = new Date().getTime() - starttime - i*10
    timings[i] = [automationList[i], timeTook]

    if(!progressBar) return
    progressBar.update({ms: `${timeTook}`.padStart(5)})
    progressBar.update(progressBar.getTotal())
    if(!hasResult) progressBar.update({task: '✔️'})
    progressBar.stop()
  })

  result.catch(reason => console.log('reason :>> ', reason))

  // await new Promise(r => setTimeout(r, 10))
  return result
}

async function runSimpleFile(/* fileName */) {
  // write(`\n✔️ ${chalk.green(fileName)}`)
}