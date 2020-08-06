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
║  1   │     1,105 │   1,843 │     3,686 │     7,372 │    22,118 │     23,040 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  2   │     5,529 │   9,216 │    18,432 │    36,864 │   110,592 │    230,400 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  3   │    19,508 │  32,514 │    65,028 │   130,056 │   390,168 │  1,040,449 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  4   │    58,047 │  96,745 │   193,491 │   386,983 │ 1,160,950 │  3,095,868 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  5   │   156,083 │ 260,138 │   520,277 │ 1,040,555 │ 3,121,667 │  8,324,445 ║
╟──────┼───────────┼─────────┼───────────┼───────────┼───────────┼────────────╢
║  6   │   392,401 │ 654,002 │ 1,308,004 │ 2,616,008 │ 7,848,025 │ 20,928,069 ║
╚══════╧═══════════╧═════════╧═══════════╧═══════════╧═══════════╧════════════╝

*/

const {table} = require('table');
var numeral = require('numeral');

const utils = require('./utils.js');

var cfg = utils.loadText("../config/environmentaltech/main.cfg");

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

console.log("Solar arrays Tiers and output RF by material:");

// var s = "Tier| ";
// matNames.forEach(name => {
//   s += name.padStart(9);
// });
// console.log(s);
matNames.unshift("Tier");
var t = [ matNames ];

array_max_efficiency.forEach((a, i) => {
  // s = `[${i+1}]:  `;
  t.push([i+1]);
  cell_efficiency.forEach((c, j) => {
    var cellGen = s_production_rate * Math.pow(s_production_power, i) * Math.min(a / 100, c / 100);
    
    var rft = parseInt(cellGen * cellCount[i]);
    // s += (rft + '').padStart(9);
    t[t.length-1].push(numeral(rft).format('0,0'));
  });
  // console.log(s);
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

console.log(table(t, config));