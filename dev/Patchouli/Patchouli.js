/*

  Patchouli_js
    Automatic Patchouli pages generator.
    Handy for ingame patchnoter

  Usage:
    1. Install dependencies (see require section below)
    2. Add "Patchouli_js()" comment blocks in .zs files
    3. Run from terminal:
        node patchouli.js
*/

//////////////////////////////////////////
// NodeJS dependencies
process.env.NODE_PATH+=':/dev/lib'

const { snakeCase }  = require('snake-case')
const glob = require('glob')
const numeral = require('numeral')
const over = require('over')

//////////////////////////////////////////
// Local dependencies
const {matchBetween} = require('../lib/utils.js')
const fs = require('fs')
const path = require('path')

//-----------------------------
// Constants

const currentVersion = 0.14
const bookPath = './patchouli_books/e2e_e/en_us/'

var defaultFileContent = {
  '*': {
    name: 'Undefined category/entry',
    icon: 'minecraft:book'
  },

  patches: {
    description: 'Pick version:',
    icon: 'artisanworktables:artisans_grimoire_electrum',
    sortnum: -1,
  },
  
  worldgen: {
    name: 'World Gen',
    icon: 'biomesoplenty:earth',
    description: 'Tweaks and changes about world gereneration and mining:'
  },
  
  energy: {
    icon: 'nuclearcraft:upgrade:1',
    description: 'Things related to $(l)Energy/$ =>'
  },
  items: {
    icon: 'thaumcraft:elemental_pick',
    description: 'All about $(l)Items/$, $(l)Tools/$ and $(l)Armor/$ =>'
  },
  liquids: {
    icon: 'minecraft:water_bucket',
    description: 'Things you can do with $(l)Liquids/$ =>'
  },
  mobs: {
    icon: 'draconicevolution:mob_soul{EntityName:"minecraft:zombie"}',
    description: 'Stories about poor $(l)creatures/$ =>'
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
}


// ######################################################################
//
// Extract Patchouli_js comment blocks from .zs files
//
// ######################################################################
function loadText(filename, encoding = 'utf8') {
  return fs.readFileSync(filename, encoding)
}
function saveText(txt, filename) {
  fs.mkdirSync(path.dirname(filename), { recursive: true })
  fs.writeFileSync(filename, txt)
}
function saveObjAsJson(obj, filename) {
  saveText(JSON.stringify(obj, null, 2), filename)
}
function readdir(folderPath) {
  return fs.readdirSync(folderPath)
}
function relative(filePath) {
  return path.relative(process.cwd(), path.resolve(__dirname, filePath))
}    

var patchouliList = []

// Add Additional pages
const additional_pages_path = relative('additional_pages.js')
patchouliList.push({
  filePath: additional_pages_path,
  command: loadText(additional_pages_path)
})

// Generate list of all documentation entries
glob.sync('scripts/**/*.zs').forEach(filePath => {
  var zsfileContent = loadText(filePath)
  for (const match of zsfileContent.matchAll(/\\* *(Patchouli_js\([\s\S\n\r]*?\))\*\//gm)) {
    var lineNumber = zsfileContent.substring(0, match.index).split('\n').length
    patchouliList.push({
      filePath: filePath, 
      command: match[1], 
      line: lineNumber, 
      below: zsfileContent.substring(match.index + match[0].length),
    })
  }
})

// Patch pages
var patchesPath = relative('patches/')
readdir(patchesPath).forEach(filePath => {
  var relPath = path.resolve(patchesPath, filePath)
  patchouliList.push({
    filePath: relPath, 
    command: loadText(relPath), 
    overrides: {
      subcategory: filePath.split('.').slice(0, -1).join('.')
    }
  })
})

// ######################################################################
//
// Content-independent helper functions
//
// ######################################################################

// Match all regex from crafttweaker.log
var crafttweaker_log = null
function from_crafttweaker_log(rgx) {
  crafttweaker_log = crafttweaker_log || loadText('crafttweaker.log')
  return [...crafttweaker_log.matchAll(rgx)]
}

// Transform ZenScript's item string into Patchouli's item string
function parse_item(str) {
  var match = str.match(/^[ \n\r]*<(.*?)>(\.withTag\(([\s\S\n\r]*)\))?[ \n\r]*$/m)
  var itemDefinition = match[1]
  var nbtStr = match[3]
  if(nbtStr){
    nbtStr = nbtStr.replace(/(\b)as \w+(\b)/gm, '$1$2')
    eval('var nbtObj='+nbtStr)
    return itemDefinition + JSON.stringify(nbtObj)
  } else {
    return itemDefinition
  }
}

// Transform liquid name into bucket with this liquid
function wrap_bucket(str) {
  return `forge:bucketfilled{FluidName:"${str}",Amount:1000}`
}

// Removes trailing spaces in _each_line_ and replace \n with $(br)
function parse_text(text) {
  return text.trim().split('\n').map(s=>s.trim()).join('$(br)').replace('$(br)$(br)','$(br2)')
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
  return $i('item', array, fnc)
}

// Same as $i() but with prefix "text"
function text$i(array, fnc) {
  return $i('text', array, fnc)
}

// Takes array and split it in several pages based of type
const pageTypesLength = {
  fluid_interaction: 10,
  grid: 42,
  grid_description: 24,
  item_list:7,
  item_spread:7,
  spotlight_advanced: 5
}
function paged_full(opts, itemsOnPage, arr) {
  itemsOnPage = itemsOnPage || pageTypesLength[opts.type]

  return arr.reduce((o, m, i) => {
    const isArr = Array.isArray(m)
    var j = ~~(i/itemsOnPage)
    o[j] = o[j]||{...opts}

    o[j][`item${i%itemsOnPage}`] = isArr ? m[0] : m

    if (opts.type == 'item_list') {
      o[j][`text${i%itemsOnPage}`] = m[1]
    } else {

    }
    return o
  },[])
}

const paged = over([
  [over.object, over.numberOptional, over.array, paged_full],
  function() { throw new Error('paged() has no parameters') } // No parameters function
])

function config(cfgPath) {
  var wholePath = 'config/' + cfgPath
  var cfg = loadText(wholePath)
  cfg = cfg
    .replace(/^ *#.*$/gm, '') // Remove comments
    .replace(/^~.*$/gm, '') // config version
    .replace(/^ *(\w+|"[^"]+") *{ *$/gm, '$1:{') // class name
    .replace(/^ *} *$/gm, '},') // end of block
    .replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *= *(.*)$/gm, (match, p1, p2, p3)=>{

      return (isNaN(p3) && !(p3 === 'true' || p3 === 'false')) 
      ? `"${p1||p2}":"${p3}",` 
      : `"${p1||p2}":${p3},`
    }) // simple values

  // Replace lists
  cfg = cfg.replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *< *[\s\S\n\r]*?> *$/gm, (match, p1, p2)=>{
    var lines = match.split('\n')
    var content = lines.slice(1, lines.length-1)
    return [
      `"${p1||p2}"` + ': [',
      ...content.map(l=>`"${l.trim()}",`),
      '],'
    ].join('\n')
  })


  var result
  try {
    result = eval(`({${cfg}})`)
  } catch (error) {
    console.log('Parsing config error. File: ', wholePath)
    console.error(error)
    saveText(
      'return{'+
      cfg.replace(/\n\n+/gm, '\n')
      +'}', 
      path.resolve(__dirname, '_error_'+cfgPath.split('.').slice(0, -1).join('.')+'.js'))
  }

  return result
}

var book = {}

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
      return matchBetween(patchouliCommand.below, opts.begin, opts.end, opts.regex)
    } else {
      return matchBetween(patchouliCommand.below, opts.begin, opts.end, /[\s\S\n\r]*/gm)[0][0]
    }
  }

  // Return all matches of regex under Patchouli_js block until empty line
  function match_block_below(regex) {
    return match_below({regex, end: '\n\n'})
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
  function Patchouli_js_single(entryId, p) {
    // Parse patchouli path
    if(!entryId) entryId = 'Misc Changes'
    var patchouli_path = entryId.split('/')
    if(patchouli_path.length==1) patchouli_path.unshift('Patches', 'v'+currentVersion)
    const isSubcategory = patchouli_path.length >= 3

    // Overwrite data for generated patches
    p = {...p, ...patchouliCommand.overrides}


    function defVal(obj, field, def) {
      obj[field] = obj[field] || def
      return obj[field]
    }
    
    var obj_category = defVal(book, patchouli_path[0], {})
    var obj_entry
    var categoryPath
    var entry_name

    if(isSubcategory){
      entry_name = patchouli_path[2]
      categoryPath = `patchouli:subcategories/${snakeCase(patchouli_path[1])}`
      var obj_subcategory = defVal(obj_category, 'subcategory:'+patchouli_path[1], {})
      obj_entry = defVal(obj_subcategory, entry_name, {})
    } else {
      entry_name = patchouli_path[1]
      categoryPath = patchouli_path[0]
      obj_entry = defVal(obj_category, 'entry:'+entry_name, {})
    }

    // Guess mandatory fields for entry
    defVal(obj_entry, 'name', entry_name)
    defVal(obj_entry, 'category', categoryPath)
    defVal(obj_entry, 'pages', [])
    defVal(obj_entry, 'icon' , p.icon || p.item || 'minecraft:book')

    // Copy all fields
    var page = {}
    var entryKeys = ['category', 'subcategory', 'entry', 'icon']
    for (const key in p) {
      if (!entryKeys.includes(key)) {
        if (key[0]==='_') {
          page[key.substr(1)] = parse_text(p[key])
        } else {
          page[key] = p[key]
        }
      }
    }

    // Guess mandatory fields for page
    page.type  = page.type  || (p.item ? 'spotlight' : 'text')

    // Title is not mandatory but many page types used it
    page.title = page.title || patchouli_path[patchouli_path.length-1]

    // Add page
    obj_entry.pages.push(page)
  }
  
  const Patchouli_js = over([
    [over.stringOptionalWithDefault(''), over.array, (str, arr)=>arr.forEach(o=>Patchouli_js_single(str, o))],
    [over.stringOptionalWithDefault(''), over.object, Patchouli_js_single],
    // [over.object, obj=>Patchouli_js_single('', obj)],
    // [over.array,  arr=>arr.forEach(obj=>Patchouli_js_single('', obj))],
    function() { return } // No parameters function
  ])
  
  try {
    eval(patchouliCommand.command)
  } catch (error) {
    console.log('Patchouli_js comment block Error.\nFile:', patchouliCommand.filePath, ' Line:', patchouliCommand.line)
    console.error(error)
  }
  
})

// ######################################################################
//
// Write collected pages into patchouli folders
//
// ######################################################################

// Remove old trash can contents
const garbagePath = path.resolve(__dirname, './garbage')
fs.rmdirSync(garbagePath, { recursive: true })

// Move old patchouli files
fs.mkdir(garbagePath, { recursive: true }, (err) => {if (err) throw err});
['categories','entries'].forEach(fldr=>{
  try {
    fs.renameSync(path.resolve(bookPath, fldr), path.resolve(garbagePath, fldr))
  } catch (error) {}
})

function saveBookFile(_partName, subfolder, content) {
  var partName = snakeCase(_partName)
  saveObjAsJson(
    {
      __comment: 'This file generated automatically with Patchouli.js. All changes will be rewritten',
      ...defaultFileContent['*'], 
      ...defaultFileContent[partName],
      name: _partName,
      ...content
    }, 
    bookPath + subfolder + partName +'.json'
  )  
  return partName
}

// Iterate through new generated book entries
for (const [_categoryName, category] of Object.entries(book)) {

  var categoryName = saveBookFile(_categoryName, 'categories/', 
    {}
  )
  
  for (const [_subcategoryName, subcategory] of Object.entries(category)) {

    var actualName = _subcategoryName.split(':').slice(1).join(':')
    var isCategory = _subcategoryName.startsWith('subcategory:')
    if(isCategory) {
      var subcategoryName = saveBookFile(actualName, 'categories/subcategories/', {
        parent: 'patchouli:'+categoryName,
      })
      
      for (const [_entryName, entry] of Object.entries(subcategory)) {
        saveBookFile(_entryName, `entries/${categoryName}/${subcategoryName}/`, entry )
      }
    } else {
      saveBookFile(actualName, `entries/${categoryName}/`, subcategory )
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

