
/* 
Taken from: wilderness-minecraft
https://github.com/badmonkey/wilderness-minecraft/blob/f32102d158566de9d346034b35c2f6226d369ff9/forge1.12/wilderness/scripts/content/traits_conarm.zs
*/

#loader contenttweaker
#modloaded conarm
#priority 101
//
// Conarm traits
//
import mods.contenttweaker.conarm.ArmorTraitBuilder;


//
// antimagic
//
val antimagic = mods.contenttweaker.conarm.ArmorTraitBuilder.create("antimagic");
antimagic.color = 0x000000;
antimagic.localizedName = "Anti-Magic";
antimagic.localizedDescription = "\u00a7oNihilistic!\n\u00a7rYour armor doesn't believe in potions, and refuses to be affected by any potion effects; good or bad.";
antimagic.onHurt = function(trait, armor, player, source, damage, newDamage, evt)
{
    if(armor.damage < armor.maxDamage && source.isMagicDamage())
    {
        evt.cancel();
    }
    return newDamage;
};
antimagic.onArmorTick = function(trait, armor, world, player)
{
    player.clearActivePotions();
};
antimagic.register();


//
// blindfaith
//
val faith = mods.contenttweaker.conarm.ArmorTraitBuilder.create("blindfaith");
faith.color = 0x000000;
faith.localizedName = "Blind Faith";
faith.localizedDescription = "\u00a7oTrust us...\n\u00a7rYou gain a complete immunity to damage (not knockback) when blinded.";
faith.onHurt = function(trait, armor, player, source, damage, newDamage, evt)
{
    if(player.isPotionActive(<potion:minecraft:blindness>))
    {
        evt.cancel();
    }
    return newDamage;
};
faith.register();


//
// darkside
//
val darkdefense = mods.contenttweaker.conarm.ArmorTraitBuilder.create("darkside");
darkdefense.color = 0x332c3b;
darkdefense.localizedName = "The Dark Side";
darkdefense.localizedDescription = "\u00a7oUnder the cover of darkness!\n\u00a7rYour armor loves the dark so much; you take less damage when in darkness.";
darkdefense.onHurt = function(trait, armor, player, source, damage, newDamage, event)
{
    return newDamage*(0.75+0.25*player.world.getBrightness(player.x, player.y, player.z)/15);
};
darkdefense.register();