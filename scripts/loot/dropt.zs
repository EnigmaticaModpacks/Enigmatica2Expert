import mods.dropt.Dropt;

/*

Special drop rule for Advanced Rocketry Geodes
Luck account up to VII level

Manually add block drops info.

*/



/*Inject_js{

setBlockDrops('advancedrocketry:geode', [{
  stack: 'thermalfoundation:geode',
  luck: [0,1,2,3].map(i=>[Math.max(1, Math.min(64, i**1.5*2)) | 0,Math.max(2, Math.min(64, i**1.5*4)) | 0])
}])

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