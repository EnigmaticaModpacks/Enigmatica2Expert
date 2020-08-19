
const utils = require('./utils.js');
const csv = require('csvtojson');


function forEachCSVinDir(dirPath, fnc) {
  utils.readdir(dirPath).forEach(filePath => {
    if (filePath.split('.').pop() === "csv") {
      const fileFullPath = dirPath + filePath;
      fnc(fileFullPath);
    }
  });
}

var potionsRegnameTag = [];

function forEachCSVRow(folder, filenameRegex, fnc, then) {
  var isFileFound = false;
  forEachCSVinDir(folder, path => {
    if (!isFileFound && path.split('/').pop().match(filenameRegex)) {
      isFileFound = true;
      var fileContent = utils.loadText(path);
      csv()
      .fromString(fileContent)
      .then((jsonObj)=>{
        jsonObj.forEach(pot => {
          fnc(pot);
        });
        then();
      });
    }
  });
}

var potions = [];
var elixirNameID = [];

forEachCSVRow("../config/tellme/", /^potions-csv.*.csv$/, pot => {
  potionsRegnameTag.push({regName: pot['Registry name'], tag: {Id: parseInt(pot['ID'])}});

}, ()=>{

  forEachCSVRow("../config/tellme/", /^potiontypes-csv.*.csv$/, pot => {
    var found = potionsRegnameTag.find(o => {
      if ( pot.Effects == "") return false;
      var match = pot.Effects.match(/^.*Potion:\[reg:(.*?),.*$/)[1];
      return o.regName === match;
    });

    if (found){
      eval(`var normTag = {${ pot["Effects"].replace(/Potion:\[[^\]]*\],/, "") }}`);
      var potEffect = normTag.PotionEffect;

      // Push potion tags
      potions.push({
        name: pot['Registry name'],
        tag: {
          Id: found.tag.Id,
          Amplifier: potEffect.amplifier,
          Duration : potEffect.duration,
        }
      });

      // Push Elixir IDs
      elixirNameID.push({
        name: found.regName,
        Id: found.tag.Id,
      });
    }
  }, ()=>{

    var scriptFilename = "../scripts/megapotion.zs";
    var megapotion_zs = utils.loadText(scriptFilename);

    function replaceArray(keyStart, keyFinish, array, makeLineFnc) {
      var s = keyStart + "\n";
      array.forEach(p => {
        s += makeLineFnc(p);
      });
      s+= keyFinish;
  
      var rgx = new RegExp(utils.escapeRegex(keyStart) + "[\\s\\S\n\r]*?" + utils.escapeRegex(keyFinish), 'm');
      megapotion_zs = megapotion_zs.replace(rgx, s);
    }

    replaceArray(
      "static potNameTag as IData[string] = {",
      "} as IData[string];",
      potions,
      p => {
        var t = p.tag;
        var pad = (member, padStart) => `${member}:${t[member].toString().padStart(padStart)}`;
        return `  "${(p.name+"\"").padEnd(40)}: {${pad("Id",3)}, ${pad("Amplifier",3)}, ${pad("Duration",5)}},\n`;
      }
    );

    // Remove duplicates
    elixirNameID = elixirNameID.filter((o, i, self) =>
      i === self.findIndex((t) => (t.name === o.name && t.Id === o.Id))
    )

    replaceArray(
      "static elixirNameId as int[string] = {",
      "} as int[string];",
      elixirNameID,
      p => {
        return `  "${(p.name+"\"").padEnd(40)}: ${p.Id},\n`;
      }
    );

    utils.saveText(megapotion_zs, scriptFilename);
  });

});