/**
 * @file find all thaumcraft addons for Bonsoukou to remove "HIDDEN" meta
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { writeFileSync } from 'fs'

import zipLocal from 'zip-local'

import { defaultHelper, getModsJars } from '../lib/utils.js'

export async function init(h = defaultHelper) {
  const jarsToInspect = getModsJars()
  await h.begin('Found .JARs', jarsToInspect.length)

  let result = []

  await Promise.all(jarsToInspect.map(handleJar))

  function handleJar(jarPath) {
    return new Promise((resolve, reject) => {
      zipLocal.unzip(jarPath, (error, unzipped) => {
        if (error) reject(error)

        const unzippedfs = unzipped.memory()

        /** @type {string[]} */
        const wholeList = unzippedfs.contents()

        const fileList = wholeList
          .map(
            (f) =>
              /** @type {[folder:string, file:string, full:string]} */ (
                f
                  .match(/^assets\/(.+)research\/(.+)\.json$/)
                  ?.slice(1)
                  .concat(f)
              )
          )
          .filter(Boolean)

        h.step()
        fileList.forEach(([folder, file, full]) =>
          handleResearchJson(folder, file, unzippedfs, full)
        )
        resolve()
      })
    })
  }

  // eslint-disable-next-line max-params
  function handleResearchJson(folder, file, unzippedfs, full) {
    const obj = JSON.parse(unzippedfs.read(full, 'text'))

    obj?.entries?.forEach((o) => {
      if (!o.meta?.includes('HIDDEN')) return
      o.meta.splice(o.meta.indexOf('HIDDEN'), 1)
      const value =
        o.meta.length === 1 ? `,"value":${JSON.stringify(o.meta)}` : ''
      result.push(
        `{"key":"${(o.key + '"').padEnd(35)},"ops":[{"path":"meta","op":"${
          value ? 'replace' : 'remove'
        }"${value}}]}`
      )
    })
  }

  writeFileSync(
    'config/tcresearchpatcher/patches/unhide_all.json',
    `[
   ${result.join('\n  ,')}
]`
  )
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
