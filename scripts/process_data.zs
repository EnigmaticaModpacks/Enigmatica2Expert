#priority 60
#ignoreBracketErrors

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;


static extras as string[][string] = {
/*Inject_js(
Object.entries(config('config/JAOPCA.cfg'))
.filter(([key])=>key!=='jaopca')
.map(([main,o])=>[
  main.replace(/(?:_|^)(.)/g, (m,p)=>p.toUpperCase()),': [',
  ...[o.extra,o.extra2,o.extra3].map(s=>`"${s}",`),'],'
])
)*/
Aluminium          : ["Iron",           "Aquamarine",         "Sapphire",           ],
Amber              : ["Iron",           "Diamond",            "CertusQuartz",       ],
Amethyst           : ["Cobalt",         "ChargedCertusQuartz","AstralStarmetal",    ],
Apatite            : ["Aluminium",      "Magnesium",          "Thorium",            ],
Aquamarine         : ["Aluminium",      "Emerald",            "Titanium",           ],
Ardite             : ["Osmium",         "Gold",               "Topaz",              ],
AstralStarmetal    : ["Silver",         "Diamond",            "Sapphire",           ],
Boron              : ["Magnesium",      "Quartz",             "QuartzBlack",        ],
CertusQuartz       : ["Quartz",         "Diamond",            "Lapis",              ],
ChargedCertusQuartz: ["Diamond",        "Lapis",              "DimensionalShard",   ],
Coal               : ["QuartzBlack",    "Quartz",             "CertusQuartz",       ],
Cobalt             : ["Iron",           "Nickel",             "Boron",              ],
Copper             : ["Tin",            "Gold",               "Iron",               ],
Diamond            : ["CertusQuartz",   "Malachite",          "Sapphire",           ],
Dilithium          : ["Lithium",        "DimensionalShard",   "AstralStarmetal",    ],
DimensionalShard   : ["AstralStarmetal","Peridot",            "Tanzanite",          ],
Draconium          : ["Ardite",         "AstralStarmetal",    "Amethyst",           ],
Emerald            : ["Peridot",        "Malachite",          "Tanzanite",          ],
Gold               : ["Silver",         "Aluminium",          "Mithril",            ],
Iridium            : ["Platinum",       "Osmium",             "DimensionalShard",   ],
Iron               : ["Nickel",         "Gold",               "Tin",                ],
Lapis              : ["Apatite",        "Sapphire",           "Diamond",            ],
Lead               : ["Copper",         "Silver",             "Uranium",            ],
Lithium            : ["Aluminium",      "Apatite",            "Topaz",              ],
Magnesium          : ["Iron",           "Copper",             "Nickel",             ],
Malachite          : ["Lapis",          "Copper",             "Iron",               ],
Mithril            : ["Gold",           "AstralStarmetal",    "Mithril",            ],
Nickel             : ["Platinum",       "Osmium",             "Cobalt",             ],
Osmium             : ["Nickel",         "Platinum",           "Iridium",            ],
Peridot            : ["Emerald",        "Diamond",            "Magnesium",          ],
Platinum           : ["Nickel",         "Iridium",            "Draconium",          ],
Quartz             : ["Iron",           "Diamond",            "Amethyst",           ],
QuartzBlack        : ["Coal",           "Aquamarine",         "Topaz",              ],
Redstone           : ["Coal",           "QuartzBlack",        "ChargedCertusQuartz",],
Ruby               : ["Aluminium",      "Magnesium",          "Sapphire",           ],
Sapphire           : ["Aluminium",      "Draconium",          "Titanium",           ],
Silver             : ["Lead",           "Gold",               "Iridium",            ],
Tanzanite          : ["Quartz",         "Diamond",            "Amethyst",           ],
Thorium            : ["Uranium",        "Boron",              "Titanium",           ],
Tin                : ["Iron",           "Lead",               "Copper",             ],
Titanium           : ["Iron",           "Magnesium",          "Ardite",             ],
Topaz              : ["QuartzBlack",    "Quartz",             "Diamond",            ],
Uranium            : ["Lead",           "Lithium",            "Thorium",            ],
Yellorium          : ["Yellorium",      "Yellorium",          "Yellorium",          ],

/**/
} as string[][string];


static kinds as IItemStack[string][string] = {
/*Inject_js(
Object.keys(config('config/JAOPCA.cfg'))
.filter(oreBase=>oreBase!=='jaopca')
.map(oreBase=>oreBase.replace(/(?:_|^)(.)/g, (m,p)=>p.toUpperCase()))
.map(oreBase=>{
  const result = {}
  ;['ore','dust','ingot','nugget','gem'].forEach((prefix,i,arr)=>{
    result[prefix] = getByOredict_first(prefix + oreBase)?.commandString
  })
  return [oreBase, ': {', ...Object.entries(result)
    .map(([k,v])=>`${k}: ${v ?? 'null'},`)
    , '},'
  ]
})
)*/
Aluminium          : {ore: <thermalfoundation:ore:4>,               dust: <thermalfoundation:material:68>,        ingot: <thermalfoundation:material:132>,       nugget: <thermalfoundation:material:196>,       gem: null,                                 },
Amber              : {ore: <biomesoplenty:gem_ore:7>,               dust: <jaopca:item_dustamber>,                ingot: null,                                   nugget: <jaopca:item_nuggetamber>,              gem: <biomesoplenty:gem:7>,                },
Amethyst           : {ore: <biomesoplenty:gem_ore>,                 dust: <jaopca:item_dustamethyst>,             ingot: null,                                   nugget: <jaopca:item_nuggetamethyst>,           gem: <biomesoplenty:gem>,                  },
Apatite            : {ore: <forestry:resources>,                    dust: <jaopca:item_dustapatite>,              ingot: null,                                   nugget: <jaopca:item_nuggetapatite>,            gem: <forestry:apatite>,                   },
Aquamarine         : {ore: <astralsorcery:blockcustomsandore>,      dust: <jaopca:item_dustaquamarine>,           ingot: null,                                   nugget: <jaopca:item_nuggetaquamarine>,         gem: <astralsorcery:itemcraftingcomponent>,},
Ardite             : {ore: <tconstruct:ore:1>,                      dust: <enderio:item_material:30>,             ingot: <tconstruct:ingots:1>,                  nugget: <tconstruct:nuggets:1>,                 gem: null,                                 },
AstralStarmetal    : {ore: <astralsorcery:blockcustomore:1>,        dust: <astralsorcery:itemcraftingcomponent:2>,ingot: <astralsorcery:itemcraftingcomponent:1>,nugget: <jaopca:item_nuggetastralstarmetal>,    gem: null,                                 },
Boron              : {ore: <nuclearcraft:ore:5>,                    dust: <nuclearcraft:dust:5>,                  ingot: <nuclearcraft:ingot:5>,                 nugget: <jaopca:item_nuggetboron>,              gem: null,                                 },
CertusQuartz       : {ore: <appliedenergistics2:charged_quartz_ore>,dust: <appliedenergistics2:material:2>,       ingot: null,                                   nugget: <jaopca:item_nuggetcertusquartz>,       gem: <appliedenergistics2:material>,       },
ChargedCertusQuartz: {ore: <appliedenergistics2:charged_quartz_ore>,dust: <jaopca:item_dustchargedcertusquartz>,  ingot: null,                                   nugget: <jaopca:item_nuggetchargedcertusquartz>,gem: <appliedenergistics2:material:1>,     },
Coal               : {ore: <minecraft:coal_ore>,                    dust: <thermalfoundation:material:768>,       ingot: null,                                   nugget: null,                                   gem: <minecraft:coal>,                     },
Cobalt             : {ore: <tconstruct:ore>,                        dust: <enderio:item_material:31>,             ingot: <tconstruct:ingots>,                    nugget: <tconstruct:nuggets>,                   gem: null,                                 },
Copper             : {ore: <thermalfoundation:ore>,                 dust: <thermalfoundation:material:64>,        ingot: <thermalfoundation:material:128>,       nugget: <thermalfoundation:material:192>,       gem: null,                                 },
Diamond            : {ore: <minecraft:diamond_ore>,                 dust: <ic2:dust:5>,                           ingot: null,                                   nugget: <thermalfoundation:material:16>,        gem: <minecraft:diamond>,                  },
Dilithium          : {ore: <libvulpes:ore0>,                        dust: <libvulpes:productdust>,                ingot: null,                                   nugget: <jaopca:item_nuggetdilithium>,          gem: <libvulpes:productgem>,               },
DimensionalShard   : {ore: <rftools:dimensional_shard_ore>,         dust: <jaopca:item_dustdimensionalshard>,     ingot: null,                                   nugget: <jaopca:item_nuggetdimensionalshard>,   gem: <rftools:dimensional_shard>,          },
Draconium          : {ore: <draconicevolution:draconium_ore>,       dust: <draconicevolution:draconium_dust>,     ingot: <draconicevolution:draconium_ingot>,    nugget: <draconicevolution:nugget>,             gem: null,                                 },
Emerald            : {ore: <minecraft:emerald_ore>,                 dust: <actuallyadditions:item_dust:3>,        ingot: null,                                   nugget: <thermalfoundation:material:17>,        gem: <minecraft:emerald>,                  },
Gold               : {ore: <minecraft:gold_ore>,                    dust: <thermalfoundation:material:1>,         ingot: <minecraft:gold_ingot>,                 nugget: <minecraft:gold_nugget>,                gem: null,                                 },
Iridium            : {ore: <thermalfoundation:ore:7>,               dust: <thermalfoundation:material:71>,        ingot: <thermalfoundation:material:135>,       nugget: <thermalfoundation:material:199>,       gem: <ic2:misc_resource:1>,                },
Iron               : {ore: <minecraft:iron_ore>,                    dust: <thermalfoundation:material>,           ingot: <minecraft:iron_ingot>,                 nugget: <minecraft:iron_nugget>,                gem: null,                                 },
Lapis              : {ore: <minecraft:lapis_ore>,                   dust: <ic2:dust:9>,                           ingot: null,                                   nugget: <jaopca:item_nuggetlapis>,              gem: <minecraft:dye:4>,                    },
Lead               : {ore: <thermalfoundation:ore:3>,               dust: <thermalfoundation:material:67>,        ingot: <thermalfoundation:material:131>,       nugget: <thermalfoundation:material:195>,       gem: null,                                 },
Lithium            : {ore: <nuclearcraft:ore:6>,                    dust: <ic2:dust:11>,                          ingot: <nuclearcraft:ingot:6>,                 nugget: <jaopca:item_nuggetlithium>,            gem: null,                                 },
Magnesium          : {ore: <nuclearcraft:ore:7>,                    dust: <nuclearcraft:dust:7>,                  ingot: <nuclearcraft:ingot:7>,                 nugget: <jaopca:item_nuggetmagnesium>,          gem: null,                                 },
Malachite          : {ore: <biomesoplenty:gem_ore:5>,               dust: <jaopca:item_dustmalachite>,            ingot: null,                                   nugget: <jaopca:item_nuggetmalachite>,          gem: <biomesoplenty:gem:5>,                },
Mithril            : {ore: <thermalfoundation:ore:8>,               dust: <thermalfoundation:material:72>,        ingot: <thermalfoundation:material:136>,       nugget: <thermalfoundation:material:200>,       gem: null,                                 },
Nickel             : {ore: <thermalfoundation:ore:5>,               dust: <thermalfoundation:material:69>,        ingot: <thermalfoundation:material:133>,       nugget: <thermalfoundation:material:197>,       gem: null,                                 },
Osmium             : {ore: <mekanism:oreblock>,                     dust: <mekanism:dust:2>,                      ingot: <mekanism:ingot:1>,                     nugget: <mekanism:nugget:1>,                    gem: null,                                 },
Peridot            : {ore: <biomesoplenty:gem_ore:2>,               dust: <jaopca:item_dustperidot>,              ingot: null,                                   nugget: <jaopca:item_nuggetperidot>,            gem: <biomesoplenty:gem:2>,                },
Platinum           : {ore: <thermalfoundation:ore:6>,               dust: <thermalfoundation:material:70>,        ingot: <thermalfoundation:material:134>,       nugget: <thermalfoundation:material:198>,       gem: null,                                 },
Quartz             : {ore: <minecraft:quartz_ore>,                  dust: <appliedenergistics2:material:3>,       ingot: null,                                   nugget: <thaumcraft:nugget:9>,                  gem: <minecraft:quartz>,                   },
QuartzBlack        : {ore: <actuallyadditions:block_misc:3>,        dust: <actuallyadditions:item_dust:7>,        ingot: null,                                   nugget: <jaopca:item_nuggetquartzblack>,        gem: <actuallyadditions:item_misc:5>,      },
Redstone           : {ore: <minecraft:redstone_ore>,                dust: <minecraft:redstone>,                   ingot: null,                                   nugget: null,                                   gem: <extrautils2:ingredients>,            },
Ruby               : {ore: <biomesoplenty:gem_ore:1>,               dust: <jaopca:item_dustruby>,                 ingot: null,                                   nugget: <jaopca:item_nuggetruby>,               gem: <biomesoplenty:gem:1>,                },
Sapphire           : {ore: <biomesoplenty:gem_ore:6>,               dust: <jaopca:item_dustsapphire>,             ingot: null,                                   nugget: <jaopca:item_nuggetsapphire>,           gem: <biomesoplenty:gem:6>,                },
Silver             : {ore: <thermalfoundation:ore:2>,               dust: <thermalfoundation:material:66>,        ingot: <thermalfoundation:material:130>,       nugget: <thermalfoundation:material:194>,       gem: null,                                 },
Tanzanite          : {ore: <biomesoplenty:gem_ore:4>,               dust: <jaopca:item_dusttanzanite>,            ingot: null,                                   nugget: <jaopca:item_nuggettanzanite>,          gem: <biomesoplenty:gem:4>,                },
Thorium            : {ore: <nuclearcraft:ore:3>,                    dust: <nuclearcraft:dust:3>,                  ingot: <nuclearcraft:ingot:3>,                 nugget: <jaopca:item_nuggetthorium>,            gem: null,                                 },
Tin                : {ore: <thermalfoundation:ore:1>,               dust: <thermalfoundation:material:65>,        ingot: <thermalfoundation:material:129>,       nugget: <thermalfoundation:material:193>,       gem: null,                                 },
Titanium           : {ore: <libvulpes:ore0:8>,                      dust: <libvulpes:productdust:7>,              ingot: <libvulpes:productingot:7>,             nugget: <libvulpes:productnugget:7>,            gem: null,                                 },
Topaz              : {ore: <biomesoplenty:gem_ore:3>,               dust: <jaopca:item_dusttopaz>,                ingot: null,                                   nugget: <jaopca:item_nuggettopaz>,              gem: <biomesoplenty:gem:3>,                },
Uranium            : {ore: <immersiveengineering:ore:5>,            dust: <immersiveengineering:metal:14>,        ingot: <immersiveengineering:metal:5>,         nugget: <immersiveengineering:metal:25>,        gem: null,                                 },
Yellorium          : {ore: <bigreactors:oreyellorite>,              dust: <bigreactors:dustyellorium>,            ingot: <bigreactors:ingotyellorium>,           nugget: null,                                   gem: null,                                 },

/**/
} as IItemStack[string][string];

function getExtras(oreBase as string, partNames as string[]) as IItemStack[] {
  val extraList = extras[oreBase];
  if(isNull(extraList) || extraList.length == 0) return [];

  var result = [] as IItemStack[];
  for mat in extraList {
    val partsOfMat = kinds[mat];
    if(isNull(partsOfMat)) continue;

    var found as IItemStack = null;
    for part in partNames {
      if(isNull(found) && !isNull(partsOfMat[part]))
        found = partsOfMat[part];
    }

    if(!isNull(found)) result += found;
  }

  return result;
}