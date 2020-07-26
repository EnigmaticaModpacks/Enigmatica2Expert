/* 
Helper script to prepare several files for fast acces
Lunch with NodeJS
*/

/*=============================================
=                Variables                    =
=============================================*/
const fs = require('fs');
const path = require("path");


/*=============================================
=                   Helpers                   =
=============================================*/
module.exports.loadText = function(filename, encoding = 'utf8') {
  return fs.readFileSync(path.resolve(__dirname, filename), encoding);
}

module.exports.loadJson = function(filename) {
  return JSON.parse(loadText(filename));
}

module.exports.saveText = function(txt, filename) {
  fs.writeFileSync(path.resolve(__dirname, filename), txt);
}

module.exports.saveObjAsJson = function(obj, filename) {
  saveText(JSON.stringify(obj, null, 2), filename);
}

