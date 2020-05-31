#loader contenttweaker

import crafttweaker.item.IItemStack;
import crafttweaker.event.EntityLivingFallEvent;
import crafttweaker.entity.IEntityEquipmentSlot as entEqSlot;
import crafttweaker.item.IItemDefinition;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import mods.ctutils.utils.Math.random;
import mods.ctutils.utils.Math.sqrt;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.floor;
import mods.contenttweaker.Color;
import mods.contenttweaker.MaterialSystem;



# -------------------------------
# Tools
# -------------------------------
static armSlots as entEqSlot[] = [
	entEqSlot.head(), entEqSlot.chest(), entEqSlot.legs(), entEqSlot.feet()
] as entEqSlot[];

static keyMaterial as string = "stone";

# Makes tiny dust from ore block
function getDustTiny(item as IItemStack) as IItemStack{
	if (isNull(item)) {return null;}
  val ores = item.ores;
	if (isNull(ores) || ores.length == 0) {return null;}
  for i in 0 to ores.length {
		val ore = ores[i];
    if (ore.name.startsWith("ore")) {
      val oreName = ore.name.substring(3);
      val jEntry = mods.jaopca.JAOPCA.getOre(oreName);
      if(!isNull(jEntry)){
        return jEntry.getOreDictEntry("dustTiny").firstItem;
      }
    }
  }
}


function rndDouble(cotRand as mods.contenttweaker.Random) as double{
	return cotRand.nextInt(1000) as double / 1000.0d;
}

# -------------------------------
# Spawning
# -------------------------------
function spawnDust(dust as IItemStack, e as EntityLivingFallEvent, power as double) {
	// print("spawnDust power:"~ power);
  val entity = e.entityLivingBase;

  val cotRand = entity.world.toContentTweakerWorld().getRandom();
	
	# ---------------------
	# Define dust entity
	# ---------------------
	val id = dust.definition.id;
	val x = entity.x;
	val y = entity.y + 0.5;
	val z = entity.z;

	# ---------------------
	# Calculate amount
	# ---------------------
	var d = (
		#random() *
		(power/*  + random() - 0.5d */)
	) as double;
	// print("- Power for spawn: " ~ d);
	val rd = rndDouble(cotRand);
	// print("  rd = " ~ rd);
	// val count = ((d >  rd) ? (d + 0.5d) : 0) as int;
	val full as double = floor(power) as double;
	// print("full: " ~ full);
	val frac as double = power - full;
	val count as int = (full + ((frac > rd) ? 1.0d : 0.0d)) as int;
	// print("count = " ~ count);

	if (count <= 0 ) { return null; }

	val velx = (rndDouble(cotRand)/2.0d - 0.25d);
	val vely = rndDouble(cotRand)/2.0d;
	val velz = (rndDouble(cotRand)/2.0d - 0.25d);

	val entItem = (dust * count).createEntityItem(entity.world, x, y, z);
	entItem.motionX = velx;
	entItem.motionY = vely;
	entItem.motionZ = velz;

	val spawnSucces = entity.world.spawnEntity(entItem);
}

# -------------------------------
# Event
# -------------------------------
function onEvent(
		trait as mods.contenttweaker.conarm.ArmorTrait,
		armor as IItemStack, 
		player as crafttweaker.player.IPlayer,
		e as EntityLivingFallEvent){

  val entity = e.entityLivingBase;
				// print("  entity.motionY: " ~ entity.motionY);

	# Return if something weird and item have no tags
	if (isNull(armor.tag) || isNull(armor.tag.Stats) || isNull(armor.tag.Stats.Durability)) { return null; }

	# Calculate cumulative values
	# Summ of all values by each type for all held items
	var cumulativeValues as double[] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0] as double[];

	# Loop over items
	val itemList as IItemStack[] = [entity.mainHandHeldItem, entity.offHandHeldItem] as IItemStack[];
	var dustList as IItemStack[] = [] as IItemStack[];
	var powrList as     double[] = [] as double[];
	for i in 0 to itemList.length {
		val heldItem = itemList[i];
		val durability = (!isNull(armor.tag.Stats) && !isNull(armor.tag.Stats.Durability)) ? armor.tag.Stats.Durability as int : 0;

		if(!isNull(heldItem) && durability > 0) {
			val dust as IItemStack = getDustTiny(heldItem) as IItemStack;

			if(!isNull(dust)) {
				# ---------------------
				# Calculate power
				# ---------------------
				// print("  entity.motionY: " ~ entity.motionY);
				val speed as double = sqrt(entity.motionX * entity.motionX + entity.motionZ * entity.motionZ);
				// print("  entity speed: " ~ speed);
				var valueList as double[] = [
					max(0.0d, (sqrt(heldItem.amount as double / heldItem.maxStackSize as double))),
					max(0.0d, ((entity.isSprinting ? 1.0d : 0.25d)) as double),
					sqrt(speed * (1.0d / 0.08775d)),
					sqrt(abs(entity.motionY) * (1.0d / 0.0784d))
				] as double[];

				# Save cumulative values
				for j in 0 to valueList.length { cumulativeValues[j] = cumulativeValues[j] + (valueList[j] / itemList.length); }

				dustList += dust;

				# Save power for each item slot
				powrList += 1.0d;
				for j in 0 to valueList.length {
					powrList[powrList.length - 1] = powrList[powrList.length - 1] * valueList[j];
				}
			}
		}
	}
	
	var power = 0.0d;
	if (powrList.length > 0) {
		for j in 0 to powrList.length {
			power = power + powrList[j] / powrList.length;
		}
	}

	if (power > 0) {
		# ---------------------
		# Show information
		# ---------------------
		// print("entity.isSneaking: " ~ entity.isSneaking);
		if (!isNull(player) && entity.isSneaking){
			var ii = 0;
			player.sendMessage("\u00A7lJumping power: " ~ (((power * 100.0d) as int) as float / 100.0f)); ii+=1;
			player.sendMessage("  items count value: \u00A73" ~ (((cumulativeValues[ii] * 100.0d) as int) as float / 100.0f)); ii+=1;
			player.sendMessage("    sprinting value: \u00A73" ~ (((cumulativeValues[ii] * 100.0d) as int) as float / 100.0f)); ii+=1;
			player.sendMessage("        speed value: \u00A73" ~ (((cumulativeValues[ii] * 100.0d) as int) as float / 100.0f)); ii+=1;
			# player.sendMessage("   durability value: " ~ cumulativeValues[2]); ii+=1;
			player.sendMessage("  vert. speed value: \u00A73" ~ (((cumulativeValues[ii] * 100.0d) as int) as float / 100.0f)); ii+=1;
		}

		# ---------------------
		# Spawn
		# ---------------------
		var allEqual = true;
		if (dustList.length > 1) {
			for i in 1 to dustList.length {
				if (!(dustList[i] has dustList[i - 1] || dustList[i - 1] has dustList[i])){
					allEqual = false;
				}
			}
		}
		if (allEqual) {
			spawnDust(dustList[0], e, power);
		} else {
			for i in 0 to dustList.length {
				spawnDust(dustList[i], e, powrList[i] / dustList.length);
			}
		}
		
		for i in 0 to armSlots.length {
			if (entity.getItemInSlot(armSlots[i]) has armor){
				armor.damageItem(max(0.0d, 5.0d * power) as int, entity);
				entity.setItemToSlot(armSlots[i], armor);
			}
		}
	}
}

# -------------------------------
# Molten heavy
# -------------------------------
var color = Color.fromHex("444450") as Color;

var heavyMatBuilder = MaterialSystem.getMaterialBuilder().setName("Heavy Metal").setColor(color).build();

var molten = heavyMatBuilder.registerPart("molten").getData();
molten.addDataValue("temperature", "320");
molten.addDataValue("density", "500000");
molten.addDataValue("viscosity", "30000");

# -------------------------------
# Grinding Tait
# -------------------------------
val grindingTrait = mods.contenttweaker.conarm.ArmorTraitBuilder.create("grinding");
grindingTrait.color = 0x444450;
grindingTrait.localizedDescription = "Ore in your hands drop tiny piles when you run+jumping";
grindingTrait.localizedName = "Grinding";

# -------------------------------
# Hook on events
# -------------------------------
grindingTrait.onFalling = function(trait, armor, player, event) {
  if(!event.entityLivingBase.world.isRemote()) {
		onEvent(trait, armor, player, event);
	}
};
grindingTrait.register();

# -------------------------------
# Tic + Conarm Material
# -------------------------------
val heavy = mods.contenttweaker.conarm.ExtendedMaterialBuilder.create("heavy");

heavy.liquid = <liquid:heavy_metal>;
heavy.castable = true;
heavy.craftable = false;

heavy.color = 0x444450;
heavy.addItem(<item:mechanics:heavy_ingot>);
heavy.representativeItem = <item:mechanics:heavy_ingot>;
heavy.localizedName = "Heavy";
heavy.itemLocalizer = function(thisMaterial, itemName){
    return "Heavy " + itemName;
};
heavy.addHeadMaterialStats(60, 0.01, 13.0, 5);
heavy.addExtraMaterialStats(-40);
heavy.addHandleMaterialStats(0.5, -10);
heavy.addBowMaterialStats(0.01, 0.1, 13);
heavy.addArrowShaftMaterialStats(0.2, -10);

heavy.addCoreMaterialStats(10, 2.5);
heavy.addPlatesMaterialStats(0.3, 5, 0);
heavy.addTrimMaterialStats(0.4);

heavy.addMaterialTrait("heavy", "head");
heavy.addMaterialTrait("heavy", "core");
heavy.addMaterialTrait("heavy", "plates");
heavy.addMaterialTrait("grinding_armor");
heavy.addProjectileMaterialStats();
heavy.register();