/* 

Computing Environmental Tech solar Arrays

Output table of solar panel Tier and its output
  based on solar panels material

Formula: https://ftb.gamepedia.com/Solar_Array_Controller

Example output:

Solar arrays Tiers and output RF by material:
╔══════╤═══════════╤═════════╤═══════════╤═══════════╤═══════════╤════════════╗
║ Tier │ litherite │ erodium │  kyronite │   pladium │    ionite │    aethium ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  1   │     1,105 │   2,442 │     5,437 │    12,026 │    23,040 │     23,040 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  2   │     5,529 │  12,211 │    27,187 │    60,134 │   133,171 │    230,400 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  3   │    19,508 │  43,081 │    95,916 │   212,154 │   469,827 │  1,040,449 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  4   │    58,047 │ 128,188 │   285,400 │   631,266 │ 1,397,977 │  3,095,868 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  5   │   156,083 │ 344,684 │   767,409 │ 1,697,406 │ 3,759,007 │  8,324,445 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  6   │   392,401 │ 866,552 │ 1,929,306 │ 4,267,364 │ 9,450,331 │ 20,928,069 ║
╚══════╧═══════════╧═════════╧═══════════╧═══════════╧═══════════╧════════════╝

*/

const {table} = require('table');
var numeral = require('numeral');

const utils = require('./utils.js');

var cfg = utils.loadText("../../config/environmentaltech/main.cfg");

const cell_efficiency = [];
const matNames = [];

for (const match of cfg.matchAll(/^            I:(\d)(\w+)_solar_cell_efficiency=(\d+)$/gm)) {
  var tier = parseInt(match[1]);
  var effi = parseInt(match[3]);

  cell_efficiency.push(effi);
  matNames.push(match[2]);
}

const array_max_efficiency = [];

for (const match of cfg.matchAll(/^            I:tier_(\d)_solar_array_max_efficiency=(\d+)$/gm)) {
  var tier = parseInt(match[1]);
  var effi = parseInt(match[2]);

  array_max_efficiency.push(effi);
}

const cellCount = [9, 25, 49, 81, 121, 169];
const s_production_power = cfg.match(/^            D:s_production_power=([\d\.]+)$/m)[1];
const s_production_rate  = cfg.match(/^            I:s_production_rate=(\d+)$/m)[1];

// console.log("Solar arrays Tiers and output RF by material:");

// var s = "Tier| ";
// matNames.forEach(name => {
//   s += name.padStart(9);
// });
// console.log(s);
matNames.unshift("Tier");
var t = [ matNames ];
var dryTable = [];

array_max_efficiency.forEach((a, i) => {
  t.push([i+1]);
  dryTable.push([]);
  cell_efficiency.forEach((c, j) => {
    var cellGen = s_production_rate * Math.pow(s_production_power, i) * Math.min(a / 100, c / 100);
    
    var rft = parseInt(cellGen * cellCount[i]);
    t[t.length-1].push(numeral(rft).format('0,0'));
    dryTable[i].push([matNames[j+1], rft, cellCount[i]]);
  });
});

config = {
  columns: {
    0: {alignment: 'center'},
    1: {alignment: 'right'},
    2: {alignment: 'right'},
    3: {alignment: 'right'},
    4: {alignment: 'right'},
    5: {alignment: 'right'},
    6: {alignment: 'right'},
  }
};

// console.log(table(t, config));

// console.log('dryTable :>> ', dryTable);
module.exports.rf_t = dryTable;