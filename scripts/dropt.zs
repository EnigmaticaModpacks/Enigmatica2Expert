import mods.dropt.Dropt;

/*

Special drop rule for Advanced Rocketry Geodes
Luck account up to VII level

*/
val rule = Dropt.rule()
  .matchBlocks(["advancedrocketry:geode"])	
  .addDrop(Dropt.drop()
    .selector(Dropt.weight(1), "REQUIRED")
    .items([<advancedrocketry:geode>])
  );

for i in 0 to 8 {
  rule.addDrop(Dropt.drop()
    .selector(Dropt.weight(pow(10, i)), "EXCLUDED", i)
    .items([<thermalfoundation:geode>], Dropt.range(
      max(1, min(64, (pow((i as double), 1.5d) * 2.0d) as int)),
      max(2, min(64, (pow((i as double), 1.5d) * 4.0d) as int))
    ))
  );
}
Dropt.list("advrock_geode").add(rule);

scripts.process.crush(<thermalfoundation:geode>, <mysticalagradditions:insanium:5>, "No exceptions", 
  [<mysticalagradditions:insanium:5>], [0.25]);