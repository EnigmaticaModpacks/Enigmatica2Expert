
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import mods.artisanworktables.builder.RecipeBuilder;
import crafttweaker.potions.IPotion;

#norun

/*

Vanilla combined potion
<minecraft:potion>.withTag({CustomPotionEffects:[{Id:1, Amplifier:0, Duration:600}], CustomPotionColor:65280, display:{Name:"{\"text\":\"Super Awesome Potion\"}"}})

Vanilla colord potion
/ct give <minecraft:potion>.withTag({ench:[{lvl:1,id:36}],enchantmentColor:327880,CustomPotionColor:327691,CustomPotionEffects:[{Id:1,Amplifier:20,Duration:600},{Id:2,Amplifier:20,Duration:600}]})


<bloodmagic:potion_flask>.withTag({CustomPotionEffects: [{Ambient: 0 as byte, CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], ShowParticles: 1 as byte, Duration: 2400, Id: 5 as byte, Amplifier: 0 as byte}]})

Rustic
/ct give <rustic:elixir>.withTag({PotionLong:1,ench:[{lvl:1,id:36}],enchantmentColor:47872})

*/

static potNameID as string[IPotion] = {
  <potion:astralsorcery:potionbleed>          : "107",
  <potion:astralsorcery:potioncheatdeath>     : "106",
  <potion:astralsorcery:potiondropmodifier>   : "109",
  <potion:astralsorcery:potionspellplague>    : "108",
  <potion:astralsorcery:potiontimefreeze>     : "110",
  <potion:biomesoplenty:curse>                : "28",
  <potion:bloodmagic:boost>                   : "66",
  <potion:bloodmagic:bounce>                  : "75",
  <potion:bloodmagic:cling>                   : "76",
  <potion:bloodmagic:constrict>               : "72",
  <potion:bloodmagic:deafness>                : "74",
  <potion:bloodmagic:feathered>               : "82",
  <potion:bloodmagic:fire_fuse>               : "71",
  <potion:bloodmagic:flight>                  : "78",
  <potion:bloodmagic:grounded>                : "79",
  <potion:bloodmagic:heavy_heart>             : "81",
  <potion:bloodmagic:planar_binding>          : "68",
  <potion:bloodmagic:plant_leech>             : "73",
  <potion:bloodmagic:sacrificial_lamb>        : "77",
  <potion:bloodmagic:soul_fray>               : "70",
  <potion:bloodmagic:soul_snare>              : "69",
  <potion:bloodmagic:suspended>               : "80",
  <potion:bloodmagic:whirlwind>               : "67",
  <potion:botania:allure>                     : "56",
  <potion:botania:bloodthirst>                : "55",
  <potion:botania:clear>                      : "57",
  <potion:botania:emptiness>                  : "54",
  <potion:botania:featherfeet>                : "53",
  <potion:botania:soulcross>                  : "52",
  <potion:conarm:superhotpotion>              : "149",
  <potion:cyclicmagic:potion.bounce>          : "102",
  <potion:cyclicmagic:potion.butter>          : "104",
  <potion:cyclicmagic:potion.ender>           : "97",
  <potion:cyclicmagic:potion.frostwalker>     : "103",
  <potion:cyclicmagic:potion.magnet>          : "96",
  <potion:cyclicmagic:potion.saturation>      : "171",
  <potion:cyclicmagic:potion.slowfall>        : "99",
  <potion:cyclicmagic:potion.snow>            : "100",
  <potion:cyclicmagic:potion.stunned>         : "105",
  <potion:cyclicmagic:potion.swimspeed>       : "101",
  <potion:cyclicmagic:potion.waterwalk>       : "98",
  <potion:ic2:radiation>                      : "0",
  <potion:immersiveengineering:concretefeet>  : "94",
  <potion:immersiveengineering:conductive>    : "91",
  <potion:immersiveengineering:flammable>     : "89",
  <potion:immersiveengineering:flashed>       : "95",
  <potion:immersiveengineering:slippery>      : "90",
  <potion:immersiveengineering:sticky>        : "92",
  <potion:immersiveengineering:stunned>       : "93",
  <potion:minecraft:absorption>               : "22",
  <potion:minecraft:blindness>                : "15",
  <potion:minecraft:fire_resistance>          : "12",
  <potion:minecraft:glowing>                  : "24",
  <potion:minecraft:haste>                    : "3",
  <potion:minecraft:health_boost>             : "21",
  <potion:minecraft:hunger>                   : "17",
  <potion:minecraft:instant_damage>           : "7",
  <potion:minecraft:instant_health>           : "6",
  <potion:minecraft:invisibility>             : "14",
  <potion:minecraft:jump_boost>               : "8",
  <potion:minecraft:levitation>               : "25",
  <potion:minecraft:luck>                     : "26",
  <potion:minecraft:mining_fatigue>           : "4",
  <potion:minecraft:nausea>                   : "9",
  <potion:minecraft:night_vision>             : "16",
  <potion:minecraft:poison>                   : "19",
  <potion:minecraft:regeneration>             : "10",
  <potion:minecraft:resistance>               : "11",
  <potion:minecraft:saturation>               : "23",
  <potion:minecraft:slowness>                 : "2",
  <potion:minecraft:speed>                    : "1",
  <potion:minecraft:strength>                 : "5",
  <potion:minecraft:unluck>                   : "27",
  <potion:minecraft:water_breathing>          : "13",
  <potion:minecraft:weakness>                 : "18",
  <potion:minecraft:wither>                   : "20",
  <potion:nutrition:malnourished>             : "113",
  <potion:nutrition:nourished>                : "112",
  <potion:nutrition:toughness>                : "111",
  <potion:plustic:mystical_fire_potion>       : "174",
  <potion:potioncore:antidote>                : "160",
  <potion:potioncore:archery>                 : "165",
  <potion:potioncore:bless>                   : "131",
  <potion:potioncore:broken_armor>            : "135",
  <potion:potioncore:broken_magic_shield>     : "151",
  <potion:potioncore:burst>                   : "148",
  <potion:potioncore:chance>                  : "127",
  <potion:potioncore:climb>                   : "144",
  <potion:potioncore:cure>                    : "136",
  <potion:potioncore:curse>                   : "168",
  <potion:potioncore:diamond_skin>            : "137",
  <potion:potioncore:disorganization>         : "132",
  <potion:potioncore:dispel>                  : "128",
  <potion:potioncore:drown>                   : "158",
  <potion:potioncore:explode>                 : "122",
  <potion:potioncore:extension>               : "167",
  <potion:potioncore:fire>                    : "153",
  <potion:potioncore:flight>                  : "146",
  <potion:potioncore:invert>                  : "125",
  <potion:potioncore:iron_skin>               : "152",
  <potion:potioncore:klutz>                   : "130",
  <potion:potioncore:launch>                  : "129",
  <potion:potioncore:lightning>               : "123",
  <potion:potioncore:love>                    : "150",
  <potion:potioncore:magic_focus>             : "138",
  <potion:potioncore:magic_inhibition>        : "124",
  <potion:potioncore:magic_shield>            : "133",
  <potion:potioncore:perplexity>              : "139",
  <potion:potioncore:purity>                  : "163",
  <potion:potioncore:reach>                   : "154",
  <potion:potioncore:recoil>                  : "156",
  <potion:potioncore:repair>                  : "145",
  <potion:potioncore:revival>                 : "134",
  <potion:potioncore:rust>                    : "147",
  <potion:potioncore:slow_fall>               : "164",
  <potion:potioncore:solid_core>              : "141",
  <potion:potioncore:spin>                    : "166",
  <potion:potioncore:step_up>                 : "157",
  <potion:potioncore:teleport>                : "143",
  <potion:potioncore:teleport_spawn>          : "155",
  <potion:potioncore:teleport_surface>        : "161",
  <potion:potioncore:vulnerable>              : "140",
  <potion:potioncore:weight>                  : "126",
  <potion:quark:black>                        : "84",
  <potion:quark:blue>                         : "83",
  <potion:quark:curse>                        : "87",
  <potion:quark:danger_sight>                 : "88",
  <potion:quark:resilience>                   : "86",
  <potion:quark:white>                        : "85",
  <potion:randomthings:collapse>              : "42",
  <potion:randomthings:imbue_collapse>        : "41",
  <potion:randomthings:imbue_experience>      : "39",
  <potion:randomthings:imbue_fire>            : "37",
  <potion:randomthings:imbue_poison>          : "38",
  <potion:randomthings:imbue_wither>          : "40",
  <potion:rats:plague>                        : "162",
  <potion:rats:synesthesia>                   : "159",
  <potion:rustic:blazing_trail>               : "31",
  <potion:rustic:feather>                     : "30",
  <potion:rustic:full>                        : "33",
  <potion:rustic:ironskin>                    : "29",
  <potion:rustic:magic_resistance>            : "34",
  <potion:rustic:shame>                       : "32",
  <potion:rustic:tipsy>                       : "36",
  <potion:rustic:wither_ward>                 : "35",
  <potion:scalinghealth:bandaged>             : "142",
  <potion:tconevo:damage_boost>               : "173",
  <potion:tconevo:damage_reduction>           : "172",
  <potion:tconevo:immortality>                : "169",
  <potion:tconevo:mortal_wounds>              : "170",
  <potion:tconstruct:carry>                   : "59",
  <potion:tconstruct:dot>                     : "64",
  <potion:tconstruct:enderference>            : "60",
  <potion:tconstruct:insatiable>              : "61",
  <potion:tconstruct:magnetic>                : "62",
  <potion:tconstruct:momentum>                : "63",
  <potion:tconstruct:splinter>                : "65",
  <potion:thaumcraft:blurredvision>           : "49",
  <potion:thaumcraft:deathgaze>               : "48",
  <potion:thaumcraft:fluxtaint>               : "43",
  <potion:thaumcraft:infectiousvisexhaust>    : "45",
  <potion:thaumcraft:sunscorned>              : "50",
  <potion:thaumcraft:thaumarhia>              : "51",
  <potion:thaumcraft:unnaturalhunger>         : "46",
  <potion:thaumcraft:visexhaust>              : "44",
  <potion:thaumcraft:warpward>                : "47",
  <potion:twilightforest:frosted>             : "58",
} as string[IPotion];

# TODO: Return something to make combining potions work
function findPotionIDByEffect(effectName as string) as string {
  for pot, idStr in potNameID {
    if (!isNull(pot)) {
      val potion = itemUtils.createPotion([pot.makePotionEffect(1, 0)] as crafttweaker.potions.IPotionEffect[]);

      if (!isNull(potion.tag) && !isNull(potion.tag.CustomPotionEffects)) {
        
        var potID = potion.tag.CustomPotionEffects[0].Id;
        if (!isNull(potID)) {
          var idInt = potID.asInt();
        }
      }
    }
  }
  return null;
}


# ######################################################################
#
# Combining function
#
# ######################################################################

function advancedBrew(
    grid as IIngredient[][], # Shaped recipe ingredients
    liquid as ILiquidStack,  # Required liquid
    toolDamage as int,       # How much damage would be dealt to Sceptre
    output as IItemStack     # Output potion (used in JEI recipe, uotput tag is changed)
  ) { 
  
  var pL = RecipeBuilder.get("chemist");
  pL.setShaped(grid);
  pL.setFluid(liquid);
  pL.addTool(<tconevo:tool_sceptre>, toolDamage);
  pL.addOutput(output);
  pL.setRecipeFunction( function(out, ins, cInfo) {
      var compoundTags = {list: []} as IData;
      var map as IItemStack[string] = ins;

      val isLong   = !isNull(D(out.tag, "PotionLong"));
      val isStrong = !isNull(D(out.tag, "PotionStrong"));
      val isMega   = !isNull(D(out.tag, "PotionMEGA"));

      # If this is MEGA potion
      var setDuration  as int;
      var setAmplifier as int;
      if(isMega){
        setDuration  = ins.potLong.tag.ElixirEffects[0].Duration.asInt();
        setAmplifier = ins.potStrong.tag.CustomPotionEffects[0].Amplifier.asInt();
        map = {m1: ins.potCombined} as IItemStack[string];
      } 

      # Iterate over all marked items to extract potion data
      for m, marked in map {

        # Try to get elixir data
        var eData = D(marked.tag, "ElixirEffects");
        var isElexir = !isNull(eData);

        # Try to get Flask or Vanilla data
        if (!isElexir) eData = D(marked.tag, "CustomPotionEffects");

        # Probably vanilla potion bottle
        # Try to get data from root
        if (isNull(eData)) {
          eData = D(marked.tag, "Potion");
          if (isNull(eData)) break; # No data -> continue loop

          var effectStr = eData.asString();

          # Cut prefixes
          var modAndName = effectStr.split(":");
          var mod = modAndName[0];
          var name = modAndName[1];

          # Get Amplifier or duration by subname
          var duration  as int = name.startsWith("long_") ? (20*60*8) : (20*60*3);
          var amplifier as int = name.startsWith("strong_") ? 1 : 0;
          
          # Remove prefixes
          var pureName = name.replaceAll("long_|strong_", "");

          var effectID = findPotionIDByEffect(mod~":"~pureName);
          if (isNull(effectID)) break;

          compoundTags = {list: compoundTags.list + {Id: effectID as int, Amplifier: amplifier, Duration: duration} };
        } else {
          # Loop over each potion effects in list
          for i in 0 to eData.length {
            val effect = eData[i];
            val durationData  = {Duration:  isMega ? setDuration  : (Dd(effect, "Duration",   {d:3600}).asInt() * (isLong   ? 10 : 1)) } as IData;
            val amplifierData = {Amplifier: min(127, isMega ? setAmplifier : (Dd(effect, "Amplifier",     {d:0}).asInt() + (isStrong ? 5  : 0))) as int } as IData;
            compoundTags = {list: compoundTags.list + (effect + durationData + amplifierData) };
          }
        }
      }
      if(compoundTags.list.length > 0) {
        // val extractedColorAndEnchs = out.tag.ench + out.tag.enchantmentColor + out.tag.CustomPotionColor;

        if (out.definition.id == "rustic:elixir")
          return out.withTag(out.tag + {ElixirEffects: compoundTags.list});

        return out.withTag(out.tag + {CustomPotionEffects: compoundTags.list});
      }
      return null;
    });
  pl.setExtraOutputOne(<minecraft:potion>, 1.0f);
  pL.create();

  mods.jei.JEI.addItem(output);
}

# ######################################################################
#
# Potion combining recipe
#
# ######################################################################

val potCombined = <minecraft:potion>.withTag(
  {
    PotionCombined: 1,

    ench:[{lvl:1,id:36}],
    enchantmentColor:327880,
    CustomPotionColor:327691,
    display:{Name:{text:"§dCombo Potion"}},

    CustomPotionEffects:[
      {
        Id:1,Amplifier:0,Duration:600
      },{
        Id:2,Amplifier:0,Duration:600
      }
    ]
  }
);


val vitCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]});

advancedBrew(
  [#Shaped recipe ingredients
    [null, vitCrystal, <thaumcraft:bottle_taint>, vitCrystal, null],
    [<ore:nuggetNetherStar>, <randomthings:bottleofair>, <ore:cofh:potion>.marked("m1"), <randomthings:bottleofair>, <ore:nuggetNetherStar>],
    [<ore:nuggetNetherStar>, <randomthings:beans:2>, <ore:cofh:potion>.marked("m2"), <randomthings:beans:2>, <ore:nuggetNetherStar>],
    [<ore:nuggetNetherStar>, <ore:gemAmethyst>, <thaumcraft:crucible>.reuse(), <ore:gemAmethyst>, <ore:nuggetNetherStar>],
    [null, <thaumcraft:nitor_purple>, <thaumcraft:nitor_purple>, <thaumcraft:nitor_purple>, null]
  ],

  # Required liquid
  <liquid:crystal> * 4000,
  
  # How much damage would be dealt to Sceptre
  100,

  # Output potion (used in JEI recipe, uotput tag is changed)
  potCombined.withLore(["Combination of 2 potions with same effects and durations"])
);

# ######################################################################
#
# Long Elixir
#
# ######################################################################

val potLong = <rustic:elixir>.withTag(
  {
    PotionLong: 1,

    ench:[{lvl:1,id:36}],
    enchantmentColor:2720000,
    display:{Name:{text:"§aLong Elixir"}},

    ElixirEffects:[
      {
        Effect: "minecraft:speed", Duration: (20*60*60*24), Amplifier: 0
      }
    ]
  }
);

# Generate all possible elixirs
# generate all possible brews
var anyElixir as IIngredient = <rustic:elixir>;
var anyBrew as IIngredient = <rustic:fluid_bottle>.withTag({Fluid:{FluidName:"wine",Amount:1000,Tag:{Quality:1.0}}});

for item in itemUtils.getItemsByRegexRegistryName("rustic:elixir") { anyElixir |= item; }
for item in itemUtils.getItemsByRegexRegistryName("rustic:fluid_bottle") {
	if (!isNull(D(item.tag, "Fluid.Tag.Quality"))) { anyBrew |= item.withTag( item.tag + {Fluid:{Tag:{Quality:1.0}}} ); }
}

advancedBrew(
  [#Shaped recipe ingredients
    [null, anyBrew, anyBrew, anyBrew, null],
    [<ore:nuggetTerrasteel>, <twilightforest:moonworm>, <mysticalagriculture:emerald_essence>, <twilightforest:moonworm>, <ore:nuggetTerrasteel>],
    [<ore:nuggetTerrasteel>, <forestry:propolis:3>, anyElixir.marked("m1"), <forestry:propolis:3>, <ore:nuggetTerrasteel>],
    [<ore:nuggetTerrasteel>, <cookingforblockheads:cow_jar>, <thaumcraft:crucible>.reuse(), <cookingforblockheads:cow_jar>, <ore:nuggetTerrasteel>],
    [null, <thaumcraft:nitor_lime>, <thaumcraft:nitor_lime>, <thaumcraft:nitor_lime>, null]
  ],

  # Required liquid
  <liquid:xu_enchanted_metal> * 6000,
  
  # How much damage would be dealt to Sceptre
  300,

  # Output potion (used in JEI recipe, uotput tag is changed)
  potLong.withLore(["Increase duration of potion x10"])
);

// for item in loadedMods["rustic"].items {
// 	val defId = item.definition.id;
// 	if (defId.startsWith("rustic:elixir")) {
// 		anyElixir |= item;
// 	} else if (defId.startsWith("rustic:fluid_bottle")
// 			&& !isNull(D(item.tag, "Fluid.Tag.Quality"))) { # Check if we have any quality
// 		anyBrew |= item;
// 	}
// }

/* 
var pL = RecipeBuilder.get("chemist");
pL.setShaped([
    [anyElixir.marked("m1"), anyElixir.marked("m2"), anyElixir.marked("m3"), anyElixir.marked("m4"), anyElixir.marked("m5")],
    [<avaritia:resource:2>, <biomesoplenty:jar_filled:1>, <randomthings:bottleofair>, <biomesoplenty:jar_filled:1>, <avaritia:resource:2>],
    [<avaritia:resource:2>, <randomthings:beans:2>, anyBrew, <randomthings:beans:2>, <avaritia:resource:2>],
    [<avaritia:resource:2>, <forge:bucketfilled>.withTag({FluidName: "potion_lingering", Amount: 1000, Tag: {Potion: "cofhcore:haste4"}}), anyBrew, <forge:bucketfilled>.withTag({FluidName: "potion_lingering", Amount: 1000, Tag: {Potion: "cofhcore:luck4"}}), <avaritia:resource:2>],
    [null, <cookingforblockheads:cow_jar>, <forge:bucketfilled>.withTag({FluidName: "hot_spring_water", Amount: 1000}), <cookingforblockheads:cow_jar>, null]]);
pL.setFluid(<liquid:potion_lingering> * 4000);
pL.addTool(<tconevo:tool_sceptre>, 100);
pL.addOutput(potLong.withLore(["Combination of all 5 elixir's effects with long duration"]));
pL.setRecipeFunction( function(out, ins, cInfo) {
    # var compoundTags as IData = potLongColor + {ElixirEffects: [{Effect: "minecraft:strength", Duration: 3600, Amplifier: 0}]};
    var compoundTags = [] as IData[];
    for elixir in ins {
      val eData = D(elixir.tag, "ElixirEffects");
      if (!isNull(eData)) {
        for effect in eData {
          val durationData = {Duration: (Dd(effect, "Duration", {d:3600}).asInt() * 10)};
          compoundTags = compoundTags + (effect + durationData);
        }
      }
    }
    if(compoundTags.length > 0) {
      return <rustic:elixir>.withTag(potLongColor + {ElixirEffects: compoundTags});
    }
    return null;
  });
pL.create();

mods.jei.JEI.addItem(potLong);
 */
# ######################################################################
#
# Strong potion
#
# ######################################################################

val potStrong = <bloodmagic:potion_flask>.withTag(
  {
    PotionStrong: 1,

    ench:[{lvl:1,id:36}],
    enchantmentColor:831714,
    CustomPotionColor:27294,
    display:{Name:{text:"§3Strong Potion"}},

    CustomPotionEffects: [
      { Id: 1 as byte, Duration: 2400, Amplifier: 5 as byte }
    ]
  }
);

// val potStrong = <bloodmagic:potion_flask>.withTag({ench: [{lvl: 1, id: 36}], enchantmentColor: 14602026});

# All possible flasks
var anyFlask as IIngredient = <bloodmagic:potion_flask>.withTag({});

# generate all possible Botania brewFlasks
var anyBrewFlask as IIngredient = null;
for item in loadedMods["botania"].items {
	val defId = item.definition.id;
	if (defId.startsWith("botania:brewflask")) {
		if (isNull(anyBrewFlask)) {
			anyBrewFlask = item;
		} else {
			anyBrewFlask |= item;
		}
	}
}

advancedBrew(
  [#Shaped recipe ingredients
    [null, <environmentaltech:aethium_crystal>, Bucket("hot_spring_water"), <environmentaltech:aethium_crystal>, null],
    [<avaritia:resource:2>, <botania:manabottle>, BucketTag("potion_lingering", {Potion: "cofhcore:haste4"}), <botania:manabottle>, <avaritia:resource:2>],
    [<avaritia:resource:2>, anyBrewFlask, anyFlask.marked("m1"), anyBrewFlask, <avaritia:resource:2>],
    [<avaritia:resource:2>, <randomthings:rezstone>, <thaumcraft:crucible>.reuse(), <randomthings:rezstone>, <avaritia:resource:2>],
    [null, <thaumictinkerer:energetic_nitor>, <thaumictinkerer:energetic_nitor>, <thaumictinkerer:energetic_nitor>, null]
  ],

  # Required liquid
  <liquid:blockfluidantimatter> * 8000,
  
  # How much damage would be dealt to Sceptre
  1000,

  # Output potion (used in JEI recipe, uotput tag is changed)
  potStrong.withLore(["Combination of all 5 Flask's effects with level X"])
);

// RecipeBuilder.get("chemist")
//   .setShaped([
//     [anyFlask, anyFlask, anyFlask, anyFlask, anyFlask],
//     [<avaritia:resource:2>, <environmentaltech:ionite_crystal>, <thaumcraft:bottle_taint>, <environmentaltech:ionite_crystal>, <avaritia:resource:2>],
//     [<avaritia:resource:2>, <botania:manabottle>, <thaumcraft:bottle_taint>, <botania:manabottle>, <avaritia:resource:2>],
//     [<avaritia:resource:2>, anyBrewFlask, anyBrewFlask, anyBrewFlask, <avaritia:resource:2>],
//     [null, <thaumictinkerer:energetic_nitor>, <randomthings:rezstone>, <thaumictinkerer:energetic_nitor>, null]])
//   .setFluid(<liquid:blockfluidantimatter> * 4000)
//   .addTool(<tconevo:tool_sceptre>, 100)
//   .addOutput(potStrong.withLore(["Combination of all 5 Flask's effects with level X"]))
//   .create();

# ######################################################################
#
# Combining potion
#
# ######################################################################


# ######################################################################
#
# MEGA potion
#
# ######################################################################

val potMEGA = <bloodmagic:potion_flask>.withTag(
  {
    PotionMEGA: 1,

    ench:[{lvl:1,id:36}],
    enchantmentColor:15326208,
    display:{Name:{text:"§eMEGA Potion"}},

    CustomPotionEffects: [
      { Id: 1 as byte, Duration: 2400, Amplifier: 5 as byte }
    ]
  }
);

// val potMEGA = <bloodmagic:potion_flask>.withTag({ench: [{lvl: 1, id: 36}], enchantmentColor: 14602026});

advancedBrew(
  [#Shaped recipe ingredients
    [null, <extrautils2:ingredients:16>, (potStrong | anyFlask).marked("potStrong"), <extrautils2:ingredients:16>, null],
    [<ore:nuggetUltimate>, <deepmoblearning:glitch_heart>, (potLong | anyElixir).marked("potLong"), <deepmoblearning:glitch_heart>, <ore:nuggetUltimate>],
    [<ore:nuggetUltimate>, <randomthings:spectreilluminator>, (potCombined | <ore:cofh:potion>).marked("potCombined"), <randomthings:spectreilluminator>, <ore:nuggetUltimate>],
    [<ore:nuggetUltimate>, <avaritia:endest_pearl>, <thaumcraft:crucible>.reuse(), <avaritia:endest_pearl>, <ore:nuggetUltimate>],
    [null, <avaritia:ultimate_stew>, <avaritia:ultimate_stew>, <avaritia:ultimate_stew>, null]
  ],

  # Required liquid
  <liquid:plasma> * 16000,
  
  # How much damage would be dealt to Sceptre
  3000,

  # Output potion (used in JEI recipe, uotput tag is changed)
  potMEGA.withLore(["Combination of §dList from Bottle Of Potion, §aDuration from Elixir, §3Potency from Flask"])
);
