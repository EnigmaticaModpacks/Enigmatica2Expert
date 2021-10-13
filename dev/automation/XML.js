/**
 * @file Collect all XML files with recipes that cant be handled by
 * zenscripts itself. This is usually EnderIO and AdvRocketry xml's
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const convert = require('xml-js')
const detectIndent = require('detect-indent')
const fs = require('fs')
const {naturalSort, globs, loadText} = require('../lib/utils.js')
const path = require('path')
const _ = require('lodash')
const { getByOreKind, getByOreBase } = require('../lib/tellme.js')
const { getExtra } = require('../lib/jaopca.js')

const init = module.exports.init = async function(h=require('../automate').defaultHelper) {

  await h.begin('Reading crafttweaker.log')

  /** @type {{[filePath: string]: string[]}} */
  const changesText = {}
  let total = 0

  for (const {groups} of loadText('crafttweaker.log').matchAll(
      /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] Put this recipe in file \[(\.\/)?(?<filename>[^\]]*?)\] manually.\n\r?(?<recipe>(\s*<!--(.*)-->\n\r?)?([\s\S\n\r]*?<\/[rR]ecipe>))/gm
  )) {
    (changesText[groups.filename] ??= []).push(groups.recipe)
    total++
  }

  _(getCustomRecipes()).forEach((arr, filePath)=>
    (changesText[filePath] ??= []).push(...arr)
  )


  function countInputs(a) {
    const recipe = a.elements.find(o => o.name?.toLowerCase() === 'recipe').elements
    const inputs = 
      recipe.find(o => o.name?.toLowerCase() === 'input')?.elements
      ??
      recipe.find(o => o.type === 'element')?.elements.filter(e=>e.type==='element' && e.name.includes('input'))

    return inputs.length
  }

  // Sort recipes inside changes to prevent object shuffling
  const changes = _(changesText).mapValues(arr=>arr
    .map(recipe => convert.xml2js(recipe, {compact: false}))
    .sort((a, b) => countInputs(b) - countInputs(a) || naturalSort(JSON.stringify(a), JSON.stringify(b)))
  ).value()

  await h.begin('Injecting in files', Object.keys(changes).length)

  function mutateXml(filePath, fnc) {
    const xml = loadText(filePath)
    const obj = convert.xml2js(xml, {compact: false})
    if(fnc) fnc(obj)
    const XML = convert.js2xml(obj, {spaces: detectIndent(xml).indent || '	'})
    fs.writeFileSync(filePath, XML)
  }

  const automaticComment = ' Recipe below generated automatically. Do not make changes or they gonna be rewritten. '

  // List of curated files and folders
  const curatedFiles = globs([
    'config/advRocketry/*.xml',
    'config/enderio/recipes/user/user_recipes.xml'
  ]).map(p=>path.relative(process.cwd(),p).replace(/\\/g,'/'))

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
        // h.step()
      }
    })
    h.step()
  }
  
  h.result(`Total XML recipes: ${total}`)
}

if(require.main === module) init()


function getCustomRecipes() { return {
'config/advRocketry/SmallPlatePress.xml': 
  _(getByOreKind('ore'))
  .mapValues(/** @return {[string, import('../lib/tellme.js').TMStack[]]} */
    (tm,oreBase)=>{
    const kind_stack = getByOreBase(oreBase)
    return [
      oreBase, [
        tm,
        kind_stack['dust'],
        getExtra(oreBase)['dustTiny'],
        getExtra(oreBase, 1)['dustTiny'],
    ]]
  })
  .filter(([,tuple]) => tuple.slice(1).every(tm=>tm))
  .map(([oreBase, tms])=>`
  <!-- [${tms[0].display}] -->
  <Recipe timeRequired="0" power="0">
    <input><oreDict>ore${oreBase}</oreDict></input><output>`
    +tms.slice(1).map((tm,i)=>`<itemStack>${`${tm.id} ${[1,4,1][i]} ${tm.damage}`}</itemStack>`).join('\n')+
  '</output></Recipe>')
  .value()
}}