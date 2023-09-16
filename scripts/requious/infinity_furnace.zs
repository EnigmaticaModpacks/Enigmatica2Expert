import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IFurnaceRecipe;
import mods.requious.AssemblyRecipe;
import mods.requious.ComponentFace;
import mods.requious.GaugeDirection;
import mods.requious.SlotVisual;

#priority -150

# [Infinity_Furnace] from [Infinity_Fuel][+4]
craft.remake(<requious:infinity_furnace>, ["pretty",
  "T R E R T",
  "# ▬ n ▬ #",
  "H r I r H",
  "# ▬ Ϟ ▬ #",
  "T R E R T"], {
  "R": <rats:rat_upgrade_basic_ratlantean>,
  "#": <ore:logSequoia>,                          # Sequoia
  "T": <mysticalagriculture:supremium_furnace>,
  "E": <contenttweaker:empowered_phosphor>,       # Empowered Phosphor
  "r": <rats:idol_of_ratlantis>,
  "H": <scalinghealth:heartcontainer>,            # Heart Container
  "I": <avaritia:singularity:12>,
  "▬": <ore:dragonsteelIngot>,
  "n": <randomthings:spectrecoil_ender>,          # Ender Spectre Coil
  "Ϟ": <randomthings:spectreenergyinjector>       # Spectre Energy Injector
});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------

var o = <assembly:infinity_furnace>;
o.setItemSlot(3,2,ComponentFace.all(),64).setAccess(true,false).setGroup("input");
o.setItemSlot(5,2,ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
o.setDurationSlot(4,2).setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png",2,1,3,1,GaugeDirection.up(),false)).setGroup("duration");

o.setJEIItemSlot(3,2, 'input');
o.setJEIItemSlot(5,2, 'output');
o.setJEIDurationSlot(4,2,"duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",3,1));

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------

function infinFurnace(inp as IIngredient, out as IItemStack) as void {
  if(isNull(inp) || isNull(out)) return;

  val assRecipe = AssemblyRecipe.create(function(c) {
    c.addItemOutput('output', out * min(64, out.amount * 4));
  })
  .requireItem("input", inp)
  .setActive(10)
  .requireDuration("duration", 10);

  <assembly:infinity_furnace>.addRecipe(assRecipe);
  <assembly:infinity_furnace>.addJEIRecipe(assRecipe);
}

# Wildcard
val W = <minecraft:dirt:*>.damage;

# Special case for logWood -> Charcoal
infinFurnace(<ore:logWood>, <minecraft:coal:1> * 4);

/*
  Commented line means that recipe exist in vanilla furnace 
  but ingredient or output hidden in JEI
*/

/*Inject_js{

const manualBlacklist = new Set(`
biomesoplenty:mud
biomesoplenty:mudball
ic2:dust:3
iceandfire:dread_stone_bricks
minecraft:stonebrick
minecraft:sponge:1
mysticalagriculture:soulstone:1
rats:marbled_cheese_brick
tcomplement:scorched_block:3
tcomplement:scorched_slab:3
tcomplement:scorched_stairs_brick
tconstruct:brownstone:3
tconstruct:seared:3
thermalfoundation:material:864
nuclearcraft:ingot:15
rustic:dust_tiny_iron
`.trim().split('\n'))

const filters = [
  [ '#', 0, (items) => items.some(([id,meta])=>isJEIBlacklisted(id,meta))],
  ['//', 0, ([[id,meta]]) => manualBlacklist.has(id + ((meta && meta!=='*') ? ':'+meta : ''))],
  ['##', 0, ([[id,meta],[out_id,out_meta]]) => {
    const  in_ore = [...getItemOredictSet(id,meta).keys()]
    const out_ore = [...getItemOredictSet(out_id,out_meta).keys()]
    return in_ore.includes('logWood')
      || in_ore.some(o=>{
        const mat = o.match(/^dust([A-Z].+)/)?.[1]
        return mat && out_ore.some(o=>o.replace(/^(ingot|gem)/, '') === mat)
      })
      // Blacklist input
      || [
        'Oxide',
        'Nitride',
        'ZA',
      ].some(key => in_ore.some(o=>o.match(new RegExp('.+'+key))))
  }],
]

const isBlacklisted = (...items) => filters.find(([,,condition],i)=>
  condition(items) && ++filters[i][1]
)?.[0] || ''

const overload = (id,meta,nbt,amount)=>{
  let s=`"${id}"`
  ;(meta || amount || nbt) && (s+=`, ${meta==='*'?'W':(meta||0)}`)
  ;((amount && parseInt(amount) > 1) || nbt) && (s+=`, ${amount||1}`)
  ;(nbt) && (s+=`, ${nbt}`)
  return s
}

const furnaceRecipes = getFurnaceRecipes()
if(!furnaceRecipes) return undefined
const filtered = furnaceRecipes
  .map(({out_id, out_meta, out_tag, out_amount, in_id, in_meta, in_tag, in_amount})=>
    isBlacklisted([in_id, in_meta], [out_id, out_meta]) +
    'infinFurnace(utils.get('+
    overload( in_id,  in_meta,  in_tag,  in_amount) + '), utils.get('+
    overload(out_id, out_meta, out_tag, out_amount) +'));'
  )

return `
# Total Furnace recipes registered: ${furnaceRecipes.length}
# Filtered by JEI blacklist: ${filters[0][1]}
# Filtered manuallly (antidupe): ${filters[1][1]}
# Filtered by oredict: ${filters[2][1]}
${filtered.join('\n')}`

}*/

# Total Furnace recipes registered: 949
# Filtered by JEI blacklist: 110
# Filtered manuallly (antidupe): 16
# Filtered by oredict: 177
infinFurnace(utils.get("actuallyadditions:block_misc", 3), utils.get("actuallyadditions:item_misc", 5));
#infinFurnace(utils.get("actuallyadditions:item_dust", 1), utils.get("minecraft:gold_ingot"));
#infinFurnace(utils.get("actuallyadditions:item_dust", 2), utils.get("minecraft:diamond"));
##infinFurnace(utils.get("actuallyadditions:item_dust", 3), utils.get("minecraft:emerald"));
#infinFurnace(utils.get("actuallyadditions:item_dust", 4), utils.get("minecraft:dye", 4));
#infinFurnace(utils.get("actuallyadditions:item_dust", 6), utils.get("minecraft:coal"));
##infinFurnace(utils.get("actuallyadditions:item_dust", 7), utils.get("actuallyadditions:item_misc", 5));
#infinFurnace(utils.get("actuallyadditions:item_dust"), utils.get("minecraft:iron_ingot"));
infinFurnace(utils.get("actuallyadditions:item_misc", 4), utils.get("actuallyadditions:item_food", 15));
infinFurnace(utils.get("actuallyadditions:item_misc", 9), utils.get("actuallyadditions:item_food", 17));
infinFurnace(utils.get("actuallyadditions:item_misc", 20), utils.get("minecraft:iron_ingot", 0, 2));
infinFurnace(utils.get("actuallyadditions:item_misc", 21), utils.get("actuallyadditions:item_misc", 22));
##infinFurnace(utils.get("advancedrocketry:productdust", 1), utils.get("advancedrocketry:productingot", 1));
##infinFurnace(utils.get("advancedrocketry:productdust"), utils.get("advancedrocketry:productingot"));
infinFurnace(utils.get("appliedenergistics2:material", 2), utils.get("appliedenergistics2:material", 5));
infinFurnace(utils.get("appliedenergistics2:material", 3), utils.get("appliedenergistics2:material", 5));
infinFurnace(utils.get("appliedenergistics2:material", 4), utils.get("minecraft:bread"));
##infinFurnace(utils.get("appliedenergistics2:material", 49), utils.get("minecraft:iron_ingot"));
##infinFurnace(utils.get("appliedenergistics2:material", 51), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("appliedenergistics2:sky_stone_block"), utils.get("appliedenergistics2:smooth_sky_stone_block"));
infinFurnace(utils.get("astralsorcery:blockcustomore", 1), utils.get("astralsorcery:itemcraftingcomponent", 1));
infinFurnace(utils.get("astralsorcery:blockcustomsandore"), utils.get("astralsorcery:itemcraftingcomponent", 0, 3));
infinFurnace(utils.get("betteranimalsplus:eel_meat_raw"), utils.get("betteranimalsplus:eel_meat_cooked"));
infinFurnace(utils.get("betteranimalsplus:golden_goose_egg"), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("betteranimalsplus:goose_egg"), utils.get("betteranimalsplus:fried_egg"));
infinFurnace(utils.get("betteranimalsplus:pheasant_egg"), utils.get("betteranimalsplus:fried_egg"));
infinFurnace(utils.get("betteranimalsplus:pheasantraw"), utils.get("betteranimalsplus:pheasantcooked"));
infinFurnace(utils.get("betteranimalsplus:turkey_egg"), utils.get("betteranimalsplus:fried_egg"));
infinFurnace(utils.get("betteranimalsplus:turkey_leg_raw"), utils.get("betteranimalsplus:turkey_leg_cooked"));
infinFurnace(utils.get("betteranimalsplus:turkey_raw"), utils.get("betteranimalsplus:turkey_cooked"));
infinFurnace(utils.get("betteranimalsplus:venisonraw"), utils.get("betteranimalsplus:venisoncooked"));
infinFurnace(utils.get("biomesoplenty:gem_ore", 1), utils.get("biomesoplenty:gem", 1));
infinFurnace(utils.get("biomesoplenty:gem_ore", 2), utils.get("biomesoplenty:gem", 2));
infinFurnace(utils.get("biomesoplenty:gem_ore", 3), utils.get("biomesoplenty:gem", 3));
infinFurnace(utils.get("biomesoplenty:gem_ore", 4), utils.get("biomesoplenty:gem", 4));
infinFurnace(utils.get("biomesoplenty:gem_ore", 5), utils.get("biomesoplenty:gem", 5));
infinFurnace(utils.get("biomesoplenty:gem_ore", 6), utils.get("biomesoplenty:gem", 6));
infinFurnace(utils.get("biomesoplenty:gem_ore"), utils.get("biomesoplenty:gem"));
##infinFurnace(utils.get("biomesoplenty:log_0", 4), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_0", 5), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_0", 6), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_0", 7), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_1", 4), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_1", 5), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_1", 6), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_1", 7), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_2", 4), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_2", 5), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_2", 6), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_2", 7), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_3", 4), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_3", 5), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_3", 6), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_3", 7), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("biomesoplenty:log_4", 5), utils.get("minecraft:coal", 1));
//infinFurnace(utils.get("biomesoplenty:mud"), utils.get("minecraft:dirt"));
//infinFurnace(utils.get("biomesoplenty:mudball"), utils.get("tconstruct:materials", 1));
infinFurnace(utils.get("biomesoplenty:plant_1", 6), utils.get("minecraft:dye", 2));
infinFurnace(utils.get("biomesoplenty:white_sand"), utils.get("minecraft:glass"));
##infinFurnace(utils.get("bloodmagic:component", 19), utils.get("minecraft:iron_ingot"));
##infinFurnace(utils.get("bloodmagic:component", 20), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("botania:biomestonea", 8), utils.get("botania:biomestonea"));
infinFurnace(utils.get("botania:biomestonea", 9), utils.get("botania:biomestonea", 1));
infinFurnace(utils.get("botania:biomestonea", 10), utils.get("botania:biomestonea", 2));
infinFurnace(utils.get("botania:biomestonea", 11), utils.get("botania:biomestonea", 3));
infinFurnace(utils.get("botania:biomestonea", 12), utils.get("botania:biomestonea", 4));
infinFurnace(utils.get("botania:biomestonea", 13), utils.get("botania:biomestonea", 5));
infinFurnace(utils.get("botania:biomestonea", 14), utils.get("botania:biomestonea", 6));
infinFurnace(utils.get("botania:biomestonea", 15), utils.get("botania:biomestonea", 7));
infinFurnace(utils.get("claybucket:unfiredclaybucket", W), utils.get("claybucket:claybucket"));
infinFurnace(utils.get("contenttweaker:ore_phosphor"), utils.get("contenttweaker:nugget_phosphor"));
infinFurnace(utils.get("cookingforblockheads:recipe_book"), utils.get("cookingforblockheads:recipe_book", 1));
##infinFurnace(utils.get("draconicevolution:draconium_dust", W), utils.get("draconicevolution:draconium_ingot"));
infinFurnace(utils.get("draconicevolution:draconium_ore", W), utils.get("draconicevolution:draconium_ingot"));
#infinFurnace(utils.get("enderio:item_material", 21), utils.get("minecraft:bread"));
##infinFurnace(utils.get("enderio:item_material", 24), utils.get("minecraft:iron_ingot"));
##infinFurnace(utils.get("enderio:item_material", 25), utils.get("minecraft:gold_ingot"));
#infinFurnace(utils.get("enderio:item_material", 26), utils.get("thermalfoundation:material", 128));
#infinFurnace(utils.get("enderio:item_material", 27), utils.get("thermalfoundation:material", 129));
#infinFurnace(utils.get("enderio:item_material", 30), utils.get("tconstruct:ingots", 1));
#infinFurnace(utils.get("enderio:item_material", 31), utils.get("tconstruct:ingots"));
##infinFurnace(utils.get("enderio:item_material", 74), utils.get("enderio:item_alloy_ingot", 7));
#infinFurnace(utils.get("enderio:item_owl_egg"), utils.get("betteranimalsplus:fried_egg"));
infinFurnace(utils.get("endreborn:block_wolframium_ore", W), utils.get("endreborn:item_ingot_wolframium"));
infinFurnace(utils.get("exnihilocreatio:item_material", 2), utils.get("exnihilocreatio:item_cooked_silkworm"));
#infinFurnace(utils.get("exnihilocreatio:item_ore_aluminium", 1), utils.get("thermalfoundation:material", 132));
#infinFurnace(utils.get("exnihilocreatio:item_ore_aluminium", 2), utils.get("thermalfoundation:material", 132));
#infinFurnace(utils.get("exnihilocreatio:item_ore_ardite", 1), utils.get("tconstruct:ingots", 1));
##infinFurnace(utils.get("exnihilocreatio:item_ore_ardite", 2), utils.get("tconstruct:ingots", 1));
#infinFurnace(utils.get("exnihilocreatio:item_ore_cobalt", 1), utils.get("tconstruct:ingots"));
##infinFurnace(utils.get("exnihilocreatio:item_ore_cobalt", 2), utils.get("tconstruct:ingots"));
#infinFurnace(utils.get("exnihilocreatio:item_ore_copper", 1), utils.get("thermalfoundation:material", 128));
#infinFurnace(utils.get("exnihilocreatio:item_ore_copper", 2), utils.get("thermalfoundation:material", 128));
#infinFurnace(utils.get("exnihilocreatio:item_ore_gold", 1), utils.get("minecraft:gold_ingot"));
#infinFurnace(utils.get("exnihilocreatio:item_ore_gold", 2), utils.get("minecraft:gold_ingot"));
#infinFurnace(utils.get("exnihilocreatio:item_ore_iron", 1), utils.get("minecraft:iron_ingot"));
#infinFurnace(utils.get("exnihilocreatio:item_ore_iron", 2), utils.get("minecraft:iron_ingot"));
#infinFurnace(utils.get("exnihilocreatio:item_ore_lead", 1), utils.get("thermalfoundation:material", 131));
#infinFurnace(utils.get("exnihilocreatio:item_ore_lead", 2), utils.get("thermalfoundation:material", 131));
#infinFurnace(utils.get("exnihilocreatio:item_ore_nickel", 1), utils.get("thermalfoundation:material", 133));
#infinFurnace(utils.get("exnihilocreatio:item_ore_nickel", 2), utils.get("thermalfoundation:material", 133));
#infinFurnace(utils.get("exnihilocreatio:item_ore_silver", 1), utils.get("thermalfoundation:material", 130));
#infinFurnace(utils.get("exnihilocreatio:item_ore_silver", 2), utils.get("thermalfoundation:material", 130));
#infinFurnace(utils.get("exnihilocreatio:item_ore_tin", 1), utils.get("thermalfoundation:material", 129));
#infinFurnace(utils.get("exnihilocreatio:item_ore_tin", 2), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("extrautils2:decorativesolid", 4), utils.get("extrautils2:decorativeglass"));
##infinFurnace(utils.get("extrautils2:ironwood_log", W), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("forestry:ash"), utils.get("tconstruct:materials"));
##infinFurnace(utils.get("forestry:logs.0", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.1", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.2", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.3", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.4", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.5", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.6", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("forestry:logs.7", W), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("forestry:peat"), utils.get("forestry:ash"));
infinFurnace(utils.get("forestry:resources"), utils.get("forestry:apatite"));
#infinFurnace(utils.get("gendustry:gene_sample", W), utils.get("gendustry:gene_sample_blank"));
#infinFurnace(utils.get("gendustry:gene_template", W), utils.get("gendustry:gene_template"));
infinFurnace(utils.get("gendustry:honey_drop", 5), utils.get("appliedenergistics2:material", 5, 2));
infinFurnace(utils.get("harvestcraft:anchovyrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:bassrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:calamarirawitem", W), utils.get("harvestcraft:calamaricookeditem"));
infinFurnace(utils.get("harvestcraft:carprawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:catfishrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:charrrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:clamrawitem", W), utils.get("harvestcraft:clamcookeditem"));
infinFurnace(utils.get("harvestcraft:crabrawitem", W), utils.get("harvestcraft:crabcookeditem"));
infinFurnace(utils.get("harvestcraft:crayfishrawitem", W), utils.get("harvestcraft:crayfishcookeditem"));
infinFurnace(utils.get("harvestcraft:duckrawitem", W), utils.get("harvestcraft:duckcookeditem"));
infinFurnace(utils.get("harvestcraft:eelrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:frograwitem", W), utils.get("harvestcraft:frogcookeditem"));
infinFurnace(utils.get("harvestcraft:greenheartfishitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:grouperrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:grubitem", W), utils.get("harvestcraft:cookedgrubitem"));
infinFurnace(utils.get("harvestcraft:herringrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:mudfishrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:musselrawitem", W), utils.get("harvestcraft:musselcookeditem"));
infinFurnace(utils.get("harvestcraft:octopusrawitem", W), utils.get("harvestcraft:octopuscookeditem"));
infinFurnace(utils.get("harvestcraft:oysterrawitem", W), utils.get("harvestcraft:oystercookeditem"));
infinFurnace(utils.get("harvestcraft:perchrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:rawtofabbititem", W), utils.get("harvestcraft:cookedtofabbititem"));
infinFurnace(utils.get("harvestcraft:rawtofaconitem", W), utils.get("harvestcraft:cookedtofaconitem"));
infinFurnace(utils.get("harvestcraft:rawtofeakitem", W), utils.get("harvestcraft:cookedtofeakitem"));
infinFurnace(utils.get("harvestcraft:rawtofeegitem", W), utils.get("harvestcraft:cookedtofeegitem"));
infinFurnace(utils.get("harvestcraft:rawtofenisonitem", W), utils.get("harvestcraft:cookedtofenisonitem"));
infinFurnace(utils.get("harvestcraft:rawtofickenitem", W), utils.get("harvestcraft:cookedtofickenitem"));
infinFurnace(utils.get("harvestcraft:rawtofishitem", W), utils.get("harvestcraft:cookedtofishitem"));
infinFurnace(utils.get("harvestcraft:rawtofuduckitem", W), utils.get("harvestcraft:cookedtofuduckitem"));
infinFurnace(utils.get("harvestcraft:rawtofurkeyitem", W), utils.get("harvestcraft:cookedtofurkeyitem"));
infinFurnace(utils.get("harvestcraft:rawtofuttonitem", W), utils.get("harvestcraft:cookedtofuttonitem"));
infinFurnace(utils.get("harvestcraft:sardinerawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:scalloprawitem", W), utils.get("harvestcraft:scallopcookeditem"));
infinFurnace(utils.get("harvestcraft:shrimprawitem", W), utils.get("harvestcraft:shrimpcookeditem"));
infinFurnace(utils.get("harvestcraft:snailrawitem", W), utils.get("harvestcraft:snailcookeditem"));
infinFurnace(utils.get("harvestcraft:snapperrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:tilapiarawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:troutrawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:tunarawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("harvestcraft:turkeyrawitem", W), utils.get("harvestcraft:turkeycookeditem"));
infinFurnace(utils.get("harvestcraft:turtlerawitem", W), utils.get("harvestcraft:turtlecookeditem"));
infinFurnace(utils.get("harvestcraft:venisonrawitem", W), utils.get("harvestcraft:venisoncookeditem"));
infinFurnace(utils.get("harvestcraft:walleyerawitem", W), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("ic2:crafting", 27), utils.get("ic2:crystal_memory"));
infinFurnace(utils.get("ic2:crushed", 1), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("ic2:crushed", 2), utils.get("minecraft:iron_ingot"));
infinFurnace(utils.get("ic2:crushed", 3), utils.get("thermalfoundation:material", 131));
infinFurnace(utils.get("ic2:crushed", 4), utils.get("thermalfoundation:material", 130));
infinFurnace(utils.get("ic2:crushed", 5), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("ic2:crushed", 6), utils.get("immersiveengineering:metal", 5));
infinFurnace(utils.get("ic2:crushed"), utils.get("thermalfoundation:material", 128));
//infinFurnace(utils.get("ic2:dust", 3), utils.get("thermalfoundation:material", 768));
#infinFurnace(utils.get("ic2:dust", 4), utils.get("thermalfoundation:material", 128));
#infinFurnace(utils.get("ic2:dust", 7), utils.get("minecraft:gold_ingot"));
##infinFurnace(utils.get("ic2:dust", 11), utils.get("nuclearcraft:ingot", 6));
#infinFurnace(utils.get("ic2:dust", 14), utils.get("thermalfoundation:material", 130));
infinFurnace(utils.get("ic2:dust", 15), utils.get("tconstruct:materials"));
#infinFurnace(utils.get("ic2:dust", 17), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("ic2:misc_resource", 4), utils.get("ic2:crafting"));
infinFurnace(utils.get("ic2:mug", 1), utils.get("ic2:mug", 2));
infinFurnace(utils.get("ic2:purified", 1), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("ic2:purified", 2), utils.get("minecraft:iron_ingot"));
infinFurnace(utils.get("ic2:purified", 3), utils.get("thermalfoundation:material", 131));
infinFurnace(utils.get("ic2:purified", 4), utils.get("thermalfoundation:material", 130));
infinFurnace(utils.get("ic2:purified", 5), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("ic2:purified", 6), utils.get("immersiveengineering:metal", 5));
infinFurnace(utils.get("ic2:purified"), utils.get("thermalfoundation:material", 128));
##infinFurnace(utils.get("ic2:rubber_wood", W), utils.get("minecraft:log", 3));
//infinFurnace(utils.get("iceandfire:dread_stone_bricks", W), utils.get("iceandfire:dread_stone_bricks_cracked"));
infinFurnace(utils.get("iceandfire:frozen_cobblestone", W), utils.get("minecraft:cobblestone"));
infinFurnace(utils.get("iceandfire:frozen_dirt", W), utils.get("minecraft:dirt"));
infinFurnace(utils.get("iceandfire:frozen_grass_path", W), utils.get("minecraft:grass_path"));
infinFurnace(utils.get("iceandfire:frozen_grass", W), utils.get("minecraft:grass"));
infinFurnace(utils.get("iceandfire:frozen_gravel", W), utils.get("minecraft:gravel"));
infinFurnace(utils.get("iceandfire:frozen_splinters", W), utils.get("minecraft:stick", 0, 3));
infinFurnace(utils.get("iceandfire:frozen_stone", W), utils.get("minecraft:stone"));
infinFurnace(utils.get("iceandfire:myrmex_desert_resin_block", W), utils.get("iceandfire:myrmex_desert_resin_glass"));
infinFurnace(utils.get("iceandfire:myrmex_jungle_resin_block", W), utils.get("iceandfire:myrmex_jungle_resin_glass"));
infinFurnace(utils.get("iceandfire:stymphalian_bird_feather", W), utils.get("thermalfoundation:material", 227));
infinFurnace(utils.get("immersiveengineering:material", 7), utils.get("thermalfoundation:rockwool", 7));
##infinFurnace(utils.get("immersiveengineering:material", 18), utils.get("immersiveengineering:material", 19));
##infinFurnace(utils.get("immersiveengineering:metal", 14), utils.get("immersiveengineering:metal", 5));
#infinFurnace(utils.get("immersiveengineering:ore", 1), utils.get("thermalfoundation:material", 132));
infinFurnace(utils.get("immersiveengineering:ore", 5), utils.get("immersiveengineering:metal", 5));
infinFurnace(utils.get("industrialforegoing:dryrubber", W), utils.get("industrialforegoing:plastic"));
##infinFurnace(utils.get("integrateddynamics:menril_log_filled"), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("integrateddynamics:menril_log"), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("jaopca:item_chunkaluminium"), utils.get("jaopca:item_dirtygemaluminium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkamethyst"), utils.get("jaopca:item_dirtygemamethyst", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkapatite"), utils.get("jaopca:item_dirtygemapatite", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkaquamarine"), utils.get("jaopca:item_dirtygemaquamarine", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkardite"), utils.get("jaopca:item_dirtygemardite", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkastralstarmetal"), utils.get("jaopca:item_dirtygemastralstarmetal", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkboron"), utils.get("jaopca:item_dirtygemboron", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkcoal"), utils.get("jaopca:item_dirtygemcoal", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkcobalt"), utils.get("jaopca:item_dirtygemcobalt", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkcopper"), utils.get("jaopca:item_dirtygemcopper", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkdiamond"), utils.get("jaopca:item_dirtygemdiamond", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkdraconium"), utils.get("jaopca:item_dirtygemdraconium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkemerald"), utils.get("jaopca:item_dirtygememerald", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkgold"), utils.get("jaopca:item_dirtygemgold", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkiridium"), utils.get("jaopca:item_dirtygemiridium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkiron"), utils.get("jaopca:item_dirtygemiron", 0, 10));
infinFurnace(utils.get("jaopca:item_chunklapis"), utils.get("jaopca:item_dirtygemlapis", 0, 10));
infinFurnace(utils.get("jaopca:item_chunklead"), utils.get("jaopca:item_dirtygemlead", 0, 10));
infinFurnace(utils.get("jaopca:item_chunklithium"), utils.get("jaopca:item_dirtygemlithium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkmagnesium"), utils.get("jaopca:item_dirtygemmagnesium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkmalachite"), utils.get("jaopca:item_dirtygemmalachite", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkmithril"), utils.get("jaopca:item_dirtygemmithril", 0, 10));
infinFurnace(utils.get("jaopca:item_chunknickel"), utils.get("jaopca:item_dirtygemnickel", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkosmium"), utils.get("jaopca:item_dirtygemosmium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkperidot"), utils.get("jaopca:item_dirtygemperidot", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkplatinum"), utils.get("jaopca:item_dirtygemplatinum", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkquartz"), utils.get("jaopca:item_dirtygemquartz", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkquartzblack"), utils.get("jaopca:item_dirtygemquartzblack", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkredstone"), utils.get("jaopca:item_dirtygemredstone", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkruby"), utils.get("jaopca:item_dirtygemruby", 0, 10));
infinFurnace(utils.get("jaopca:item_chunksapphire"), utils.get("jaopca:item_dirtygemsapphire", 0, 10));
infinFurnace(utils.get("jaopca:item_chunksilver"), utils.get("jaopca:item_dirtygemsilver", 0, 10));
infinFurnace(utils.get("jaopca:item_chunktanzanite"), utils.get("jaopca:item_dirtygemtanzanite", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkthorium"), utils.get("jaopca:item_dirtygemthorium", 0, 10));
infinFurnace(utils.get("jaopca:item_chunktin"), utils.get("jaopca:item_dirtygemtin", 0, 10));
infinFurnace(utils.get("jaopca:item_chunktopaz"), utils.get("jaopca:item_dirtygemtopaz", 0, 10));
infinFurnace(utils.get("jaopca:item_chunktungsten"), utils.get("jaopca:item_dirtygemtungsten", 0, 10));
infinFurnace(utils.get("jaopca:item_chunkuranium"), utils.get("jaopca:item_dirtygemuranium", 0, 10));
infinFurnace(utils.get("jaopca:item_clusteraluminium"), utils.get("thermalfoundation:material", 68, 2));
infinFurnace(utils.get("jaopca:item_clusteramber"), utils.get("thaumcraft:amber", 0, 3));
infinFurnace(utils.get("jaopca:item_clusteramethyst"), utils.get("biomesoplenty:gem", 0, 3));
infinFurnace(utils.get("jaopca:item_clusterapatite"), utils.get("forestry:apatite", 0, 17));
infinFurnace(utils.get("jaopca:item_clusteraquamarine"), utils.get("astralsorcery:itemcraftingcomponent", 0, 7));
infinFurnace(utils.get("jaopca:item_clusterardite"), utils.get("exnihilocreatio:item_ore_ardite", 2, 2));
infinFurnace(utils.get("jaopca:item_clusterastralstarmetal"), utils.get("astralsorcery:itemcraftingcomponent", 2, 2));
infinFurnace(utils.get("jaopca:item_clusterboron"), utils.get("nuclearcraft:dust", 5, 2));
infinFurnace(utils.get("jaopca:item_clustercertusquartz"), utils.get("appliedenergistics2:material", 0, 5));
infinFurnace(utils.get("jaopca:item_clusterchargedcertusquartz"), utils.get("appliedenergistics2:material", 1, 3));
infinFurnace(utils.get("jaopca:item_clustercoal"), utils.get("minecraft:coal", 0, 8));
infinFurnace(utils.get("jaopca:item_clustercobalt"), utils.get("exnihilocreatio:item_ore_cobalt", 2, 2));
infinFurnace(utils.get("jaopca:item_clusterdiamond"), utils.get("minecraft:diamond", 0, 3));
infinFurnace(utils.get("jaopca:item_clusterdilithium"), utils.get("libvulpes:productgem", 0, 2));
infinFurnace(utils.get("jaopca:item_clusterdimensionalshard"), utils.get("rftools:dimensional_shard", 0, 5));
infinFurnace(utils.get("jaopca:item_clusterdraconium"), utils.get("draconicevolution:draconium_dust", 0, 2));
infinFurnace(utils.get("jaopca:item_clusteremerald"), utils.get("minecraft:emerald", 0, 3));
infinFurnace(utils.get("jaopca:item_clusteriridium"), utils.get("ic2:misc_resource", 1, 2));
infinFurnace(utils.get("jaopca:item_clusterlapis"), utils.get("minecraft:dye", 4, 17));
infinFurnace(utils.get("jaopca:item_clusterlithium"), utils.get("ic2:dust", 11, 2));
infinFurnace(utils.get("jaopca:item_clustermagnesium"), utils.get("nuclearcraft:dust", 7, 2));
infinFurnace(utils.get("jaopca:item_clustermalachite"), utils.get("biomesoplenty:gem", 5, 3));
infinFurnace(utils.get("jaopca:item_clustermithril"), utils.get("thermalfoundation:material", 72, 2));
infinFurnace(utils.get("jaopca:item_clusternickel"), utils.get("thermalfoundation:material", 69, 2));
infinFurnace(utils.get("jaopca:item_clusterosmium"), utils.get("mekanism:dust", 2, 2));
infinFurnace(utils.get("jaopca:item_clusterperidot"), utils.get("biomesoplenty:gem", 2, 3));
infinFurnace(utils.get("jaopca:item_clusterplatinum"), utils.get("thermalfoundation:material", 70, 2));
infinFurnace(utils.get("jaopca:item_clusterquartzblack"), utils.get("actuallyadditions:item_misc", 5, 3));
infinFurnace(utils.get("jaopca:item_clusterredstone"), utils.get("extrautils2:ingredients", 0, 17));
infinFurnace(utils.get("jaopca:item_clusterruby"), utils.get("biomesoplenty:gem", 1, 3));
infinFurnace(utils.get("jaopca:item_clustersapphire"), utils.get("biomesoplenty:gem", 6, 3));
infinFurnace(utils.get("jaopca:item_clustertanzanite"), utils.get("biomesoplenty:gem", 4, 3));
infinFurnace(utils.get("jaopca:item_clusterthorium"), utils.get("nuclearcraft:dust", 3, 2));
infinFurnace(utils.get("jaopca:item_clustertitanium"), utils.get("libvulpes:productdust", 7, 2));
infinFurnace(utils.get("jaopca:item_clustertopaz"), utils.get("biomesoplenty:gem", 3, 3));
infinFurnace(utils.get("jaopca:item_clustertrinitite"), utils.get("trinity:trinitite_shard", 0, 2));
infinFurnace(utils.get("jaopca:item_clustertungsten"), utils.get("qmd:dust", 0, 2));
infinFurnace(utils.get("jaopca:item_clusteruranium"), utils.get("immersiveengineering:metal", 14, 2));
infinFurnace(utils.get("jaopca:item_crushedaluminium"), utils.get("thermalfoundation:material", 132));
infinFurnace(utils.get("jaopca:item_crushedardite"), utils.get("tconstruct:ingots", 1));
infinFurnace(utils.get("jaopca:item_crushedastralstarmetal"), utils.get("astralsorcery:itemcraftingcomponent", 1));
infinFurnace(utils.get("jaopca:item_crushedboron"), utils.get("nuclearcraft:ingot", 5));
infinFurnace(utils.get("jaopca:item_crushedcobalt"), utils.get("tconstruct:ingots"));
infinFurnace(utils.get("jaopca:item_crusheddraconium"), utils.get("draconicevolution:draconium_ingot"));
infinFurnace(utils.get("jaopca:item_crushediridium"), utils.get("thermalfoundation:material", 135));
infinFurnace(utils.get("jaopca:item_crushedlithium"), utils.get("nuclearcraft:ingot", 6));
infinFurnace(utils.get("jaopca:item_crushedmagnesium"), utils.get("nuclearcraft:ingot", 7));
infinFurnace(utils.get("jaopca:item_crushedmithril"), utils.get("thermalfoundation:material", 136));
infinFurnace(utils.get("jaopca:item_crushednickel"), utils.get("thermalfoundation:material", 133));
infinFurnace(utils.get("jaopca:item_crushedosmium"), utils.get("mekanism:ingot", 1));
infinFurnace(utils.get("jaopca:item_crushedplatinum"), utils.get("thermalfoundation:material", 134));
infinFurnace(utils.get("jaopca:item_crushedpurifiedaluminium"), utils.get("thermalfoundation:material", 132));
infinFurnace(utils.get("jaopca:item_crushedpurifiedardite"), utils.get("tconstruct:ingots", 1));
infinFurnace(utils.get("jaopca:item_crushedpurifiedastralstarmetal"), utils.get("astralsorcery:itemcraftingcomponent", 1));
infinFurnace(utils.get("jaopca:item_crushedpurifiedboron"), utils.get("nuclearcraft:ingot", 5));
infinFurnace(utils.get("jaopca:item_crushedpurifiedcobalt"), utils.get("tconstruct:ingots"));
infinFurnace(utils.get("jaopca:item_crushedpurifieddraconium"), utils.get("draconicevolution:draconium_ingot"));
infinFurnace(utils.get("jaopca:item_crushedpurifiediridium"), utils.get("thermalfoundation:material", 135));
infinFurnace(utils.get("jaopca:item_crushedpurifiedlithium"), utils.get("nuclearcraft:ingot", 6));
infinFurnace(utils.get("jaopca:item_crushedpurifiedmagnesium"), utils.get("nuclearcraft:ingot", 7));
infinFurnace(utils.get("jaopca:item_crushedpurifiedmithril"), utils.get("thermalfoundation:material", 136));
infinFurnace(utils.get("jaopca:item_crushedpurifiednickel"), utils.get("thermalfoundation:material", 133));
infinFurnace(utils.get("jaopca:item_crushedpurifiedosmium"), utils.get("mekanism:ingot", 1));
infinFurnace(utils.get("jaopca:item_crushedpurifiedplatinum"), utils.get("thermalfoundation:material", 134));
infinFurnace(utils.get("jaopca:item_crushedpurifiedthorium"), utils.get("nuclearcraft:ingot", 3));
infinFurnace(utils.get("jaopca:item_crushedpurifiedtungsten"), utils.get("endreborn:item_ingot_wolframium"));
infinFurnace(utils.get("jaopca:item_crushedthorium"), utils.get("nuclearcraft:ingot", 3));
infinFurnace(utils.get("jaopca:item_crushedtungsten"), utils.get("endreborn:item_ingot_wolframium"));
infinFurnace(utils.get("jaopca:item_crystalabyssaluminium"), utils.get("jaopca:item_dirtygemaluminium"));
infinFurnace(utils.get("jaopca:item_crystalabyssamber"), utils.get("jaopca:item_dirtygemamber"));
infinFurnace(utils.get("jaopca:item_crystalabyssamethyst"), utils.get("jaopca:item_dirtygemamethyst"));
infinFurnace(utils.get("jaopca:item_crystalabyssapatite"), utils.get("jaopca:item_dirtygemapatite"));
infinFurnace(utils.get("jaopca:item_crystalabyssaquamarine"), utils.get("jaopca:item_dirtygemaquamarine"));
infinFurnace(utils.get("jaopca:item_crystalabyssardite"), utils.get("jaopca:item_dirtygemardite"));
infinFurnace(utils.get("jaopca:item_crystalabyssastralstarmetal"), utils.get("jaopca:item_dirtygemastralstarmetal"));
infinFurnace(utils.get("jaopca:item_crystalabyssboron"), utils.get("jaopca:item_dirtygemboron"));
infinFurnace(utils.get("jaopca:item_crystalabysscertusquartz"), utils.get("jaopca:item_dirtygemcertusquartz"));
infinFurnace(utils.get("jaopca:item_crystalabysschargedcertusquartz"), utils.get("jaopca:item_dirtygemchargedcertusquartz"));
infinFurnace(utils.get("jaopca:item_crystalabysscoal"), utils.get("jaopca:item_dirtygemcoal"));
infinFurnace(utils.get("jaopca:item_crystalabysscobalt"), utils.get("jaopca:item_dirtygemcobalt"));
infinFurnace(utils.get("jaopca:item_crystalabysscopper"), utils.get("jaopca:item_dirtygemcopper"));
infinFurnace(utils.get("jaopca:item_crystalabyssdiamond"), utils.get("jaopca:item_dirtygemdiamond"));
infinFurnace(utils.get("jaopca:item_crystalabyssdilithium"), utils.get("jaopca:item_dirtygemdilithium"));
infinFurnace(utils.get("jaopca:item_crystalabyssdimensionalshard"), utils.get("jaopca:item_dirtygemdimensionalshard"));
infinFurnace(utils.get("jaopca:item_crystalabyssdraconium"), utils.get("jaopca:item_dirtygemdraconium"));
infinFurnace(utils.get("jaopca:item_crystalabyssemerald"), utils.get("jaopca:item_dirtygememerald"));
infinFurnace(utils.get("jaopca:item_crystalabyssgold"), utils.get("jaopca:item_dirtygemgold"));
infinFurnace(utils.get("jaopca:item_crystalabyssiridium"), utils.get("jaopca:item_dirtygemiridium"));
infinFurnace(utils.get("jaopca:item_crystalabyssiron"), utils.get("jaopca:item_dirtygemiron"));
infinFurnace(utils.get("jaopca:item_crystalabysslapis"), utils.get("jaopca:item_dirtygemlapis"));
infinFurnace(utils.get("jaopca:item_crystalabysslead"), utils.get("jaopca:item_dirtygemlead"));
infinFurnace(utils.get("jaopca:item_crystalabysslithium"), utils.get("jaopca:item_dirtygemlithium"));
infinFurnace(utils.get("jaopca:item_crystalabyssmagnesium"), utils.get("jaopca:item_dirtygemmagnesium"));
infinFurnace(utils.get("jaopca:item_crystalabyssmalachite"), utils.get("jaopca:item_dirtygemmalachite"));
infinFurnace(utils.get("jaopca:item_crystalabyssmithril"), utils.get("jaopca:item_dirtygemmithril"));
infinFurnace(utils.get("jaopca:item_crystalabyssnickel"), utils.get("jaopca:item_dirtygemnickel"));
infinFurnace(utils.get("jaopca:item_crystalabyssosmium"), utils.get("jaopca:item_dirtygemosmium"));
infinFurnace(utils.get("jaopca:item_crystalabyssperidot"), utils.get("jaopca:item_dirtygemperidot"));
infinFurnace(utils.get("jaopca:item_crystalabyssplatinum"), utils.get("jaopca:item_dirtygemplatinum"));
infinFurnace(utils.get("jaopca:item_crystalabyssquartz"), utils.get("jaopca:item_dirtygemquartz"));
infinFurnace(utils.get("jaopca:item_crystalabyssquartzblack"), utils.get("jaopca:item_dirtygemquartzblack"));
infinFurnace(utils.get("jaopca:item_crystalabyssredstone"), utils.get("jaopca:item_dirtygemredstone"));
infinFurnace(utils.get("jaopca:item_crystalabyssruby"), utils.get("jaopca:item_dirtygemruby"));
infinFurnace(utils.get("jaopca:item_crystalabysssapphire"), utils.get("jaopca:item_dirtygemsapphire"));
infinFurnace(utils.get("jaopca:item_crystalabysssilver"), utils.get("jaopca:item_dirtygemsilver"));
infinFurnace(utils.get("jaopca:item_crystalabysstanzanite"), utils.get("jaopca:item_dirtygemtanzanite"));
infinFurnace(utils.get("jaopca:item_crystalabyssthorium"), utils.get("jaopca:item_dirtygemthorium"));
infinFurnace(utils.get("jaopca:item_crystalabysstin"), utils.get("jaopca:item_dirtygemtin"));
infinFurnace(utils.get("jaopca:item_crystalabysstitanium"), utils.get("jaopca:item_dirtygemtitanium"));
infinFurnace(utils.get("jaopca:item_crystalabysstopaz"), utils.get("jaopca:item_dirtygemtopaz"));
infinFurnace(utils.get("jaopca:item_crystalabysstrinitite"), utils.get("jaopca:item_dirtygemtrinitite"));
infinFurnace(utils.get("jaopca:item_crystalabysstungsten"), utils.get("jaopca:item_dirtygemtungsten"));
infinFurnace(utils.get("jaopca:item_crystalabyssuranium"), utils.get("jaopca:item_dirtygemuranium"));
infinFurnace(utils.get("jaopca:item_dirtygemaluminium"), utils.get("thermalfoundation:material", 132, 12));
infinFurnace(utils.get("jaopca:item_dirtygemamber"), utils.get("thaumcraft:amber", 0, 18));
infinFurnace(utils.get("jaopca:item_dirtygemamethyst"), utils.get("biomesoplenty:gem", 0, 18));
infinFurnace(utils.get("jaopca:item_dirtygemapatite"), utils.get("forestry:apatite", 0, 64));
infinFurnace(utils.get("jaopca:item_dirtygemaquamarine"), utils.get("astralsorcery:itemcraftingcomponent", 0, 37));
infinFurnace(utils.get("jaopca:item_dirtygemardite"), utils.get("tconstruct:ingots", 1, 12));
infinFurnace(utils.get("jaopca:item_dirtygemastralstarmetal"), utils.get("astralsorcery:itemcraftingcomponent", 1, 12));
infinFurnace(utils.get("jaopca:item_dirtygemboron"), utils.get("nuclearcraft:ingot", 5, 12));
infinFurnace(utils.get("jaopca:item_dirtygemcertusquartz"), utils.get("appliedenergistics2:material", 0, 27));
infinFurnace(utils.get("jaopca:item_dirtygemchargedcertusquartz"), utils.get("appliedenergistics2:material", 1, 18));
infinFurnace(utils.get("jaopca:item_dirtygemcoal"), utils.get("minecraft:coal", 0, 46));
infinFurnace(utils.get("jaopca:item_dirtygemcobalt"), utils.get("tconstruct:ingots", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygemcopper"), utils.get("thermalfoundation:material", 128, 12));
infinFurnace(utils.get("jaopca:item_dirtygemdiamond"), utils.get("minecraft:diamond", 0, 18));
infinFurnace(utils.get("jaopca:item_dirtygemdilithium"), utils.get("libvulpes:productgem", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygemdimensionalshard"), utils.get("rftools:dimensional_shard", 0, 27));
infinFurnace(utils.get("jaopca:item_dirtygemdraconium"), utils.get("draconicevolution:draconium_ingot", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygememerald"), utils.get("minecraft:emerald", 0, 18));
infinFurnace(utils.get("jaopca:item_dirtygemgold"), utils.get("minecraft:gold_ingot", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygemiridium"), utils.get("thermalfoundation:material", 135, 12));
infinFurnace(utils.get("jaopca:item_dirtygemiron"), utils.get("minecraft:iron_ingot", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygemlapis"), utils.get("minecraft:dye", 4, 64));
infinFurnace(utils.get("jaopca:item_dirtygemlead"), utils.get("thermalfoundation:material", 131, 12));
infinFurnace(utils.get("jaopca:item_dirtygemlithium"), utils.get("nuclearcraft:ingot", 6, 12));
infinFurnace(utils.get("jaopca:item_dirtygemmagnesium"), utils.get("nuclearcraft:ingot", 7, 12));
infinFurnace(utils.get("jaopca:item_dirtygemmalachite"), utils.get("biomesoplenty:gem", 5, 18));
infinFurnace(utils.get("jaopca:item_dirtygemmithril"), utils.get("thermalfoundation:material", 136, 12));
infinFurnace(utils.get("jaopca:item_dirtygemnickel"), utils.get("thermalfoundation:material", 133, 12));
infinFurnace(utils.get("jaopca:item_dirtygemosmium"), utils.get("mekanism:ingot", 1, 12));
infinFurnace(utils.get("jaopca:item_dirtygemperidot"), utils.get("biomesoplenty:gem", 2, 18));
infinFurnace(utils.get("jaopca:item_dirtygemplatinum"), utils.get("thermalfoundation:material", 134, 12));
infinFurnace(utils.get("jaopca:item_dirtygemquartz"), utils.get("minecraft:quartz", 0, 27));
infinFurnace(utils.get("jaopca:item_dirtygemquartzblack"), utils.get("actuallyadditions:item_misc", 5, 18));
infinFurnace(utils.get("jaopca:item_dirtygemredstone"), utils.get("extrautils2:ingredients", 0, 64));
infinFurnace(utils.get("jaopca:item_dirtygemruby"), utils.get("biomesoplenty:gem", 1, 18));
infinFurnace(utils.get("jaopca:item_dirtygemsapphire"), utils.get("biomesoplenty:gem", 6, 18));
infinFurnace(utils.get("jaopca:item_dirtygemsilver"), utils.get("thermalfoundation:material", 130, 12));
infinFurnace(utils.get("jaopca:item_dirtygemtanzanite"), utils.get("biomesoplenty:gem", 4, 18));
infinFurnace(utils.get("jaopca:item_dirtygemthorium"), utils.get("nuclearcraft:ingot", 3, 12));
infinFurnace(utils.get("jaopca:item_dirtygemtin"), utils.get("thermalfoundation:material", 129, 12));
infinFurnace(utils.get("jaopca:item_dirtygemtitanium"), utils.get("libvulpes:productingot", 7, 12));
infinFurnace(utils.get("jaopca:item_dirtygemtopaz"), utils.get("biomesoplenty:gem", 3, 18));
infinFurnace(utils.get("jaopca:item_dirtygemtrinitite"), utils.get("trinity:trinitite_shard", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygemtungsten"), utils.get("qmd:dust", 0, 12));
infinFurnace(utils.get("jaopca:item_dirtygemuranium"), utils.get("immersiveengineering:metal", 5, 12));
infinFurnace(utils.get("jaopca:item_dustalchaluminium"), utils.get("jaopca:item_dirtygemaluminium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchamethyst"), utils.get("jaopca:item_dirtygemamethyst", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchapatite"), utils.get("jaopca:item_dirtygemapatite", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchaquamarine"), utils.get("jaopca:item_dirtygemaquamarine", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchardite"), utils.get("jaopca:item_dirtygemardite", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchastralstarmetal"), utils.get("jaopca:item_dirtygemastralstarmetal", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchboron"), utils.get("jaopca:item_dirtygemboron", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchcoal"), utils.get("jaopca:item_dirtygemcoal", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchcobalt"), utils.get("jaopca:item_dirtygemcobalt", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchcopper"), utils.get("jaopca:item_dirtygemcopper", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchdiamond"), utils.get("jaopca:item_dirtygemdiamond", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchdraconium"), utils.get("jaopca:item_dirtygemdraconium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchemerald"), utils.get("jaopca:item_dirtygememerald", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchgold"), utils.get("jaopca:item_dirtygemgold", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchiridium"), utils.get("jaopca:item_dirtygemiridium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchiron"), utils.get("jaopca:item_dirtygemiron", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchlapis"), utils.get("jaopca:item_dirtygemlapis", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchlead"), utils.get("jaopca:item_dirtygemlead", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchlithium"), utils.get("jaopca:item_dirtygemlithium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchmagnesium"), utils.get("jaopca:item_dirtygemmagnesium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchmalachite"), utils.get("jaopca:item_dirtygemmalachite", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchmithril"), utils.get("jaopca:item_dirtygemmithril", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchnickel"), utils.get("jaopca:item_dirtygemnickel", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchosmium"), utils.get("jaopca:item_dirtygemosmium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchperidot"), utils.get("jaopca:item_dirtygemperidot", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchplatinum"), utils.get("jaopca:item_dirtygemplatinum", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchquartz"), utils.get("jaopca:item_dirtygemquartz", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchquartzblack"), utils.get("jaopca:item_dirtygemquartzblack", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchredstone"), utils.get("jaopca:item_dirtygemredstone", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchruby"), utils.get("jaopca:item_dirtygemruby", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchsapphire"), utils.get("jaopca:item_dirtygemsapphire", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchsilver"), utils.get("jaopca:item_dirtygemsilver", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchtanzanite"), utils.get("jaopca:item_dirtygemtanzanite", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchthorium"), utils.get("jaopca:item_dirtygemthorium", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchtin"), utils.get("jaopca:item_dirtygemtin", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchtopaz"), utils.get("jaopca:item_dirtygemtopaz", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchtungsten"), utils.get("jaopca:item_dirtygemtungsten", 0, 48));
infinFurnace(utils.get("jaopca:item_dustalchuranium"), utils.get("jaopca:item_dirtygemuranium", 0, 48));
##infinFurnace(utils.get("jaopca:item_dustapatite"), utils.get("forestry:apatite"));
#infinFurnace(utils.get("jaopca:item_hunkastralstarmetal"), utils.get("astralsorcery:itemcraftingcomponent", 1));
#infinFurnace(utils.get("jaopca:item_hunkboron"), utils.get("nuclearcraft:ingot", 5));
#infinFurnace(utils.get("jaopca:item_hunkdraconium"), utils.get("draconicevolution:draconium_ingot"));
#infinFurnace(utils.get("jaopca:item_hunkiridium"), utils.get("thermalfoundation:material", 135));
#infinFurnace(utils.get("jaopca:item_hunklithium"), utils.get("nuclearcraft:ingot", 6));
#infinFurnace(utils.get("jaopca:item_hunkmagnesium"), utils.get("nuclearcraft:ingot", 7));
#infinFurnace(utils.get("jaopca:item_hunkmithril"), utils.get("thermalfoundation:material", 136));
#infinFurnace(utils.get("jaopca:item_hunkosmium"), utils.get("mekanism:ingot", 1));
#infinFurnace(utils.get("jaopca:item_hunkplatinum"), utils.get("thermalfoundation:material", 134));
#infinFurnace(utils.get("jaopca:item_hunkthorium"), utils.get("nuclearcraft:ingot", 3));
#infinFurnace(utils.get("jaopca:item_hunktitanium"), utils.get("libvulpes:productingot", 7));
#infinFurnace(utils.get("jaopca:item_hunktungsten"), utils.get("endreborn:item_ingot_wolframium"));
#infinFurnace(utils.get("jaopca:item_hunkuranium"), utils.get("immersiveengineering:metal", 5));
infinFurnace(utils.get("jaopca:item_rockychunkaluminium"), utils.get("jaopca:item_dirtygemaluminium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkamber"), utils.get("jaopca:item_dirtygemamber", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkamethyst"), utils.get("jaopca:item_dirtygemamethyst", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkapatite"), utils.get("jaopca:item_dirtygemapatite", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkaquamarine"), utils.get("jaopca:item_dirtygemaquamarine", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkardite"), utils.get("jaopca:item_dirtygemardite", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkastralstarmetal"), utils.get("jaopca:item_dirtygemastralstarmetal", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkboron"), utils.get("jaopca:item_dirtygemboron", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkcertusquartz"), utils.get("jaopca:item_dirtygemcertusquartz", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkchargedcertusquartz"), utils.get("jaopca:item_dirtygemchargedcertusquartz", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkcoal"), utils.get("jaopca:item_dirtygemcoal", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkcobalt"), utils.get("jaopca:item_dirtygemcobalt", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkcopper"), utils.get("jaopca:item_dirtygemcopper", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkdiamond"), utils.get("jaopca:item_dirtygemdiamond", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkdilithium"), utils.get("jaopca:item_dirtygemdilithium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkdimensionalshard"), utils.get("jaopca:item_dirtygemdimensionalshard", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkdraconium"), utils.get("jaopca:item_dirtygemdraconium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkemerald"), utils.get("jaopca:item_dirtygememerald", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkgold"), utils.get("jaopca:item_dirtygemgold", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkiridium"), utils.get("jaopca:item_dirtygemiridium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkiron"), utils.get("jaopca:item_dirtygemiron", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunklapis"), utils.get("jaopca:item_dirtygemlapis", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunklead"), utils.get("jaopca:item_dirtygemlead", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunklithium"), utils.get("jaopca:item_dirtygemlithium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkmagnesium"), utils.get("jaopca:item_dirtygemmagnesium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkmalachite"), utils.get("jaopca:item_dirtygemmalachite", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkmithril"), utils.get("jaopca:item_dirtygemmithril", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunknickel"), utils.get("jaopca:item_dirtygemnickel", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkosmium"), utils.get("jaopca:item_dirtygemosmium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkperidot"), utils.get("jaopca:item_dirtygemperidot", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkplatinum"), utils.get("jaopca:item_dirtygemplatinum", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkquartz"), utils.get("jaopca:item_dirtygemquartz", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkquartzblack"), utils.get("jaopca:item_dirtygemquartzblack", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkredstone"), utils.get("jaopca:item_dirtygemredstone", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkruby"), utils.get("jaopca:item_dirtygemruby", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunksapphire"), utils.get("jaopca:item_dirtygemsapphire", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunksilver"), utils.get("jaopca:item_dirtygemsilver", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunktanzanite"), utils.get("jaopca:item_dirtygemtanzanite", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkthorium"), utils.get("jaopca:item_dirtygemthorium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunktin"), utils.get("jaopca:item_dirtygemtin", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunktitanium"), utils.get("jaopca:item_dirtygemtitanium", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunktopaz"), utils.get("jaopca:item_dirtygemtopaz", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunktrinitite"), utils.get("jaopca:item_dirtygemtrinitite", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunktungsten"), utils.get("jaopca:item_dirtygemtungsten", 0, 4));
infinFurnace(utils.get("jaopca:item_rockychunkuranium"), utils.get("jaopca:item_dirtygemuranium", 0, 4));
#infinFurnace(utils.get("libvulpes:productdust", 1), utils.get("minecraft:iron_ingot"));
#infinFurnace(utils.get("libvulpes:productdust", 2), utils.get("minecraft:gold_ingot"));
#infinFurnace(utils.get("libvulpes:productdust", 3), utils.get("appliedenergistics2:material", 5));
#infinFurnace(utils.get("libvulpes:productdust", 4), utils.get("thermalfoundation:material", 128));
#infinFurnace(utils.get("libvulpes:productdust", 5), utils.get("thermalfoundation:material", 129));
##infinFurnace(utils.get("libvulpes:productdust", 7), utils.get("libvulpes:productingot", 7));
#infinFurnace(utils.get("libvulpes:productdust", 9), utils.get("thermalfoundation:material", 132));
#infinFurnace(utils.get("libvulpes:productdust", 10), utils.get("thermalfoundation:material", 135));
infinFurnace(utils.get("mechanics:heavy_mesh", W), utils.get("mechanics:heavy_ingot", 0, 2));
##infinFurnace(utils.get("mekanism:dust", 1), utils.get("minecraft:gold_ingot"));
##infinFurnace(utils.get("mekanism:dust", 2), utils.get("mekanism:ingot", 1));
##infinFurnace(utils.get("mekanism:dust", 3), utils.get("thermalfoundation:material", 128));
##infinFurnace(utils.get("mekanism:dust", 4), utils.get("thermalfoundation:material", 129));
##infinFurnace(utils.get("mekanism:dust", 5), utils.get("thermalfoundation:material", 130));
##infinFurnace(utils.get("mekanism:dust"), utils.get("minecraft:iron_ingot"));
#infinFurnace(utils.get("mekanism:oreblock", 1), utils.get("thermalfoundation:material", 128));
#infinFurnace(utils.get("mekanism:oreblock", 2), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("mekanism:oreblock"), utils.get("mekanism:ingot", 1));
##infinFurnace(utils.get("mekanism:otherdust", 1), utils.get("thermalfoundation:material", 160));
##infinFurnace(utils.get("mekanism:otherdust", 4), utils.get("nuclearcraft:ingot", 6));
infinFurnace(utils.get("mekanism:polyethene", 1), utils.get("rats:rat_tube_white"));
infinFurnace(utils.get("minecraft:beef", W), utils.get("minecraft:cooked_beef"));
infinFurnace(utils.get("minecraft:book", W), utils.get("cookingforblockheads:recipe_book", 1));
infinFurnace(utils.get("minecraft:cactus", W), utils.get("minecraft:dye", 2));
infinFurnace(utils.get("minecraft:chainmail_boots", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:chainmail_chestplate", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:chainmail_helmet", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:chainmail_leggings", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:chicken", W), utils.get("minecraft:cooked_chicken"));
infinFurnace(utils.get("minecraft:chorus_fruit", W), utils.get("minecraft:chorus_fruit_popped"));
infinFurnace(utils.get("minecraft:clay_ball", W), utils.get("minecraft:brick"));
infinFurnace(utils.get("minecraft:clay", W), utils.get("minecraft:hardened_clay"));
infinFurnace(utils.get("minecraft:coal_ore", W), utils.get("minecraft:coal"));
infinFurnace(utils.get("minecraft:coal", W), utils.get("nuclearcraft:ingot", 8));
infinFurnace(utils.get("minecraft:cobblestone", W), utils.get("minecraft:stone"));
infinFurnace(utils.get("minecraft:diamond_ore", W), utils.get("minecraft:diamond"));
infinFurnace(utils.get("minecraft:dye", 3), utils.get("nuclearcraft:roasted_cocoa_beans"));
infinFurnace(utils.get("minecraft:egg"), utils.get("betteranimalsplus:fried_egg"));
infinFurnace(utils.get("minecraft:emerald_ore", W), utils.get("minecraft:emerald"));
infinFurnace(utils.get("minecraft:fish", 1), utils.get("minecraft:cooked_fish", 1));
infinFurnace(utils.get("minecraft:fish"), utils.get("minecraft:cooked_fish"));
infinFurnace(utils.get("minecraft:gold_ore", W), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("minecraft:golden_axe", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_boots", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_chestplate", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_helmet", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_hoe", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_horse_armor", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_leggings", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_pickaxe", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_shovel", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:golden_sword", W), utils.get("minecraft:gold_nugget"));
infinFurnace(utils.get("minecraft:iron_axe", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_boots", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_chestplate", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_helmet", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_hoe", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_horse_armor", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_leggings", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_ore", W), utils.get("minecraft:iron_ingot"));
infinFurnace(utils.get("minecraft:iron_pickaxe", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_shovel", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:iron_sword", W), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("minecraft:lapis_ore", W), utils.get("minecraft:dye", 4));
##infinFurnace(utils.get("minecraft:log", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("minecraft:log2", W), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("minecraft:mutton", W), utils.get("minecraft:cooked_mutton"));
infinFurnace(utils.get("minecraft:netherrack", W), utils.get("minecraft:netherbrick"));
infinFurnace(utils.get("minecraft:porkchop", W), utils.get("minecraft:cooked_porkchop"));
infinFurnace(utils.get("minecraft:potato", W), utils.get("minecraft:baked_potato"));
infinFurnace(utils.get("minecraft:quartz_ore", W), utils.get("minecraft:quartz"));
infinFurnace(utils.get("minecraft:rabbit", W), utils.get("minecraft:cooked_rabbit"));
infinFurnace(utils.get("minecraft:redstone_ore", W), utils.get("minecraft:redstone"));
infinFurnace(utils.get("minecraft:rotten_flesh"), utils.get("rustic:tallow"));
infinFurnace(utils.get("minecraft:sand", W), utils.get("minecraft:glass"));
infinFurnace(utils.get("minecraft:shears"), utils.get("minecraft:iron_nugget"));
//infinFurnace(utils.get("minecraft:sponge", 1), utils.get("minecraft:sponge"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 1), utils.get("minecraft:orange_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 2), utils.get("minecraft:magenta_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 3), utils.get("minecraft:light_blue_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 4), utils.get("minecraft:yellow_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 5), utils.get("minecraft:lime_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 6), utils.get("minecraft:pink_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 7), utils.get("minecraft:gray_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 8), utils.get("minecraft:silver_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 9), utils.get("minecraft:cyan_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 10), utils.get("minecraft:purple_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 11), utils.get("minecraft:blue_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 12), utils.get("minecraft:brown_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 13), utils.get("minecraft:green_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 14), utils.get("minecraft:red_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay", 15), utils.get("minecraft:black_glazed_terracotta"));
infinFurnace(utils.get("minecraft:stained_hardened_clay"), utils.get("minecraft:white_glazed_terracotta"));
//infinFurnace(utils.get("minecraft:stonebrick"), utils.get("minecraft:stonebrick", 2));
infinFurnace(utils.get("mysticalagriculture:crafting", 29), utils.get("mysticalagriculture:crafting", 38));
//infinFurnace(utils.get("mysticalagriculture:soulstone", 1), utils.get("mysticalagriculture:soulstone"));
infinFurnace(utils.get("mysticalagriculture:soulstone", 3), utils.get("mysticalagriculture:soulstone", 4));
infinFurnace(utils.get("mysticalagriculture:soulstone"), utils.get("mysticalagriculture:crafting", 28));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 1), utils.get("thermalfoundation:ore", 0, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_1", 2), utils.get("thermalfoundation:ore", 7, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 3), utils.get("thermalfoundation:ore", 3, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 4), utils.get("thermalfoundation:ore", 8, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 5), utils.get("thermalfoundation:ore", 5, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 6), utils.get("thermalfoundation:ore", 6, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 7), utils.get("thermalfoundation:ore", 2, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 8), utils.get("thermalfoundation:ore", 1, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 9), utils.get("appliedenergistics2:quartz_ore", 0, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_1", 10), utils.get("appliedenergistics2:charged_quartz_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 11), utils.get("mekanism:oreblock", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 12), utils.get("immersiveengineering:ore", 5, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1", 14), utils.get("libvulpes:ore0", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_1"), utils.get("thermalfoundation:ore", 4, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_2", 1), utils.get("biomesoplenty:gem_ore", 1, 2));
infinFurnace(utils.get("netherendingores:ore_end_modded_2", 2), utils.get("biomesoplenty:gem_ore", 6, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_2", 3), utils.get("biomesoplenty:gem_ore", 2, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_2", 5), utils.get("netherendingores:ore_other_1", 6, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_2", 6), utils.get("netherendingores:ore_other_1", 7, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_2", 7), utils.get("netherendingores:ore_other_1", 8, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_2", 8), utils.get("netherendingores:ore_other_1", 9, 2));
#infinFurnace(utils.get("netherendingores:ore_end_modded_2", 9), utils.get("netherendingores:ore_other_1", 10, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla", 1), utils.get("minecraft:diamond_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla", 2), utils.get("minecraft:emerald_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla", 3), utils.get("minecraft:gold_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla", 4), utils.get("minecraft:iron_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla", 5), utils.get("minecraft:lapis_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla", 6), utils.get("minecraft:redstone_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_end_vanilla"), utils.get("minecraft:coal_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 1), utils.get("thermalfoundation:ore", 0, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 2), utils.get("thermalfoundation:ore", 7, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 3), utils.get("thermalfoundation:ore", 3, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 4), utils.get("thermalfoundation:ore", 8, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 5), utils.get("thermalfoundation:ore", 5, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 6), utils.get("thermalfoundation:ore", 6, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 7), utils.get("thermalfoundation:ore", 2, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 8), utils.get("thermalfoundation:ore", 1, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 9), utils.get("appliedenergistics2:quartz_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 10), utils.get("appliedenergistics2:charged_quartz_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 11), utils.get("mekanism:oreblock", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 12), utils.get("immersiveengineering:ore", 5, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_1", 14), utils.get("libvulpes:ore0", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_1"), utils.get("thermalfoundation:ore", 4, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 1), utils.get("biomesoplenty:gem_ore", 1, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 2), utils.get("biomesoplenty:gem_ore", 6, 2));
infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 3), utils.get("biomesoplenty:gem_ore", 2, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 5), utils.get("netherendingores:ore_other_1", 6, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 6), utils.get("netherendingores:ore_other_1", 7, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 7), utils.get("netherendingores:ore_other_1", 8, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 8), utils.get("netherendingores:ore_other_1", 9, 2));
#infinFurnace(utils.get("netherendingores:ore_nether_modded_2", 9), utils.get("netherendingores:ore_other_1", 10, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla", 1), utils.get("minecraft:diamond_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla", 2), utils.get("minecraft:emerald_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla", 3), utils.get("minecraft:gold_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla", 4), utils.get("minecraft:iron_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla", 5), utils.get("minecraft:lapis_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla", 6), utils.get("minecraft:redstone_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_nether_vanilla"), utils.get("minecraft:coal_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_other_1", 1), utils.get("minecraft:quartz_ore", 0, 2));
infinFurnace(utils.get("netherendingores:ore_other_1", 3), utils.get("tconstruct:ore", 1, 2));
infinFurnace(utils.get("netherendingores:ore_other_1", 4), utils.get("tconstruct:ingots"));
infinFurnace(utils.get("netherendingores:ore_other_1", 5), utils.get("tconstruct:ore", 0, 2));
#infinFurnace(utils.get("netherendingores:ore_other_1"), utils.get("minecraft:quartz"));
##infinFurnace(utils.get("nuclearcraft:americium", 2), utils.get("nuclearcraft:americium"));
##infinFurnace(utils.get("nuclearcraft:americium", 3), utils.get("nuclearcraft:americium"));
##infinFurnace(utils.get("nuclearcraft:americium", 4), utils.get("nuclearcraft:americium"));
##infinFurnace(utils.get("nuclearcraft:americium", 7), utils.get("nuclearcraft:americium", 5));
##infinFurnace(utils.get("nuclearcraft:americium", 8), utils.get("nuclearcraft:americium", 5));
##infinFurnace(utils.get("nuclearcraft:americium", 9), utils.get("nuclearcraft:americium", 5));
##infinFurnace(utils.get("nuclearcraft:americium", 12), utils.get("nuclearcraft:americium", 10));
##infinFurnace(utils.get("nuclearcraft:americium", 13), utils.get("nuclearcraft:americium", 10));
##infinFurnace(utils.get("nuclearcraft:americium", 14), utils.get("nuclearcraft:americium", 10));
##infinFurnace(utils.get("nuclearcraft:berkelium", 2), utils.get("nuclearcraft:berkelium"));
##infinFurnace(utils.get("nuclearcraft:berkelium", 3), utils.get("nuclearcraft:berkelium"));
##infinFurnace(utils.get("nuclearcraft:berkelium", 4), utils.get("nuclearcraft:berkelium"));
##infinFurnace(utils.get("nuclearcraft:berkelium", 7), utils.get("nuclearcraft:berkelium", 5));
##infinFurnace(utils.get("nuclearcraft:berkelium", 8), utils.get("nuclearcraft:berkelium", 5));
##infinFurnace(utils.get("nuclearcraft:berkelium", 9), utils.get("nuclearcraft:berkelium", 5));
##infinFurnace(utils.get("nuclearcraft:californium", 2), utils.get("nuclearcraft:californium"));
##infinFurnace(utils.get("nuclearcraft:californium", 3), utils.get("nuclearcraft:californium"));
##infinFurnace(utils.get("nuclearcraft:californium", 4), utils.get("nuclearcraft:californium"));
##infinFurnace(utils.get("nuclearcraft:californium", 7), utils.get("nuclearcraft:californium", 5));
##infinFurnace(utils.get("nuclearcraft:californium", 8), utils.get("nuclearcraft:californium", 5));
##infinFurnace(utils.get("nuclearcraft:californium", 9), utils.get("nuclearcraft:californium", 5));
##infinFurnace(utils.get("nuclearcraft:californium", 12), utils.get("nuclearcraft:californium", 10));
##infinFurnace(utils.get("nuclearcraft:californium", 13), utils.get("nuclearcraft:californium", 10));
##infinFurnace(utils.get("nuclearcraft:californium", 14), utils.get("nuclearcraft:californium", 10));
##infinFurnace(utils.get("nuclearcraft:californium", 17), utils.get("nuclearcraft:californium", 15));
##infinFurnace(utils.get("nuclearcraft:californium", 18), utils.get("nuclearcraft:californium", 15));
##infinFurnace(utils.get("nuclearcraft:californium", 19), utils.get("nuclearcraft:californium", 15));
##infinFurnace(utils.get("nuclearcraft:curium", 2), utils.get("nuclearcraft:curium"));
##infinFurnace(utils.get("nuclearcraft:curium", 3), utils.get("nuclearcraft:curium"));
##infinFurnace(utils.get("nuclearcraft:curium", 4), utils.get("nuclearcraft:curium"));
##infinFurnace(utils.get("nuclearcraft:curium", 7), utils.get("nuclearcraft:curium", 5));
##infinFurnace(utils.get("nuclearcraft:curium", 8), utils.get("nuclearcraft:curium", 5));
##infinFurnace(utils.get("nuclearcraft:curium", 9), utils.get("nuclearcraft:curium", 5));
##infinFurnace(utils.get("nuclearcraft:curium", 12), utils.get("nuclearcraft:curium", 10));
##infinFurnace(utils.get("nuclearcraft:curium", 13), utils.get("nuclearcraft:curium", 10));
##infinFurnace(utils.get("nuclearcraft:curium", 14), utils.get("nuclearcraft:curium", 10));
##infinFurnace(utils.get("nuclearcraft:curium", 17), utils.get("nuclearcraft:curium", 15));
##infinFurnace(utils.get("nuclearcraft:curium", 18), utils.get("nuclearcraft:curium", 15));
##infinFurnace(utils.get("nuclearcraft:curium", 19), utils.get("nuclearcraft:curium", 15));
#infinFurnace(utils.get("nuclearcraft:dust", 1), utils.get("thermalfoundation:material", 129));
#infinFurnace(utils.get("nuclearcraft:dust", 2), utils.get("thermalfoundation:material", 131));
##infinFurnace(utils.get("nuclearcraft:dust", 3), utils.get("nuclearcraft:ingot", 3));
#infinFurnace(utils.get("nuclearcraft:dust", 4), utils.get("immersiveengineering:metal", 5));
##infinFurnace(utils.get("nuclearcraft:dust", 5), utils.get("nuclearcraft:ingot", 5));
##infinFurnace(utils.get("nuclearcraft:dust", 6), utils.get("nuclearcraft:ingot", 6));
##infinFurnace(utils.get("nuclearcraft:dust", 7), utils.get("nuclearcraft:ingot", 7));
##infinFurnace(utils.get("nuclearcraft:dust", 8), utils.get("nuclearcraft:ingot", 8));
##infinFurnace(utils.get("nuclearcraft:dust", 9), utils.get("nuclearcraft:ingot", 9));
##infinFurnace(utils.get("nuclearcraft:dust", 10), utils.get("nuclearcraft:ingot", 10));
##infinFurnace(utils.get("nuclearcraft:dust", 11), utils.get("nuclearcraft:ingot", 11));
##infinFurnace(utils.get("nuclearcraft:dust", 12), utils.get("thermalfoundation:material", 132));
##infinFurnace(utils.get("nuclearcraft:dust", 13), utils.get("thermalfoundation:material", 130));
#infinFurnace(utils.get("nuclearcraft:dust"), utils.get("thermalfoundation:material", 128));
infinFurnace(utils.get("nuclearcraft:flour"), utils.get("minecraft:bread"));
infinFurnace(utils.get("nuclearcraft:gem_dust", 1), utils.get("nuclearcraft:dust", 14));
##infinFurnace(utils.get("nuclearcraft:ingot", 14), utils.get("nuclearcraft:ingot", 11));
//infinFurnace(utils.get("nuclearcraft:ingot", 15), utils.get("nuclearcraft:ingot", 14));
##infinFurnace(utils.get("nuclearcraft:neptunium", 2), utils.get("nuclearcraft:neptunium"));
##infinFurnace(utils.get("nuclearcraft:neptunium", 3), utils.get("nuclearcraft:neptunium"));
##infinFurnace(utils.get("nuclearcraft:neptunium", 4), utils.get("nuclearcraft:neptunium"));
##infinFurnace(utils.get("nuclearcraft:neptunium", 7), utils.get("nuclearcraft:neptunium", 5));
##infinFurnace(utils.get("nuclearcraft:neptunium", 8), utils.get("nuclearcraft:neptunium", 5));
##infinFurnace(utils.get("nuclearcraft:neptunium", 9), utils.get("nuclearcraft:neptunium", 5));
#infinFurnace(utils.get("nuclearcraft:ore", 1), utils.get("thermalfoundation:material", 129));
#infinFurnace(utils.get("nuclearcraft:ore", 2), utils.get("thermalfoundation:material", 131));
infinFurnace(utils.get("nuclearcraft:ore", 3), utils.get("nuclearcraft:ingot", 3));
#infinFurnace(utils.get("nuclearcraft:ore", 4), utils.get("immersiveengineering:metal", 5));
infinFurnace(utils.get("nuclearcraft:ore", 5), utils.get("nuclearcraft:ingot", 5));
infinFurnace(utils.get("nuclearcraft:ore", 6), utils.get("nuclearcraft:ingot", 6));
infinFurnace(utils.get("nuclearcraft:ore", 7), utils.get("nuclearcraft:ingot", 7));
#infinFurnace(utils.get("nuclearcraft:ore"), utils.get("thermalfoundation:material", 128));
##infinFurnace(utils.get("nuclearcraft:plutonium", 2), utils.get("nuclearcraft:plutonium"));
##infinFurnace(utils.get("nuclearcraft:plutonium", 3), utils.get("nuclearcraft:plutonium"));
##infinFurnace(utils.get("nuclearcraft:plutonium", 4), utils.get("nuclearcraft:plutonium"));
##infinFurnace(utils.get("nuclearcraft:plutonium", 7), utils.get("nuclearcraft:plutonium", 5));
##infinFurnace(utils.get("nuclearcraft:plutonium", 8), utils.get("nuclearcraft:plutonium", 5));
##infinFurnace(utils.get("nuclearcraft:plutonium", 9), utils.get("nuclearcraft:plutonium", 5));
##infinFurnace(utils.get("nuclearcraft:plutonium", 12), utils.get("nuclearcraft:plutonium", 10));
##infinFurnace(utils.get("nuclearcraft:plutonium", 13), utils.get("nuclearcraft:plutonium", 10));
##infinFurnace(utils.get("nuclearcraft:plutonium", 14), utils.get("nuclearcraft:plutonium", 10));
##infinFurnace(utils.get("nuclearcraft:plutonium", 17), utils.get("nuclearcraft:plutonium", 15));
##infinFurnace(utils.get("nuclearcraft:plutonium", 18), utils.get("nuclearcraft:plutonium", 15));
##infinFurnace(utils.get("nuclearcraft:plutonium", 19), utils.get("nuclearcraft:plutonium", 15));
##infinFurnace(utils.get("nuclearcraft:uranium", 2), utils.get("nuclearcraft:uranium"));
##infinFurnace(utils.get("nuclearcraft:uranium", 3), utils.get("nuclearcraft:uranium"));
##infinFurnace(utils.get("nuclearcraft:uranium", 4), utils.get("nuclearcraft:uranium"));
##infinFurnace(utils.get("nuclearcraft:uranium", 7), utils.get("nuclearcraft:uranium", 5));
##infinFurnace(utils.get("nuclearcraft:uranium", 8), utils.get("nuclearcraft:uranium", 5));
##infinFurnace(utils.get("nuclearcraft:uranium", 9), utils.get("nuclearcraft:uranium", 5));
##infinFurnace(utils.get("nuclearcraft:uranium", 12), utils.get("nuclearcraft:uranium", 10));
##infinFurnace(utils.get("nuclearcraft:uranium", 13), utils.get("nuclearcraft:uranium", 10));
##infinFurnace(utils.get("nuclearcraft:uranium", 14), utils.get("nuclearcraft:uranium", 10));
infinFurnace(utils.get("opencomputers:material", 2), utils.get("opencomputers:material", 4));
##infinFurnace(utils.get("qmd:copernicium", 2), utils.get("qmd:copernicium"));
##infinFurnace(utils.get("qmd:copernicium", 3), utils.get("qmd:copernicium"));
##infinFurnace(utils.get("qmd:copernicium", 4), utils.get("qmd:copernicium"));
##infinFurnace(utils.get("qmd:dust", 1), utils.get("qmd:ingot", 1));
##infinFurnace(utils.get("qmd:dust", 2), utils.get("qmd:ingot", 2));
##infinFurnace(utils.get("qmd:dust", 3), utils.get("libvulpes:productingot", 7));
#infinFurnace(utils.get("qmd:dust", 4), utils.get("tconstruct:ingots"));
##infinFurnace(utils.get("qmd:dust", 5), utils.get("thermalfoundation:material", 133));
##infinFurnace(utils.get("qmd:dust", 6), utils.get("qmd:ingot", 6));
##infinFurnace(utils.get("qmd:dust", 7), utils.get("qmd:ingot", 7));
##infinFurnace(utils.get("qmd:dust", 8), utils.get("mekanism:ingot", 1));
##infinFurnace(utils.get("qmd:dust", 9), utils.get("thermalfoundation:material", 135));
##infinFurnace(utils.get("qmd:dust", 10), utils.get("thermalfoundation:material", 134));
##infinFurnace(utils.get("qmd:dust", 11), utils.get("qmd:ingot", 11));
##infinFurnace(utils.get("qmd:dust", 12), utils.get("qmd:ingot", 12));
##infinFurnace(utils.get("qmd:dust", 13), utils.get("qmd:ingot", 13));
##infinFurnace(utils.get("qmd:dust", 14), utils.get("qmd:ingot", 14));
##infinFurnace(utils.get("qmd:dust"), utils.get("endreborn:item_ingot_wolframium"));
##infinFurnace(utils.get("qmd:dust2", 1), utils.get("qmd:ingot2", 1));
##infinFurnace(utils.get("qmd:dust2"), utils.get("qmd:ingot2"));
infinFurnace(utils.get("quark:biome_cobblestone", 2), utils.get("minecraft:stone"));
#infinFurnace(utils.get("quark:crab_leg", W), utils.get("quark:cooked_crab_leg"));
infinFurnace(utils.get("quark:frog_leg", W), utils.get("quark:cooked_frog_leg"));
infinFurnace(utils.get("quark:trowel"), utils.get("minecraft:iron_nugget"));
//infinFurnace(utils.get("rats:marbled_cheese_brick", W), utils.get("rats:marbled_cheese_brick_cracked"));
infinFurnace(utils.get("rats:marbled_cheese_raw", W), utils.get("rats:marbled_cheese"));
infinFurnace(utils.get("rats:rat_nugget_ore", 1, 1, {OreItem: {id: "forestry:resources", Count: 1, Damage: 0 as short}, IngotItem: {id: "forestry:apatite", Count: 1, Damage: 0 as short}}), utils.get("forestry:apatite"));
infinFurnace(utils.get("rats:rat_nugget_ore", 2, 1, {OreItem: {id: "astralsorcery:blockcustomsandore", Count: 1, Damage: 0 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 3, Damage: 0 as short}}), utils.get("astralsorcery:itemcraftingcomponent", 0, 3));
infinFurnace(utils.get("rats:rat_nugget_ore", 3, 1, {OreItem: {id: "tconstruct:ore", Count: 1, Damage: 1 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1, Damage: 1 as short}}), utils.get("tconstruct:ingots", 1));
infinFurnace(utils.get("rats:rat_nugget_ore", 4, 1, {OreItem: {id: "twilightforest:armor_shard_cluster", Count: 1, Damage: 0 as short}, IngotItem: {id: "twilightforest:knightmetal_ingot", Count: 1, Damage: 0 as short}}), utils.get("twilightforest:knightmetal_ingot"));
infinFurnace(utils.get("rats:rat_nugget_ore", 5, 1, {OreItem: {id: "actuallyadditions:block_misc", Count: 1, Damage: 3 as short}, IngotItem: {id: "actuallyadditions:item_misc", Count: 1, Damage: 5 as short}}), utils.get("actuallyadditions:item_misc", 5));
infinFurnace(utils.get("rats:rat_nugget_ore", 6, 1, {OreItem: {id: "nuclearcraft:ore", Count: 1, Damage: 5 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1, Damage: 5 as short}}), utils.get("nuclearcraft:ingot", 5));
infinFurnace(utils.get("rats:rat_nugget_ore", 7, 1, {OreItem: {id: "thaumcraft:ore_cinnabar", Count: 1, Damage: 0 as short}, IngotItem: {id: "thaumcraft:quicksilver", Count: 1, Damage: 0 as short}}), utils.get("thaumcraft:quicksilver"));
infinFurnace(utils.get("rats:rat_nugget_ore", 8, 1, {OreItem: {id: "minecraft:coal_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:coal", Count: 1, Damage: 0 as short}}), utils.get("minecraft:coal"));
infinFurnace(utils.get("rats:rat_nugget_ore", 9, 1, {OreItem: {id: "tconstruct:ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1, Damage: 0 as short}}), utils.get("tconstruct:ingots"));
infinFurnace(utils.get("rats:rat_nugget_ore", 10, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 128 as short}}), utils.get("thermalfoundation:material", 128));
infinFurnace(utils.get("rats:rat_nugget_ore", 11, 1, {OreItem: {id: "minecraft:diamond_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:diamond", Count: 1, Damage: 0 as short}}), utils.get("minecraft:diamond"));
infinFurnace(utils.get("rats:rat_nugget_ore", 12, 1, {OreItem: {id: "draconicevolution:draconium_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "draconicevolution:draconium_ingot", Count: 1, Damage: 0 as short}}), utils.get("draconicevolution:draconium_ingot"));
infinFurnace(utils.get("rats:rat_nugget_ore", 13, 1, {OreItem: {id: "minecraft:emerald_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:emerald", Count: 1, Damage: 0 as short}}), utils.get("minecraft:emerald"));
infinFurnace(utils.get("rats:rat_nugget_ore", 14, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 0 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 4 as short}}), utils.get("thermalfoundation:ore", 4, 2));
#infinFurnace(utils.get("rats:rat_nugget_ore", 15, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 5 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2, Damage: 6 as short}}), utils.get("netherendingores:ore_other_1", 6, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 16, 1, {OreItem: {id: "netherendingores:ore_other_1", Count: 1, Damage: 3 as short}, IngotItem: {id: "tconstruct:ore", Count: 2, Damage: 1 as short}}), utils.get("tconstruct:ore", 1, 2));
#infinFurnace(utils.get("rats:rat_nugget_ore", 17, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 8 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2, Damage: 9 as short}}), utils.get("netherendingores:ore_other_1", 9, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 18, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 9 as short}, IngotItem: {id: "appliedenergistics2:quartz_ore", Count: 2, Damage: 0 as short}}), utils.get("appliedenergistics2:quartz_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 19, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 10 as short}, IngotItem: {id: "appliedenergistics2:charged_quartz_ore", Count: 2, Damage: 0 as short}}), utils.get("appliedenergistics2:charged_quartz_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 20, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:coal_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:coal_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 21, 1, {OreItem: {id: "netherendingores:ore_other_1", Count: 1, Damage: 5 as short}, IngotItem: {id: "tconstruct:ore", Count: 2, Damage: 0 as short}}), utils.get("tconstruct:ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 22, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 0 as short}}), utils.get("thermalfoundation:ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 23, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 1 as short}, IngotItem: {id: "minecraft:diamond_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:diamond_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 24, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 14 as short}, IngotItem: {id: "libvulpes:ore0", Count: 2, Damage: 0 as short}}), utils.get("libvulpes:ore0", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 25, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 2 as short}, IngotItem: {id: "minecraft:emerald_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:emerald_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 26, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 3 as short}, IngotItem: {id: "minecraft:gold_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:gold_ore", 0, 2));
#infinFurnace(utils.get("rats:rat_nugget_ore", 27, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 6 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2, Damage: 7 as short}}), utils.get("netherendingores:ore_other_1", 7, 2));
#infinFurnace(utils.get("rats:rat_nugget_ore", 28, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 9 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2, Damage: 10 as short}}), utils.get("netherendingores:ore_other_1", 10, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 29, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 7 as short}}), utils.get("thermalfoundation:ore", 7, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 30, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 4 as short}, IngotItem: {id: "minecraft:iron_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:iron_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 31, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 5 as short}, IngotItem: {id: "minecraft:lapis_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:lapis_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 32, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 3 as short}}), utils.get("thermalfoundation:ore", 3, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 33, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 8 as short}}), utils.get("thermalfoundation:ore", 8, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 34, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 5 as short}}), utils.get("thermalfoundation:ore", 5, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 35, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 11 as short}, IngotItem: {id: "mekanism:oreblock", Count: 2, Damage: 0 as short}}), utils.get("mekanism:oreblock", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 36, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 3 as short}, IngotItem: {id: "biomesoplenty:gem_ore", Count: 2, Damage: 2 as short}}), utils.get("biomesoplenty:gem_ore", 2, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 37, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 6 as short}}), utils.get("thermalfoundation:ore", 6, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 38, 1, {OreItem: {id: "netherendingores:ore_other_1", Count: 1, Damage: 1 as short}, IngotItem: {id: "minecraft:quartz_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:quartz_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 39, 1, {OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 6 as short}, IngotItem: {id: "minecraft:redstone_ore", Count: 2, Damage: 0 as short}}), utils.get("minecraft:redstone_ore", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 40, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 1 as short}, IngotItem: {id: "biomesoplenty:gem_ore", Count: 2, Damage: 1 as short}}), utils.get("biomesoplenty:gem_ore", 1, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 41, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 2 as short}, IngotItem: {id: "biomesoplenty:gem_ore", Count: 2, Damage: 6 as short}}), utils.get("biomesoplenty:gem_ore", 6, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 42, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 2 as short}}), utils.get("thermalfoundation:ore", 2, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 43, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 1 as short}}), utils.get("thermalfoundation:ore", 1, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 44, 1, {OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 12 as short}, IngotItem: {id: "immersiveengineering:ore", Count: 2, Damage: 5 as short}}), utils.get("immersiveengineering:ore", 5, 2));
#infinFurnace(utils.get("rats:rat_nugget_ore", 45, 1, {OreItem: {id: "netherendingores:ore_end_modded_2", Count: 1, Damage: 7 as short}, IngotItem: {id: "netherendingores:ore_other_1", Count: 2, Damage: 8 as short}}), utils.get("netherendingores:ore_other_1", 8, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 46, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 0 as short}}), utils.get("biomesoplenty:gem"));
infinFurnace(utils.get("rats:rat_nugget_ore", 47, 1, {OreItem: {id: "minecraft:gold_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:gold_ingot", Count: 1, Damage: 0 as short}}), utils.get("minecraft:gold_ingot"));
infinFurnace(utils.get("rats:rat_nugget_ore", 48, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 135 as short}}), utils.get("thermalfoundation:material", 135));
infinFurnace(utils.get("rats:rat_nugget_ore", 49, 1, {OreItem: {id: "minecraft:iron_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:iron_ingot", Count: 1, Damage: 0 as short}}), utils.get("minecraft:iron_ingot"));
infinFurnace(utils.get("rats:rat_nugget_ore", 50, 1, {OreItem: {id: "minecraft:lapis_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:dye", Count: 1, Damage: 4 as short}}), utils.get("minecraft:dye", 4));
infinFurnace(utils.get("rats:rat_nugget_ore", 51, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 131 as short}}), utils.get("thermalfoundation:material", 131));
infinFurnace(utils.get("rats:rat_nugget_ore", 52, 1, {OreItem: {id: "nuclearcraft:ore", Count: 1, Damage: 6 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1, Damage: 6 as short}}), utils.get("nuclearcraft:ingot", 6));
infinFurnace(utils.get("rats:rat_nugget_ore", 53, 1, {OreItem: {id: "nuclearcraft:ore", Count: 1, Damage: 7 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1, Damage: 7 as short}}), utils.get("nuclearcraft:ingot", 7));
infinFurnace(utils.get("rats:rat_nugget_ore", 54, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 5 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 5 as short}}), utils.get("biomesoplenty:gem", 5));
infinFurnace(utils.get("rats:rat_nugget_ore", 55, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 136 as short}}), utils.get("thermalfoundation:material", 136));
infinFurnace(utils.get("rats:rat_nugget_ore", 78, 1, {OreItem: {id: "minecraft:quartz_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:quartz", Count: 1, Damage: 0 as short}}), utils.get("minecraft:quartz"));
infinFurnace(utils.get("rats:rat_nugget_ore", 86, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 133 as short}}), utils.get("thermalfoundation:material", 133));
infinFurnace(utils.get("rats:rat_nugget_ore", 87, 1, {OreItem: {id: "mekanism:oreblock", Count: 1, Damage: 0 as short}, IngotItem: {id: "mekanism:ingot", Count: 1, Damage: 1 as short}}), utils.get("mekanism:ingot", 1));
infinFurnace(utils.get("rats:rat_nugget_ore", 88, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 2 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 2 as short}}), utils.get("biomesoplenty:gem", 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 89, 1, {OreItem: {id: "contenttweaker:ore_phosphor", Count: 1, Damage: 0 as short}, IngotItem: {id: "contenttweaker:nugget_phosphor", Count: 1, Damage: 0 as short}}), utils.get("contenttweaker:nugget_phosphor"));
infinFurnace(utils.get("rats:rat_nugget_ore", 90, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 134 as short}}), utils.get("thermalfoundation:material", 134));
infinFurnace(utils.get("rats:rat_nugget_ore", 91, 1, {OreItem: {id: "twilightforest:ironwood_raw", Count: 1, Damage: 0 as short}, IngotItem: {id: "twilightforest:ironwood_ingot", Count: 2, Damage: 0 as short}}), utils.get("twilightforest:ironwood_ingot", 0, 2));
infinFurnace(utils.get("rats:rat_nugget_ore", 92, 1, {OreItem: {id: "minecraft:redstone_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:redstone", Count: 1, Damage: 0 as short}}), utils.get("minecraft:redstone"));
infinFurnace(utils.get("rats:rat_nugget_ore", 93, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 1 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 1 as short}}), utils.get("biomesoplenty:gem", 1));
infinFurnace(utils.get("rats:rat_nugget_ore", 94, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 6 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 6 as short}}), utils.get("biomesoplenty:gem", 6));
infinFurnace(utils.get("rats:rat_nugget_ore", 95, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 130 as short}}), utils.get("thermalfoundation:material", 130));
infinFurnace(utils.get("rats:rat_nugget_ore", 96, 1, {OreItem: {id: "astralsorcery:blockcustomore", Count: 1, Damage: 1 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 1, Damage: 1 as short}}), utils.get("astralsorcery:itemcraftingcomponent", 1));
infinFurnace(utils.get("rats:rat_nugget_ore", 97, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 4 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 4 as short}}), utils.get("biomesoplenty:gem", 4));
infinFurnace(utils.get("rats:rat_nugget_ore", 98, 1, {OreItem: {id: "nuclearcraft:ore", Count: 1, Damage: 3 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1, Damage: 3 as short}}), utils.get("nuclearcraft:ingot", 3));
infinFurnace(utils.get("rats:rat_nugget_ore", 99, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 129 as short}}), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("rats:rat_nugget_ore", 100, 1, {OreItem: {id: "biomesoplenty:gem_ore", Count: 1, Damage: 3 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1, Damage: 3 as short}}), utils.get("biomesoplenty:gem", 3));
infinFurnace(utils.get("rats:rat_nugget_ore", 101, 1, {OreItem: {id: "endreborn:block_wolframium_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "endreborn:item_ingot_wolframium", Count: 1, Damage: 0 as short}}), utils.get("endreborn:item_ingot_wolframium"));
infinFurnace(utils.get("rats:rat_nugget_ore", 102, 1, {OreItem: {id: "immersiveengineering:ore", Count: 1, Damage: 5 as short}, IngotItem: {id: "immersiveengineering:metal", Count: 1, Damage: 5 as short}}), utils.get("immersiveengineering:metal", 5));
infinFurnace(utils.get("rats:rat_nugget_ore", 0, 1, {OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 132 as short}}), utils.get("thermalfoundation:material", 132));
infinFurnace(utils.get("rats:raw_rat", W), utils.get("rats:cooked_rat"));
//infinFurnace(utils.get("rustic:dust_tiny_iron"), utils.get("minecraft:iron_nugget"));
infinFurnace(utils.get("rustic:honeycomb"), utils.get("rustic:beeswax"));
##infinFurnace(utils.get("rustic:log", 1), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("rustic:log"), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("tcomplement:scorched_block", 1), utils.get("tcomplement:scorched_block"));
//infinFurnace(utils.get("tcomplement:scorched_block", 3), utils.get("tcomplement:scorched_block", 4));
//infinFurnace(utils.get("tcomplement:scorched_slab", 3), utils.get("tcomplement:scorched_slab", 4));
//infinFurnace(utils.get("tcomplement:scorched_stairs_brick", W), utils.get("tcomplement:scorched_stairs_brick_cracked"));
infinFurnace(utils.get("tconevo:earth_material_block"), utils.get("tconevo:material", 1));
infinFurnace(utils.get("tconevo:edible"), utils.get("tconevo:edible", 1));
#infinFurnace(utils.get("tconevo:metal", 1), utils.get("tconevo:metal"));
#infinFurnace(utils.get("tconevo:metal", 6), utils.get("tconevo:metal", 5));
#infinFurnace(utils.get("tconevo:metal", 11), utils.get("tconevo:metal", 10));
#infinFurnace(utils.get("tconevo:metal", 16), utils.get("tconevo:metal", 15));
#infinFurnace(utils.get("tconevo:metal", 21), utils.get("tconevo:metal", 20));
#infinFurnace(utils.get("tconevo:metal", 26), utils.get("tconevo:metal", 25));
#infinFurnace(utils.get("tconevo:metal", 31), utils.get("tconevo:metal", 30));
#infinFurnace(utils.get("tconevo:metal", 36), utils.get("tconevo:metal", 35));
#infinFurnace(utils.get("tconevo:metal", 41), utils.get("tconevo:metal", 40));
infinFurnace(utils.get("tconstruct:brownstone", 1), utils.get("tconstruct:brownstone"));
//infinFurnace(utils.get("tconstruct:brownstone", 3), utils.get("tconstruct:brownstone", 4));
infinFurnace(utils.get("tconstruct:ore", 1), utils.get("tconstruct:ingots", 1));
infinFurnace(utils.get("tconstruct:ore"), utils.get("tconstruct:ingots"));
//infinFurnace(utils.get("tconstruct:seared", 3), utils.get("tconstruct:seared", 4));
infinFurnace(utils.get("tconstruct:slime_congealed", 1), utils.get("tconstruct:slime_channel", 1, 3));
infinFurnace(utils.get("tconstruct:slime_congealed", 2), utils.get("tconstruct:slime_channel", 2, 3));
infinFurnace(utils.get("tconstruct:slime_congealed", 3), utils.get("tconstruct:slime_channel", 3, 3));
infinFurnace(utils.get("tconstruct:slime_congealed", 4), utils.get("tconstruct:slime_channel", 4, 3));
#infinFurnace(utils.get("tconstruct:slime_congealed", 5), utils.get("tconstruct:slime_channel", 5, 3));
infinFurnace(utils.get("tconstruct:slime_congealed"), utils.get("tconstruct:slime_channel", 0, 3));
infinFurnace(utils.get("tconstruct:soil", 1), utils.get("tconstruct:materials", 9));
infinFurnace(utils.get("tconstruct:soil", 2), utils.get("tconstruct:materials", 10));
infinFurnace(utils.get("tconstruct:soil", 3), utils.get("tconstruct:soil", 4));
infinFurnace(utils.get("tconstruct:soil", 5), utils.get("tconstruct:materials", 11));
infinFurnace(utils.get("tconstruct:soil"), utils.get("tconstruct:materials"));
infinFurnace(utils.get("tconstruct:spaghetti", 2), utils.get("tconstruct:moms_spaghetti"));
infinFurnace(utils.get("thaumcraft:cluster", 1), utils.get("thermalfoundation:material", 1, 2));
infinFurnace(utils.get("thaumcraft:cluster", 2), utils.get("thermalfoundation:material", 128, 2));
infinFurnace(utils.get("thaumcraft:cluster", 3), utils.get("thermalfoundation:material", 129, 2));
infinFurnace(utils.get("thaumcraft:cluster", 4), utils.get("thermalfoundation:material", 130, 2));
infinFurnace(utils.get("thaumcraft:cluster", 5), utils.get("thermalfoundation:material", 131, 2));
infinFurnace(utils.get("thaumcraft:cluster", 6), utils.get("thaumcraft:quicksilver", 0, 2));
infinFurnace(utils.get("thaumcraft:cluster", 7), utils.get("minecraft:quartz", 0, 5));
infinFurnace(utils.get("thaumcraft:cluster"), utils.get("thermalfoundation:material", 0, 2));
##infinFurnace(utils.get("thaumcraft:log_greatwood", W), utils.get("minecraft:coal", 1));
##infinFurnace(utils.get("thaumcraft:log_silverwood", W), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("thaumcraft:ore_amber", W), utils.get("thaumcraft:amber"));
infinFurnace(utils.get("thaumcraft:ore_cinnabar", W), utils.get("thaumcraft:quicksilver"));
#infinFurnace(utils.get("thaumcraft:ore_quartz", W), utils.get("minecraft:quartz"));
infinFurnace(utils.get("thaumicaugmentation:stone", 10), utils.get("thaumcraft:stone_ancient_rock"));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 1), utils.get("minecraft:gold_ingot", 0, 3));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 2), utils.get("thermalfoundation:material", 128, 3));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 3), utils.get("thermalfoundation:material", 129, 3));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 4), utils.get("thermalfoundation:material", 130, 3));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 6), utils.get("thaumcraft:quicksilver", 0, 3));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 7), utils.get("minecraft:quartz", 0, 3));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster", 8), utils.get("thaumcraft:ingot", 1, 2));
#infinFurnace(utils.get("thaumicwonders:eldritch_cluster"), utils.get("minecraft:iron_ingot", 0, 3));
##infinFurnace(utils.get("thermalfoundation:material", 1), utils.get("minecraft:gold_ingot"));
##infinFurnace(utils.get("thermalfoundation:material", 64), utils.get("thermalfoundation:material", 128));
##infinFurnace(utils.get("thermalfoundation:material", 65), utils.get("thermalfoundation:material", 129));
##infinFurnace(utils.get("thermalfoundation:material", 66), utils.get("thermalfoundation:material", 130));
##infinFurnace(utils.get("thermalfoundation:material", 67), utils.get("thermalfoundation:material", 131));
##infinFurnace(utils.get("thermalfoundation:material", 68), utils.get("thermalfoundation:material", 132));
##infinFurnace(utils.get("thermalfoundation:material", 69), utils.get("thermalfoundation:material", 133));
##infinFurnace(utils.get("thermalfoundation:material", 70), utils.get("thermalfoundation:material", 134));
##infinFurnace(utils.get("thermalfoundation:material", 71), utils.get("thermalfoundation:material", 135));
##infinFurnace(utils.get("thermalfoundation:material", 72), utils.get("thermalfoundation:material", 136));
##infinFurnace(utils.get("thermalfoundation:material", 96), utils.get("thermalfoundation:material", 160));
##infinFurnace(utils.get("thermalfoundation:material", 97), utils.get("thermalfoundation:material", 161));
##infinFurnace(utils.get("thermalfoundation:material", 98), utils.get("thermalfoundation:material", 162));
##infinFurnace(utils.get("thermalfoundation:material", 99), utils.get("thermalfoundation:material", 163));
##infinFurnace(utils.get("thermalfoundation:material", 100), utils.get("thermalfoundation:material", 164));
infinFurnace(utils.get("thermalfoundation:material", 801), utils.get("minecraft:coal", 1));
//infinFurnace(utils.get("thermalfoundation:material", 864), utils.get("thermalfoundation:rockwool", 7));
##infinFurnace(utils.get("thermalfoundation:material"), utils.get("minecraft:iron_ingot"));
infinFurnace(utils.get("thermalfoundation:ore", 1), utils.get("thermalfoundation:material", 129));
infinFurnace(utils.get("thermalfoundation:ore", 2), utils.get("thermalfoundation:material", 130));
infinFurnace(utils.get("thermalfoundation:ore", 3), utils.get("thermalfoundation:material", 131));
infinFurnace(utils.get("thermalfoundation:ore", 4), utils.get("thermalfoundation:material", 132));
infinFurnace(utils.get("thermalfoundation:ore", 5), utils.get("thermalfoundation:material", 133));
infinFurnace(utils.get("thermalfoundation:ore", 6), utils.get("thermalfoundation:material", 134));
infinFurnace(utils.get("thermalfoundation:ore", 7), utils.get("thermalfoundation:material", 135));
infinFurnace(utils.get("thermalfoundation:ore", 8), utils.get("thermalfoundation:material", 136));
infinFurnace(utils.get("thermalfoundation:ore"), utils.get("thermalfoundation:material", 128));
infinFurnace(utils.get("threng:material", 2), utils.get("threng:material"));
##infinFurnace(utils.get("trinity:dust_au_198", W), utils.get("trinity:ingot_au_198"));
infinFurnace(utils.get("twilightforest:armor_shard_cluster", W), utils.get("twilightforest:knightmetal_ingot"));
infinFurnace(utils.get("twilightforest:ironwood_raw", W), utils.get("twilightforest:ironwood_ingot", 0, 2));
infinFurnace(utils.get("twilightforest:magic_beans"), utils.get("randomthings:beans", 2));
##infinFurnace(utils.get("twilightforest:magic_log", W), utils.get("minecraft:coal", 1));
infinFurnace(utils.get("twilightforest:raw_meef", W), utils.get("twilightforest:cooked_meef"));
##infinFurnace(utils.get("twilightforest:twilight_log", W), utils.get("minecraft:coal", 1));
/**/