const testFolder = '../../mods/';
const fs = require('fs');
const path = require("path");

const e2e = fs.readdirSync(path.resolve(__dirname, '../../../Enigmatica 2 Expert/mods/'));
const e2ee= fs.readdirSync(path.resolve(__dirname, '../../mods/'));

const cut = (s)=> s.match(/([^-_]+).*/)[1];

e2ee.forEach(file => {
  if (!e2e.find(f=> cut(file) === cut(f))) {
    console.log(file);
  }
});