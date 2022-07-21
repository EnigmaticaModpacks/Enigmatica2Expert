/**
 * @file Create fixed advancement files for Bonsoukou
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { rename, unlink } from 'fs/promises'
import { join } from 'path'

import fast_glob from 'fast-glob'
import yargs from 'yargs'
import zipLocal from 'zip-local'

import { getRemovedRecipes } from '../lib/tellme.js'
import {
  defaultHelper,
  getModsJars,
  loadText,
  saveObjAsJson,
} from '../lib/utils.js'

const { argv } = yargs(process.argv.slice(2)).option('remove', {
  alias: 'r',
  type: 'boolean',
  describe: 'Remove patched .jar files created by Bansoukou',
})

const { sync: globs } = fast_glob

/**
 * @typedef {import('./advancement-fix').Advancement} Advancement
 */

/**
 * @typedef {{jarPath: string, list: {[archievePath: string]: Advancement}}} AdvancementStore
 */

export async function init(h = defaultHelper) {
  if (argv['remove']) {
    await removePatchedFiles()
    h.result('Patched files removed')
    return
  }

  await h.begin('Loading & parsing debug.log')
  const erroring = getErroring()

  const jarsToInspect = getModsJars()
  await h.begin('Found .JARs', jarsToInspect.length)

  const store = await Promise.all(
    jarsToInspect.map((jarPath) => {
      const p = getJarAdvancements(jarPath)
      p.then(() => h.step())
      return p
    })
  )

  const removedRecipeNames = new Set(getRemovedRecipes().map((r) => r.name))

  const removedResources = fixAdvancements(store, removedRecipeNames)
  removedResources.forEach((rPath) => {
    const resPath = getResourceName(rPath)
    // if (!erroring.resources.has(resPath)) {
    //   throw new Error(
    //     `Found erroring advancement in non-erroring .json file '${resPath}'`
    //   )
    // }
    erroring.resources.delete(resPath)
  })

  console.log('Still Unfixed :>> ', erroring.resources)
}

function removePatchedFiles() {
  return Promise.all(
    globs(['mods/*-patched.jar'], { dot: !0 }).map((fileName) => {
      const base = fileName.replace(/-patched\.jar$/g, '')

      return Promise.all([
        rename(`${base}.disabled`, `${base}.jar`),
        unlink(fileName),
      ])
    })
  )
}

/**
 * Fix current list of erroring advancements
 * Returns list of resourcePathes for changed advancements
 * @param {AdvancementStore[]} jarAdvancements
 * @param {Set<string>} removedRecipeNames
 */
function fixAdvancements(jarAdvancements, removedRecipeNames) {
  /** @type {string[]} */
  const result = []
  jarAdvancements.forEach((store) => {
    for (const [archievePath, advJson] of Object.entries(store.list)) {
      if (
        handleAdvancement(
          store.jarPath,
          archievePath,
          advJson,
          removedRecipeNames
        )
      ) {
        result.push(archievePath)
      }
    }
  })
  return result
}

/**
 * Get list of erroring advancements
 */
function getErroring() {
  let log = loadText('logs/debug.log')
  const serverThreadStart = log.indexOf('[Server thread/')
  if (serverThreadStart !== -1) log = log.substring(serverThreadStart)

  /** @type {Set<string>} */
  const erroringResources = new Set()
  const erroringRecipeNames = new Set(
    [
      ...log.matchAll(
        /Parsing error loading built-in advancement (?<resource>.+)[\n\s]+.+Unknown recipe '(?<recipeName>.+)'/gm
      ),
    ].map(({ groups: { resource, recipeName } }) => {
      erroringResources.add(resource)
      return recipeName
    })
  )

  return {
    names: erroringRecipeNames,
    resources: erroringResources,
  }
}

/**
 * Do necessary things with jar by path
 * @param {string} jarPath
 * @returns {Promise<AdvancementStore>}
 */
function getJarAdvancements(jarPath) {
  return new Promise((resolve, reject) => {
    zipLocal.unzip(jarPath, (error, unzipped) => {
      if (error) reject(error)

      const unzippedfs = unzipped.memory()

      /** @type {string[]} */
      const fileList = unzippedfs
        .contents()
        .filter((archPath) =>
          archPath.match(/^assets\/.+advancements\/.+\.json$/)
        )

      resolve({
        jarPath,
        list: Object.fromEntries(
          fileList.map((archievePath) => [
            archievePath,
            JSON.parse(unzippedfs.read(archievePath, 'text')),
          ])
        ),
      })
    })
  })
}

/**
 * @param {Set<string>} removedRecipeNames
 */
function handleAdvancement(jarPath, archievePath, advJson, removedRecipeNames) {
  if (!mutateAdvancement(removedRecipeNames, advJson)) return false
  saveFile(jarPath, archievePath, advJson)
  return true
}

/**
 * @param {string} jarPath
 * @param {string} archievePath
 * @param {Advancement} advJson
 */
function saveFile(jarPath, archievePath, advJson) {
  saveObjAsJson(advJson, join('bansoukou/', getJarName(jarPath), archievePath))

  // console.log('saveFile :>> ', join(jarName, archievePath))
}

function getJarName(jarPath) {
  return jarPath.match(/^mods\/(.+)\.(jar|disabled)$/)[1]
}

/**
 * Convert file path into Minecraft resourcePath
 * @param {string} filePath
 */
function getResourceName(filePath) {
  const {
    groups: { domain, path },
  } = filePath.match(
    /^assets\/(?<domain>[^/]+)\/advancements\/(?<path>.+)\.json/
  )

  return `${domain}:${path}`.toLocaleLowerCase()
}

/**
 * List of all possible conditions that could lead to error
 * Fix if found and return true
 * @type {((advcnmt: Advancement, isFineRecName: (rName:string)=>boolean)=>boolean)[]}
 */
const mutateList = [
  // Has erroring recipe in rewards
  (advcnmt, isFineRecName) => {
    const filtered = advcnmt.rewards?.recipes?.filter(isFineRecName)
    if (!filtered) return false

    const hasErroringRecipe =
      filtered.length !== advcnmt.rewards?.recipes.length

    // This advancement has only recipes as rewards
    // Remove rewards completely
    if (
      (hasErroringRecipe && Object.keys(advcnmt.rewards).length === 1) ||
      filtered.length <= 0
    ) {
      delete advcnmt.rewards
      return true
    }
  },

  // Has erroring recipe in criteria
  (advcnmt, isFineRecName) => {
    if (!advcnmt.criteria) return false
    let deleted = false
    for (const [key, criteria] of Object.entries(advcnmt.criteria)) {
      if (
        criteria.trigger !== 'minecraft:recipe_unlocked' ||
        isFineRecName(criteria.conditions.recipe)
      )
        continue

      delete advcnmt.criteria[key]
      deleted = true
    }

    if (Object.keys(advcnmt.criteria).length === 0) {
      // No criteria left, warn
      console.log('no criteria for :>> ', advcnmt)
    }

    return deleted
  },
]

/**
 * @arg {Advancement} advcnmt
 * @param {Set<string>} erroringRecipeNames
 */
function mutateAdvancement(erroringRecipeNames, advcnmt) {
  // Remove requirments field if its useless
  if (
    advcnmt.requirements &&
    Object.keys(advcnmt.criteria).every((key) =>
      advcnmt.requirements.some((arr) => arr.some((s) => s === key))
    )
  ) {
    delete advcnmt.requirements
  }

  let wasChanged = false
  mutateList.forEach((mutateCb) => {
    if (mutateCb(advcnmt, (s) => !erroringRecipeNames.has(s))) wasChanged = true
  })

  // This advancment is empty, remove it completely
  // if (Object.keys(advcnmt).length === 1 && advcnmt.criteria) return -1
  if (wasChanged) return 1
  return 0
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
