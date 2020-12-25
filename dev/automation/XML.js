
const utils = require('./utils.js');
const convert = require('xml-js');
const detectIndent = require('detect-indent');

function mutateXml(filePath, fnc) {
  var xml = utils.loadText(filePath);
  const indent = detectIndent(xml).indent || '	';

  var obj = convert.xml2js(xml, {compact: false});

  if(fnc) fnc(obj);

  var XML = convert.js2xml(obj, {spaces: indent});

  utils.saveText(XML, filePath);
}

function forEachXMLinDir(dirPath, fnc) {
  utils.readdir(dirPath).forEach(filePath => {
    if (filePath.split('.').pop() === "xml") {
      const xmlPath = dirPath + filePath;
      fnc(xmlPath);
    }
  });
}

// forEachXMLinDir("../config/advRocketry/", mutateXml);
// mutateXml("../config/enderio/recipes/user/user_recipes.xml");
var crafttweaker_log = utils.loadText("../crafttweaker.log");

var changes = {};

for (const match of crafttweaker_log.matchAll(
    /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] Put this recipe in file \[([^\]]*?)\] manually.\n\r?((\s*<!--(.*)-->\n\r?)?([\s\S\n\r]*?<\/[rR]ecipe>))/gm
  )) {
  var filename = "." + match[1];
  var recipe = match[2];
  var comment = match[4];

  if (changes[filename] === undefined) changes[filename] = {};

  changes[filename][comment] = recipe;
}

for (const [changeFile, changesMap] of Object.entries(changes)) {
  // console.log("-------------");
  // console.log(changeFile);
  // console.log("-------------");

  for (const [comment, recipe] of Object.entries(changesMap)) {
    // console.log(comment);
  }
}

// List of curated files and folders
const curatedContent = {
  files: [
    "../config/enderio/recipes/user/user_recipes.xml",
  ],
  folders: [
    "../config/advRocketry/",
  ]
}

// Create combined path of files
var curatedFiles = curatedContent.files.slice();

var automaticComment = ' Recipe below generated automatically. Do not make changes or they gonna be rewritten. ';

curatedContent.folders.forEach(dirPath => {
  utils.readdir(dirPath).forEach(filePath => {
    if (filePath.split('.').pop() === "xml") {
      curatedFiles.push(dirPath + filePath);
    }
  });
});

for (let i = 0; i < curatedFiles.length; i++) {
  const filePath = curatedFiles[i];
  mutateXml(filePath, obj => {
    var recipes = obj.elements.find(o => (o.name === "Recipes" || o.name === "enderio:recipes"));
    if (!recipes) return;

    var recipeList = recipes.elements;
    if (!recipeList) return;

    var j = recipeList.length
    while (j--) {
      const commentElement = recipeList[j];
      if (commentElement.type === "comment" && commentElement.comment === automaticComment) {
        var elemsToRemove = (recipeList[j+1] && recipeList[j+1].type === "comment") ? 3 : 2;
        recipeList.splice(j, elemsToRemove);
      }
    }

    // Add recipes to this list
    if (!changes[filePath]) return;
    for (const [comment, recipe] of Object.entries(changes[filePath])) {
      var recipeXml = convert.xml2js(recipe, {compact: false});
      recipeList.push({ type: 'comment', comment: automaticComment });
      recipeXml.elements.forEach(e => {
        recipeList.push(e);
      });
    }
  });
}
