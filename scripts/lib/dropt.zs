import mods.dropt.Dropt;
import crafttweaker.item.IItemStack;

/*

Special drop rule for Advanced Rocketry Geodes
Luck account up to VII level

Manually add block drops info.

*/



/*Inject_js(
[...loadText('crafttweaker.log')
  .matchAll(/Modify drop; Block: (?<block>.+) Drop: (?<stack>.+) (?<luck>\[.*\])/gm)
].forEach(({groups: {block, stack, luck}}) =>
  setBlockDrops(block, [{
    stack: stack,
    luck: eval(luck).slice(0, 4)
  }])
),
'# Done!'
)*/
# Done!
/**/

function addDrop(block as IItemStack, drop as IItemStack) as void {
  val rule = Dropt.rule()
    .matchBlocks([block.definition.id])
    .addDrop(Dropt.drop()
      .selector(Dropt.weight(1), "REQUIRED")
      .items([block])
    );

  var logStr = "Modify drop; Block: "~block.definition.id ~" Drop: "~drop.definition.id~" [";
  for i in 0 to 8 {
    val a = max(1, min(64, (pow((i as double), 1.5d) * 2.0d) as int));
    val b = max(2, min(64, (pow((i as double), 1.5d) * 4.0d) as int));
    rule.addDrop(Dropt.drop()
      .selector(Dropt.weight(pow(10, i)), "EXCLUDED", i)
      .items([drop], Dropt.range(a, b))
    );
    logStr += "["~ a ~", "~b~"],";
  }
  logStr += "]";
  Dropt.list(block.definition.id.replaceAll(':','_')).add(rule);
  utils.log(logStr);
}
