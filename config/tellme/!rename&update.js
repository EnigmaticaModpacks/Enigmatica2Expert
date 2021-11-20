/**
 * @file Remove excess TellMe output
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
import fs_extra from 'fs-extra'
const { readdirSync, unlink, rename } = fs_extra
import _ from 'lodash'

import { defaultHelper } from '../../dev/lib/utils.js'
import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }

export async function init(h=defaultHelper) {
  _(readdirSync(relative()).filter(f => f.match(/^.*\.(csv|txt)$/)))
  .groupBy(o=>o.replace(/^([\w-]+?)_.*\.(csv|txt)$/, '$1.$2'))
  .forEach((list, key) => {
    list.shift()
    if(list.length <= 0) return
    rename(relative(list.pop()), relative(key))
    list.forEach(f => unlink(relative(f)))
  })
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()