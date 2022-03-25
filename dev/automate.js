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
import { defaultHelper, loadText } from './lib/utils.js'
import chalk from 'chalk'
const { Format, MultiBar } = cli_progress
const { gray, green, dim } = chalk
const { ValueFormat } = Format

import mc_benchmark from 'mc-benchmark'

import yargs from 'yargs'
const argv = yargs(process.argv.slice(2))
  .alias('k', 'keep-cache')
  .describe('k', 'Not delete cached files')
  .default('k', true)
  .alias('h', 'hardfail')
  .describe('h', 'Exit script on any error').argv

const getFileName = (/** @type {string} */ s) => s.replace(/^.*[\\/]/, '')
const getExtension = (/** @type {string} */ s) => s.split('.').pop()
const write = (s) => process.stdout.write(s)

/**
 * @typedef {Function} InitCallback
 * @param {typeof defaultHelper} h
 * @param {{[key: string]: any}} options
 * @returns {Promise<any>}
 */

const automationList = [
  'config/tellme/!rename&update.js',
  ...glob.sync('dev/automation/*.js'),
  'dev/TCon/tweakerconstruct.js',
  'dev/Patchouli/Patchouli.js',

  (h, opts) =>
    mc_benchmark({
      readFileSync: loadText,
      defaultLogger: h,
      output: 'dev/benchmarks/latest.md',
    }),
]

// create new container
const multibar = new MultiBar({
  format: '{fileName} ' + gray('[{bar}] | {value}/{total} | {ms} |') + ' {task}',
  hideCursor: true,
  formatValue: (...args) => `${ValueFormat(...args)}`.padStart(3),
})

let starttime = 0
let errorCount = 0
export async function init(options = argv) {
  starttime = new Date().getTime()
  await Promise.all(automationList.map((f, i) => startTask(f, i, options)))
  await new Promise((r) => setTimeout(r, 100))

  if (errorCount <= 0) {
    write('\nSucces!\n')
    process.exit(0)
  } else {
    write('\nFail!\n')
    process.exit(1)
  }
}

// @ts-ignore
if (import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

async function getModule(filePath) {
  return await import(`../${filePath}`)
}

/**
 * @param {string | InitCallback} file
 * @param {number} i
 * @param {typeof argv} options
 */
async function startTask(file, i, options) {
  const isStr = typeof file === 'string'

  /** @type {InitCallback} */
  const jsmodule = isStr ? (await getModule(file))?.init : file
  if (!jsmodule) return

  const fileName = isStr ? getFileName(file) : file.name
  const progressBar = multibar.create(0, 0, {
    fileName: green(fileName.padStart(24)),
    task: '',
    ms: '     ',
  })

  /** @type {typeof defaultHelper} */
  const h = createHelper(progressBar)

  const result = (async () => {
    await new Promise((r) => setTimeout(r, i * 10))
    return jsmodule(h, options)
  })()

  result.then(() => {
    const timeTook = new Date().getTime() - starttime - i * 10
    stopProgressBar(progressBar, h, timeTook)
  })

  result.catch((reason) => console.log('reason :>> ', reason))
  return result
}

function createHelper(progressBar) {
  return !progressBar
    ? defaultHelper
    : {
        taskResult: '',
        begin: async (task, steps) => {
          progressBar.update(progressBar.getTotal(), { task })
          progressBar.setTotal(progressBar.getTotal() + (steps ?? 1))
          await new Promise((r) => setTimeout(r, 1))
        },
        done: (task = '') => {
          progressBar.increment()
          if (task) progressBar.update({ task })
        },
        step: () => {
          progressBar.increment()
        },
        result: function (s) {
          progressBar.update({ task: (this.taskResult += `✔️  ${s.replace(/\b(\d+)\b/g, dim.yellow('$1'))}`) })
        },
        warn: function (s = '?') {
          progressBar.update({ task: (this.taskResult += `⚠️ ${chalk.dim.yellow(`${s}`)}`) })
        },
        error: function (s = '!') {
          errorCount++
          progressBar.update({ task: (this.taskResult += `🛑 ${chalk.dim.red(`${s}`)}`) })
          if (argv['hardfailt']) {
            console.error(`\n\n🛑 Fatal Error:\n${s}`)
            throw new Error(`Fatal Error:\n${s}`)
          }
        },
      }
}

function stopProgressBar(progressBar, h, timeTook) {
  if (!progressBar) return
  progressBar.update({ ms: `${timeTook}`.padStart(5) })
  progressBar.update(progressBar.getTotal())
  if (!h.taskResult) progressBar.update({ task: '✔️' })
  progressBar.stop()
}
