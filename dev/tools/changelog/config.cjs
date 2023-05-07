// @ts-check

const { readFileSync, existsSync } = require('node:fs')
const { resolve } = require('node:path')
const { execSync } = require('node:child_process')

function execSyncInherit(command) {
  return execSync(command, { stdio: 'inherit' })
}

const writerOpts = {
  transform: (commit, context) => {
    // Add new "description" field that actually both bod + footer with indentation
    if (typeof commit.body === 'string' || typeof commit.footer === 'string')
      commit.description = (`${commit.body ?? ''}${commit.footer ? `\n\n${commit.footer}` : ''}`).trim().split('\n')

    if (typeof commit.hash === 'string') commit.shortHash = commit.hash.substring(0, 7)

    return commit
  },
  finalizeContext: (context, options, commits, keyCommit) => {
    const old_version = execSync('git describe --tags --abbrev=0').toString().trim()

    // Extract old mcinstance
    execSyncInherit(`git show tags/${old_version}:minecraftinstance.json > minecraftinstance_old.json`)

    execSyncInherit(
      'esno mc-tools/packages/curseforge/src/cli.ts modlist --old=minecraftinstance_old.json --ignore=dev/.devonly.ignore --key=secrets/~cf_api_key.txt --template=dev/tools/changelog/modlist.md --output=~mods_changes.md')

    context.modschanges = readFileSync('~mods_changes.md', 'utf8')
    return context
  },
}

addTemplate('template', 'mainTemplate')
;['commit', 'footer', 'header'].forEach(f => addTemplate(f, `${f}Partial`))

function addTemplate(fileName, templateName) {
  const filePath = resolve(__dirname, `${fileName}.hbs`)
  if (existsSync(filePath))
    writerOpts[templateName] = readFileSync(filePath, 'utf8')
}

////////////////////////////////////////////////////////////////////////
module.exports = {
  writerOpts,
}
