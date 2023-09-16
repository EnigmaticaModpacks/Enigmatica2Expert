/*

Copy Beheading enchantment behaviour (Cyclic) for TCon tools.

https://github.com/Lothrazar/Cyclic/blob/trunk/1.12/src/main/java/com/lothrazar/cyclicmagic/enchant/EnchantBeheading.java

*/

#reloadable

import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.item.IItemStack;

static entityToSkin as string[IEntityDefinition] = {
  <entity:minecraft:blaze>         : "MHF_Blaze",
  <entity:minecraft:cave_spider>   : "MHF_CaveSpider",
  <entity:minecraft:chicken>       : "MHF_Chicken",
  <entity:minecraft:cow>           : "MHF_Cow",
  <entity:minecraft:elder_guardian>: "MHF_Guardian",
  <entity:minecraft:enderman>      : "MHF_Enderman",
  <entity:minecraft:endermite>     : "MHF_Endermite",
  <entity:minecraft:ghast>         : "MHF_Ghast",
  <entity:minecraft:guardian>      : "MHF_Guardian",
  <entity:minecraft:iron_golem>    : "MHF_Golem",
  <entity:minecraft:magma_cube>    : "MHF_LavaSlime",
  <entity:minecraft:mooshroom>     : "MHF_MushroomCow",
  <entity:minecraft:ocelot>        : "MHF_Ocelot",
  <entity:minecraft:pig>           : "MHF_Pig",
  <entity:minecraft:pig_zombie>    : "MHF_PigZombie",
  <entity:minecraft:sheep>         : "MHF_Sheep",
  <entity:minecraft:silverfish>    : "MHF_Silverfish",
  <entity:minecraft:slime>         : "MHF_Slime",
  <entity:minecraft:snowman>       : "MHF_SnowGolem",
  <entity:minecraft:spider>        : "MHF_Spider",
  <entity:minecraft:squid>         : "MHF_Squid",
  <entity:minecraft:villager>      : "MHF_Villager",
  <entity:minecraft:witch>         : "MHF_Witch",
  <entity:minecraft:wither>        : "MHF_Wither",
  <entity:minecraft:wolf>          : "MHF_Wolf",
} as string[IEntityDefinition];

static entityToTag as string[][IEntityDefinition] = {
  <entity:minecraft:zombie_villager>: ["Zombie Villager Head", "af249a67-e184-4c02-8b72-521fbcd89686", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvY2ZmMDQ4MmZkMzJmYWIyY2U5ZjVmYTJlMmQ5YjRkYzc1NjFkYTQyMjE1MmM5OWZjODA0YjkxMzljYWYyNTZiIn19fQ=="],
  <entity:minecraft:vindicator>     : ["Vindicator Head"     , "06505ad7-5132-4ba9-a6c1-af81d06be308", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTAwZDNmZmYxNmMyZGNhNTliOWM1OGYwOTY1MjVjODY5NzExNjZkYmFlMTMzYjFiMDUwZTVlZTcxNjQ0MyJ9fX0="],
  <entity:minecraft:evoker>         : ["Evoker Head"         , "08e26a19-3672-4356-b21d-d9e831145279", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTAwZDNmZmYxNmMyZGNhNTliOWM1OGYwOTY1MjVjODY5NzExNjZkYmFlMTMzYjFiMDUwZTVlZTcxNjQ0MyJ9fX0="],
  <entity:minecraft:shulker>        : ["Shulker Head"        , "478e38c8-47e5-4d23-b094-b232e7126521", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDhmYjk2YmY0YTlhMzFiMjU1MzhiNzEyMTdkYThiNjM0ZThjMDVkNGMzNWE2YWI4N2FjYjM3ZjkzYTZmMmMifX19"],
  <entity:minecraft:rabbit>         : ["Rabbit Head"         , "e11c58cf-fbcc-4c27-9b8d-90fbb1994e41", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZGM3YTMxN2VjNWMxZWQ3Nzg4Zjg5ZTdmMWE2YWYzZDJlZWI5MmQxZTk4NzljMDUzNDNjNTdmOWQ4NjNkZTEzMCJ9fX0="],
  <entity:minecraft:polarBear>      : ["Polar Bear Head"     , "c7ed0da7-c4fb-4cea-97d9-3b21c1716970", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDQ2ZDIzZjA0ODQ2MzY5ZmEyYTM3MDJjMTBmNzU5MTAxYWY3YmZlODQxOTk2NjQyOTUzM2NkODFhMTFkMmIifX19"],
  <entity:minecraft:llama>          : ["Llama Head"          , "6e5f307d-0a67-4736-8060-7baa2df1877e", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNGNmMWIzYjNmNTM5ZDJmNjNjMTcyZTk0Y2FjZmFhMzkxZThiMzg1Y2RkNjMzZjNiOTkxYzc0ZTQ0YjI4In19fQ=="],
  <entity:minecraft:bat>            : ["Bat Head"            , "04eec3c8-a65b-496a-8b20-0fbfe3f352ec", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzJiMWVjZmY3N2ZmZTNiNTAzYzMwYTU0OGViMjNhMWEwOGZhMjZmZDY3Y2RmZjM4OTg1NWQ3NDkyMTM2OCJ9fX0="],
  <entity:minecraft:horse>          : ["Horse Head"          , "31ca5a99-7f0e-4251-85bf-b1003ca6f86a", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjE5MDI4OTgzMDg3MzBjNDc0NzI5OWNiNWE1ZGE5YzI1ODM4YjFkMDU5ZmU0NmZjMzY4OTZmZWU2NjI3MjkifX19"],
  <entity:minecraft:skeleton_horse> : ["Horse Head"          , "31ca5a99-7f0e-4251-85bf-b1003ca6f86a", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjE5MDI4OTgzMDg3MzBjNDc0NzI5OWNiNWE1ZGE5YzI1ODM4YjFkMDU5ZmU0NmZjMzY4OTZmZWU2NjI3MjkifX19"],
  <entity:minecraft:zombie_horse>   : ["Horse Head"          , "31ca5a99-7f0e-4251-85bf-b1003ca6f86a", "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjE5MDI4OTgzMDg3MzBjNDc0NzI5OWNiNWE1ZGE5YzI1ODM4YjFkMDU5ZmU0NmZjMzY4OTZmZWU2NjI3MjkifX19"],
} as string[][IEntityDefinition];

events.onEntityLivingDeathDrops(function(e as crafttweaker.event.EntityLivingDeathDropsEvent) {
  if(e.entity.world.remote) return;

  // Check if this entity is living
  if(!(e.entity instanceof IEntityLivingBase)) return;
  val entity as IEntityLivingBase = e.entity;
  if(isNull(entity.definition)) return;

  // Check if killer have tools
  if(
    isNull(e.damageSource.trueSource)
    || isNull(e.damageSource.trueSource.heldEquipment)
    || e.damageSource.trueSource.heldEquipment.length <= 0
  ) return;
  val equipmentList = e.damageSource.trueSource.heldEquipment;

  // Check if dead entity is in list
  val skinName = entityToSkin[entity.definition];
  var skinTags as string[] = null;
  if (isNull(skinName)) skinTags = entityToTag[entity.definition];
  if (isNull(skinName) && isNull(skinTags)) return;

  // Compute beheading level
  var beheadingLevel = 0;
  for i, tool in equipmentList {
    if(isNull(tool)) continue;
    if (
      tool.definition.owner != "tconstruct"
      || isNull(tool.tag)
      || isNull(tool.tag.Modifiers)
    ) continue;

    for i, modifier in tool.tag.Modifiers.asList() {
      if(
        isNull(modifier.identifier)
        || isNull(modifier.level)
        || (modifier.identifier.asString() != 'beheading'
        && modifier.identifier.asString() != 'beheading_cleaver')
      ) continue;
      beheadingLevel += modifier.level.asInt();
    }
  }

  // Roll random
  if (beheadingLevel <= 0) return;
  if (e.entity.world.random.nextInt(10) > beheadingLevel) return;

  // Add head to drop list
  if (!isNull(skinName)) {
    e.addItem(<minecraft:skull:3>.withTag({SkullOwner: skinName}));
  } else {
    e.addItem(<minecraft:skull:3>.withTag({
      display: {Name: skinTags[0]},
      SkullOwner: {
        Id: skinTags[1],
        Properties: {textures: [{Value: skinTags[2]}]},
    }}));
  }
});
