
const {table} = require('table');
const { orderBy } = require('natural-orderby');

const {transpose, loadText, saveText} = require('./utils.js');
const {max, round, abs, sign,sqrt,pow,log} = Math;

/*=============================================
=                Parsing                      =
=============================================*/
const _sqrt = "sqrt(abs(n*10))*sign(n)"; // Special importancy for handle
const toInt = "max(1,round(n))";

const Armory_mediumBuff = ["*1.5+1","*1.5+1","*1.5+0.5","*1.5+1","+0.25","+5"];
const Armory_slightNerf = ["*0.6","*0.6","*0.6","*0.6","*0.6","*0.6"];

/*=============================================
=               Material Tweaks               =
=============================================*/
const tweaks = {
  "Armory Stat Tweaks":{
    _names             : ["CoreDurability" ,"Defense","Modifier"      ,"PlatesDurability","Toughness","ExtraDurability"],
    _importancy        : ["sqrt((n+10)*10)-10", "n*0.5" ,"sqrt((n+1)*10)-3", "n*0.3"          , "pow(n+2,2)-4"               , "n*0.5"] ,
    
    "dark_steel"       : [      ""         , ""      , ""             , ""               , 3         , ""]              ,
    "end_steel"        : [    "*2"         , "*2"    , ""             , "*2"             , ""        , "*2"]            ,
    "treatedwood"      : [      ""         , ""      , "*0.72"        , ""               , ""        , ""]              ,
    "xu_demonic_metal" : [      ""         , "*0.45" , "*0.8"         , ""               , ""        , ""]              ,
    "ma.prosperity"    : [      ""         , ""      , "+1"           , "+5"             , ""        , ""]              ,
    "ma.soulium"       : [      ""         , ""      , ""             , ""               , ""        , ""]              ,
    "ma.base_essence"  : [      ""         , ""      , ""             , ""               , ""        , ""]              ,
    "ma.inferium"      : [      ""         ,      "" ,      ""        , "*2"             , 1        , "*2"]            ,
    "ma.prudentium"    : [      ""         ,      "" ,      ""        , "*2"             , 1.5        , "*2"]            ,
    "ma.intermedium"   : [      ""         ,      "" ,      ""        , "*2"             , 2        , "*2"]            ,
    "ma.superium"      : [      ""         ,      "" ,      ""        , "*2"             , 2.5        , "*2"]            ,
    "ma.supremium"     : [      ""         ,      "" ,      ""        , "*2"             , 3        , "*2"]            ,
    "boron"            : [  "*1.5"         , "*1.5"  , ""             , ""               , ""        , ""]              ,
    "tough"            : [ "*1.18"         , "*1.5"  , ""             , ""               , "*1.5"    , ""]              ,
    "hard_carbon"      : [ "*1.08"         , "*1.5"  , ""             , ""               , "*1.51"   , ""]              ,
    "boron_nitride"    : [    "*2"         , "*1.5"  , ""             , ""               , "*1.97"   , ""]              ,
    "starmetal"        : [  "*0.8"         , "*1.06" , "*20"          , "*1.6"           , "*4.67"   , ""]              ,
    "iridium"          : [  "*0.7"         , "*1.44" , "*1.44"        , "-11"            , "*0.8"    , "*0.33"]         ,
    "thaumium"         : [ "*1.23"         , "*1.25" ,"*17.69"        , "*4.5"           , "-0.75"   , "*3"]            ,
    "osmiridium"       : [      ""         , "*1.26" , ""             , ""               , 2.2       , ""]              ,
    "titanium"         : [    "*3"         , "*1.23" , ""             , "*3"             , ""        , "*3"]            ,
    "chocolate"        : [      ""         , ""      , "+0.5"         , ""               , ""        , ""]              ,
    "livingwood"       : [      "+7"       , ""      , ""             , ""               , ""        , ""]              ,
    "dreamwood"        : [      "*2"       , "*2"    , ""             , "*2"             , ""        , "*2"]            ,
    "livingrock"       : [     "*2"        , "*2"    , "+1"           , "*2"             , "+0.25"   , "*2"]            ,
    "meat_metal"       : [     "*1.5"      , "*1.5"  , "+1"           , "*1.5"           , "+0.25"   , "+20"]           ,

    "signalum"         : [     "*2"        , "*2"    , "*2"           , "*2"             , "+1"      , "+20"]           ,
    "lumium"           : [     "*2"        , "*2"    , "*2"           , "*2"             , "+1"      , "+20"]           ,
    "mica"             : [     ""          , "*2"    , ""             , ""               , ""        ,""]               ,
    "apatite"          : [     ""          , "/2"    , ""             , ""               , ""        ,""]               ,
    "crystal_matrix"   : [     ""          , ""      , ""             , ""               , "+1"      ,""]               ,
    "refined_obsidian" : [     "*0.6"      , "*0.6"  , ""             , ""               , ""        ,""]               ,
    "infinity_metal"   : [     ""          , ""      , ""             , ""               , 30        , ""]              ,

    "amethyst": Armory_mediumBuff,
    "carbon_fiber": Armory_slightNerf,
  },

  "Arrow Shaft Stat Tweaks":{
    _names                        : ["Modifier","BonusAmmo"],
    _output                       : [       "n", "round(n)"],
    _importancy                   : [   "n*10.0",     "n*0.2"],
    
    "reed"                        : [    "*0.7",     "*0.5"],
    "polyethylene"                : [        "",       "/2"],
  },
  
  "Bowstring Stat Tweaks":{
    _names                        : ["Modifier"],
    _importancy                   : [   "n*10.0"],
    
    "mana_string"                 : [       1.3],
    "soularium"                   : [       1.5],
  },
  
  "Fletching Stat Tweaks":{
    _names                       : ["Accuracy","Modifier"],
    _importancy                  : [   "n*40.0",   "n*10.0"],
    
    "stymph_feather"             : [    "*1.1",    "*1.5"],
    "titanium"                   : [    "*1.2",    "*1.2"],
  },
  
  "Stat Tweaks": {
    _names                        : ["HeadDurability","MiningSpeed","AttackDamage","HarvestLevel","HandleModifier","HandleDurability","ExtraDurability","DrawSpeed" ,"Range"       ,"BonusDamage"],
    _output                       : [   toInt        , "n"         , "n"          , toInt        ,"n"             , toInt            , toInt           , "n"        , "n"          , "n"]         ,
    _importancy                   : [   _sqrt+"/3"  , "pow(n+1,2)","pow(n+1,2)/5", "n*5"        , "pow(n+3,2)-9" , "log(abs(n)+1)*sign(n)+8"    , "log(n+50)*2-4", "sqrt(n*10)", "n*4"     , "n*2"] ,
    
    "dark_steel"                  : [      ""        , ""          , "*1.44"      , ""           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "end_steel"                   : [  "*1.5"        , "*1.83"     , "*1.49"      , ""           , ""             , ""               , ""              , ""         , ""           , "*1.22"]     ,
    "treatedwood"                 : [  "*4.0"        , "*2.50"     , "*2.50"      , 2            , ""             , "*3.5"           , ""              , ""         , ""           , ""]          ,
    "livingwood"                  : [  "*1.5"        , "*1.5"      , "*1.5"       , ""           , ""             , "*3.5"           , ""              , ""         , ""           , ""]          ,
    "xu_demonic_metal"            : [      ""        , ""          , "*1.08"      , ""           , ""             , ""               , ""              , ""         , ""           , ""]          ,

    "palis_crystal"               : [  "*1.2"        , "*1.2"      , "*1.2"       , ""           , ""             , ""               , "+200"          , ""         , ""           , ""]          ,
    "restonia_crystal"            : [  "*1.2"        , "*2"        , "*1.2"       , ""           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "void_crystal"                : [  "*1.5"        , "*1.5"      , "*1.5"       , ""           , ""             , ""               , ""              , ""         , "*3"         , ""]          ,
    "enori_crystal"               : [    "*2"        , "*1.5"      , "*1.5"       , ""           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    
    "ma.prosperity"               : [      ""        , ""          , ""           , 4            , 1.4            , ""               , ""              , ""         , ""           , "+2"]        ,
    "ma.soulium"                  : [    "*2"        , ""          , ""           , ""           , ""             , ""               , "*1.3"          , "*1.3"     , ""           , ""]          ,
    "ma.base_essence"             : [      ""        , ""          , ""           , "*2.5"       , "*3.5"         , ""               , ""              , ""         , ""           , "+2.5"]      ,
    
    "boron"                       : [  "*1.5"        , ""          , "*2"         , "*3.5"       , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "tough"                       : [  "*1.5"        , ""          , "*2"         , "*2.67"      , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "hard_carbon"                 : [  "*1.5"        , ""          , "*2"         , "*2.67"      , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "boron_nitride"               : [  "*1.5"        , ""          , "*2"         , "*2.25"      , ""             , ""               , ""              , ""         , ""           , ""]          ,
    
    "mica"                        : [      ""        , ""          , ""           , ""           , ""             , ""               , "+700"          , ""         , ""           , ""]          ,
    "osgloglas"                   : [  "*0.8"        , "*0.8"      , "*0.8"       , ""           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    
    "integrationforegoing.plastic": [      ""        , "*0.78"     , ""           , ""           , ""             , ""               , ""              , 4.5        , ""           , ""]          ,
    "starmetal"                   : [ "*0.52"        , "*1.33"     , "*1.21"      , "*2.33"      , "*1.67"        , "*1.5"           , "*7.65"         , "*0.63"    , "*1.25"      , "*4"]        ,
    "thaumium"                    : [  "*0.8"        , ""          , "*0.77"      , "*1.33"      , "*0.77"        , "*1.53"          , "*1.84"         , "*0.58"    , "*1.8"       , "*9.5"]      ,
    "osmiridium"                  : [      ""        , "*0.77"     , "*0.77"      , "*0.77"      , "*0.77"        , ""               , "*10"           , ""         , ""           , ""]          ,
    "titanium"                    : [ "*3.38"        , "*2.11"     , ""           , "*2"         , "*2"           , ""               , ""              , "*0.74"    , ""           , ""]          ,
    "infinity_metal"              : [ ""             , 25          , 300          , 15           , ""             , ""               , ""              , ""    , ""           , 300]          ,

    "neutronium"                  : [      ""        , ""          , ""           , 12           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "wyvern_metal"                : [      ""        , ""          , ""           , 12           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "crystal_matrix"              : [      ""        , ""          , ""           , 11           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "aethium"                     : [      ""        , ""          , ""           , 10           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "ma.superium"                 : [      ""        , ""          , ""           , 10           , ""             , ""               , ""              , ""         , ""           , ""]          ,
    "vibrant_alloy"               : [      ""        , ""          , ""           ,  9           , ""             , ""               , ""              , ""         , ""           , ""]          ,
  }
}

/*=============================================
=                  Parse                      =
=============================================*/

// Format big numbers
function nice(v) { return  Math.round(parseFloat(v)*100)/100}

var cfg = loadText("./default_configs/tweakersconstruct.cfg");
var currentCfg = loadText("../config/tweakersconstruct.cfg");
var formattedTable = "";

// Compare group of parameters like "Armory Stat Tweaks" or "Fletching Stat Tweaks"
// And save them to variable
function parseStats(key, obj) {
  const lookupString = `(S:"?${key}"? <[\\n\\r])([\\r\\s\\S]*?)\\n(     >)`;
  
  const rgx = new RegExp(lookupString);
  const cfgListChunk = cfg.match(rgx)[0];
  
  // New recalculated values list
  const list = [];
  
  // Big Table
  const bigTable = [[], ...obj._names.map(name=>[])];

  // Materials that exists in current pack
  var realMats = [];

  function cut(s) { return s.substr(Math.max(0, s.length - 16)); }

  // const localTweaks = {};
  for (const match of cfgListChunk.matchAll(/^ *([^:\n]+):([^<\n]+)$/gm)) {
    const mat = match[1].trim();
    var nums = match[2].split(':').map(v => v!=="d" ? nice(v) : 0);

    realMats.push(mat);
    
    // Is this matearial tweaked in JS table
    const tweak = obj[mat];
    var isActuallyTweaked = false;
    var numObjs = nums.map((old_n,i) => {
      if (!tweak) { return {val: old_n}}
      else {
        var n = tweak[i];
        if (typeof n == "string") {
          if (n===""){
            n = "d";
          } else {
            n = nice(eval(old_n + n));
            isActuallyTweaked = true;
          }
        } else {
          isActuallyTweaked = true;
        }

        // Some values should be clamped to Int (like harvest level)
        var isDefault = n==="d";
        if (obj._output && !isDefault) n = eval(obj._output[i]);

        return {val: isDefault ? old_n : n, isDefault};
      }
    });

    // Compute total power of material after tweaks
    var power = 0;
    numObjs.forEach((num,i) => {
      var n = num.val;
      power += eval(obj._importancy[i]);
    });

    list.push({
      mat, 
      power, 
      raw: `        ${mat}:${numObjs.map(n=>n.isDefault?"d":n.val).join(":")}`,
      tweaked: isActuallyTweaked
    });

    // Add values to big table
    function valMat(val, isRound=false) { return `${((isRound ? round(val,2) : nice(val)) + '').padStart(5)} ${cut(mat)}`; }
    bigTable[0].push(valMat(power,true));
    numObjs.forEach((num,i) => {
      var n = num.val;
      var importancy = eval(obj._importancy[i]);
      // var resultStr = (nice(importancy)+' ').padStart(6)+valMat(n);
      var resultStr = valMat(n);
      bigTable[i+1].push(resultStr);
    });
  }


  function powStr(l, kav = true) {
    return `${(Math.round(l.power, 2)+'').padStart(4)} ${kav?'"':''}${(l.mat)}${kav?'"':''}`;
  }

  // Sort and save new data
  list.sort((a,b) => a.power - b.power);

  var powerStr = "";
  // list.forEach(l => { powerStr += `${(Math.round(l.power, 2)+'').padStart(4)} "${(l.mat+'"').padEnd(30)}, # ${Math.round(l.power, 2)}\n`; });
  list.forEach(l => { powerStr += `${powStr(l).padEnd(30)}, # ${Math.round(l.power, 2)}\n`; });
  // list.forEach(l => { powerStr += `${(Math.round(l.power, 2)+'').padStart(4)} ${l.mat}\n`; });
  console.log(powerStr);
  
  // Output a table of values
  formattedTable += key+'\n'+table([
    ["Total Power",...obj._names.map((name,i)=>name+'\n'+obj._importancy[i])],
    ...transpose( bigTable.map(bt=>orderBy(bt)) ),
    ["Total Power",...obj._names],
  ],{
    drawHorizontalLine: (i, size) => i === 0 || i === 1 || i === size-1 || i === size-2
  }) + "\n\n";
  // console.log();

  // Write back in cfg loaded text
  var exportStr = "";
  list.forEach(l => { if (l.tweaked) exportStr += `${l.raw}\n`; });
  
  currentCfg = currentCfg.replace(new RegExp(lookupString, "m"), `$1${exportStr}$3`);

  // console.log('unusedTweaks :>> ', Object.keys(obj).reduce((o,cur)=>{
  //   if(!realMats.includes(cur)) o.push(cur);
  //   return o;
  // }, []));
}

// Loop through tweaks at start of file
for (const [key, value] of Object.entries(tweaks)) {
  parseStats(key, value);
}

// Save in file
saveText(currentCfg, "../config/tweakersconstruct.cfg");

// Save for analytics
saveText(formattedTable, "./tweakersconstruct_table.cs");