import crafttweaker.item.IItemStack;
import crafttweaker.event.EntityLivingFallEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemDefinition;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import mods.ctutils.utils.Math.random;
import mods.ctutils.utils.Math.sqrt;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.abs;



# -------------------------------
# Tools
# -------------------------------
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

# -------------------------------
# Spawning
# -------------------------------
function spawnDust(dust as IItemStack, e as EntityLivingFallEvent, power as double) {
  val entity = e.entityLivingBase;

	
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
	val count = ((d > random() ) ? (d + 0.5d) : 0) as int;

	if (count <= 0 ) { return null; }

	val velx = (random()/2 - 0.25);
	val vely = random()/2;
	val velz = (random()/2 - 0.25);

	// val commandLine = "summon Item " ~
	// 	x ~ " " ~ y ~ " " ~ z ~
	// 	' {Item:{id:"' ~ id ~ '",Count:' ~ 
	// 	count ~ '},Motion:[' ~ 
	// 	velx ~ "," ~ vely ~ "," ~ velz ~ ']}';

	val entItem = (dust * count).createEntityItem(entity.world, x, y, z);
	entItem.motionX = velx;
	entItem.motionY = vely;
	entItem.motionZ = velz;

	val spawnSucces = entity.world.spawnEntity(entItem);

	// print(" Spawn dust --> count:" ~ count ~ " pos:[" ~ x ~ "][" ~ y ~ "][" ~ z ~ "] vel:[" ~ velx ~ "][" ~ vely ~ "][" ~ velz ~ "]");
	// print("motionY:" ~ entity.motionY);
	

	// server.commandManager.executeCommand(server, commandLine);

	#disance	disance	float
	#damageMultiplier	damageMultiplier	float
}

# -------------------------------
# Event
# -------------------------------
function onEvent(e as EntityLivingFallEvent){
  val entity = e.entityLivingBase;
  
  # Condition
  // IItemStack getItemInSlot(IEntityEquipmentSlot slot);
  var boots = entity.getItemInSlot(crafttweaker.entity.IEntityEquipmentSlot.feet());


  if( !isNull(boots) && 
      !isNull(boots.tag) && 
      !isNull(boots.tag.TinkerData) && 
      !isNull(boots.tag.TinkerData.Materials)){
		val tag = boots.tag;

		var isContentKeyMat = false;
		for i in 0 to tag.TinkerData.Materials.length {
			val matName = tag.TinkerData.Materials[i].asString();
			if (matName == keyMaterial) { isContentKeyMat = true; }
		}
		if (!isContentKeyMat) { return null; }

		# Calculate cumulative values
		# Summ of all values by each type for all held items
		var cumulativeValues as double[] = [0, 0, 0, 0] as double[];

		# Loop over items
		val itemList as IItemStack[] = [entity.mainHandHeldItem, entity.offHandHeldItem] as IItemStack[];
		var dustList as IItemStack[] = [] as IItemStack[];
		var powrList as     double[] = [] as double[];
		for i in 0 to itemList.length {
			val heldItem = itemList[i];
			val durability = (!isNull(tag.Stats) && !isNull(tag.Stats.Durability)) ? tag.Stats.Durability as int : 0;

			if(!isNull(heldItem) && durability > 0) {
				val dust as IItemStack = getDustTiny(heldItem) as IItemStack;

				if(!isNull(dust)) {
					# ---------------------
					# Calculate power
					# ---------------------
					var valueList as double[] = [
						max(0.0d, (sqrt(heldItem.amount as double / heldItem.maxStackSize as double))),
						max(0.0d, ((entity.isSprinting ? 1.0d : 0.25d)) as double),
						max(0.0d, sqrt(sqrt(durability as double / 1000.0d)) as double),
						sqrt(abs(entity.motionY) * 6.0d)
					] as double[];

					# Save cumulative values
					for j in 0 to valueList.length { cumulativeValues[j] = cumulativeValues[j] + (valueList[j] / itemList.length); }
					// print(" ==> " ~ 
					// (((valueList[0] * 100) as int) as double / 100.0d) ~ " " ~ 
					// (((valueList[1] * 100) as int) as double / 100.0d) ~ " " ~ 
					// (((valueList[2] * 100) as int) as double / 100.0d) ~ " " ~ 
					// (((valueList[3] * 100) as int) as double / 100.0d));

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
		for j in 0 to powrList.length {
			# TODO: Index Out of bounds
			power = power + powrList[j] / powrList.length;
			}
				
		// print("Jumping power: " ~ (((power * 100) as int) as double / 100.0d));
		// print("  items count value: " ~ (((cumulativeValues[0] * 100) as int) as double / 100.0d));
		// print("    sprinting value: " ~ (((cumulativeValues[1] * 100) as int) as double / 100.0d));
		// print("   durability value: " ~ (((cumulativeValues[2] * 100) as int) as double / 100.0d));
		// print("  vert. speed value: " ~ (((cumulativeValues[3] * 100) as int) as double / 100.0d));

		if (power > 0) {
			# ---------------------
			# Show information
			# ---------------------
			// print("entity.isSneaking: " ~ entity.isSneaking);
			if (entity.isSneaking){
				
				entity.sendMessage("Jumping power: " ~ power);
				entity.sendMessage("  items count value: " ~ cumulativeValues[0]);
				entity.sendMessage("    sprinting value: " ~ cumulativeValues[1]);
				entity.sendMessage("   durability value: " ~ cumulativeValues[2]);
				entity.sendMessage("  vert. speed value: " ~ cumulativeValues[3]);
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
			
			# boots = boots.updateTag({Stats: {Durability: mods.ctutils.utils.Math.max(durability - 5, 0) as int}});
			boots.damageItem(5, entity);
			entity.setItemToSlot(
				crafttweaker.entity.IEntityEquipmentSlot.feet(), boots				
				# .transformDamage(5).items[0]
				);
		}
  }
}

# -------------------------------
# Hook on events
# -------------------------------
events.onEntityLivingFall(function(event as EntityLivingFallEvent){
  onEvent(event);
});

# -------------------------------
# Show info
# -------------------------------
// events.onPlayerLeftClickBlock(function(event as crafttweaker.event.PlayerLeftClickBlockEvent){
  
// });
/* 
<conarm:boots>.withTag({
	StatsOriginal: {
		Toughness: 0.0 as float, FreeModifiers: 3, Durability: 17, Defense: 5.0 as float
		}, 
	Stats: {
		Toughness: 0.0 as float, FreeModifiers: 3, Durability: 13, Defense: 5.0 as float
	}, 
	TinkerData: {
		Materials: ["stone", "stone", "stone"], Modifiers: []
	}, 
	Modifiers: [
		{identifier: "cheapskate_armor", color: -6710887, level: 1}, {identifier: "cheap_armor", color: -6710887, level: 1}
	], Traits: ["cheapskate_armor", "cheap_armor"]
}) 

<conarm:boots:1>.withTag({
	StatsOriginal: {
		Toughness: 0.0 as float, FreeModifiers: 3, Durability: 17, Defense: 5.0 as float
		}, 
	Stats: {
		Toughness: 0.0 as float, FreeModifiers: 3, Durability: 13, Defense: 5.0 as float
	}, 
	TinkerData: {
		Materials: ["stone", "stone", "stone"], Modifiers: []
	}, 
	Modifiers: [
		{identifier: "cheapskate_armor", color: -6710887, level: 1}, 
		{identifier: "cheap_armor", color: -6710887, level: 1}
	], 
	Traits: ["cheapskate_armor", "cheap_armor"]})


*/