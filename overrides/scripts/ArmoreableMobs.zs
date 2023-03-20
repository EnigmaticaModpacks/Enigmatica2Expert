import crafttweaker.item.IItemStack as IItemStack;
import mods.armoreablemobs.ArmorHandler;
import mods.armoreablemobs.ArmorEntity;
import mods.armoreablemobs.ArmorSlot;
import mods.armoreablemobs.ArmorGroup;
#modloaded armoreablemobs


# *======= Variables =======*

	#var draconicGroup = ArmorHandler.createArmorGroup("draconic", 0.01);
	#var wyvernGroup = ArmorHandler.createArmorGroup("wyvern", 0.02);
	var nuclearGroup = ArmorHandler.createArmorGroup("nuclear", 0.1);
	var mysticalGroup = ArmorHandler.createArmorGroup("mystical", 0.1);
	var twilightGroup = ArmorHandler.createArmorGroup("twilight", 0.15);
	var magicalGroup = ArmorHandler.createArmorGroup("magical", 0.15);
	var vanillaGroup = ArmorHandler.createArmorGroup("vanilla", 0.1);
	var energyGroup = ArmorHandler.createArmorGroup("energy", 0.1);
	var skeletonGroup = ArmorHandler.createArmorGroup("skeleton", 0.3);

# *======= Entities =======*

	var zombiePigman = ArmorHandler.createArmorEntity("minecraft:zombie_pigman").withNBTCheck("Health", 50.0, "GREATER");
	var zombie = ArmorHandler.createArmorEntity("minecraft:zombie").withNBTCheck("Health", 100.0, "LESS");
	var husk = ArmorHandler.createArmorEntity("minecraft:husk").withNBTCheck("Health", 40.0, "GREATER");
	var zombieStrong = ArmorHandler.createArmorEntity("minecraft:zombie").withNBTCheck("Health", 100.0, "GREATER");
	var zombieBoss = ArmorHandler.createArmorEntity("minecraft:zombie").withNBTCheck("Health", 200.0, "GREATER");
	var skeleton = ArmorHandler.createArmorEntity("minecraft:skeleton");
	var skeletonBoss = ArmorHandler.createArmorEntity("minecraft:skeleton").withNBTCheck("Health", 150.0, "GREATER");
	var stray = ArmorHandler.createArmorEntity("minecraft:stray").withNBTCheck("Health", 40.0, "GREATER");
	var strayBoss = ArmorHandler.createArmorEntity("minecraft:stray").withNBTCheck("Health", 200.0, "GREATER");
	var zombieVillager = ArmorHandler.createArmorEntity("minecraft:zombie_villager");
	var witherSkeleton = ArmorHandler.createArmorEntity("minecraft:wither_skeleton").withNBTCheck("Health", 35.0, "GREATER");
	var knight = ArmorHandler.createArmorEntity("emberroot:knight_fallen").withNBTCheck("Health", 50.0, "GREATER");
	
# *======= Weaponry =======*
	
	val weapons = [
	<minecraft:stone_sword>,
	<minecraft:iron_sword>,
	<minecraft:diamond_sword>,
	<mysticalagriculture:intermedium_sword>,
	<botania:elementiumsword>,
	<thermalfoundation:tool.sword_invar>,
	<thermalfoundation:tool.sword_platinum>,
	<twilightforest:fiery_sword>.withTag({ench: [{lvl: 2 as short, id: 20 as short}]}),
	<redstonearsenal:tool.sword_flux>.withTag({Energy: 320000}),
	<tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 0.51 as float, FreeModifiers: 3, Durability: 6, HarvestLevel: 0, Attack: 0.05 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.01 as float, FreeModifiers: 4, Durability: 506, HarvestLevel: 0, Attack: 1.05 as float}, Special: {Categories: ["tool", "weapon"]}, TinkerData: {UsedModifiers: 3, Materials: ["paper", "paper"], Modifiers: ["toolleveling", "knockback", "creative", "diamond"]}, Modifiers: [{identifier: "writable", color: -1, level: 2, writable2: 1 as byte, writable1: 1 as byte}, {identifier: "toolleveling", color: 16777215, level: 1, xp: 5, bonus_modifiers: 0}, {identifier: "knockback", current: 20, color: 10461087, level: 2, max: 20, extraInfo: "19 / 20"}, {identifier: "creative", color: 0, level: 3}, {identifier: "diamond", color: 9237730}], Traits: ["writable1", "writable2", "toolleveling", "knockback"]}),
	<tconstruct:broadsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 2.1 as float, FreeModifiers: 3, Durability: 481, HarvestLevel: 5, Attack: 8.0 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 2.1 as float, FreeModifiers: 2, Durability: 481, HarvestLevel: 5, Attack: 8.0 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["magmaslime", "magmaslime", "magmaslime"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "flammable", color: -27123, level: 1}, {identifier: "superheat", color: -27123, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["flammable", "superheat", "toolleveling"]}),
	<tconstruct:hammer>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.24 as float, FreeModifiers: 3, Durability: 1750, HarvestLevel: 1, Attack: 1.8 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 11.00701 as float, FreeModifiers: 3, Durability: 1750, HarvestLevel: 1, Attack: 1.8 as float}, Special: {Categories: ["tool", "harvest", "weapon"]}, TinkerData: {UsedModifiers: 1, Materials: ["slime", "slime", "slime", "slime"], Modifiers: ["toolleveling", "creative", "haste"]}, Modifiers: [{identifier: "slimey_green", color: -8206221, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "creative", color: 0, level: 2}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}], Traits: ["slimey_green", "toolleveling"]}),
	<tconstruct:hatchet>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.5 as float, FreeModifiers: 3, Durability: 168, HarvestLevel: 3, Attack: 6.7 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 12.073282 as float, FreeModifiers: 2, Durability: 168, HarvestLevel: 3, Attack: 6.7 as float}, Special: {Categories: ["aoe", "weapon", "harvest", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["prismarine", "prismarine", "prismarine"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "aquadynamic", color: -8462660, level: 1}, {identifier: "jagged", color: -8462660, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["aquadynamic", "jagged", "toolleveling"]}),
	<tconstruct:hatchet>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.6 as float, FreeModifiers: 3, Durability: 816, HarvestLevel: 3, Attack: 6.9 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 11.311658 as float, FreeModifiers: 2, Durability: 816, HarvestLevel: 3, Attack: 6.9 as float}, Special: {Categories: ["aoe", "weapon", "harvest", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["ruby", "ruby", "ruby"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "bloodymary", color: -43691, level: 1}, {identifier: "sharp", color: -43691, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["bloodymary", "sharp", "toolleveling"]}),
	<tconstruct:hatchet>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.8 as float, FreeModifiers: 3, Durability: 988, HarvestLevel: 6, Attack: 5.6 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 12.327148 as float, FreeModifiers: 2, Durability: 988, HarvestLevel: 6, Attack: 5.6 as float}, Special: {Categories: ["aoe", "weapon", "harvest", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["knightslime", "knightslime", "knightslime"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "unnatural", color: -946192, level: 1}, {identifier: "crumbling", color: -946192, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["unnatural", "crumbling", "toolleveling"]}),
	<tconstruct:kama>.withTag({ench: [{lvl: 1 as short, id: 21 as short}, {lvl: 1 as short, id: 35 as short}], StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 0.5 as float, FreeModifiers: 3, Durability: 125, HarvestLevel: 7, Attack: 11.1 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 0.5 as float, FreeModifiers: 3, Durability: 125, HarvestLevel: 7, Attack: 11.1 as float}, Special: {Categories: ["aoe", "weapon", "harvest", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["xu_demonic_metal", "xu_demonic_metal", "xu_demonic_metal"], Modifiers: ["toolleveling", "luck", "creative"]}, Modifiers: [{identifier: "xu_whispering", color: -6079744, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "luck", current: 66, color: 2970082, level: 2, max: 180, modifierUsed: 1 as byte, extraInfo: "65 / 180"}, {identifier: "creative", color: 0, level: 2}], Traits: ["xu_whispering", "toolleveling", "luck"]}),
	<tconstruct:mattock>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, HarvestLevelAxe: 7, MiningSpeed: 16.53 as float, FreeModifiers: 3, HarvestLevelShovel: 7, Durability: 3256, HarvestLevel: 7, Attack: 14.62 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, HarvestLevelAxe: 7, MiningSpeed: 21.12457 as float, FreeModifiers: 2, HarvestLevelShovel: 7, Durability: 3256, HarvestLevel: 7, Attack: 14.62 as float}, Special: {Categories: ["aoe", "harvest", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["ma.superium", "ma.superium", "ma.superium"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "prosperous", color: -16744485, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["prosperous", "toolleveling"]}),
	<tconstruct:kama>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.35 as float, FreeModifiers: 3, Durability: 341, HarvestLevel: 2, Attack: 4.6 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 12.792588 as float, FreeModifiers: 2, Durability: 341, HarvestLevel: 2, Attack: 4.6 as float}, Special: {Categories: ["aoe", "weapon", "harvest", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["ma.soulium", "ma.soulium", "ma.soulium"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "chunky", color: -11124169, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["chunky", "toolleveling"]}),
	<tconstruct:broadsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.2 as float, FreeModifiers: 3, Durability: 726, HarvestLevel: 5, Attack: 5.5 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 6.2 as float, FreeModifiers: 2, Durability: 726, HarvestLevel: 5, Attack: 5.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["pigiron", "pigiron", "pigiron"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "tasty", color: -1073509, level: 1}, {identifier: "baconlicious", color: -1073509, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["tasty", "baconlicious", "toolleveling"]}),
	<tconstruct:frypan>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 7.0 as float, FreeModifiers: 3, Durability: 700, HarvestLevel: 4, Attack: 6.2 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 7.0 as float, FreeModifiers: 1, Durability: 700, HarvestLevel: 4, Attack: 6.2 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["fluixcrystal_plustic", "fluixcrystal_plustic"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "portly", color: -2009268071, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}], Traits: ["portly", "toolleveling"]}),
	<tconstruct:rapier>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 7.0 as float, FreeModifiers: 3, Durability: 394, HarvestLevel: 7, Attack: 3.5 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 7.0 as float, FreeModifiers: 1, Durability: 394, HarvestLevel: 7, Attack: 3.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["xu_enchanted_metal", "xu_enchanted_metal", "xu_enchanted_metal"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "xu_xp_boost", color: -4197792, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}], Traits: ["xu_xp_boost", "toolleveling"]}),
	<tconstruct:battlesign>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 9.0 as float, FreeModifiers: 3, Durability: 405, HarvestLevel: 6, Attack: 10.0 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 9.0 as float, FreeModifiers: 1, Durability: 405, HarvestLevel: 6, Attack: 10.0 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["refinedglowstone", "refinedglowstone"], Modifiers: ["toolleveling", "haste"]}, Modifiers: [{identifier: "sassy", color: -171, level: 1}, {identifier: "illuminati", color: -171, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}], Traits: ["sassy", "illuminati", "toolleveling"]}),
	<tconstruct:cleaver>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.6 as float, FreeModifiers: 3, Durability: 1720, HarvestLevel: 4, Attack: 10.41 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 4.6 as float, FreeModifiers: 2, Durability: 1720, HarvestLevel: 4, Attack: 10.41 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["amber", "amber", "amber", "amber"], Modifiers: ["beheading_cleaver", "toolleveling", "creative", "haste"]}, Modifiers: [{identifier: "shocking", charge: 10.0 as float, color: -22016, level: 1, x: 100.0126747544041, y: 6.49390748022948, z: 85.70858240049272}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "creative", color: 0, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}], Traits: ["shocking", "toolleveling"]}),
	<tconstruct:longsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.1 as float, FreeModifiers: 3, Durability: 106, HarvestLevel: 2, Attack: 3.3 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 5.1 as float, FreeModifiers: 5, Durability: 106, HarvestLevel: 2, Attack: 3.3 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["livingwood_plustic", "livingwood_plustic", "livingwood_plustic"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{botanical2: 1 as byte, identifier: "botanical", botanical1: 1 as byte, color: -16733696, level: 3}, {identifier: "ecological", color: -16733696, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["botanical1", "ecological", "botanical2", "toolleveling"]}),
	<tconstruct:longsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.0 as float, FreeModifiers: 3, Durability: 2289, HarvestLevel: 4, Attack: 10.5 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 6.0 as float, FreeModifiers: 2, Durability: 2289, HarvestLevel: 4, Attack: 10.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["amethyst", "amethyst", "amethyst"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "apocalypse", color: -43521, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["apocalypse", "toolleveling"]}),
	<tconstruct:longsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 3.0 as float, FreeModifiers: 3, Durability: 496, HarvestLevel: 3, Attack: 7.5 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 3.0 as float, FreeModifiers: 2, Durability: 496, HarvestLevel: 3, Attack: 7.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["tanzanite", "tanzanite", "tanzanite"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "freezing", color: -43521, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["freezing", "toolleveling"]}),
	<tconstruct:longsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 3.23 as float, FreeModifiers: 3, Durability: 412, HarvestLevel: 5, Attack: 3.73 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 3.9719975 as float, FreeModifiers: 2, Durability: 518, HarvestLevel: 5, Attack: 4.2550097 as float}, Special: {Categories: ["weapon", "tool"], alienStatBonus: {identifier: "", color: 0, attack: 0.5249997 as float, durability: 106, speed: 0.742001 as float}, alienStatPool: {identifier: "", color: 16777215, attack: 1.334999 as float, durability: 269, speed: 1.8479984 as float}}, TinkerData: {UsedModifiers: 1, Materials: ["endstone", "endstone", "endstone"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "enderference", color: -2041712, level: 1}, {identifier: "alien", color: -2041712, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["enderference", "alien", "toolleveling"]}),
	<tconstruct:broadsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.8 as float, FreeModifiers: 3, Durability: 1020, HarvestLevel: 6, Attack: 6.5 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 6.8 as float, FreeModifiers: 2, Durability: 1020, HarvestLevel: 6, Attack: 6.5 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["alumite", "alumite", "alumite"], Modifiers: ["toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "global", color: -43691, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["global", "toolleveling"]}),
	<tconstruct:cleaver>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 9.0 as float, FreeModifiers: 3, Durability: 4422, HarvestLevel: 11, Attack: 11.45 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 9.0 as float, FreeModifiers: 2, Durability: 4422, HarvestLevel: 11, Attack: 11.45 as float}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 1, Materials: ["terrasteel", "terrasteel", "terrasteel", "terrasteel"], Modifiers: ["beheading_cleaver", "toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "mana", color: -11141291, level: 1}, {identifier: "terrafirma", color: -11141291, level: 3, terrafirma2: 1 as byte, terrafirma1: 1 as byte}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["mana", "terrafirma1", "terrafirma2", "toolleveling"]}),
	<tconstruct:cleaver>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 6.0 as float, FreeModifiers: 3, Durability: 1294, HarvestLevel: 10, Attack: 10.54 as float}, Stats: {AttackSpeedMultiplier: 1.2 as float, MiningSpeed: 6.8259974 as float, FreeModifiers: 2, Durability: 1409, HarvestLevel: 10, Attack: 11.110009 as float}, Special: {Categories: ["weapon", "tool"], alienStatBonus: {identifier: "", color: 0, attack: 0.49999967 as float, durability: 101, speed: 0.7140009 as float}, alienStatPool: {identifier: "", color: 16777215, attack: 1.4549989 as float, durability: 265, speed: 1.707999 as float}}, TinkerData: {UsedModifiers: 1, Materials: ["iridium", "iridium", "iridium", "iridium"], Modifiers: ["beheading_cleaver", "toolleveling", "haste", "creative"]}, Modifiers: [{identifier: "dense", color: -5592406, level: 1}, {identifier: "alien", color: -5592406, level: 1}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "haste", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "creative", color: 0, level: 1}], Traits: ["dense", "alien", "toolleveling"]})
	] as IItemStack[];
	
	for weapon in weapons {
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", weapon, 10, 0.02));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", weapon, 10, 0.02));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", weapon, 10, 0.02));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", weapon, 10, 0.02));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", weapon, 10, 0.02));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", weapon, 10, 0.02));
	}
	
# *======= Draconic =======*
/*
	draconicGroup.addArmor(ArmorHandler.createArmorSlot("head", <draconicevolution:draconic_helm>.withTag({Energy: 3200000}), 1, 0.0));
	draconicGroup.addArmor(ArmorHandler.createArmorSlot("chest", <draconicevolution:draconic_chest>.withTag({Energy: 3200000}), 1, 0.0));
	draconicGroup.addArmor(ArmorHandler.createArmorSlot("legs", <draconicevolution:draconic_legs>.withTag({Energy: 3200000}), 1, 0.0));
	draconicGroup.addArmor(ArmorHandler.createArmorSlot("feet", <draconicevolution:draconic_boots>.withTag({Energy: 3200000}), 1, 0.0));
	
	draconicGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", <draconicevolution:draconic_sword>.withTag({Energy: 3200000}), 1, 0.005));
	draconicGroup.addArmor(ArmorHandler.createArmorSlot("offhand", <draconicevolution:draconium_capacitor:1>, 1, 0.0005));

	draconicGroup.addEntity(zombie);
	draconicGroup.addEntity(zombieStrong);
	draconicGroup.addEntity(zombieBoss);
	draconicGroup.addEntity(knight);
	draconicGroup.addEntity(husk);
	draconicGroup.addEntity(witherSkeleton);
	draconicGroup.addEntity(zombiePigman);
	draconicGroup.addEntity(zombieVillager);
	
# *======= Wyvern =======*

	wyvernGroup.addArmor(ArmorHandler.createArmorSlot("head", <draconicevolution:wyvern_helm>.withTag({Energy: 1600000}), 1, 0.0));
	wyvernGroup.addArmor(ArmorHandler.createArmorSlot("chest", <draconicevolution:wyvern_chest>.withTag({Energy: 1600000}), 1, 0.0));
	wyvernGroup.addArmor(ArmorHandler.createArmorSlot("legs", <draconicevolution:wyvern_legs>.withTag({Energy: 1600000}), 1, 0.0));
	wyvernGroup.addArmor(ArmorHandler.createArmorSlot("feet", <draconicevolution:wyvern_boots>.withTag({Energy: 1600000}), 1, 0.0));
	
	wyvernGroup.addArmor(ArmorHandler.createArmorSlot("mainhand", <draconicevolution:wyvern_sword>.withTag({Energy: 1600000}), 1, 0.008));
	wyvernGroup.addArmor(ArmorHandler.createArmorSlot("offhand", <draconicevolution:draconium_capacitor>, 1, 0.0008));

	wyvernGroup.addEntity(zombie);
	wyvernGroup.addEntity(zombieStrong);
	wyvernGroup.addEntity(zombieBoss);
	wyvernGroup.addEntity(knight);
	wyvernGroup.addEntity(husk);
	wyvernGroup.addEntity(witherSkeleton);
	wyvernGroup.addEntity(zombiePigman);
	wyvernGroup.addEntity(zombieVillager);
*/

# *======= Twilight Armor =======*

	twilightGroup.addArmor(ArmorHandler.createArmorSlot("head", <twilightforest:ironwood_helmet>.withTag({ench: [{lvl: 1 as short, id: 6 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("chest", <twilightforest:ironwood_chestplate>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("legs", <twilightforest:ironwood_leggings>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("feet", <twilightforest:ironwood_boots>.withTag({ench: [{lvl: 1 as short, id: 2 as short}]}), 1, 0.25));

	twilightGroup.addArmor(ArmorHandler.createArmorSlot("head", <twilightforest:knightmetal_helmet>, 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("chest", <twilightforest:knightmetal_chestplate>, 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("legs", <twilightforest:knightmetal_leggings>, 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("feet", <twilightforest:knightmetal_boots>, 1, 0.25));

	twilightGroup.addArmor(ArmorHandler.createArmorSlot("head", <twilightforest:steeleaf_helmet>.withTag({ench: [{lvl: 2 as short, id: 4 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("chest", <twilightforest:steeleaf_chestplate>.withTag({ench: [{lvl: 2 as short, id: 3 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("legs", <twilightforest:steeleaf_leggings>.withTag({ench: [{lvl: 2 as short, id: 1 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("feet", <twilightforest:steeleaf_boots>.withTag({ench: [{lvl: 2 as short, id: 2 as short}]}), 1, 0.25));

	twilightGroup.addArmor(ArmorHandler.createArmorSlot("head", <twilightforest:fiery_helmet>, 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("chest", <twilightforest:fiery_chestplate>, 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("legs", <twilightforest:fiery_leggings>, 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("feet", <twilightforest:fiery_boots>, 1, 0.25));
	
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("head", <twilightforest:ironwood_helmet>.withTag({ench: [{lvl: 1 as short, id: 6 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("chest", <twilightforest:ironwood_chestplate>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("legs", <twilightforest:ironwood_leggings>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}), 1, 0.25));
	twilightGroup.addArmor(ArmorHandler.createArmorSlot("feet", <twilightforest:ironwood_boots>.withTag({ench: [{lvl: 1 as short, id: 2 as short}]}), 1, 0.25));
	
	twilightGroup.addEntity(zombie);
	twilightGroup.addEntity(zombieStrong);
	twilightGroup.addEntity(zombieBoss);
	twilightGroup.addEntity(knight);
	twilightGroup.addEntity(husk);
	twilightGroup.addEntity(witherSkeleton);
	twilightGroup.addEntity(zombiePigman);
	twilightGroup.addEntity(zombieVillager);

# *======= Mystical Agriculture Armor =======*
		
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("head", <mysticalagriculture:inferium_helmet>, 10, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <mysticalagriculture:inferium_chestplate>, 10, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <mysticalagriculture:inferium_leggings>, 10, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <mysticalagriculture:inferium_boots>, 10, 0.1));

	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("head", <mysticalagriculture:prudentium_helmet>, 7, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <mysticalagriculture:prudentium_chestplate>, 7, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <mysticalagriculture:prudentium_leggings>, 7, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <mysticalagriculture:prudentium_boots>, 7, 0.1));
		
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("head", <mysticalagriculture:intermedium_helmet>, 5, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <mysticalagriculture:intermedium_chestplate>, 5, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <mysticalagriculture:intermedium_leggings>, 5, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <mysticalagriculture:intermedium_boots>, 5, 0.1));

	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("head", <mysticalagriculture:superium_helmet>, 2, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <mysticalagriculture:superium_chestplate>, 2, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <mysticalagriculture:superium_leggings>, 2, 0.1));
	mysticalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <mysticalagriculture:superium_boots>, 2, 0.1));

	mysticalGroup.addEntity(zombie);
	mysticalGroup.addEntity(zombieStrong);
	mysticalGroup.addEntity(zombieBoss);
	mysticalGroup.addEntity(knight);
	mysticalGroup.addEntity(husk);
	mysticalGroup.addEntity(witherSkeleton);
	mysticalGroup.addEntity(zombiePigman);
	mysticalGroup.addEntity(zombieVillager);
		
# *======= Magical Armor =======*
		
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("head", <botania:manaweavehelm>, 10, 0.15));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <botania:manaweavechest>, 10, 0.15));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <botania:manaweavelegs>, 10, 0.15));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <botania:manaweaveboots>, 10, 0.15));

	magicalGroup.addArmor(ArmorHandler.createArmorSlot("head", <psi:psimetal_exosuit_helmet>, 5, 0.05));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <psi:psimetal_exosuit_chestplate>, 5, 0.05));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <psi:psimetal_exosuit_leggings>, 5, 0.05));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <psi:psimetal_exosuit_boots>, 5, 0.05));
		
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("head", <botania:manasteelhelm>, 10, 0.1));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <botania:manasteelchest>, 10, 0.1));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <botania:manasteellegs>, 10, 0.1));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <botania:manasteelboots>, 10, 0.1));

	magicalGroup.addArmor(ArmorHandler.createArmorSlot("head", <botania:elementiumhelm>, 4, 0.01));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <botania:elementiumchest>, 4, 0.01));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <botania:elementiumlegs>, 4, 0.01));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <botania:elementiumboots>, 4, 0.01));

	magicalGroup.addArmor(ArmorHandler.createArmorSlot("head", <botania:terrasteelhelm>, 1, 0.003));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("chest", <botania:terrasteelchest>, 1, 0.003));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("legs", <botania:terrasteellegs>, 1, 0.003));
	magicalGroup.addArmor(ArmorHandler.createArmorSlot("feet", <botania:terrasteelboots>, 1, 0.003));
	
	magicalGroup.addEntity(zombie);
	magicalGroup.addEntity(zombieStrong);
	magicalGroup.addEntity(zombieBoss);
	magicalGroup.addEntity(knight);
	magicalGroup.addEntity(husk);
	magicalGroup.addEntity(witherSkeleton);
	magicalGroup.addEntity(zombiePigman);
	magicalGroup.addEntity(zombieVillager);
	
# *======= NuclearCraft Armor =======*

	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("head", <nuclearcraft:helm_boron>, 10, 0.2));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("chest", <nuclearcraft:chest_boron>, 10, 0.2));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("legs", <nuclearcraft:legs_boron>, 10, 0.2));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("feet", <nuclearcraft:boots_boron>, 10, 0.2));

	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("head", <nuclearcraft:helm_tough>, 8, 0.04));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("chest", <nuclearcraft:chest_tough>, 8, 0.04));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("legs", <nuclearcraft:legs_tough>, 8, 0.04));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("feet", <nuclearcraft:boots_tough>, 8, 0.04));
		
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("head", <nuclearcraft:helm_hard_carbon>, 4, 0.01));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("chest", <nuclearcraft:chest_hard_carbon>, 4, 0.01));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("legs", <nuclearcraft:legs_hard_carbon>, 4, 0.01));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("feet", <nuclearcraft:boots_hard_carbon>, 4, 0.01));

	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("head", <nuclearcraft:helm_boron_nitride>, 3, 0.001));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("chest", <nuclearcraft:chest_boron_nitride>, 3, 0.001));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("legs", <nuclearcraft:legs_boron_nitride>, 3, 0.001));
	nuclearGroup.addArmor(ArmorHandler.createArmorSlot("feet", <nuclearcraft:boots_boron_nitride>, 3, 0.001));

	nuclearGroup.addEntity(zombie);
	nuclearGroup.addEntity(zombieStrong);
	nuclearGroup.addEntity(zombieBoss);
	nuclearGroup.addEntity(knight);
	nuclearGroup.addEntity(husk);
	nuclearGroup.addEntity(witherSkeleton);
	nuclearGroup.addEntity(zombiePigman);
	nuclearGroup.addEntity(zombieVillager);
	
# *======= Vanilla Armor =======*
		
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("head", <minecraft:leather_helmet>, 1, 0.5));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("chest", <minecraft:leather_chestplate>, 1, 0.5));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("legs", <minecraft:leather_leggings>, 1, 0.5));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("feet", <minecraft:leather_boots>, 1, 0.5));

	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("head", <minecraft:iron_helmet>, 1, 0.2));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("chest", <minecraft:iron_chestplate>, 1, 0.2));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("legs", <minecraft:iron_leggings>, 1, 0.2));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("feet", <minecraft:iron_boots>, 1, 0.2));

	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("head", <minecraft:golden_helmet>, 1, 0.1));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("chest", <minecraft:golden_chestplate>, 1, 0.1));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("legs", <minecraft:golden_leggings>, 1, 0.1));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("feet", <minecraft:golden_boots>, 1, 0.1));

	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("head", <minecraft:diamond_helmet>, 1, 0.025));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("chest", <minecraft:diamond_chestplate>, 1, 0.025));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("legs", <minecraft:diamond_leggings>, 1, 0.025));
	vanillaGroup.addArmor(ArmorHandler.createArmorSlot("feet", <minecraft:diamond_boots>, 1, 0.025));
	
	vanillaGroup.addEntity(zombie);
	vanillaGroup.addEntity(zombieStrong);
	vanillaGroup.addEntity(zombieBoss);
	vanillaGroup.addEntity(knight);
	vanillaGroup.addEntity(husk);
	vanillaGroup.addEntity(witherSkeleton);
	vanillaGroup.addEntity(zombiePigman);
	vanillaGroup.addEntity(zombieVillager);
	
# *======= Energy Armor =======*
		
	energyGroup.addArmor(ArmorHandler.createArmorSlot("head", <immersiveengineering:faraday_suit_head>, 10, 0.1));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("chest", <immersiveengineering:faraday_suit_chest>, 10, 0.1));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("legs", <immersiveengineering:faraday_suit_legs>, 10, 0.1));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("feet", <immersiveengineering:faraday_suit_feet>, 10, 0.1));

	energyGroup.addArmor(ArmorHandler.createArmorSlot("head", <ic2:nano_helmet>, 5, 0.05));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("chest", <ic2:nano_chestplate>, 5, 0.05));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("legs", <ic2:nano_leggings>, 5, 0.05));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("feet", <ic2:nano_boots>, 5, 0.05));

	energyGroup.addArmor(ArmorHandler.createArmorSlot("head", <redstonearsenal:armor.helmet_flux>, 3, 0.04));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("chest", <redstonearsenal:armor.plate_flux>, 3, 0.04));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("legs", <redstonearsenal:armor.legs_flux>, 3, 0.04));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("feet", <redstonearsenal:armor.boots_flux>, 3, 0.04));

	energyGroup.addArmor(ArmorHandler.createArmorSlot("head", <ic2:quantum_helmet>, 1, 0.01));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("chest", <ic2:quantum_chestplate>, 1, 0.01));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("legs", <ic2:quantum_leggings>, 1, 0.01));
	energyGroup.addArmor(ArmorHandler.createArmorSlot("feet", <ic2:quantum_boots>, 1, 0.01));

	energyGroup.addEntity(zombie);
	energyGroup.addEntity(zombieStrong);
	energyGroup.addEntity(zombieBoss);
	energyGroup.addEntity(knight);
	energyGroup.addEntity(husk);
	energyGroup.addEntity(witherSkeleton);
	energyGroup.addEntity(zombiePigman);
	energyGroup.addEntity(zombieVillager);
	
# *======= Skeleton Armor =======*

	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("head", <ic2:nano_helmet>, 5, 0.05));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("chest", <ic2:nano_chestplate>, 5, 0.05));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("legs", <ic2:nano_leggings>, 5, 0.05));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("feet", <ic2:nano_boots>, 5, 0.05));

	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("head", <redstonearsenal:armor.helmet_flux>, 3, 0.04));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("chest", <redstonearsenal:armor.plate_flux>, 3, 0.04));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("legs", <redstonearsenal:armor.legs_flux>, 3, 0.04));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("feet", <redstonearsenal:armor.boots_flux>, 3, 0.04));

	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("head", <ic2:quantum_helmet>, 1, 0.01));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("chest", <ic2:quantum_chestplate>, 1, 0.01));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("legs", <ic2:quantum_leggings>, 1, 0.01));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("feet", <ic2:quantum_boots>, 1, 0.01));
	
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("head", <botania:terrasteelhelm>, 1, 0.003));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("chest", <botania:terrasteelchest>, 1, 0.003));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("legs", <botania:terrasteellegs>, 1, 0.003));
	skeletonGroup.addArmor(ArmorHandler.createArmorSlot("feet", <botania:terrasteelboots>, 1, 0.003));
	
	skeletonGroup.addEntity(skeleton);
	skeletonGroup.addEntity(skeletonBoss);
	skeletonGroup.addEntity(stray);
	skeletonGroup.addEntity(strayBoss);

		