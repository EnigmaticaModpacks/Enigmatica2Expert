#loader contenttweaker

import crafttweaker.world.IWorld;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityCreature;
import crafttweaker.player.IPlayer;
import crafttweaker.damage.IDamageSource;
import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.item.IItemStack;
import crafttweaker.game.ITeam;
import crafttweaker.liquid.ILiquidStack;
import mods.contenttweaker.World;
import mods.contenttweaker.Random;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Material as PartMaterial;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Color;
import mods.contenttweaker.tconstruct.Material;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.tconstruct.Trait;
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.conarm.ArmorTrait;
import mods.contenttweaker.conarm.ArmorTraitBuilder;
import mods.contenttweaker.conarm.ExtendedMaterialBuilder;

# ######################################################################
#
# 
#
# ######################################################################


val wispwhisperTrait = TraitBuilder.create("wispwhisper");
wispwhisperTrait.onHit =
  function (trait, tool, attacker, target, damage, isCritical) {
    val world = attacker.world;			
    if(!world.isRemote()){
      var CotWorld = world.toContentTweakerWorld();
      // if(CotWorld.getRandom().nextInt(8) == 1){
      //   val wisp as crafttweaker.entity.IEntityLiving = <entity:thaumcraft:wisp>.spawnEntity(world, target.position as IBlockPos);
      //   wisp.attackTarget = target;
      //   val pot = <potion:minecraft:wither>;
      //   wisp.addPotionEffect(pot.makePotionEffect(999, 2, false, false));
      // }
      // print(" weapon onHit()");
    }			
  };
wispwhisperTrait.register();

val wispwhisperarmorTrait = ArmorTraitBuilder.create("wispwhisper");
wispwhisperarmorTrait.onHurt =
  function (trait, armor, player, source as IDamageSource, damage, newDamage, event) {
    if(source.getTrueSource() instanceof crafttweaker.entity.IEntityLivingBase) {
      val truesource as crafttweaker.entity.IEntityLivingBase = source.getTrueSource();
      if(!isNull(truesource)){
        val world = player.world;
        if(!world.isRemote()){
          var CotWorld = world.toContentTweakerWorld();
          // if(CotWorld.getRandom().nextInt(16) == 1){
          //   val wisp as crafttweaker.entity.IEntityLiving = <entity:thaumcraft:wisp>.spawnEntity(world, player.position as IBlockPos);
          //   wisp.attackTarget = truesource;
          //   val pot = <potion:minecraft:wither>;
          //   wisp.addPotionEffect(pot.makePotionEffect(999, 2, false, false));
          // }			
          // print(" armor onHit()");		
        }			
      }
    }			
    return newDamage;
  };
wispwhisperarmorTrait.register();

val potato = ExtendedMaterialBuilder.create("potato");

potato.color = 0x909966;
potato.craftable = true;
potato.addItem(<item:minecraft:potato>);
potato.representativeItem = <item:minecraft:potato>;
potato.localizedName = "Potato";
potato.itemLocalizer = 
function(thisMaterial, itemName){
    return "Potato " + itemName;
};
potato.addHeadMaterialStats(20, 1.8, 1.8, 0);
potato.addExtraMaterialStats(25);
potato.addHandleMaterialStats(0.5, 10);
potato.addBowMaterialStats(1.3, 0.8, 0);
potato.addCoreMaterialStats(10, 2.5);
potato.addPlatesMaterialStats(0.8, 5, 0);
potato.addTrimMaterialStats(0.4);
potato.addMaterialTrait("wispwhisper");
potato.addMaterialTrait("curiosity");
potato.addProjectileMaterialStats();
potato.register();




# ######################################################################
#
# 
#
# ######################################################################

// <thaumcraft:thaumium_pick>.withTag({infench:[{lvl:1,id:4},{lvl:2,id:3}]})
// <thaumcraft:elemental_pick>.withTag({infench: [{lvl: 1 as short, id: 4 as short}, {lvl: 2 as short, id: 3 as short}]})
// <tconstruct:pickaxe>.withTag({StatsOriginal:{AttackSpeedMultiplier:1.0,MiningSpeed:12.0,FreeModifiers:3,Durability:1072,HarvestLevel:4,Attack:4.1},Stats:{AttackSpeedMultiplier:1.1,MiningSpeed:12.0,FreeModifiers:3,Durability:1072,HarvestLevel:4,Attack:4.1}})



# ######################################################################
#
# Additional Ore when mining
#
# ######################################################################



# ######################################################################
#
# Deconstruct Armor when kick, or on crafting table
#
# ######################################################################



# ######################################################################
#
# Drop Curiocity
#
# ######################################################################

static curiocityList as IItemStack[] = [
  <item:thaumcraft:curio>  ,  // Arcane Curiosity - Auromancy
  <item:thaumcraft:curio:1>,  // Preserved Curiosity - Alchemy
  <item:thaumcraft:curio:2>,  // Ancient Curiosity - Golemancy
  <item:thaumcraft:curio:3>,  // Eldritch Curiosity - Eldritch
  <item:thaumcraft:curio:4>,  // Illuminating Curiosity - Infusion
  <item:thaumcraft:curio:5>,  // Twisted Curiosity - Artifice
] as IItemStack[];

# TODO: Add hidden recipes for focus curiositys

//create(String identifier, int color, @Optional int maxLevel, @Optional int countPerLevel)
val curiosityTrait = mods.contenttweaker.tconstruct.TraitBuilder.create("curiosity");
curiosityTrait.color = 0xffaadd;
curiosityTrait.maxLevel = 5;
curiosityTrait.countPerLevel = 10;

//myTrait.addItem(IIngredient item, @Optional(1) int amountNeeded, @Optional(1) int amountMatched));
// curiosityTrait.addItem(<item:thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "cognitio"}]}), 1, 1);
// curiosityTrait.addItem(<item:thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "cognitio"}]}), 1, 25);
curiosityTrait.addItem(<item:thaumcraft:taint_soil>, 1, 1);
curiosityTrait.addItem(<item:thaumcraft:taint_rock>, 1, 1);

// myTrait.extraInfo = function(TraitRepresentation thisTrait, IItemStack item, IData tag){....};
curiosityTrait.extraInfo = function(trait, item, tag){
  // print(tag.asString());
  return [trait.getData(item).level as string] as string[];
};



curiosityTrait.localizedName = "Curiosity";
curiosityTrait.localizedDescription = "Dealing crit damage or mining hard blocks drops curiosity";
curiosityTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCrit, wasHit) {
  val world = attacker.world;
  # TODO: Only players can cause this
  if(!world.isRemote() && wasCrit && wasHit){
    var cotWorld = world.toContentTweakerWorld();
    val rand = cotWorld.getRandom();
    val traiData = trait.getData(tool);
    # TODO: Looting account
    if(rand.nextInt(300) <= pow(traiData.level as float, 3.0f) as int){
      val rndCurio = curiocityList[rand.nextInt(curiocityList.length)];
      val entItem = rndCurio.createEntityItem(target.world, target.x, target.y + 0.5d, target.z);
      # TODO: Make dropped curiocity fly to side of attack
      val spawnSucces = target.world.spawnEntity(entItem);
    }
  }	
};
curiosityTrait.onBlockHarvestDrops = function(trait, tool, e) {
  //   Event:
  // player  isPlayer  silkTouch  fortuneLevel  drops  dropChance  world  blockState  block 
  val world = e.world;
  if(!world.isRemote() && e.isPlayer){
    var cotWorld = world.toContentTweakerWorld();
    val rand = cotWorld.getRandom();
    val blockHarvLvl = e.block.definition.harvestLevel;
    val traiData = trait.getData(tool);
    # TODO: Luck account
    if(blockHarvLvl > 0 && rand.nextInt(3000) <= pow((traiData.level) as float, 3.0f) as int){
      val rndCurio = curiocityList[rand.nextInt(curiocityList.length)];
      val entItem = rndCurio.createEntityItem(world, e.x, e.y, e.z);
      entItem.motionY = 0.10d;
      val spawnSucces = world.spawnEntity(entItem);
    }
  }	
};
curiosityTrait.register();


# ######################################################################
#
# Crushing ore on jumps
#
# ######################################################################


# ######################################################################
#
# 
#
# ######################################################################

