
const utils = require('./utils.js');
const {max, round, abs, sign} = Math;

/*=============================================
=           Parsing
=============================================*/
const _sqrt = " - n + Math.sqrt(abs(n*10)) * sign(n)"; // Special importancy for handle
const toInt = "max(1,round(n))";

/*=====  Material Tweaks  ======*/
// MaterialID                  :CoreDurabl: Defense:Modifier: PltsDrb:   Tough: ExtraDurab
const tweaks = {
  "Armory Stat Tweaks":{
    //                            CoreDurability     Modifier          Toughness
    //                                       Defense       PlatesDurability    ExtraDurability
    _importancy                  : [  "*0.3",  "*0.5",  "*0.5",  "*0.3",  "*3.0",  "*0.5"],
    
    "dark_steel"                 : [      "",      "",      "",      "",       4,      ""],
    "end_steel"                  : [    "*2",    "*2",      "",    "*2",      "",    "*2"],
    "treatedwood"                : [      "",      "", "*0.72",      "",      "",      ""],
    "xu_demonic_metal"           : [      "", "*0.45",  "*0.8",      "",      "",      ""],
    "ma.prosperity"              : [      "",      "",      "",      "",      "",      ""],
    "ma.soulium"                 : [      "",      "",      "",      "",      "",      ""],
    "ma.base_essence"            : [      "",      "",      "",      "",      "",      ""],
 // "ma.inferium"                : [    "*2",    "*2",      "",    "*2",      "",    "*2"],
 // "ma.prudentium"              : [    "*2",    "*2",      "",    "*2",      "",    "*2"],
 // "ma.intermedium"             : [    "*2",    "*2",      "",    "*2",      "",    "*2"],
 // "ma.superium"                : [    "*2",    "*2",      "",    "*2",      "",    "*2"],
 // "ma.supremium"               : [ "*4.22", "*2.67",  "*1.2",    "*2",      "",    "*2"],
    "boron"                      : [  "*1.5",  "*1.5",      "",      "",      "",      ""],
    "tough"                      : [ "*1.18",  "*1.5",      "",      "",  "*1.5",      ""],
    "hard_carbon"                : [ "*1.08",  "*1.5",      "",      "", "*1.51",      ""],
    "boron_nitride"              : [    "*2",  "*1.5",      "",      "", "*1.97",      ""],
    "starmetal"                  : [  "*0.8", "*1.06",   "*20",  "*1.6", "*4.67",      ""],
    "iridium"                    : [  "*0.7", "*1.44", "*1.44",   "-11",  "*0.8", "*0.33"],
    "thaumium"                   : [ "*1.23", "*1.25","*17.69",  "*4.5", "-0.75",    "*3"],
    "osmiridium"                 : [      "", "*1.26",      "",      "",     2.2,      ""],
    "titanium"                   : [    "*3", "*1.23",      "",    "*3",      "",    "*3"],
    "infinity_avaritia_plustic"  : [  "*2.4",  "*2.4",      "",      "",      "",      ""],
  },

  "Arrow Shaft Stat Tweaks":{
    //                            Modifier BonusAmmo
    _output                       : [      "n","round(n)"],
    _importancy                   : [  "*10.0",    "*0.2"],
    
    "reed"                        : [  "*0.7",     "*0.5"],
    "enderium"                    : [  "*2.0",     "*2.0"],
  },
  
  "Bowstring Stat Tweaks":{
    //                             Modifier
    _importancy                   : [  "*10.0"],
    
    "soularium"                   : [   "*2.0"],
    "mana_string"                 : [   "*1.5"],
  },
  
  "Fletching Stat Tweaks":{
    //                            Accuracy Modifier
    _importancy                  : [  "*40.0",  "*10.0"],
    
    "stymph_feather"             : [   "*1.1", "*1.1"],
    "titanium"                   : [   "*1.2", "*1.2"],
  },
  
  "Stat Tweaks": {
    //                            HeadDurability    AttackDamage      HandleModifier    ExtraDurability        Range
    //                                      MiningSpeed        HarvestLevel     HandleDurability    DrawSpeed        BonusDamage
    _output                       : [   toInt,     "n",     "n",   toInt,"n"     ,   toInt,   toInt,     "n",     "n",     "n"],
    _importancy                   : [   _sqrt,  "*1.0",  "*1.0",  "*0.7",  "*0.5",   _sqrt,   _sqrt,  "*1.0",  "*1.3",  "*1.0"],
    
    "dark_steel"                  : [      "",      "", "*1.44",      "",      "",      "",      "",      "",      "",      ""],
    "end_steel"                   : [  "*1.5", "*1.83", "*1.49",      "",      "",      "",      "",      "",      "", "*1.22"],
    "treatedwood"                 : [  "*4.0", "*2.50", "*2.50",       2,      "",  "*3.5",      "",      "",      "",      ""],
    "livingwood"                  : [  "*1.5",  "*1.5",  "*1.5",      "",      "",  "*3.5",      "",      "",      "",      ""],
    "xu_demonic_metal"            : [      "",      "", "*1.08",      "",      "",      "",      "",      "",      "",      ""],

    "palis_crystal"               : [  "*1.2",  "*1.2",  "*1.2",      "",      "",      "",  "+200",      "",      "",      ""],
    "restonia_crystal"            : [  "*1.2",    "*2",  "*1.2",      "",      "",      "",      "",      "",      "",      ""],
    "void_crystal"                : [  "*1.5",  "*1.5",  "*1.5",      "",      "",      "",      "",      "",    "*3",      ""],
    "enori_crystal"               : [    "*2",  "*1.5",  "*1.5",      "",      "",      "",      "",      "",      "",      ""],
    
    "ma.prosperity"               : [      "",      "",      "",       4,     1.4,      "",      "",      "",      "",    "+2"],
    "ma.soulium"                  : [    "*2",      "",      "",      "",      "",      "",  "*1.3",  "*1.3",      "",      ""],
    "ma.base_essence"             : [      "",      "",      "",  "*2.5",  "*3.5",      "",      "",      "",      "",  "+2.5"],
 // "ma.inferium"                 : [  "*1.5",  "*1.5",    "*2",      "",      "",      "",      "",      "",      "",      ""],
 // "ma.prudentium"               : [  "*1.5",  "*1.5",    "*2",      "",      "",      "",      "",      "",      "",      ""],
 // "ma.intermedium"              : [  "*1.5",  "*1.5",    "*2",      "",      "",      "",      "",      "",      "",      ""],
 // "ma.superium"                 : [  "*1.5",  "*1.5",    "*2",      "",      "",      "",      "",      "",      "",      ""],
 // "ma.supremium"                : [  "*1.5",  "*1.5",    "*2",      "",      "",      "",      "",      "",      "",      ""],
    
    "boron"                       : [  "*1.5",      "",    "*2",  "*3.5",      "",      "",      "",      "",      "",      ""],
    "tough"                       : [  "*1.5",      "",    "*2", "*2.67",      "",      "",      "",      "",      "",      ""],
    "hard_carbon"                 : [  "*1.5",      "",    "*2", "*2.67",      "",      "",      "",      "",      "",      ""],
    "boron_nitride"               : [  "*1.5",      "",    "*2", "*2.25",      "",      "",      "",      "",      "",      ""],
    
    "mica"                        : [      "",      "",      "",      "",      "",      "",  "+700",      "",      "",      ""],
    "osgloglas"                   : [  "*0.8",  "*0.8",  "*0.8",      "",      "",      "",      "",      "",      "",      ""],
    "meat_metal"                  : [      "",      "",      "",      "",    "+4",      "",      "",      "",      "",      ""],
    
    "integrationforegoing.plastic": [      "", "*0.78",      "",      "",      "",      "",      "",     4.5,      "",      ""],
    "starmetal"                   : [ "*0.52", "*1.33", "*1.21", "*2.33", "*1.67",  "*1.5", "*7.65", "*0.63", "*1.25",    "*4"],
    "thaumium"                    : [  "*0.8",      "", "*0.77", "*1.33", "*0.77", "*1.53", "*1.84", "*0.58",  "*1.8",  "*9.5"],
    "osmiridium"                  : [      "",      "",      "",      "",      "",      "",   "*10",      "",      "",      ""],
    "titanium"                    : [ "*3.38", "*2.11",      "",    "*2", "*2.43",      "",      "", "*0.74",      "",      ""],
    "infinity_avaritia_plustic"   : [      "",      "",     300,      "",      "",      "",      "",   "*15",      "",  "*3.5"],
  }
}

/*=====  OreDict first items  ======*/
function nice(v) { return  Math.round(parseFloat(v)*100)/100}

var cfg = utils.loadText("./default_configs/tweakersconstruct.cfg");
var currentCfg = utils.loadText("../config/tweakersconstruct.cfg");

function parseStats(key, obj) {
  const importancy = obj._importancy;
  const lookupString = `(S:"?${key}"? <[\\n\\r])([\\r\\s\\S]*?)\\n(     >)`;
  
  const rgx = new RegExp(lookupString);
  const cfgListChunk = cfg.match(rgx)[0];
  
  const list = [];
  // const localTweaks = {};
  for (const match of cfgListChunk.matchAll(/^ *([^:\n]+):(.+)$/gm)) {
    const mat = match[1].trim();
    var nums = match[2].split(':').map(v => nice(v));

    var power = 0;
    nums.forEach((n,i) => power += eval(n + ' ' + importancy[i]));

    if (isNaN(power)) continue;
  
    // const old = list.find(a => a.mat === mat);
    const tweak = obj[mat];
    if (tweak) {
      nums = nums.map((old_n,i) => {
        var n = tweak[i];
        if (typeof n == "string") {
          n = nice(eval(old_n + n));
        }

        if (obj._output) n = eval(obj._output[i]);

        return n;
      });
    }

    // if (!tweak) {
      list.push({
        mat, 
        power, 
        raw: `        ${mat}:${nums.join(":")}`,
        params: nums,
        tweaked: tweak !== undefined
      });
    // } else {
    //   localTweaks[mat] = nums.map((a,i) => {
    //     const b = tweak.params[i];
    //     if (Math.abs(a-b)<=0.01) return ""
    //     if (a === 0) return b// `${b<0?"-":"+"}${Math.abs(b)}`
    //     if (b === 0) return `${a<0?"+":"-"}${Math.abs(a)}`
    //     return `*${Math.round(b/a * 100) / 100}`
    //   });
    // }
  }
  
  // Log localTweaks
  // var tweaksStr = '';
  // for (const [key, value] of Object.entries(localTweaks)) {
  //   tweaksStr += `${('"'+key+'"').padEnd(29)}: [${value.map(v=>JSON.stringify(v).padStart(8)).join(',')}],\n`
  // }
  // console.log(key + ":\n" + tweaksStr);

  // Sort and save new data
  list.sort((a,b) => a.power - b.power);

  var powerStr = "";
  list.forEach(l => { powerStr += `"${(l.mat+'"').padEnd(30)}, # ${Math.round(l.power, 2)}\n`; });
  console.log(powerStr);

  // Write back in cfg loaded text
  var exportStr = "";
  list.forEach(l => { if (l.tweaked) exportStr += `${l.raw}\n`; });
  
  currentCfg = currentCfg.replace(new RegExp(lookupString, "m"), `$1${exportStr}$3`);
}

for (const [key, value] of Object.entries(tweaks)) {
  parseStats(key, value);
}

utils.saveText(currentCfg, "../config/tweakersconstruct.cfg");
