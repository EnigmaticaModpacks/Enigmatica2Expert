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
	equipData_zs:    			'scripts/equipment/equipData.zs',
	oredict_zs:   			  'scripts/OreDict.zs',
	bigTable:             path.resolve(__dirname, './tweakersconstruct_table.cs'),// eslint-disable-line
}

const {transpose, injectInFile, begin, end} = require(paths.utils)

/*=============================================
=                  Parse                      =
=============================================*/


// Format big numbers
begin('  Loading configs .')
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

const invalid = {
	material: new Set(),
	absent: new Set(),
	fileInject: new Set(),
}

function injectToEquipments(list, varName) {
	const listStr = list
		.filter(l => ![
			'ma.superium',
			'ma.supremium',
			'spectre',
			'draconic_metal',
			'neutronium',
			'aethium',
			'chaotic_metal',
			'infinity_metal',
		].includes(l.mat))
		.map(l=>`  ${('"'+l.mat+'"').padEnd(25)}, # ${round(l.power, 2)}`)
		.join('\n')

	const injectResult = injectInFile(
    paths.equipData_zs,
    `val ${varName} as IData = [\n`,
    '\n] as IData;',
    listStr
  )

  if(!injectResult.length) {
		invalid.fileInject.add(`${paths.equipData_zs}: ${varName}`)
	}
}

function logBigTable(tweakGroup, tweakObj, bigTable) {
	// Output a table of values
	formattedTable += tweakGroup+'\n'+table([
		['Total Power',...tweakObj._names.map((name,i)=>name+'\n'+tweakObj._importancy[i])],
		...transpose( bigTable.map(bt=>orderBy(bt)) ),
		['Total Power',...tweakObj._names],
	],{
		drawHorizontalLine: (i, size) => i === 0 || i === 1 || i === size || i === size-1
	}) + '\n\n'
}

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
  if(tweakGroup === 'Stat Tweaks')        injectToEquipments(list, 'defaultWeaponMats')

  logBigTable(tweakGroup, tweakObj, bigTable)

	// Write back in cfg loaded text
	currentCfg = currentCfg.replace(new RegExp(lookupString, 'm'), `$1${
    list.filter(l=>l.tweaked).map(l=>l.raw).join('\n') + '\n'
  }$3`)

	// Invalid tweaks (exist in tweaks, but absent in actual tweakerconstruct.cfg)
	Object.keys(tweakObj).forEach(o=>{
		if(o.substr(0,1) !== '_' && !existMats.has(o)) invalid.material.add(o)
	})
	;[...existMats.values()].forEach(o=>{
		if(!tweakObj[o]) invalid.absent.add(o)
	})
}

async function start() {
	begin('  Parsing csv ')
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

	begin('  Saving files .')
  fs.writeFileSync(paths.tweakerconstruct_cfg, currentCfg)
	begin('.')
	fs.writeFileSync(paths.bigTable, formattedTable)
	end()

	Object.entries(invalid).forEach(([key,map])=>{
		if(map.size === 0) return
		console.log(({
			material: `Found ${map.size} invalid materials for tweaks: ${[...map].join(', ')}`,
			absent:   `Found ${map.size} materials without tweaks: ${[...map].join(', ')}`,
			fileInject: 'Unable to inject files: ' + [...map].map(s=>`"${s}"`).join(', '),
		})[key])
	})
}
start()


/*

## Unused TC traits

-----------

- [x] darktraveler  | Surrounding mobs get randomly afflicted with damage.
- [x] hailhydra     | Random explosions plague your enemies. Also, when you are attacked, there is a chance to get Absorption.
- [x] hearts        | The higher your health, the more damage you do.
- [x] heavy_metal   | Increased knockback + Slowness on target.
- [x] illuminati    | While the tool is in your hand, nearby entities (that do not hold a tool with this trait) glow, and you become invisible.
- [x] morganlefay   | Bonus magic damage (ranging from 0.0 to 5.0; Gaussian distributed) is afflicted (it is absolute).
- [x] rudeawakening | Damage pierces armor (mobs only).
- [x] spades        | The lower your health, the more damage you do.
- [x] starfishy     | Press the "set portal" key (default "N") to set a virtual portal on the block you are pointing at. If you are on the brink of death, you have %d enori crystals to spare, and the portal has enough space above, then the crystals are consumed, you are teleported to the virtual portal, and you are spared. (The tool must be in your hand.)
- [x] thundering    | Summon a thunderbolt on impact.
- [x] unnamed       | Bonus damage accrued for each entity of the same type as the target close to it.
- [x] vindictive    | Bonus damage to players, and you gain some health by attacking.
- [x] blindbandit   | A mob called the "Blind Bandit" will sometimes be summoned for a limited time after you attack or are attacked. She will attack hostile mobs, and will also attack those who dare attack her (except you), piercing armor on mobs.
- [x] botanical2    | 
- [x] barrett       | ❌ As health decreases, there is an increasing chance of a critical hit.
- [x] divineshield  | ❌ While this tool is in your hand, you are granted fire resistance. Also, damage is reduced, but at a durability cost.
- [x] dprk          | ❌ When attacking or defending, Supreme Leaders will spawn, exploding on opponents in the same manner as a creeper.
- [x] ghastly       | ❌ If the holder is attacked while sneaking, the attacker is inflicted with Slowness.
- [x] ignoble       | ❌ As one takes damage, one starts to harbor feelings of ignoble jealousy as the offender is killed. When this trait is enabled, those feelings are vented when attacking while sneaking.
- [x] jaded         | ❌ Mobs attacked with this tool have their ability to heal temporarily hindered.
- [x] mystical_fire | ❌ Sets the target on fire, and damages the target with magic for a certain amount of time.
- [x] naphtha       | ❌ Arrows (and bolts) burn the target on impact.
- [x] trash         | ❌ Random stuff is slowly generated when the tool is selected, but the tool is damaged slowly in this way.

❌ - Could not find trait

barrett|divineshield|dprk|ghastly|ignoble|jaded|mystical_fire|naphtha|trash


*/