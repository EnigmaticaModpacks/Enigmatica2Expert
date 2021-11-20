/**
 * @file Translate misc files on Russian language
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */
//@ts-check

import replace_in_file from 'replace-in-file'
import { defaultHelper } from '../lib/utils.js'


export function init(h=defaultHelper) {
  h.begin('Rusificate Files')

  
  // Set Russian Language in default options
  const replacedInOptions = replace_in_file.sync({
    files: 'config/defaultoptions/options.txt',
    from: /^lang:\w+$/gm,
    to: 'lang:ru_ru',
  })

  // Replace world names
  const planetNames = {
    'Overworld'       : 'Надмир',
    'Nether'          : 'Ад',
    'The End'         : 'Энд',
    'Twilight Forest' : 'Сумеречный Лес',
    'Ratlantis'       : 'Ратландия',
    'Deep Dark'       : 'Глубокая Тьма',
    'Luna'            : 'Луна',
    'Mercury'         : 'Меркурий',
    'Venus'           : 'Венера',
    'Mars'            : 'Марс',
    'Io'              : 'Ио',
    'Europa'          : 'Европа',
    'Titan'           : 'Титан',
    'Uranus'          : 'Уран',
    'Neptune'         : 'Нептун',
    'Proxima B'       : 'Проксима Б',
    'Terra Nova'      : 'Терра Нова',
    'Novus'           : 'Новус',
    'Stella'          : 'Стелла',
    'KELT-2ab'        : 'КЕЛЬТ-2ab',
    'KELT-3'          : 'КЕЛЬТ-3',
    'KELT-4ab'        : 'КЕЛЬТ-4ab',
    'KELT-6a'         : 'КЕЛЬТ-6a',
    'Kepler 0118'     : 'Кеплер 0118',
    'Kepler 0119'     : 'Кеплер 0119',
    'Spectre'         : 'Спектр',
    'RFTools Dimension': 'Измерение РФИнструментов',
  }
  const replacedDims = replace_in_file.sync({
    files: 'config/jeresources/world-gen.json',
    from: /^\s+"dim": "(?<name>.*)(?<id> \(-?\d+\))"$/gm,
    to: (/** @type {*[]} */ ...args)=>{
      /** @type {Object<string, string>} */
      const groups = args[args.length - 2]
      return '    "dim": "' + (planetNames[groups.name] ?? groups.name) + groups.id + '"'
    },
  })
  h.result(`Replaced options: ${replacedInOptions.filter(o=>o.hasChanged).length}, replaced dims: ${replacedDims.filter(o=>o.hasChanged).length}` )

  return ['config/defaultoptions/options.txt', 'config/jeresources/world-gen.json']
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()