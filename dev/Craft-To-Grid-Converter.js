
var isSingle = true;

var source = 
`
[null, <extrautils2:ingredients:16>, anyStrong.marked("potStrong"), <extrautils2:ingredients:16>, null],
[<ore:nuggetUltimate>, <deepmoblearning:glitch_heart>, anyLong.marked("potLong"), <deepmoblearning:glitch_heart>, <ore:nuggetUltimate>],
[<ore:nuggetUltimate>, <randomthings:spectreilluminator>, anyCombined.marked("potCombined"), <randomthings:spectreilluminator>, <ore:nuggetUltimate>],
[<ore:nuggetUltimate>, <avaritia:endest_pearl>, <thaumcraft:crucible>.reuse(), <avaritia:endest_pearl>, <ore:nuggetUltimate>],
[null, <avaritia:ultimate_stew>, <avaritia:ultimate_stew>, <avaritia:ultimate_stew>, null]
`;
var list = {};

var avaliableChars = "◪☼◩▬✝▭⩉◘◊ⱋ▥♰ⰱ‡☒◧◇▢ⰻ☠☑ⰷ▦♦☐▤◽ⱄ∪◙◰▣Ⰰ◳◨⍣χ☺‗♣◫ⱎ▨♂◲◱⍤◉♠▧▩₀₁₂₃₄";

for (const [c,m] of Object.entries(list)) {
  avaliableChars = avaliableChars.replace(c, "");
}
avaliableChars = [...avaliableChars]; // Tricky unicode split

function handleMatch(m) {
  var c = avaliableChars[0];
  if (!Object.values(list).includes(m)) {
    if (!isSingle) console.log(`list[\"${c}\"] = ${m};`);
    list[c] = m;
    avaliableChars.shift();
  }
}

for (const match of source.matchAll(/<[^>]+?>(.withTag\(\{.*?\}\))*(.reuse\(\))*(.marked\(\".*?\"\))*/gm)) {
	handleMatch(match[0]);
}

for (const match of source.matchAll(/[ \[](\w+\.marked\(".*?"\))[,\]]/gm)) {
	handleMatch(match[1]);
}

function escapeRegex(string) {
  return string.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
}

var listAsString = "{\n";
for (const [c, m] of Object.entries(list)) {
	source = source.replace(new RegExp(escapeRegex(m), 'g'), c);
	listAsString += `  "${c}": ${m},\n`;
}
for (let i = 0; i < 4; i++) {
	listAsString += `  "${avaliableChars.shift()}": ${"null"},\n`;
}
listAsString += "}";



source = '\ncraft.make( , ["pretty",' +
  source
  .replace(/^( *)\[+/gm,"$1\"")
  .replace(/null/gm," ")
  .replace(/\], *$/gm,"\",")
  .replace(/(.), /gm,"$1 ")
  .replace(/\]\]?\)?;? *$/gm, `\"], ${isSingle?listAsString:"list"});`)

console.log(source);