#modloaded jei

#priority -1

/*

Configure your tool, by giving yourself bone with NBT tag.
use command:

/give @p bone 1 0 {style: "tags_with_spaced_between"}

Avaliable style tags:

noFancy       : No item names and comments
noPretty      : No spaces in grid
noTrail       : No trailing comma in ingredients map
noBucket      : No transforming <forge:bucketfilled> into global Bucket()
noTransformers: No .anyDamage() if ingredient can have damage
noOre         : Not replace ingredients with OreDict entries
firstOre      : Only use first OreDict entry if there is many
dense         : Always pack recipe in one line
noRemove      : No additional "remove: <...>" line in ingredients if MC have
                other recipes for same item, but with anoter amount

*/


val toolItem = itemUtils.getItem(scripts.craft.helper.helper.toolItemID);
mods.jei.JEI.addItem(toolItem.withTag({
  style: "noFancy noPretty noBucket noTrail noTransformers noRemove noOre",

  ench:[{lvl:1,id:0}], // Add enchant glow
  enchantmentColor:16711680, // Random Things can change color with this tag
  display:{Name:"Bone §b(no styles)"},
}));