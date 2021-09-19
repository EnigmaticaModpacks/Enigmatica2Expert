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
const {begin, end, naturalSort, globs} = require('../lib/utils.js')
const path = require('path')

const init = module.exports.init = async function() {
  const changes = {}
  let total = 0

  for (const {groups} of fs.readFileSync('crafttweaker.log', 'utf8').matchAll(
      /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] Put this recipe in file \[(\.\/)?(?<filename>[^\]]*?)\] manually.\n\r?(?<recipe>(\s*<!--(.*)-->\n\r?)?([\s\S\n\r]*?<\/[rR]ecipe>))/gm
  )) {
    (changes[groups.filename] ??= []).push(groups.recipe)
    total++
  }


  function countInputs(a) {
    const recipe = a.elements.find(o => o.name?.toLowerCase() === 'recipe').elements
    const inputs = 
      recipe.find(o => o.name?.toLowerCase() === 'input')?.elements
      ??
      recipe.find(o => o.type === 'element')?.elements.filter(e=>e.type==='element' && e.name.includes('input'))

    return inputs.length
  }

  // Sort recipes inside changes to prevent object shuffling
  for (const key of Object.keys(changes)) {
    changes[key] = changes[key]
      .map(recipe => convert.xml2js(recipe, {compact: false}))
      .sort((a, b) => countInputs(b) - countInputs(a) || naturalSort(JSON.stringify(a), JSON.stringify(b)))
  }

  begin(`  Found ${total} recipes for ${Object.keys(changes).length} files. Injecting `)

  function mutateXml(filePath, fnc) {
    const xml = fs.readFileSync(filePath, 'utf8')
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
      }
      begin('.')
    })
  }
  end()
}

if(require.main === module) init()