
const convert = require('xml-js')
const detectIndent = require('detect-indent')
const fs = require('fs')
const glob = require('glob')
const {begin, end} = require('../lib/utils.js')

const crafttweaker_log = fs.readFileSync('crafttweaker.log', 'utf8')

const changes = {}
const stat = {
  total: 0,
  files: new Map()
}

for (const match of crafttweaker_log.matchAll(
    /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] Put this recipe in file \[(\.\/)?(?<filename>[^\]]*?)\] manually.\n\r?(?<recipe>(\s*<!--(.*)-->\n\r?)?([\s\S\n\r]*?<\/[rR]ecipe>))/gm
  )) {
  const g = match.groups
  changes[g.filename] = changes[g.filename]??[]
  changes[g.filename].push(g.recipe)
  stat.total++
}

begin(`  Found ${stat.total} recipes for ${Object.keys(changes).length} files. Injecting `)

// List of curated files and folders
const curatedFiles = [
  ...glob.sync('config/advRocketry/*.xml'),
  'config/enderio/recipes/user/user_recipes.xml'
]

const automaticComment = ' Recipe below generated automatically. Do not make changes or they gonna be rewritten. '

function mutateXml(filePath, fnc) {
  const xml = fs.readFileSync(filePath, 'utf8')
  const obj = convert.xml2js(xml, {compact: false})
  if(fnc) fnc(obj)
  const XML = convert.js2xml(obj, {spaces: detectIndent(xml).indent || '	'})
  fs.writeFileSync(filePath, XML)
}

// Normalize enderio recipes
// mutateXml("../config/enderio/recipes/user/user_recipes.xml");

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
    for (const recipe of changes[filePath]) {
      const recipeXml = convert.xml2js(recipe, {compact: false})
      recipeList.push({ type: 'comment', comment: automaticComment })
      recipeXml.elements.forEach(e => {
        recipeList.push(e)
      })
    }
    begin('.')
  })
}
end()