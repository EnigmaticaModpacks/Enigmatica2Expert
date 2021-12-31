/**
 * @file Collect all XML files with recipes that cant be handled by
 * zenscripts itself. This is usually EnderIO and AdvRocketry xml's
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import { xml2js, js2xml } from 'xml-js'
import detectIndent from 'detect-indent'
import { writeFileSync } from 'fs'
import { relative } from 'path'
import _ from 'lodash'
import { getExtra } from '../lib/jaopca.js'
import { getByOreKind, getByOreBase, getOreBases_byKinds } from '../lib/tellme.js'
import { naturalSort, globs, loadText, defaultHelper } from '../lib/utils.js'

/** @typedef {import("xml-js").Element} XMLElement*/

import yargs from 'yargs'
const argv = yargs(process.argv.slice(2))
  .alias('d', 'dryrun').describe('d', 'Do not add/remove recipes, just format files')
  .argv

export async function init(h=defaultHelper) {

  // List of curated files and folders
  const curatedFiles = globs([
    'config/advRocketry/*.xml',
    'config/enderio/recipes/user/user_recipes.xml'
  ]).map(p=>relative(process.cwd(),p).replace(/\\/g,'/'))

  await h.begin('Curating XML files', curatedFiles.length)

  const automaticComment = ' Recipe below generated automatically. Do not make changes or they gonna be rewritten. '

  const changes = !argv['dryrun']
    ? (await h.begin('Reading crafttweaker.log'), getChanges())
    : {}

  let totalNewRecipes = 0

  for (const filePath of curatedFiles) {
    mutateXml(filePath, xml_obj => {
      const recipes = xml_obj.elements.find(o => (o.name === 'Recipes' || o.name === 'enderio:recipes'))
      if (!recipes) return

      const recipeList = recipes.elements
      if (!recipeList) return

      let j = recipeList.length
      while (j--) {
        const commentElement = recipeList[j]
        if (commentElement.type === 'comment' && commentElement.comment === automaticComment) {
          const elemsToRemove = (recipeList[j+1] && recipeList[j+1].type === 'comment') ? 3 : 2
          recipeList.splice(j, elemsToRemove)
        }
      }

      // Add recipes to this list
      if (!changes[filePath]) return
      for (const recipeXml of changes[filePath]) {
        recipeList.push({ type: 'comment', comment: automaticComment })
        recipeXml.elements.forEach(e => {
          recipeList.push(e)
        })
        totalNewRecipes++
      }
    })
    h.step()
  }
  
  h.result(`Total automatic XML recipes: ${totalNewRecipes}`)
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/** @param {string} xmlString */
function xml_to_js(xmlString) {
  return /** @type {XMLElement} */(xml2js(xmlString, {compact: false}))
}

/** @return {{[filePath: string]: XMLElement[]}} */
function getChanges(h=defaultHelper) {
  /** @type {{[filePath: string]: string[]}} */
  const changesText = {}

  for (const {groups} of loadText('crafttweaker.log').matchAll(
      /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] Put this recipe in file \[(\.\/)?(?<filename>[^\]]*?)\] manually.\n\r?(?<recipe>(\s*<!--(.*)-->\n\r?)?([\s\S\n\r]*?<\/[rR]ecipe>))/gm
  )) {
    (changesText[groups.filename] ??= []).push(groups.recipe)
  }

  _(getCustomRecipes()).forEach((arr, filePath)=>
    (changesText[filePath] ??= []).push(...arr)
  )


  /** @param {XMLElement} a */
  function countInputs(a) {
    const recipe = a.elements.find(o => o.name?.toLowerCase() === 'recipe').elements
    const inputs = 
      recipe.find(o => o.name?.toLowerCase() === 'input')?.elements
      ??
      recipe.find(o => o.type === 'element')?.elements.filter(e=>e.type==='element' && e.name.includes('input'))

    return inputs.length
  }

  // Sort recipes inside changes to prevent object shuffling
  return _(changesText).mapValues(arr=>arr
    .map(xml_to_js)
    .sort((a, b) => countInputs(b) - countInputs(a) || naturalSort(JSON.stringify(a), JSON.stringify(b)))
  ).value()
}

/**
 * @param {string} filePath
 * @param {{ (xml_obj: XMLElement): void }} xmlObjectMutationCB
 */
function mutateXml(filePath, xmlObjectMutationCB) {
  const xml = loadText(filePath)
  const obj = xml_to_js(xml)
  if(xmlObjectMutationCB) xmlObjectMutationCB(obj)
  const XML = js2xml(obj, {spaces: detectIndent(xml).indent || '	'})
  writeFileSync(filePath, XML)
}

/**
 * @param {string} input
 * @param {string|number} amount
 */
function xmlIngr(input, amount=1) {
  const parts = input.split(':')
  return parts.length > 1
    ? `<itemStack>${parts.slice(0,2).join(':')}${(amount!=1||parts[2])? ' '+amount : ''}${parts[2]? ' '+parts[2] : ''}</itemStack>`
    : `<oreDict>${input}${amount!=1? ' '+amount : ''}</oreDict>`
}

/**
 * @param {string | string[]} input
 */
function parseItems(input) {
  return (Array.isArray(input) ? input : [input])
    // @ts-ignore
    .map(s=>s.startsWith('<') ? s : xmlIngr(...(s.includes(' ') ? s.split(' ') : [s])))
    .join('\n')
}

/**
 * @param {string} name
 * @param {string | string[]} inputs
 * @param {string | string[]} outputs
 */
function makeXMLRecipe(name, inputs, outputs, timeRequired = 0, power = 0) {
  return `<!-- [${name}] -->
  <Recipe timeRequired="${timeRequired}" power="${power}"><input>`
    +parseItems(inputs)
    +'</input><output>'
    +parseItems(outputs)
  +'</output></Recipe>'
}


function getCustomRecipes() { return {

'config/advRocketry/SmallPlatePress.xml': [
  ...[
      ['3', 'blockSheetmetal','stick'],
      ['6', 'block','plate']
    ].map(kinds=>
      getOreBases_byKinds(kinds.slice(1))
      .filter(b=>b!=='Aluminum')
      .map(oreBase=>[oreBase, kinds[1], kinds[2], kinds[0]])
    )
    .flat()
    .concat([
      [       'Wood', 'plank', 'stick', '6'],
      ['TreatedWood', 'plank', 'stick', '6'],
    ])
    .map(([oreBase, kind1, kind2, amount])=>makeXMLRecipe(
      `${oreBase} Block`,
      `${kind1}${oreBase}`,
      `${kind2}${oreBase} ${amount}`
    ))
  ,
  makeXMLRecipe('Stone Sticks','cobblestone','stickStone 6'),
  makeXMLRecipe('HDPE Sticks','mekanism:plasticblock:15','stickHDPE 6'),
],

'config/advRocketry/Centrifuge.xml': [
  makeXMLRecipe('Magic centrifuge','<fluidStack>enrichedlava 1000</fluidStack>',[
    'flux_goo '    + 180,
    'thaumium '    + 60,
    'livingrock '  + 50,
    'manasteel '   + 45,
    'bound_metal ' + 15,
    'terrasteel '  + 2,
    'elementium '  + 1,
  ].map(s=>`<fluidStack>${s}</fluidStack>`),
  20, 100000),
  makeXMLRecipe('Curio centrifuge','<fluidStack>flux_goo 100</fluidStack>',[
    'thaumcraft:curio:0 2',
    // 'thaumcraft:curio:1 2',
    'thaumcraft:curio:2 2',
    // 'thaumcraft:curio:3 2',
    'thaumcraft:curio:4 2',
    'thaumcraft:curio:5 1',
  ],
  20, 100000)
],

'config/enderio/recipes/user/user_recipes.xml': 
  getOreBases_byKinds(['dustDirty', 'dust'])
  .filter(b=>b!=='Aluminum')
  .map(oreBase =>
  `<recipe name="${oreBase} Clearing">
    <tanking type="FILL" logic="NONE">
      <input name="dustDirty${oreBase}"/>
      <fluid name="steam" amount="1000"/>
      <output name="dust${oreBase}"/>
    </tanking>
  </recipe>`)
,
}}