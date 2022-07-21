/**
 * @file Computing Environmental Tech solar Arrays
 *
 * Output table of solar panel Tier and its output
 *   based on solar panels material
 *
 * Formula: https://ftb.gamepedia.com/Solar_Array_Controller
 *
 * Example output:
 *
 * Solar arrays Tiers and output RF by material:
 * ╔══════╤═══════════╤═════════╤═══════════╤═══════════╤═══════════╤════════════╗
 * ║ Tier │ litherite │ erodium │  kyronite │   pladium │    ionite │    aethium ║
 * ╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
 * ║  1   │     1,105 │   2,442 │     5,437 │    12,026 │    23,040 │     23,040 ║
 * ╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
 * ║  2   │     5,529 │  12,211 │    27,187 │    60,134 │   133,171 │    230,400 ║
 * ╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
 * ║  3   │    19,508 │  43,081 │    95,916 │   212,154 │   469,827 │  1,040,449 ║
 * ╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
 * ║  4   │    58,047 │ 128,188 │   285,400 │   631,266 │ 1,397,977 │  3,095,868 ║
 * ╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
 * ║  5   │   156,083 │ 344,684 │   767,409 │ 1,697,406 │ 3,759,007 │  8,324,445 ║
 * ╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
 * ║  6   │   392,401 │ 866,552 │ 1,929,306 │ 4,267,364 │ 9,450,331 │ 20,928,069 ║
 * ╚══════╧═══════════╧═════════╧═══════════╧═══════════╧═══════════╧════════════╝
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import numeral from 'numeral'
import { table } from 'table'

import { defaultHelper, loadText } from './utils.js'

/**
 * Table with values
 * rf/t [ material ] [ Tier ]
 * @type {[string, number, number][][]}
 */
let dryTable

export function getRfT() {
  if (dryTable) return dryTable

  const cfg = loadText('config/environmentaltech/main.cfg')

  /** @type {string[]} */
  const matNames = []

  /** @type {number[]} */
  const cell_efficiency = []

  for (const match of cfg.matchAll(
    /^ {12}I:\d(\w+)_solar_cell_efficiency=(\d+)$/gm
  )) {
    matNames.push(match[1])
    cell_efficiency.push(Number(match[2]))
  }

  const array_max_efficiency = [
    ...cfg.matchAll(/^ {12}I:tier_\d_solar_array_max_efficiency=(\d+)$/gm),
  ].map((m) => Number(m[1]))

  const s_production_power = parseFloat(
    cfg.match(/^ {12}D:s_production_power=([\d.]+)$/m)[1]
  )
  const s_production_rate = Number(
    cfg.match(/^ {12}I:s_production_rate=(\d+)$/m)[1]
  )

  dryTable = []
  const cellCount = [9, 25, 49, 81, 121, 169]
  array_max_efficiency.forEach((maxEfficiency, i) => {
    dryTable.push([])
    cell_efficiency.forEach((efficiency, j) => {
      const rft =
        cellCount[i] *
        s_production_rate *
        Math.pow(s_production_power, i) *
        Math.min(maxEfficiency / 100, efficiency / 100)
      dryTable[i].push([matNames[j], rft, cellCount[i]])
    })
  })

  return dryTable
}

export async function init(h = defaultHelper) {
  /**
   * Visual table
   */
  const t = [
    ['Tier', ...getRfT()[0].map(([matName]) => matName)],
    ...getRfT().map((arr, tier) => [
      `${tier + 1}`,
      ...arr.map(([, rft]) => numeral(rft).format('0,0')),
    ]),
  ]

  console.log(
    table(t, {
      columns: {
        0: { alignment: 'center' },
        1: { alignment: 'right' },
        2: { alignment: 'right' },
        3: { alignment: 'right' },
        4: { alignment: 'right' },
        5: { alignment: 'right' },
        6: { alignment: 'right' },
      },
    })
  )
}

// @ts-ignore
if (
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
