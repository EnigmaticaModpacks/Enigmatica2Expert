#modloaded oeintegration

import crafttweaker.item.IIngredient;

# [Excavate Modifier] from [Triple Compressed Cobblestone][+1]
craft.remake(<oeintegration:excavatemodifier>, ["pretty",
  "  □  ",
  "□ ░ □",
  "  □  "], {
  "□": <ore:plateBronze>,             # Bronze Plate
  "░": <ore:compressed3xCobblestone>, # Triple Compressed Cobblestone
});


# [Enchanted Book] from [Excavate Modifier]
recipes.addShapeless('Excavator to book', Book(<enchantment:oeintegration:oreexcavation>),
	[<oeintegration:excavatemodifier>] as IIngredient[]
, function(out, ins, cInfo) {
    return Book(<enchantment:oeintegration:oreexcavation>);
}, null);

// --------------------------------------------------------------
// Add tooltips about excavation special items
// --------------------------------------------------------------
val desc = scripts.category.tooltip_utils.desc;

/*Inject_js{
const c = config('config/oreexcavation.cfg').general
const def = {
  speed     : c.Speed,
  limit     : c.Limit,
  range     : c.Range,
  exaustion : c.Exaustion,
  experience: c.Experience,
}
const all = config('config/oeintegration.cfg').general.toolWhitelistOverride
const overridn = loadJson('config/oreexcavation_overrides.json').overrides

return overridn
  .concat(all.filter(s=>!overridn.some(o=>o.itemID==s)).map(s=>({itemID:s})))
  .map(o => [
    `desc.tooltip(<${o.itemID}>`,
    `, 'excavate.overrides', ${
      Object.entries(o)
      .filter(([k, v]) => k !== 'itemID' && def[k] != v)
      .map(([k, v]) => `'§7'+desc.local('${k}')+': §6${v}'`)
      .join(` +' '+ `) || "''"
      });`,
  ])
}*/
desc.tooltip(<oeintegration:excavatemodifier>    , 'excavate.overrides', '§7'+desc.local('speed')+': §61' +' '+ '§7'+desc.local('limit')+': §616' +' '+ '§7'+desc.local('range')+': §610');
desc.tooltip(<tconstruct:moms_spaghetti>         , 'excavate.overrides', '§7'+desc.local('speed')+': §61' +' '+ '§7'+desc.local('range')+': §65' +' '+ '§7'+desc.local('exaustion')+': §61');
desc.tooltip(<forestry:bronze_pickaxe>           , 'excavate.overrides', '§7'+desc.local('speed')+': §65' +' '+ '§7'+desc.local('limit')+': §664' +' '+ '§7'+desc.local('experience')+': §61');
desc.tooltip(<forestry:bronze_shovel>            , 'excavate.overrides', '§7'+desc.local('speed')+': §65' +' '+ '§7'+desc.local('limit')+': §664' +' '+ '§7'+desc.local('experience')+': §61');
desc.tooltip(<immersiveengineering:drill>        , 'excavate.overrides', '§7'+desc.local('speed')+': §632' +' '+ '§7'+desc.local('limit')+': §6128' +' '+ '§7'+desc.local('exaustion')+': §60');
desc.tooltip(<ic2:drill>                         , 'excavate.overrides', '§7'+desc.local('speed')+': §632');
desc.tooltip(<ic2:diamond_drill>                 , 'excavate.overrides', '');
desc.tooltip(<ic2:iridium_drill>                 , 'excavate.overrides', '§7'+desc.local('speed')+': §6128' +' '+ '§7'+desc.local('limit')+': §6512');
desc.tooltip(<forestry:grafter>                  , 'excavate.overrides', '');
desc.tooltip(<forestry:grafter_proven>           , 'excavate.overrides', '');
desc.tooltip(<gendustry:industrial_grafter>      , 'excavate.overrides', '');
desc.tooltip(<ic2:chainsaw>                      , 'excavate.overrides', '');
desc.tooltip(<thermalinnovation:drill>           , 'excavate.overrides', '');
desc.tooltip(<thermalinnovation:saw>             , 'excavate.overrides', '');
desc.tooltip(<twilightforest:mazebreaker_pickaxe>, 'excavate.overrides', '');
desc.tooltip(<twilightforest:minotaur_axe>       , 'excavate.overrides', '');
/**/
// --------------------------------------------------------------
