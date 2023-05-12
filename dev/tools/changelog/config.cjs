// @ts-check

const { readFileSync, existsSync } = require('node:fs')
const { resolve } = require('node:path')
const { execSync } = require('node:child_process')
const compareFunc = require('compare-func')

function execSyncInherit(command) {
  return execSync(command, { stdio: 'inherit' })
}

const renames = {
  feat  : 'Features',
  fix   : 'Bug Fixes',
  perf  : 'Performance Improvements',
  revert: 'Reverts',
}

const discardable = {
  docs    : 'Documentation',
  style   : 'Styles',
  refactor: 'Code Refactoring',
  test    : 'Tests',
  build   : 'Build System',
  ci      : 'Continuous Integration',
  chore   : 'Misc Changes',
}

function transform(commit, context) {
  let discard = true
  const issues = []

  // Handle breaking
  commit.notes.forEach((note) => {
    note.title = 'BREAKING CHANGES'
    discard = false
  })

  // Rename types
  const newType = renames[commit.type]
    ?? (commit.revert ? 'Reverts' : undefined)

  // This is discardable commit type
  if (!newType && discard && discardable[commit.type]) return

  commit.type = newType

  if (commit.scope === '*') commit.scope = ''

  if (typeof commit.hash === 'string')
    commit.shortHash = commit.hash.substring(0, 7)

  // Add new "description" field that actually both bod + footer with indentation
  if (typeof commit.body === 'string' || typeof commit.footer === 'string')
    commit.description = (`${commit.body ?? ''}${commit.footer ? `\n\n${commit.footer}` : ''}`).trim().split('\n')

  // Create issue urls
  if (typeof commit.subject === 'string') {
    let url = context.repository
      ? `${context.host}/${context.owner}/${context.repository}`
      : context.repoUrl
    if (url) {
      url = `${url}/issues/`
      // Issue URLs.
      commit.subject = commit.subject.replace(/#([0-9]+)/g, (_, issue) => {
        issues.push(issue)
        return `[#${issue}](${url}${issue})`
      })
    }
    if (context.host) {
      // User URLs.
      commit.subject = commit.subject.replace(/\B@([a-z0-9](?:-?[a-z0-9/]){0,38})/g, (_, username) => {
        if (username.includes('/'))
          return `@${username}`

        return `[@${username}](${context.host}/${username})`
      })
    }
  }

  // remove references that already appear in the subject
  commit.references = commit.references.filter((reference) => {
    if (!issues.includes(reference.issue))
      return true

    return false
  })

  return commit
}

function finalizeContext(context, options, commits, keyCommit) {
  const old_version = execSync('git describe --tags --abbrev=0').toString().trim()

  // Extract old mcinstance
  execSyncInherit(`git show tags/${old_version}:minecraftinstance.json > minecraftinstance_old.json`)

  execSyncInherit(
    'esno mc-tools/packages/curseforge/src/cli.ts modlist'
    + ' --old=minecraftinstance_old.json'
    + ' --ignore=dev/.devonly.ignore'
    + ' --key=secrets/~cf_api_key.txt'
    + ' --template=dev/tools/changelog/modlist.md'
    + ' --output=~mods_changes.md'
  )

  context.modschanges = readFileSync('~mods_changes.md', 'utf8')

  context.commitGroups.forEach((g, i) => {
    if (!g.title) g.title = 'Misc'

    const groupedBy = {}

    g.commits.forEach((c) => {
      (groupedBy[c.scope || ''] ??= []).push(c)
      delete c.scope
    })

    delete g.commits

    g.scopes = Object.entries(groupedBy)
      .map(([scope, commits]) => ({ scope, commits }))
  })

  return context
}

const writerOpts = {
  transform,
  finalizeContext,
  groupBy         : 'type',
  commitGroupsSort: 'title',
  commitsSort     : ['scope', 'subject'],
  noteGroupsSort  : 'title',
  notesSort       : compareFunc,
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
  parserOpts: {
    headerPattern       : /^(\w*)(?:\((.*)\))?: (.*)$/,
    headerCorrespondence: ['type', 'scope', 'subject'],
    noteKeywords        : ['BREAKING CHANGE'],
    revertPattern       : /^(?:Revert|revert:)\s"?([\s\S]+?)"?\s*This reverts commit (\w*)\./i,
    revertCorrespondence: ['header', 'hash'],
  },
}
