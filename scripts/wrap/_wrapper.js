const replace = require('replace-in-file')
const fs = require('fs')
const path = require('path')
const _ = require('lodash')

//##############################################################
//
// Functions
//
//##############################################################

/* Lookup docs string
(?!//|#)mods\.(?!jei|JAOPCA)\w+(\.\w+){1,2}\.(?!remove)\w+\((\w|\[\w).*\)
*/


const typeSerialize = [
  ['string'             , 'serialize._string($1)'            ],
  ['string[]'           , 'serialize.string__($1)'           ],
  ['CTAspectStack'      , 'serialize.CTAspectStack($1)'      ],
  ['CTAspectStack[]'    , 'serialize.CTAspectStack__($1)'    ],
  ['IBlock'             , 'serialize.IBlock($1)'             ],
  ['IGasStack'          , 'serialize.IGasStack($1)'          ],
  ['IIngredient'        , 'serialize.IIngredient($1)'        ],
  ['IIngredient[]'      , 'serialize.IIngredient__($1)'      ],
  ['IIngredient[][]'    , 'serialize.IIngredient____($1)'    ],
  ['IItemStack'         , 'serialize.IItemStack($1)'         ],
  ['IItemStack[]'       , 'serialize.IItemStack__($1)'       ],
  ['IItemStack[][]'     , 'serialize.IItemStack____($1)'     ],
  ['ILiquidDefinition'  , 'serialize.ILiquidDefinition($1)'  ],
  ['ILiquidStack'       , 'serialize.ILiquidStack($1)'       ],
  ['ILiquidStack[]'     , 'serialize.ILiquidStack__($1)'     ],
  ['IOreDictEntry'      , 'serialize.IOreDictEntry($1)'      ],
  ['WeightedItemStack'  , 'serialize.WeightedItemStack($1)'  ],
  ['WeightedItemStack[]', 'serialize.WeightedItemStack__($1)'],

  ['int'    , '$1'],
  ['bool'   , '$1'],
  ['short'  , '$1'],
  ['long'   , '$1'],
  ['float'  , '$1'],
  ['double' , '$1'],
  ['byte'   , '$1'],
  ['boolean', '$1'],

  ['int[]'    , 'serialize.string__($1)'],
  ['bool[]'   , 'serialize.string__($1)'],
  ['short[]'  , 'serialize.string__($1)'],
  ['long[]'   , 'serialize.string__($1)'],
  ['float[]'  , 'serialize.string__($1)'],
  ['double[]' , 'serialize.string__($1)'],
  ['byte[]'   , 'serialize.string__($1)'],
  ['boolean[]', 'serialize.string__($1)'],
]

const typesAliases = [
  ['IIngredient' , /itemInput\d*/  ] ,
  ['IItemStack'  , /itemOutput\d*/ ] ,
  ['ILiquidStack', /fluidInput\d*/ ] ,
  ['ILiquidStack', /fluidOutput\d*/] ,
  ['IIngredient' , /blockInput\d*/ ] ,
  ['IIngredient' , /blockOutput\d*/] ,
  ['string' , /String/i] ,
  ['bool' , /Boolean/i] ,
]

//##############################################################
//
// Helpers
//
//##############################################################
function loadText(filename, encoding = 'utf8') {
  return fs.readFileSync(path.resolve(__dirname, filename), encoding)
}

function saveText(txt, filename) {
  fs.writeFileSync(path.resolve(__dirname, filename), txt)
}

const noTypeSet = new Set()

function getSerialization(type) {
  const replStr = typeSerialize.find(o=>o[0].toLowerCase() === type.toLowerCase())
  if(!replStr) {
    if(!noTypeSet.has(type)) {
      noTypeSet.add(type)
      console.error('Type serialization not found! ==> ', type)
    }
    return 'TYPE_SERIALIZE_NOT_FOUND'
  }
  return replStr[1]
}

//------------------------------------------------------------------
// Parse all avaliable functions
//------------------------------------------------------------------
const signatureStrings = loadText('_functions.java')
  .replace(/\/\*[\s\S]*?\*\/|([^\\:]|^)\/\/.*$/gm, '$1') // Block comments, line comments
  .split('\n')
  .filter(l=>l.trim())

console.log('Loaded signatures: ', signatureStrings.length)

const signatures = signatureStrings.map(s=>{
  const m = s.match(/^mods\.(?<mod>\w+)\.(?<class>\w+(\.\w+)?)\.(?<method>\w+)\((?<args>.*)\)$/)
  m.groups.args = m.groups.args
    .replace(/^\[|\]$/gm, '')
    .split(',')
    .map((a,i)=>{
      const g = a.trim()
        .match(/(?<isOptional>@[Oo]ptional )?(?:(?<type1>[^ ]+) (?<name1>[^ ]+)$|(?<name2>[^ ]+) as (?<type2>[^ ]+)$|^(?<type3>[^ ]+)$)/)
        .groups


      function fixType(v, cb) {
        for (const [alias, typeRgx] of typesAliases) {
          if(typeRgx.test(v)) {
            return cb(alias, typeRgx)
          }
        }
        return v
      }

      if(g.type3) {
        fixType(g.type3, alias => {
          g.type1 = alias, g.name1 = g.type3
        })
      }

      return {
        name: (g.name1 || g.name2 || `arg${i}`).replace(/^(in)$/, '_$1'),
        type: fixType(g.type1 || g.type2 || g.type3, v=>v),
        isOptional: g.isOptional != undefined
      }
    })
  return {...m.groups, source: s}
})


//------------------------------------------------------------------
// Create data structure
// mod{} -> class{} -> method{} -> functions[] -> 3 types of arguments {}
//------------------------------------------------------------------
let rgx_mod    = new Set()
let rgx_class  = new Set()
let rgx_method = new Set()

const structure = {}
let functionsCount = 0
let overloadCount = 0
signatures.forEach(sig => {
  // mods
  if(!structure[sig.mod]) {
    structure[sig.mod] = {}
    rgx_mod.add(sig.mod)
  }

  // classes in mod
  if(!structure[sig.mod][sig.class]) {
    structure[sig.mod][sig.class] = {}
    rgx_class.add(sig.class)
  }

  // Method in class
  if(!structure[sig.mod][sig.class][sig.method]) {
    structure[sig.mod][sig.class][sig.method] = []
    rgx_method.add(sig.method)
  }

  // functions in method
  function pushFunction(args) {
    structure[sig.mod][sig.class][sig.method].push({
      ['<ARGS_ZS>' ]: args.map(a=>`${a.name} as ${a.type}`).join(', '),
      ['<ARGS_STR>']: args.map(a=>a.name.replace(/(.*)/, getSerialization(a.type))).join(', '),
      ['<ARGS_REF>']: args.map(a=>a.name).join(', '),
    })
    functionsCount++
  }
  let argFrom = null
  let argTo = 0
  sig.args.forEach((arg,i) => {
    if(arg.isOptional) {
      if(argFrom==null) {
        pushFunction(sig.args.slice(i))
      } else {
        pushFunction(sig.args.slice(0, i))
      }
      overloadCount++
    } else {
      if(argFrom==null) argFrom = i
      argTo = Math.max(argTo, i+1)
    }
  })
  pushFunction(sig.args.slice(argFrom))
})
console.log('Parsed functions: ', functionsCount, ' Including overloaded: ', overloadCount)


//------------------------------------------------------------------
// Find all occurances in .zs files
// and replace them with scripts.wrap.
//------------------------------------------------------------------
let rgx =
  '^(?<before>[ 	]*(?!//+|#+)[ 	]*(import )?)'+
  '(?<namespace>mods|scripts.wrap)'+
  `.(?<mod>${   [...   rgx_mod].join('|')})`+
  `.(?<class>${ [... rgx_class].join('|')})`+
  `.(?<method>${[...rgx_method].join('|')})`+
  '(?<after>[ 	\n]*[(;])'
const replaceRegexp = new RegExp(rgx, 'gm')
// console.log('Replace Regexp: ', replaceRegexp.source);
// let rgx = /^[ 	]*(?!\/\/+|#+)[ 	]*(import )?mods\.(?!jei|jaopca|ctutils|zentoolforge|mekatweaker|artisanworktables)\w+(\.(?!remove\w*)\w+){1,}[ 	]*[(;]/gm

let totalReplaced = 0
let functionsSet = new Set()

const options = {
  files: 'scripts/**/*.zs',
  ignore: 'scripts/wrap/*',
  from: replaceRegexp,
  countMatches: true,
  // dry: true,
  to: (...args) => {
    let g = args[args.length-2]

    // Increment counters
    function inc(p) {_.set(structure, [...p, '_counter'], _.get(structure, [...p, '_counter'], 0)+1)}
    inc([g.mod])
    inc([g.mod, g.class.replace('_','.')])
    inc([g.mod, g.class.replace('_','.'), g.method])

    functionsSet.add([g.mod, g.class, g.method].join('.'))
    totalReplaced++

    return `${g.before}scripts.wrap.${g.mod}.${g.class.replace(/\./g,'_')}.${g.method}${g.after}`
    // return '$<before>scripts.wrap.$<mod>.$<class>.$<method>$<after>'
  },
}


try {
  const results = replace.sync(options)
  // console.log('Replacement results:', results);
  const changedFiles = results
    .filter(result => result.hasChanged)
    .map(result => result.numReplacements + ' ' + result.file)

  // console.log('changedFiles :>> ', changedFiles);
}
catch (error) {
  console.error('Error occurred:', error)
}

console.log('Total replaces: ', totalReplaced)


//------------------------------------------------------------------
// Write content in file
//------------------------------------------------------------------
const [
  tempelate_Header,
  tempelate_ClassHead,
  tempelate_Method,
  tempelate_Function,
  tempelate_ClassTail,
] = loadText('_tempelate').split('/*<SPLITTER>*/')

const fileContent = {}

for (const [modName, modObj] of Object.entries(structure)) {

  for (const [className, classObj] of Object.entries(modObj)) {
    let classText = ''

    for (const [methodName, methodObj] of Object.entries(classObj)) {

      if(methodObj._counter && Array.isArray(methodObj)) {
        for (const funcArgs of methodObj) {
          let functionText = tempelate_Function
          for (const [aKey, aTxt] of Object.entries(funcArgs)) {
            functionText = functionText.replace(aKey, aTxt)
          }
          classText = classText || tempelate_Method.replace(/<METHOD_USES>/g, methodObj._counter)
          classText += functionText.replace(/<METHOD>/g, methodName)
        }
      }
    }

    if(classText) {
      classText = tempelate_ClassHead
        .replace(/<CLASS_USES>/g, classObj._counter)
        + classText + tempelate_ClassTail

      fileContent[modName] = fileContent[modName] || tempelate_Header
        .replace(/<MOD>/g, modName)
        .replace(/<MOD_USES>/g, modObj._counter)

      fileContent[modName] += classText
        .replace(/<CLASS>/g, className.replace(/\./g,'_'))
        .replace(/<CLASS_PURE>/g, className)
        .replace(/<MOD>/g, modName)
    }
  }
}

let rewrittenFiles = 0
for (const [modName, txt] of Object.entries(fileContent)) {
  saveText(txt, `${modName}.zs`)
  rewrittenFiles++
}
console.log('Rewritten wrap files :>> ', rewrittenFiles)

console.log('Functions used :>>\n----------------------')
functionsSet.forEach(s=>{
  let method = signatures.find(g=>new RegExp(`${g.mod}.${g.class}.${g.method}`).test(s))

  console.log(method.source)
})
console.log('----------------------')