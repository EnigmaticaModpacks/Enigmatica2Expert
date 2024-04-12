import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.damage.IDamageSource;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.util.Math;
#modloaded emberroot

# Returns looting level from IDamageSource, if applicable
	function getLooting (dmgSource as IDamageSource) as int {
		var dmgSourceEntity = dmgSource.getImmediateSource();
		if (dmgSourceEntity instanceof IPlayer) {
			var player as IPlayer = dmgSourceEntity;
			if (player.currentItem.isEnchanted) {
				var enchants = player.currentItem.enchantments;
				for enchant in enchants {
					if (enchant.definition == <enchantment:minecraft:looting>) {
						return enchant.level;
					}
				}
			}
		}
		return 0;
	}

# EmberRoot Zoo Deer
	<entity:emberroot:deers>.clearDrops();
# Venison
	<entity:emberroot:deers>.addDropFunction(function(deerEntity, damageSource) {
		var deerEntityLiving as IEntityLivingBase = deerEntity;
		if (deerEntityLiving.isChild) return null;
	
		var looting as int = getLooting(damageSource);
		
		# Drops from 1 to [looting level] venison, with distribution biased away from min and max values
		var numBonusDrops as int = 0;
		if (looting > 0) numBonusDrops = (Math.round(deerEntity.world.random.nextDouble(0.0, (looting as double)))) as int;
		
		var venison as IItemStack = deerEntity.isBurning ? <harvestcraft:venisoncookeditem> : <harvestcraft:venisonrawitem>;
		return venison.withAmount(1 + numBonusDrops);
		});
# Leather
	<entity:emberroot:deers>.addDropFunction(function(deerEntity, damageSource) {
		var deerEntityLiving as IEntityLivingBase = deerEntity;
		if (deerEntityLiving.isChild) return null;
		
		var looting as int = getLooting(damageSource);
		
		# Drops from 0 to 2 + [looting level] leather, with uniform distribution
		var numDrops = deerEntity.world.random.nextInt(0, 2 + looting) as int;
		
		# Apparently CT acts funny if you return withAmount(0); it stops the other drop, too
		return numDrops != 0 ? <minecraft:leather>.withAmount(numDrops) : null;
		});