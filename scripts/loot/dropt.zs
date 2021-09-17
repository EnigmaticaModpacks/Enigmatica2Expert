import mods.dropt.Dropt;

/*

Special drop rule for Advanced Rocketry Geodes
Luck account up to VII level

Manually add block drops info.

*/



/*Inject_js{

const id_block = 'advancedrocketry:geode'
const id_drop = 'thermalfoundation:geode'
const newObj = {
  name: id_block, meta: 0, length: 1,
  name0: id_drop, meta0: 0,
}
for (let i=0;i<4;i++) {
  newObj[i+'chance0'] = 100
}
for (let i=0;i<4;i++) {
  const a = Math.max(1, Math.min(64, i**1.5*2)) | 0
  const b = Math.max(2, Math.min(64, i**1.5*4)) | 0
  newObj[i+'pair0'] = `{\n  "left": ${a},\n  "right": ${b}\n}`
}
const filename = 'config/BlockDrops/blockdrops.txt'
const arr = JSON.parse(loadText(filename))
const obj = arr.find(o=>o.name===id_block)
if(obj) Object.assign(obj, newObj)
else(arr.push(newObj))

saveText(
  JSON.stringify(arr, null, 2)
    .replace(/^(\s+"\d+chance\d+": \d+)(,?)$/gm, '$1.0$2')
  , filename
)
return '# Done!'

}*/
# Done!
/**/

val geode_rule = Dropt.rule()
  .matchBlocks(["advancedrocketry:geode"])	
  .addDrop(Dropt.drop()
    .selector(Dropt.weight(1), "REQUIRED")
    .items([<advancedrocketry:geode>])
  );

for i in 0 to 8 {
  geode_rule.addDrop(Dropt.drop()
    .selector(Dropt.weight(pow(10, i)), "EXCLUDED", i)
    .items([<thermalfoundation:geode>], Dropt.range(
      max(1, min(64, (pow((i as double), 1.5d) * 2.0d) as int)),
      max(2, min(64, (pow((i as double), 1.5d) * 4.0d) as int))
    ))
  );
}
Dropt.list("advrock_geode").add(geode_rule);