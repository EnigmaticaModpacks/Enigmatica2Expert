
const {escapeRegex} = require('./utils.js');

var isSingle = false;

var source = 
`
[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
[<ore:cheeseWheels>, <ore:cheeseWheels>, <botania:brewflask>.withTag({brewKey: "overload"}), <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <botania:brewflask>.withTag({brewKey: "overload"}), <ore:cheeseWheels>, <ore:cheeseWheels>], 
[<ore:cheeseWheels>, <ore:cheeseWheels>, <rats:chunky_cheese_token>, <scalinghealth:difficultychanger>, <scalinghealth:heartcontainer>, <scalinghealth:difficultychanger>, <rats:chunky_cheese_token>, <ore:cheeseWheels>, <ore:cheeseWheels>], 
[<ore:cheeseWheels>, <ore:cheeseWheels>, <rats:chunky_cheese_token>, <scalinghealth:heartcontainer>, <rats:rat_upgrade_nonbeliever>, <scalinghealth:heartcontainer>, <rats:chunky_cheese_token>, <ore:cheeseWheels>, <ore:cheeseWheels>], 
[<ore:cheeseWheels>, <ore:cheeseWheels>, <rats:chunky_cheese_token>, <scalinghealth:difficultychanger>, <scalinghealth:heartcontainer>, <scalinghealth:difficultychanger>, <rats:chunky_cheese_token>, <ore:cheeseWheels>, <ore:cheeseWheels>], 
[<ore:cheeseWheels>, <ore:cheeseWheels>, <botania:brewflask>.withTag({brewKey: "overload"}), <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <botania:brewflask>.withTag({brewKey: "overload"}), <ore:cheeseWheels>, <ore:cheeseWheels>], 
[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>]
`;
var list = {};

//////////////////////////////////////////
// Prepare chars
var avaliableChars = "▢▬☼⩉◊♥◪◽◩✝▭◘ⱋ▥♰ⰱ‡☒◧◇ⰻ☠☑ⰷ▦♦☐▤ⱄ∪◙◰▣Ⰰ◳◨⍣χ☺‗♣◫ⱎ▨♂◲◱⍤◉♠▧▩₀₁₂₃₄";

for (const [c,m] of Object.entries(list)) {
  avaliableChars = avaliableChars.replace(c, "");
}
avaliableChars = [...avaliableChars]; // Tricky unicode split

//////////////////////////////////////////
// Collect all items and sort them
var itemUses = [];
function handleMatch(m) {
  var found = itemUses.find(it => it.item === m);
  if (found) found.uses++;
  else itemUses.push({item: m, uses: 1});
}

// Regular ItemStack
for (const match of source.matchAll(/<[^>]+?>(.withTag\(\{.*?\}\))*(.reuse\(\))*(.marked\(\".*?\"\))*/gm)) {
	handleMatch(match[0]);
}

// Variable with "marked"
for (const match of source.matchAll(/[ \[](\w+\.marked\(".*?"\))[,\]]/gm)) {
	handleMatch(match[1]);
}

itemUses.sort((a,b)=>b.uses-a.uses);

//////////////////////////////////////////
// Assign chars to items
itemUses.forEach(o => {
  var m = o.item;
  if (!Object.values(list).includes(m)) {
    var c = avaliableChars[0];
    if (!isSingle) console.log(`list[\"${c}\"] = ${m};`);
    list[c] = m;
    avaliableChars.shift();
  }
});

//////////////////////////////////////////
// Make list of items
var listAsString = "{\n";
for (const [c, m] of Object.entries(list)) {
	source = source.replace(new RegExp(escapeRegex(m), 'g'), c);
	listAsString += `  "${c}": ${m},\n`;
}
for (let i = 0; i < 4; i++) {
	listAsString += `  "${avaliableChars.shift()}": ${"null"},\n`;
}
listAsString += "}";



//////////////////////////////////////////
// Replace grid
source = '\ncraft.make( , ["pretty",' +
  source
  .replace(/^( *)\[+/gm,"$1\"") // String start replace with ""
  .replace(/null/gm," ")        // Nulls replace to " "
  .replace(/\], *$/gm,"\",")    // End of line replace to second " and comma
  .replace(/\], ?\[/gm,`",\n"`)  // Recipe.zs export
  .replace(/(.), /gm,"$1 ")     // Remove excess commas
  .replace(/\]\]?\)?;? *$/gm, `\"], ${isSingle?listAsString:"list"});`)

console.log(source);