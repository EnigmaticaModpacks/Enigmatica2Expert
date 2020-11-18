
const {table} = require('table')
const { orderBy } = require('natural-orderby')

const {transpose, loadText, saveText, injectInFile} = require('../lib/utils.js')
const {max, round, abs, sign,sqrt,pow,log} = Math // eslint-disable-line

/*=============================================
=                Parsing                      =
=============================================*/
const _sqrt = 'sqrt(abs(n*10))*sign(n)' // Special importancy for handle
const toInt = 'max(1,round(n))'

const Armory_mediumBuff = ['*1.5+1','*1.5+1','*1.5+0.5','*1.5+1','+0.25','+5']
const Armory_slightNerf = ['*0.6','*0.6','*0.6','*0.6','*0.6','*0.6']

/*=============================================
=               Material Tweaks               =
=============================================*/
const tweaks = {
	'Armory Stat Tweaks':{
		_names             : ['CoreDurability' ,'Defense','Modifier'      ,'PlatesDurability','Toughness','ExtraDurability'],
		_importancy        : ['sqrt((n+10)*10)-10', 'n*0.5' ,'sqrt((n+1)*10)-3', 'n*0.3', 'pow(n+2,2)-4', 'n*0.5'          ] ,

		'dark_steel'       : [      ''         , ''      , ''             , ''               , 3         , ''              ] ,
		'end_steel'        : [    '*2'         , '*2'    , ''             , '*2'             , ''        , '*2'            ] ,
		'treatedwood'      : [      ''         , ''      , '*0.72'        , ''               , ''        , ''              ] ,
		'xu_demonic_metal' : [      ''         , '*0.45' , '*0.8'         , ''               , ''        , ''              ] ,
		'ma.prosperity'    : [      ''         , ''      , '+1'           , '+5'             , ''        , ''              ] ,
		'ma.soulium'       : [      ''         , ''      , ''             , ''               , ''        , ''              ] ,
		'ma.base_essence'  : [      ''         , ''      , ''             , ''               , ''        , ''              ] ,
		'ma.inferium'      : [      ''         ,      '' ,      ''        , '*2'             , 1        , '*2'             ] ,
		'ma.prudentium'    : [      ''         ,      '' ,      ''        , '*2'             , 1.5        , '*2'           ] ,
		'ma.intermedium'   : [      ''         ,      '' ,      ''        , '*2'             , 2        , '*2'             ] ,
		'ma.superium'      : [      ''         ,      '' ,      ''        , '*2'             , 2.5        , '*2'           ] ,
		'ma.supremium'     : [      ''         ,      '' ,      ''        , '*2'             , 3        , '*2'             ] ,
		'boron'            : [  '*1.5'         , '*1.5'  , ''             , ''               , ''        , ''              ] ,
		'tough'            : [ '*1.18'         , '*1.5'  , ''             , ''               , '*1.5'    , ''              ] ,
		'hard_carbon'      : [ '*1.08'         , '*1.5'  , ''             , ''               , '*1.51'   , ''              ] ,
		'boron_nitride'    : [    '*2'         , '*1.5'  , ''             , ''               , '*1.97'   , ''              ] ,
		'starmetal'        : [  '*0.8'         , '*1.06' , '*20'          , '*1.6'           , '*4.67'   , ''              ] ,
		'iridium'          : [  '*0.7'         , '*1.44' , '*1.44'        , '-11'            , '*0.8'    , '*0.33'         ] ,
		'thaumium'         : [ '*1.23'         , '*1.25' ,'*17.69'        , '*4.5'           , '-0.75'   , '*3'            ] ,
		'osmiridium'       : [      ''         , '*1.26' , ''             , ''               , 2.2       , ''              ] ,
		'titanium'         : [    '*3'         , '*1.23' , ''             , '*3'             , ''        , '*3'            ] ,
		'chocolate'        : [      ''         , ''      , '+0.5'         , ''               , ''        , ''              ] ,
		'livingwood'       : [      '+7'       , ''      , ''             , ''               , ''        , ''              ] ,
		'dreamwood'        : [      '*2'       , '*2'    , ''             , '*2'             , ''        , '*2'            ] ,
		'livingrock'       : [     '*2'        , '*2'    , '+1'           , '*2'             , '+0.25'   , '*2'            ] ,
		'meat_metal'       : [     '*1.5'      , '*1.5'  , '+1'           , '*1.5'           , '+0.25'   , '+20'           ] ,
		'signalum'         : [     '*2'        , '*2'    , '*2'           , '*2'             , '+1'      , '+20'           ] ,
		'lumium'           : [     '*2'        , '*2'    , '*2'           , '*2'             , '+1'      , '+20'           ] ,
		'mica'             : [     ''          , '*2'    , ''             , ''               , ''        ,''               ] ,
		'apatite'          : [     ''          , '/2'    , ''             , ''               , ''        ,''               ] ,
		'crystal_matrix'   : [     ''          , ''      , ''             , ''               , '+1'      ,''               ] ,
		'refined_obsidian' : [     '*0.6'      , '*0.6'  , ''             , ''               , ''        ,''               ] ,
		'infinity_metal'   : [     ''          , ''      , ''             , ''               , 30        , ''              ] ,

		'amethyst': Armory_mediumBuff,
		'carbon_fiber': Armory_slightNerf,
	},

	'Arrow Shaft Stat Tweaks':{
		_names                        : ['Modifier','BonusAmmo'],
		_output                       : [       'n', 'round(n)'],
		_importancy                   : [   'n*10.0',   'n*0.2'],

		'reed'                        : [    '*0.7',     '*0.5'],
		'polyethylene'                : [        '',       '/2'],
	},

	'Bowstring Stat Tweaks':{
		_names                        : ['Modifier'],
		_importancy                   : [   'n*10.0'],

		'mana_string'                 : [       1.3],
		'soularium'                   : [       1.5],
	},

	'Fletching Stat Tweaks':{
		_names                       : ['Accuracy','Modifier'],
		_importancy                  : [   'n*40.0',   'n*10.0'],

		'stymph_feather'             : [    '*1.1',    '*1.5'],
		'titanium'                   : [    '*1.2',    '*1.2'],
	},

	'Stat Tweaks': {
		_names                        : ['HeadDurability','MiningSpeed','AttackDamage','HarvestLevel','HandleModifier','HandleDurability','ExtraDurability','DrawSpeed' ,'Range'       ,'BonusDamage'],
		_output                       : [   toInt        , 'n'         , 'n'          , toInt        ,'n'             , toInt            , toInt           , 'n'        , 'n'          , 'n']         ,
		_importancy                   : [   _sqrt+'/3'  , 'pow(n+1,2)','pow(n+1,2)/5', 'n*5'        , 'pow(n+3,2)-9' , 'log(abs(n)+1)*sign(n)+8'    , 'log(n+50)*2-4', 'sqrt(n*10)', 'n*4'     , 'n*2'] ,

		'dark_steel'                  : [      ''        , ''          , '*1.44'      , ''           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'end_steel'                   : [  '*1.5'        , '*1.83'     , '*1.49'      , ''           , ''             , ''               , ''              , ''         , ''           , '*1.22']     ,
		'treatedwood'                 : [  '*4.0'        , '*2.50'     , '*2.50'      , 2            , ''             , '*3.5'           , ''              , ''         , ''           , '']          ,
		'livingwood'                  : [  '*1.5'        , '*1.5'      , '*1.5'       , ''           , ''             , '*3.5'           , ''              , ''         , ''           , '']          ,
		'xu_demonic_metal'            : [      ''        , ''          , '*1.08'      , ''           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'redstone_alloy'              : [      ''        , ''          , ''           , 3            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'meat_metal'                  : [      ''        , ''          , ''           , 5            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'aquamarine'                  : [      ''        , ''          , ''           , 1            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'pulsating_iron'              : [      ''        , ''          , ''           , '+2'         , ''             , ''               , ''              , ''         , ''           , '']          ,
		'apatite'                     : [      ''        , ''          , ''           , 0            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'ma.inferium'                 : [      ''        , ''          , ''           , 5            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'ma.prudentium'               : [      ''        , ''          , ''           , 6            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'ma.intermedium'              : [      ''        , ''          , ''           , 7            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'ma.superium'                 : [      ''        , ''          , ''           , 8            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'ma.supremium'                : [      ''        , ''          , ''           , 10           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'dragonsteel_fire'            : [      ''        , ''          , ''           , 9            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'dragonsteel_ice'             : [      ''        , ''          , ''           , 9            , ''             , ''               , ''              , ''         , ''           , '']          ,

		'palis_crystal'               : [  '*1.2'        , '*1.2'      , '*1.2'       , ''           , ''             , ''               , '+200'          , ''         , ''           , '']          ,
		'restonia_crystal'            : [  '*1.2'        , '*2'        , '*1.2'       , ''           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'void_crystal'                : [  '*1.5'        , '*1.5'      , '*1.5'       , ''           , ''             , ''               , ''              , ''         , '*3'         , '']          ,
		'enori_crystal'               : [    '*2'        , '*1.5'      , '*1.5'       , ''           , ''             , ''               , ''              , ''         , ''           , '']          ,

		'ma.prosperity'               : [      ''        , ''          , ''           , 4            , 1.4            , ''               , ''              , ''         , ''           , '+2']        ,
		'ma.soulium'                  : [    '*2'        , ''          , ''           , ''           , ''             , ''               , '*1.3'          , '*1.3'     , ''           , '']          ,
		'ma.base_essence'             : [      ''        , ''          , ''           , '*2.5'       , '*3.5'         , ''               , ''              , ''         , ''           , '+2.5']      ,

		'magnesium'                   : [      ''        , ''          , ''           , 8            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'thorium'                     : [      ''        , ''          , ''           , 8            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'boron'                       : [  '*1.5'        , ''          , '*2'         , 8            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'tough'                       : [  '*1.5'        , ''          , '*2'         , 7            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'hard_carbon'                 : [  '*1.5'        , ''          , '*2'         , 7            , ''             , ''               , ''              , ''         , ''           , '']          ,
		'boron_nitride'               : [  '*1.5'        , ''          , '*2'         , '*2.25'      , ''             , ''               , ''              , ''         , ''           , '']          ,

		'mica'                        : [      ''        , ''          , ''           , ''           , ''             , ''               , '+700'          , ''         , ''           , '']          ,
		'osgloglas'                   : [  '*0.8'        , '*0.8'      , '*0.8'       , ''           , ''             , ''               , ''              , ''         , ''           , '']          ,

		'integrationforegoing.plastic': [      ''        , '*0.78'     , ''           , ''           , ''             , ''               , ''              , 4.5        , ''           , '']          ,
		'starmetal'                   : [ '*0.52'        , '*1.33'     , '*1.21'      , '*2.33'      , '*1.67'        , '*1.5'           , '*7.65'         , '*0.63'    , '*1.25'      , '*4']        ,
		'thaumium'                    : [  '*0.8'        , ''          , '*0.77'      , '*1.33'      , '*0.77'        , '*1.53'          , '*1.84'         , '*0.58'    , '*1.8'       , '*9.5']      ,
		'osmiridium'                  : [      ''        , '*0.77'     , '*0.77'      , '*0.77'      , '*0.77'        , ''               , '*10'           , ''         , ''           , '']          ,
		'titanium'                    : [ '*3.38'        , '*2.11'     , ''           , '*2'         , '*2'           , ''               , ''              , '*0.74'    , ''           , '']          ,
		'infinity_metal'              : [ ''             , 25          , 300          , 15           , ''             , ''               , ''              , ''    , ''           , 300]          ,

		'neutronium'                  : [      ''        , ''          , ''           , 12           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'wyvern_metal'                : [      ''        , ''          , ''           , 12           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'crystal_matrix'              : [      ''        , ''          , ''           , 11           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'aethium'                     : [      ''        , ''          , ''           , 10           , ''             , ''               , ''              , ''         , ''           , '']          ,
		'vibrant_alloy'               : [      ''        , ''          , ''           ,  9           , ''             , ''               , ''              , ''         , ''           , '']          ,
	}
}

/*=============================================
=                  Parse                      =
=============================================*/

// Format big numbers
function nice(v) { return  round(parseFloat(v)*100)/100}

let cfg = loadText('../default_configs/tweakersconstruct.cfg')
let currentCfg = loadText('../../config/tweakersconstruct.cfg')
let formattedTable = ''

function isNumber(s) { return /^\d+\.?\d*$/.test(s) }
function cut(s) { return s.substr(Math.max(0, s.length - 20)) }
function bigTableEntry(val, matID, isRound=false) { return `${((isRound ? round(val,2) : nice(val)) + '').padStart(5)} ${cut(matID)}` }

function tweakValue(defVal, n, outputCommand) {
  if (!n) return defVal

  if(n==='' || n==='d' || n==defVal) return 'd'
  if(!isNumber(n)) n = nice(eval(defVal + n))
  n = eval(outputCommand)

  return n
}

function tweakMaterial(tweakGroup, matID, tweakObj, defaultVals) {
  const nums = defaultVals.map((defVal,i) =>
    tweakValue(defVal, tweakObj[matID]?.[i], tweakObj._output?.[i] || 'n')
  )
	let isActuallyTweaked = nums.some((v,i)=>v!=defaultVals[i])

	// Compute total power of material after tweaks
	let power = 0
	nums.forEach((num,i) => {
		let n = isNaN(num) ? 0 : num // eslint-disable-line
		power += eval(tweakObj._importancy[i])
	})

	return {
    nums,
		mat: matID,
		power,
		raw: `        ${matID}:${nums.join(':')}`,
		tweaked: isActuallyTweaked
	}
}

function injectToEquipments(list, varName) {
	const listStr = list
		.map(l=>`${('"'+l.mat+'"').padEnd(30)}, # ${round(l.power, 2)}`)
		.join('\n')

  injectInFile(
    'scripts/EquipGeneration.zs',
    `static ${varName} as IData = [\n`,
    listStr,
    '\n] as IData;'
  )
}

function logBigTable(tweakGroup, tweakObj, bigTable) {
	// Output a table of values
	formattedTable += tweakGroup+'\n'+table([
		['Total Power',...tweakObj._names.map((name,i)=>name+'\n'+tweakObj._importancy[i])],
		...transpose( bigTable.map(bt=>orderBy(bt)) ),
		['Total Power',...tweakObj._names],
	],{
		drawHorizontalLine: (i, size) => i === 0 || i === 1 || i === size-1 || i === size-2
	}) + '\n\n'
}

// Compare group of parameters like "Armory Stat Tweaks" or "Fletching Stat Tweaks"
// And save them to variable
function parseStats(tweakGroup, tweakObj) {
	const lookupString = `(S:"?${tweakGroup}"? <[\\n\\r])([\\r\\s\\S]*?)\\n(     >)`

	const rgx = new RegExp(lookupString)
	const cfgListChunk = cfg.match(rgx)[0]


	const list = [] // New recalculated values list
	const realMats = [] // Materials that exists in current pack
	const bigTable = [[], ...tweakObj._names.map(()=>[])]

	for (const match of cfgListChunk.matchAll(/^ *(?<matID>[^:\n]+):(?<rawValues>[^<\n]+)$/gm)) {
		const matID = match.groups.matID
		let defaultVals = match.groups.rawValues.split(':')

		realMats.push(matID)

    const tweaked = tweakMaterial(tweakGroup, matID, tweakObj, defaultVals)
    list.push(tweaked)

    // Add values to big table
    bigTable[0].push(bigTableEntry(tweaked.power, tweaked.mat, true))
    tweaked.nums.forEach((num,i) => {
      // let n = num
      // let importancy = eval(tweakObj._importancy[i])
      // let resultStr = (nice(importancy)+' ').padStart(6)+valMat(n);
      bigTable[i+1].push(bigTableEntry(num, tweaked.mat))
    })
	}

  list.sort((a,b) => a.power - b.power)

  if(tweakGroup === 'Armory Stat Tweaks') injectToEquipments(list, 'defaultArmorMats')
  if(tweakGroup === 'Stat Tweaks')        injectToEquipments(list, 'defaultWeaponMats')

  logBigTable(tweakGroup, tweakObj, bigTable)

	// Write back in cfg loaded text
	currentCfg = currentCfg.replace(new RegExp(lookupString, 'm'), `$1${
    list.filter(l=>l.tweaked).map(l=>l.raw).join('\n') + '\n'
  }$3`)

	// console.log('unusedTweaks :>> ', Object.keys(obj).reduce((o,cur)=>{
	//   if(!realMats.includes(cur)) o.push(cur);
	//   return o;
	// }, []));
}

// Loop through tweaks at start of file
for (const [key, value] of Object.entries(tweaks)) {
	parseStats(key, value)
}

// Save in file
saveText(currentCfg, '../../config/tweakersconstruct.cfg')

// Save for analytics
saveText(formattedTable, './tweakersconstruct_table.cs')