/**
 * @file Make necessary preparations to turn dev version of pack
 * into distributable one.
 * Actually its:
 *  1. Clear temporary folders and files from previous script lunch
 *  2. Creating and replacing .zip files of latest tag
 *  3. Replacing files in dedicated server folder
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
import chalk from 'chalk'
import { sync as delSync } from 'del'
import fast_glob from 'fast-glob'
import fs_extra from 'fs-extra'
import git_describe from 'git-describe'
import parseGitignore from 'parse-gitignore'
import { resolve } from 'path'
import simpleGit from 'simple-git'
import yargs from 'yargs'
import terminal_kit from 'terminal-kit'
import { end, execSyncInherit, loadText, saveText, write } from './lib/utils.js'
import { curseMarkdown } from './lib/curseforge.js'

const { gitDescribeSync } = git_describe
const { terminal: term } = terminal_kit
const { rmSync, mkdirSync, existsSync, renameSync } = fs_extra
const git = simpleGit()

const { sync: _globs } = fast_glob

/**
 * Globs with default options `dot: true, onlyFiles: false`
 * @param {string | string[]} source
 * @param {import('../node_modules/fast-glob/out/settings').Options} [options]
 */
const globs = (source, options) =>
  _globs(source, { dot: true, onlyFiles: false, ...options })

const { argv } = yargs(process.argv.slice(2))
  .alias('h', 'help')
  .option('forced', {
    alias: 'f',
    type: 'boolean',
    describe: 'Ignore all checks',
  })
  .option('dryRun', {
    alias: 'd',
    type: 'boolean',
    describe: 'Not create .zip files',
  })
  .option('localSkip', {
    alias: 'l',
    type: 'boolean',
    describe: 'Do not change local server files',
  })
  .option('old', {
    alias: 'o',
    type: 'boolean',
    describe: 'Do not clear previous files in TMP folder, and not clone',
  })

;(async () => {
  const mcClientPath = process.cwd()
  const sZPath = 'D:/Program Files/7-Zip/7z.exe'
  const distrDir = 'E:/YandexDisk/DEVELOPING/Enigmatica/Distributable/'
  const serverRoot = resolve(mcClientPath, 'server/')
  const tmpDir = 'D:/mc_tmp/'
  const tmpOverrides = resolve(tmpDir, 'overrides/')

  /**
   * Write task in log and execute it
   * @param {string} s Name of the tast would be printed in Log
   * @param {()=>void} fn Function of task
   * @param {string} [cwd] Optional working path where task is executed
   */
  const doTask = (s, fn, cwd) => {
    const oldCwd = process.cwd()
    if (cwd) process.chdir(cwd)
    write(chalk.green(s))
    end(fn())
    if (cwd) process.chdir(oldCwd)
  }

  /* 
 █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
*/
  write(`${chalk.gray('-'.repeat(20))}\n`)

  const ckey = chalk.rgb(179, 95, 16)
  const cpress = chalk.rgb(186, 126, 89)

  /**
   * Prompt user to write something and press ENTER or ESC
   * @param {string} message message to show
   * @param {terminal_kit.Terminal.InputFieldOptions} [options] message to show
   * @returns {Promise<string|undefined>} inputted string or undefined
   */
  async function enterString(message, options) {
    term(cpress(message.replace(/(ENTER|ESC)/g, ckey('$1'))))
    const result = await term.inputField({
      cancelable: true,
      ...(options ?? {}),
    }).promise
    term('\n')
    return result
  }

  /**
   * Prompt user to press ENTER or ESC
   * @param {string} message message to show
   * @param {()=>Promise<boolean>} [condition] repeat until true
   * @returns {Promise<boolean>} `true` if ENTER pressed, `false` otherwise
   */
  const pressEnterOrEsc = async (message, condition) => {
    let oneTime = 0
    while (condition ? !(await condition()) : !oneTime++) {
      if ((await enterString(message)) === undefined) return false
    }
    return true
  }

  let STEP = 1

  if (
    await pressEnterOrEsc(
      `[${STEP++}] Press ENTER to perform Automation. Press ESC to skip.`
    )
  ) {
    doTask(`🪓 Doing automation ...\n\n`, () =>
      execSyncInherit('node ./dev/automate.js')
    )
  }

  /*
 ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗██╗      ██████╗  ██████╗ 
██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ██╔═══██╗██╔════╝ 
██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗  ██║     ██║   ██║██║  ███╗
██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║     ██║   ██║██║   ██║
╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗╚██████╔╝╚██████╔╝
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝ ╚═════╝  ╚═════╝ 
*/

  const oldVersion = gitDescribeSync().tag

  const inputVersion = (
    await enterString(`[${STEP++}] Enter next version and press ENTER: `, {
      default: oldVersion,
    })
  ).trim()
  const nextVersion = inputVersion || oldVersion

  if (await pressEnterOrEsc(`[${STEP++}] Generate Changelog? ENTER / ESC.`)) {
    execSyncInherit('node ./dev/changelog.js --next=' + nextVersion)
    await pressEnterOrEsc(`[${STEP++}] Manually fix LATEST.md and press ENTER.`)
    execSyncInherit('node ./dev/changelog.js --append')
    curseMarkdown('changelogs/LATEST.md')
  }

  await pressEnterOrEsc(
    `[${STEP++}] Clear your working tree, rebase, and press ENTER. Press ESC to skip.`,
    async () => (await git.status()).isClean()
  )

  if (await pressEnterOrEsc(`[${STEP++}] Add tag? ENTER / ESC.`)) {
    execSyncInherit(`git tag -a -f -m "Next automating release" ${nextVersion}`)
    // await git.addAnnotatedTag(nextVersion, 'Next automating release')
  }

  /*
██████╗ ██████╗ ███████╗██████╗ ███████╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
██████╔╝██████╔╝█████╗  ██████╔╝█████╗  ██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔═══╝ ██╔══██╗██╔══╝  ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║     ██║  ██║███████╗██║     ███████╗██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
*/

  const devonlyIgnore = parseGitignore(loadText('dev/.devonly.ignore'))

  if (!argv['old']) {
    doTask(`🪓 Clearing tmp folder ${tmpDir} ... `, () => {
      try {
        rmSync(tmpDir, { recursive: true })
        // eslint-disable-next-line no-empty
      } catch (err) {}
      mkdirSync(tmpOverrides, { recursive: true })
    })

    doTask(
      `👬 Cloning latest tag to ${tmpOverrides} ... \n`,
      () => {
        execSyncInherit(`git clone --depth 1 "file://${mcClientPath}" .`)
      },
      tmpOverrides
    )

    doTask(
      `⬅️ Move manifest.json ... `,
      () => renameSync('manifest.json', resolve(tmpDir, 'manifest.json')),
      tmpOverrides
    )

    doTask(
      `🧹 Removing non-release files and folders ... `,
      () => {
        const removeFromEveryPackage = globs(devonlyIgnore)
        return (
          'removed: ' +
          delSync(removeFromEveryPackage, { dryRun: false }).length
        )
      },
      tmpOverrides
    )
  }

  /*
███████╗██╗██████╗ 
╚══███╔╝██║██╔══██╗
  ███╔╝ ██║██████╔╝
 ███╔╝  ██║██╔═══╝ 
███████╗██║██║     
╚══════╝╚═╝╚═╝     
*/

  /**
   * Returns handler for working with Zip file of specified path
   * @param {string} zipPath path to file working with
   */
  function withZip(zipPath) {
    /**
     * Handler to work with zip file
     * @param {string | string[]} params Globs for files add or remove from Zip
     * @param {string} [command] Optional 7Zip command. Default 'a' - Add
     */
    const zipHandler = (params, command = 'a') => {
      if (argv['dryRun'])
        return write(
          `\n${command === 'd' ? '➖' : '➕'} ${
            chalk.bgRgb(10, 10, 10).rgb(30, 30, 30)(zipPath) +
            ' ' +
            chalk.gray(params)
          }`
        )

      const exec7z = (p) =>
        execSyncInherit(`"${sZPath}" ${command} -bso0 "${zipPath}" ${p}`)

      if (!Array.isArray(params)) return exec7z(params)

      const tmpPath = '_tmp_7zip.txt'
      saveText(params.join('\n'), tmpPath)
      exec7z(`@${tmpPath}`)
      delSync(tmpPath)
    }
    return zipHandler
  }

  /********************************************************

███████╗███╗   ██╗
██╔════╝████╗  ██║
█████╗  ██╔██╗ ██║
██╔══╝  ██║╚██╗██║
███████╗██║ ╚████║
╚══════╝╚═╝  ╚═══╝

********************************************************/

  const zipPath_base = `${distrDir}E2E-Extended_${nextVersion}`
  const zipPath_EN = `${zipPath_base}.zip`
  const zipPath_server = `${zipPath_base}_server.zip`
  const zipPath_RU = `${zipPath_base}_RU.zip`

  const isZipsExist =
    !argv['dryRun'] &&
    [zipPath_EN, zipPath_server, zipPath_RU].some((f) => existsSync(f))

  let rewriteOldZipFiles = false
  if (
    isZipsExist &&
    (await pressEnterOrEsc(`[${STEP++}] Rewrite old .zip files? ENTER / ESC`))
  ) {
    rewriteOldZipFiles = true
    doTask(
      `🪓 Removing old zip files ... `,
      () =>
        delSync([zipPath_EN, zipPath_server, zipPath_RU], { force: true })
          .length
    )
  }

  const makeZips = !isZipsExist || rewriteOldZipFiles
  makeZips &&
    doTask(`🏴󠁧󠁢󠁥󠁮󠁧󠁿 Create EN .zip ... \n`, () => withZip(zipPath_EN)('.'), tmpDir)

  /********************************************************

███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝

********************************************************/

  const serveronlyIgnore = parseGitignore(loadText('dev/.serveronly.ignore'))
  const serverFilesList = globs(serveronlyIgnore, { cwd: tmpOverrides })
  const serverModsList = globs(serveronlyIgnore, {
    ignore: [
      ...devonlyIgnore,
      'mods/*-patched.jar', // Bansoukou-patched files should be handled separately
    ],
  }).filter((f) => f.startsWith('mods/'))

  const unpatchedList = globs('mods/*-patched.jar').map((f) =>
    f.replace('-patched.jar', '')
  )

  makeZips &&
    doTask(
      '📥 Create server zip ... \n',
      () => {
        const zip = withZip(zipPath_server)
        zip('.')

        // Delete
        write('\n Deleting excess server files\n')
        const serverRemoveList = globs('*', {
          ignore: serverFilesList,
          cwd: tmpOverrides,
        })
        zip(serverRemoveList, 'd')

        // Add default Server overrites
        write('\n Add server root files\n')
        process.chdir(serverRoot)
        zip('.')

        // Add mods
        write('\n Add server mods\n')
        process.chdir(mcClientPath)
        zip(serverModsList)

        // Add Unpatched by Bansoukou mods
        write('\n Add & Rename Bansoukou-unpatched mods\n')
        const disabledList = unpatchedList.map((f) => f + '.disabled')
        const renameList = unpatchedList.flatMap((f) => [
          f + '.disabled',
          f + '.jar',
        ])
        process.chdir(mcClientPath)
        zip(disabledList)
        zip(renameList, 'rn')
      },
      tmpOverrides
    )

  /*
██████╗ ███████╗██╗     ███████╗ █████╗ ███████╗███████╗
██╔══██╗██╔════╝██║     ██╔════╝██╔══██╗██╔════╝██╔════╝
██████╔╝█████╗  ██║     █████╗  ███████║███████╗█████╗  
██╔══██╗██╔══╝  ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝  
██║  ██║███████╗███████╗███████╗██║  ██║███████║███████╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
*/

  if (await pressEnterOrEsc(`[${STEP++}] FORCE Push tag? ENTER / ESC`)) {
    await git.push(['--force'])
    await git.pushTags(['--force'])
  }

  const inputTitle = await enterString(
    `[${STEP++}] Enter release title and press ENTER. Press ESC to skip release: `
  )

  if (inputTitle !== undefined)
    doTask(`🌍 Releasing on Github ... \n`, () =>
      execSyncInherit(
        'gh release create' +
          ` ${nextVersion}` +
          ` --title="${(nextVersion + ' ' + inputTitle).trim()}"` +
          // ' --draft' +
          ' --repo=Krutoy242/Enigmatica2Expert-Extended' +
          ' --notes-file="./dev/release/~GitHub_notes.md"' +
          ` "${zipPath_EN}"` +
          ` "${zipPath_server}"`
      )
    )

  process.exit(0)
})()
