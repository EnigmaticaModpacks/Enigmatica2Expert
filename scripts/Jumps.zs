import crafttweaker.item.IItemStack;
import crafttweaker.event.EntityLivingFallEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemDefinition;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import mods.ctutils.utils.Math.random;


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
function spawnDust(dust as IItemStack, e as EntityLivingFallEvent) {
  val entity = e.entityLivingBase;

	#/summon Item ~ ~ ~ {Item:{id:"minecraft:diamond",Count:1}}

	val id = dust.definition.id;
	val x = entity.x;
	val y = entity.y + 0.5;
	val z = entity.z;
	#val count = e.damageMultiplier as int;
	val count = (random()/(entity.isSprinting ? 4 : 1) < 0.125 ) ? 1 : 0;

	if (count == 0 ) { return null; }


	val velx = (random()/2 - 0.25);
	val vely = random()/2;
	val velz = (random()/2 - 0.25);

	val commandLine = "summon Item " ~
		x ~ " " ~ y ~ " " ~ z ~
		' {Item:{id:"' ~ id ~ '",Count:' ~ 
		count ~ '},Motion:[' ~ 
		velx ~ "," ~ vely ~ "," ~ velz ~ ']}';

	
	# entity.world.spawnEntity(IEntity entity);

	#val entItem = (dust * count).createEntityItem(entity.world, x, y, z);	
	// val entItem = <minecraft:cobblestone>.createEntityItem(entity.world, x, y, z);	
	// entItem.motionX = velx;
	// entItem.motionY = vely;
	// entItem.motionZ = velz;

	server.commandManager.executeCommand(server, commandLine);

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

		# Loop over items
		val itemList as IItemStack[] = [entity.mainHandHeldItem, entity.offHandHeldItem] as IItemStack[];
		for i in 0 to itemList.length {
			val item = itemList[i];
			val durability = (!isNull(tag.Stats) && !isNull(tag.Stats.Durability)) ? tag.Stats.Durability as int : 0;

			if(!isNull(item) && durability > 0) {
				val dust as IItemStack = getDustTiny(item) as IItemStack;

				if(!isNull(dust)) {
					spawnDust(dust, e);
					
					# boots = boots.updateTag({Stats: {Durability: mods.ctutils.utils.Math.max(durability - 5, 0) as int}});
					boots.damageItem(5, entity);
					entity.setItemToSlot(
						crafttweaker.entity.IEntityEquipmentSlot.feet(), boots				
						# .transformDamage(5).items[0]
						);
				}
			}
		}
  }
}

# -------------------------------
# Hook on events
# -------------------------------
events.onEntityLivingFall(function(event as EntityLivingFallEvent){
  onEvent(event);

	// val e = event.entityLivingBase;
	// <minecraft:cobblestone>.createEntityItem(e.world, e.x, e.y, e.z);
});
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