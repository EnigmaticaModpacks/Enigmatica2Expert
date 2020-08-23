/*

  Patchouli_js
    Automatic Patchouli pages generator.
    Handy for ingame patchnoter

  Usage:
    1. Install dependencyes (see require section below)
    2. Add "Patchouli_js()" comment blocks in .zs files
    3. Run from terminal:
        node patchouli.js
*/

//////////////////////////////////////////
// NodeJS dependencies
const { snakeCase }  = require("snake-case");
const glob = require("glob")
const numeral = require('numeral');

//////////////////////////////////////////
// Local dependencies
const {loadText, saveObjAsJson, matchBetween} = require('../utils.js');

//-----------------------------
// Constants

const currentVersion = 0.14;
const bookPath = "../patchouli_books/e2e_e/en_us/";

const defaultFileContent = {
  "*": {
    name: "Undefined category/entry",
    icon: "minecraft:book",
    description: "Undefined description"
  },

  patches: {
    description: "Pick version:",
    icon: "artisanworktables:artisans_grimoire_electrum",
  },
  
  knowledge: {
    "name": "Knowledge",
    "icon": "artisanworktables:artisans_grimoire_wood",
    "description": "Chapters about things in this modpack:"
  },

  quest_and_loot: {
    "name": "Quest and loot",
    "icon": "questbook:itemquestbook",
    "description": "Info about Lootboxes and Quests"
  },

  v0_14: {
    description: "Fluid update! Many things...",
    icon: "artisanworktables:artisans_grimoire_platinum"
  },

  bug_fixes: {
    priority: true
  },

  misc_changes: {
    priority: true
  },

  recipe_changes: {
    priority: true
  }
};


// ######################################################################
//
// Extract Patchouli_js comment blocks from .zs files
//
// ######################################################################

// Generate list of all documentation entries
var patchouliList = [];
glob.sync("scripts/**/*.zs").forEach(zsfile => {
  var filePath = "../"+zsfile;
  var zsfileContent = loadText(filePath);
  for (const match of zsfileContent.matchAll(/\\* *(Patchouli_js\([\s\S\n\r]*?\))\*\//gm)) {
    var lineNumber = zsfileContent.substring(0, match.index).split('\n').length;
    patchouliList.push({
      filePath: filePath, 
      command: match[1], 
      line: lineNumber, 
      below: zsfileContent.substring(match.index + match[0].length),
    });
  }
});    

patchouliList.push({
  filePath: "./dev/Patchouli/additional_pages.js", 
  command: loadText("./Patchouli/additional_pages.js"), 
  line: 0, 
  below: "",
});

// ######################################################################
//
// Content-independent helper functions
//
// ######################################################################

// Match all regex from crafttweaker.log
var crafttweaker_log = null;
function from_crafttweaker_log(rgx) {
  crafttweaker_log = crafttweaker_log || loadText("../../crafttweaker.log");
  return [...crafttweaker_log.matchAll(rgx)];
}

// Transform ZenScript's item string into Patchouli's item string
function parse_item(str) {
  var match = str.match(/^[ \n\r]*<(.*?)>(\.withTag\(([\s\S\n\r]*)\))?[ \n\r]*$/m);
  var itemDefinition = match[1];
  var nbtStr = match[3];
  if(nbtStr){
    nbtStr = nbtStr.replace(/(\b)as \w+(\b)/gm, "$1$2");
    eval("var nbtObj="+nbtStr);
    return itemDefinition + JSON.stringify(nbtObj);
  } else {
    return itemDefinition;
  }
}

// Transform liquid name into bucket with this liquid
function wrap_bucket(str) {
  return `forge:bucketfilled{FluidName:"${str}",Amount:1000}`;
}

// Removes trailing spaces in _each_line_ and replace \n with $(br)
function parse_text(text) {
  return text.trim().split("\n").map(s=>s.trim()).join("$(br)")
}

// Convert array into object with key: value
//   fnc is optional
/* 
Example:
  $i("item", [[1],[2]])
    returns {item0: 1, item1: 2 }

  $i("text", [1,2], m => m*2)
    returns {text0: 2, text1: 4 }
*/
function $i(prefix, array, fnc) {
  return array.reduce((o, m, i) => Object.assign(o, {
    [prefix+i]: fnc ? fnc(m) : m[0]
  }),{})
}

// Same as $i() but with prefix "item"
function item$i(array, fnc) {
  return $i("item", array, fnc)
}

// Same as $i() but with prefix "text"
function text$i(array, fnc) {
  return $i("text", array, fnc)
}

// Takes array and split it in several pages based of type
function paged(opts, itemsOnPage, arr) {
  return arr.reduce((o, m, i) => {
    var j = ~~(i/itemsOnPage);
    o[j] = o[j]||{...opts};

    o[j][`item${i%itemsOnPage}`] = m[0];

    if (opts.type == "grid") {
    } else {

    }
    // o[j][`text${i%itemsOnPage}`] = m[1];
    return o;
  },[])
}


var book = {};

// Iterate over comment blocks
patchouliList.forEach(patchouliCommand => {

  // ######################################################################
  //
  // Content-dependent helper functions
  //
  // ######################################################################

  // Returns array of matching regex
  //  All options are optional
  function match_below(opts) {
    if (opts && opts.regex) {
      return matchBetween(patchouliCommand.below, opts.begin, opts.end, opts.regex);
    } else {
      return matchBetween(patchouliCommand.below, opts.begin, opts.end, /[\s\S\n\r]*/gm)[0][0];
    }
  }

  // Return all matches of regex under Patchouli_js block until empty line
  function match_block_below(regex) {
    return match_below({regex, end: "\n\n"})
  }

  // Return all matches of regex under Patchouli_js block until end of file
  function match_regex_below(regex) {
    return [...patchouliCommand.below.matchAll(regex)]
  }

  // ######################################################################
  //
  // Main function
  //
  // ######################################################################
  function Patchouli_js(parameters) {

    // Call function for each array element if array provided as argument
    if(Array.isArray(parameters)) return parameters.forEach(o=>Patchouli_js(o));

    // console.log('parameters :>> ', parameters);

    // p is for parameters
    var p;
    if(typeof parameters == 'object') {
      p = parameters;
    } else {
      //TODO: Working with parameters instead of object
    }

    // Pointer is current category/subcategory/entry
    var pointer = book;
    var currField = "E2:E-E";

    // Define default value of field in current pointer
    function defVal(field, def) { pointer[field] = pointer[field] || def; }

    // Advance pointer
    function goDown(field, def) {
      currField = p[field] = p[field] || def;
      defVal(currField, {});
      pointer = pointer[currField];
      return currField;
    }

    const v_category    = goDown("category",    "Patches");
    const v_subcategory = goDown("subcategory", "v"+currentVersion);
    const v_entry       = goDown("entry",       "misc_changes");

    /* 
      Change current entry fields
    */
    pointer.name = currField;

    // Guess mandatory fields for entry
    defVal("category", `patchouli:subcategories/${snakeCase(v_subcategory)}`);
    defVal("pages", []);
    defVal("icon" , p.icon || p.item || "minecraft:book");

    // Copy all fields
    var page = {};
    var entryKeys = ["category", "subcategory", "entry", "icon"];
    for (const key in p) {
      if (!entryKeys.includes(key)) {
        if (key[0]==="_") {
          page[key.substr(1)] = parse_text(p[key]);
        } else {
          page[key] = p[key];
        }
      }
    }

    // Guess mandatory fields for page
    page.type  = page.type  || (p.item ? "spotlight" : "text")

    // Title is not mandatory but many page types used it
    page.title = page.title || p.entry;

    // Add page
    pointer.pages.push(page);
  }
  
  try {
    eval(patchouliCommand.command);
  } catch (error) {
    console.log('Patchouli_js comment block Error.\nFile:', patchouliCommand.filePath, " Line:", patchouliCommand.line);
    console.error(error);
  }
  
});

// ######################################################################
//
// Write collected pages into patchouli folders
//
// ######################################################################

function saveBookFile(_partName, subfolder, content) {
  var partName = snakeCase(_partName);
  saveObjAsJson(
    {
      __comment: "This file generated automatically with Patchouli.js. All changes will be rewritten",
      ...defaultFileContent["*"], 
      ...defaultFileContent[partName],
      name: _partName,
      ...content
    }, 
    bookPath + subfolder + partName +".json"
  );  
  return partName;
}

// Iterate through new generated book entries
for (const [_categoryName, category] of Object.entries(book)) {

  var categoryName = saveBookFile(_categoryName, "categories/", 
    {}
  );
  
  for (const [_subcategoryName, subcategory] of Object.entries(category)) {

    var subcategoryName = saveBookFile(_subcategoryName, "categories/subcategories/", {
      parent: "patchouli:"+categoryName,
    });
    
    for (const [_entryName, entry] of Object.entries(subcategory)) {

      saveBookFile(_entryName, `entries/${categoryName}/${subcategoryName}/`, 
        entry
      );

    }
  }  
}

/*
function findNewPoint(x, y, angle, distance) {
  var result = {};

  result.x = Math.round(Math.cos(angle * Math.PI) * distance + x);
  result.y = Math.round(Math.sin(angle * Math.PI) * distance + y);

  return result;
}

for (let i = 0; i < 6; i++) {
  console.log('x,y :>> ', JSON.stringify(findNewPoint(50, 16, 0.2*i, 26.0)));
}*/
