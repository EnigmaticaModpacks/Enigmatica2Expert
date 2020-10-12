const escapeRegex = require('escape-string-regexp');
const {loadText, saveText} = require('./utils.js');

/*
₀₁₂₃₄₅₆₇₈₉
!"#$%&'()*+,-./0123456789:;< = >?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
¡¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿ʹʺʼˆˇˉ˘˙˚˛˜˝Ͱͱͳʹ͵ͺ;΄΅·‖‘’‚“”„†‡•…‰‹›⁰⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ
₊₋₌₍₎₠€₮₯₸₹₺₽ℓ№ℙ™⅓⅔⅕⅖⅗⅘⅙⅚⅛⅜⅝⅞←↑→↓↔↕∊∍∏∑−∕∙√∫≤≥⌃⌄⌅⌆⌐⌠⌡
─━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋
╌╍╎╏═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬╭╮╯╰╱╲╴╵╶╷╸╹╺╻╼╽╾╿▀▄█▌▐░▒▓
►◄♂♪♫
¹²³⁴⁵⁶⁷⁸⁹
*/

var globalList = {
};

function makeGrid(source) {

  
  //////////////////////////////////////////
  // Prepare chars
  // var avaliableChars = "▢‗☼⩉◊♥◪◽◩✝▭◘▬ⱋ▥♰ⰱ‡☒◧◇ⰻ☠☑ⰷ▦♦☐▤ⱄ∪◙◰▣Ⰰ◳◨⍣χ☺♣◫ⱎ▨♂◲◱⍤◉♠▧▩₀₁₂₃₄";
  var avaliableChars = "○▬□▲◊⌂θ¤╳☼●⌀◘‗☺☻♀♦♠♣♥▼◙▪▫■∞∩ͻͼͽ≈≠≡≢ͲΘΞΣΨΩαβγζξ∂∆¢£¥";

  // Remove already used characters
  var list = { ... globalList };
  for (const [c,m] of Object.entries(list)) {
    avaliableChars = avaliableChars.replace(c, "");
  }
  avaliableChars = [...avaliableChars]; // Tricky unicode split

  //////////////////////////////////////////
  // Collect all items and sort them
  var itemUses = [];
  function handleMatch(m) {
    var found = itemUses.find(it => it.item === m);
    if (found) found.uses++;
    else itemUses.push({item: m, uses: 1});
  }
  
  // Regular ItemStack
  for (const match of source.matchAll(/<[^>]+?>(.withTag\(\{.*?\}\))*(.reuse\(\))*(.anyDamage\(\))*(.marked\(\".*?\"\))*/gm)) {
    handleMatch(match[0]);
  }
  
  // Variable with "marked"
  for (const match of source.matchAll(/[ \[](\w+\.marked\(".*?"\))[,\]]/gm)) {
    handleMatch(match[1]);
  }
  
  itemUses.sort((a,b)=>b.uses-a.uses);
  
  //////////////////////////////////////////
  // Assign chars to items
  itemUses.forEach(o => {
    var m = o.item;
    if (!Object.values(list).includes(m)) {
      var c = avaliableChars[0];
      list[c] = m;
      avaliableChars.shift();
    }
  });
  
  //////////////////////////////////////////
  // Make list of items
  var newSource = source;
  for (const [c, m] of Object.entries(list)) {
    newSource = newSource.replace(new RegExp(escapeRegex(m), 'g'), `"${c}"`);
  }

  var evaluated
  try {
    evaluated = eval(newSource);
  } catch (error) {
    return null;
  }

  var is2d = false;
  var grid = evaluated.map(elem=>{
    if (Array.isArray(elem)) {
      is2d = true;
      return elem.map(c=>c==null?" ":c).join("");
    } else {
      return elem
    }
  });
  if(!is2d) grid = grid.join("");

  // Collect unique list - list of additional items, extending global
  var unique = {};
  for (const [c,m] of Object.entries(list)) {
    if(!globalList[c]) unique[c] = m;
  }

  return {grid, list, unique}
}

const _fncName = /(?:recipes\.(?:addShapedMirrored|addShaped)|mods.astralsorcery.Altar.(?:addConstellationAltarRecipe|addAttunementAltarRecipe|addTraitAltarRecipe))/.source;
// var _fncName = /(?:mods.astralsorcery.Altar.addConstellationAltarRecipe)/.source;
const _s = /[\s\n]*?/.source;
const _par = _s+/\(/.source+_s;
const _com = _s+/,/.source+_s;
const _anyString = /".*?"/.source;
const _item = /<[^>]+?>(?:\s+\*\s+\d+)?/.source;
const _array = /\[[\s\S\n]*?\]/.source;
const _varNum = `(?:`+_com+/\d+/.source+_s +`)*?`;
const _varStr = `(?:`+_com+_anyString+_s +`)*?`;

var query = "(?<head>"
+ `(?<fncName>`+_fncName+`)`
+ _par + _anyString + _com 
+ `(?<output>`+_item+`)` 
+ `(?<numbers>`+_varNum+`)` + _com
+ `)(?<array>` +_array+ `)(?<tail>`+ _varStr +`\\);)`

var regex = new RegExp(query,"gm");

function stringifyList(list) {
  var s = "{\n";
  for (const [c,m] of Object.entries(list)) {
    s += `    "${c}": ${m},\n`;
  }
  return s.slice(0, -2) + "\n  }";
}

function stringifyGrid(list, partitions) {
  if (Array.isArray(list)) {
    var s = "[\n"
    list.forEach(c=>{
      s += `    "${c}",\n`
    });
    return s.slice(0, -2) + "\n  ]";
  } else {
    if (partitions) {
      var s = "\n";
      var cursor = 0;
      partitions.forEach(k=>{
        s += `    "`+list.substring(cursor, cursor+k)+`"+\n`;
        cursor += k;
      });
      return s.slice(0, -2);
    } else {
      return JSON.stringify(list)
    }
  }
}

console.log('object :>> ', makeGrid(`[[null, <fluxnetworks:flux>, null],
[<thaumictinkerer:spellbinding_cloth>, <tconstruct:bow_string>, <thaumictinkerer:spellbinding_cloth>], 
[<thaumictinkerer:spellbinding_cloth>, <thaumictinkerer:spellbinding_cloth>, <thaumictinkerer:spellbinding_cloth>]]
`));
return;

var zsFileText = loadText("../scripts/mods/MysticalAgradditions.zs");
zsFileText = zsFileText.replace(regex, function() {
  var g = arguments[arguments.length-1];
  
  var grid = makeGrid(g.array);

  if(grid){
    // var partitions;
    // if (g.fncName.endsWith("addAttunementAltarRecipe")) partitions = [3,3,3,4];
    // if (g.fncName.endsWith("addConstellationAltarRecipe")) partitions = [3,3,3,4,8];
    // if (g.fncName.endsWith("addTraitAltarRecipe")) partitions = [3,3,3,4,8,4,1];
    // return g.head.trimStart() + `Grid(${
    //   stringifyGrid(grid.grid, partitions)
    // }, ${
    //   stringifyList(grid.unique)
    // }).shapeless()` + g.tail;
    var uniList = [];
    for (const [c,m] of Object.entries(grid.unique)) {
      uniList.push(m);
    }
    return `addTieredRecipe(0, ${g.output}, [${uniList.join(", ")}] ` + g.tail.replace(/[\n\s]/g,"");
  } else {
    return arguments[0];
  }
});

saveText(zsFileText.replace(/[\s\n]*(addTieredRecipe)/g,"\n$1"), "tmp.zs");