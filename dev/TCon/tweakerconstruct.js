/*

	This script parsing default Tweakerconstruct config and special tweakers
	csv files to make new tweaks

*/


const {max, round, abs, sign,sqrt,pow,log} = Math // eslint-disable-line
const {table} = require('table')
const {orderBy} = require('natural-orderby')
const fs = require('fs')
const path = require('path')
const csv = require('csvtojson')
const glob = require('glob')

const paths = {
	utils:                '../lib/utils.js',
	default_config:       'dev/default_configs/tweakersconstruct.cfg',
	tweakerconstruct_cfg: 'config/tweakersconstruct.cfg',
	equipGenration_zs:    'scripts/EquipGeneration.zs',
	oredict_zs:   			  'scripts/OreDict.zs',
	bigTable:             path.resolve(__dirname, './tweakersconstruct_table.cs'),// eslint-disable-line
}

const {transpose, injectInFile, begin, end} = require(paths.utils)

/*=============================================
=                  Parse                      =
=============================================*/


// Format big numbers
begin('Loading files .')
let cfg = fs.readFileSync(paths.default_config, 'utf8')
begin('.')
let currentCfg = fs.readFileSync(paths.tweakerconstruct_cfg, 'utf8')
end()
let formattedTable = ''

function isNumber(s) { return /^\d+\.?\d*$/.test(s) }
function nice(v) { return  round(parseFloat(v)*100)/100}
function cut(s) { return s.substr(Math.max(0, s.length - 20)) }
function bigTableEntry(val, matID, isRound=false) {
	return `${((isRound ? round(val,2) : nice(val)) + '').padStart(5)} ${cut(matID)}`
}

function tweakValue(defVal, n, outputCommand) {
  if(n==null || n==='' || n==='d' || n==defVal) return 'd'
  if(!isNumber(n)) n = nice(eval(defVal + n))
	n = eval(outputCommand)

	if(parseFloat(n) === parseFloat(defVal)) return 'd'

  return n
}


function tweakMaterial(tweakGroup, matID, tweakObj, defaultVals) {
  const nums = defaultVals.map((defVal,i) =>
    tweakValue(defVal, tweakObj[matID]?.[i], tweakObj._output?.[i] || 'n')
	)
	const reals = nums.map((n,i)=>parseFloat(isNaN(n) ? (parseFloat(defaultVals[i]) || 0.0) : n))
	let isActuallyTweaked = nums.some((v,i)=>
		v!=='d' && v!=defaultVals[i]
	)

	// Compute total power of material after tweaks
	let power = 0
	reals.forEach((num,i) => {
		let n = num // eslint-disable-line
		power += eval(tweakObj._importancy[i])
	})

	return {
		nums,
		reals,
		mat: matID,
		power,
		tweaks: tweakObj[matID] ?? nums.map(()=>''),
		raw: `        ${matID}:${nums.join(':')}`,
		tweaked: isActuallyTweaked
	}
}

function injectToEquipments(list, varName) {
	const listStr = list
		.map(l=>`  ${('"'+l.mat+'"').padEnd(25)}, # ${round(l.power, 2)}`)
		.join('\n')

  injectInFile(
    paths.equipGenration_zs,
    `static ${varName} as IData = [\n`,
    listStr,
    '\n] as IData;'
  )
}

function injectOreDicts(list) {
	const acc = {}
	list.forEach(l=>{
		const lvl = l.reals[3]
		acc[lvl] = acc[lvl] ?? []
		acc[lvl].push(l.mat)
	})

	let listStr = ''
	for (const [lvl,arr] of Object.entries(acc)) {
		listStr += `# addSharpeningKitOredict(${lvl}, [${arr.map(m=>'"'+m+'"').join(', ')}]);\n`
	}


  injectInFile(
    paths.oredict_zs,
`# ------------------------------------------------
# Mining level Sharpening Kits
# generated automatically with tweakerconstruct.zs\n`,
		listStr,
    '# ------------------------------------------------'
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

const invalidTweaks = new Set()
const absentTweaks = new Set()

// Compare group of parameters like "Armory Stat Tweaks" or "Fletching Stat Tweaks"
// And save them to variable
function parseStats(tweakGroup, tweakObj) {
	const lookupString = `(S:"?${tweakGroup}"? <[\\n\\r])([\\r\\s\\S]*?)\\n(     >)`

	const rgx = new RegExp(lookupString)
	const cfgListChunk = cfg.match(rgx)[0]


	const list = [] // New recalculated values list
	const existMats = new Set() // Materials that exists in current pack
	const bigTable = [[], ...tweakObj._names.map(()=>[])]

	for (const match of cfgListChunk.matchAll(/^ *(?<matID>[^:\n]+):(?<rawValues>[^<\n]+)$/gm)) {
		const matID = match.groups.matID
		let defaultVals = match.groups.rawValues.split(':')

		existMats.add(matID)

    const tweaked = tweakMaterial(tweakGroup, matID, tweakObj, defaultVals)
    list.push(tweaked)

    // Add values to big table
    bigTable[0].push(bigTableEntry(tweaked.power, tweaked.mat, true))
    tweaked.reals.forEach((real,i) => {
      // let n = real
      // let importancy = eval(tweakObj._importancy[i])
      // let resultStr = (nice(importancy)+' ').padStart(6)+valMat(n)
      bigTable[i+1].push(bigTableEntry(real, tweaked.mat))
    })
	}

  list.sort((a,b) => a.power - b.power)

  if(tweakGroup === 'Armory Stat Tweaks') injectToEquipments(list, 'defaultArmorMats')
  if(tweakGroup === 'Stat Tweaks') {
		injectToEquipments(list, 'defaultWeaponMats')
		injectOreDicts(list)
	}

  logBigTable(tweakGroup, tweakObj, bigTable)

	// Write back in cfg loaded text
	currentCfg = currentCfg.replace(new RegExp(lookupString, 'm'), `$1${
    list.filter(l=>l.tweaked).map(l=>l.raw).join('\n') + '\n'
  }$3`)

	// Invalid tweaks (exist in tweaks, but absent in actual tweakerconstruct.cfg)
	Object.keys(tweakObj).forEach(o=>{
		if(o.substr(0,1) !== '_' && !existMats.has(o)) invalidTweaks.add(o)
	})
	;[...existMats.values()].forEach(o=>{
		if(!tweakObj[o]) absentTweaks.add(o)
	})
}

async function start() {
	begin('Parsing csv ')
	for(const filePath of glob.sync('dev/TCon/tweaks/*.csv')) {
		begin('.')
		const fileName = path.basename(filePath).split('.').slice(0, -1).join('.')
		const result = await csv({
			noheader:true,
			output: 'csv'
		}).fromFile(filePath)

		parseStats(fileName, result.reduce((a,v)=>(a[v[0]]=v.slice(1),a), {}))
	}
	end()

	begin('Saving files .')
  fs.writeFileSync(paths.tweakerconstruct_cfg, currentCfg)
	begin('.')
	fs.writeFileSync(paths.bigTable, formattedTable)
	end()

	if(invalidTweaks.size>0) {
		console.log(`Found ${invalidTweaks.size} invalid materials for tweaks: ${[...invalidTweaks].join(', ')}`)
	}
	if(absentTweaks.size>0) {
		console.log(`Found ${absentTweaks.size} materials without tweaks: ${[...absentTweaks].join(', ')}`)
	}
}
start()