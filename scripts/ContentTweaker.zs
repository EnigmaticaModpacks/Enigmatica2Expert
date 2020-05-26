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

val wispwhisperTrait = TraitBuilder.create("wispwhisper");
wispwhisperTrait.onHit =
  function (trait, tool, attacker, target, damage, isCritical) {
    val world = attacker.world;			
    if(!world.isRemote()){
      var CotWorld = world.toContentTweakerWorld();
      if(CotWorld.getRandom().nextInt(8) == 1){
        val wisp as crafttweaker.entity.IEntityLiving = <entity:thaumcraft:wisp>.spawnEntity(world, target.position as IBlockPos);
        wisp.attackTarget = target;
        val pot = <potion:minecraft:wither>;
        wisp.addPotionEffect(pot.makePotionEffect(999, 2, false, false));
      }
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
          if(CotWorld.getRandom().nextInt(16) == 1){
            val wisp as crafttweaker.entity.IEntityLiving = <entity:thaumcraft:wisp>.spawnEntity(world, player.position as IBlockPos);
            wisp.attackTarget = truesource;
            val pot = <potion:minecraft:wither>;
            wisp.addPotionEffect(pot.makePotionEffect(999, 2, false, false));
          }					
        }			
      }
    }			
    return newDamage;
  };
wispwhisperarmorTrait.register();