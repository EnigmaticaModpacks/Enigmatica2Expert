import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

print("--- loading Equipment.zs ---");

for item in [
	"enderio:item_dark_steel_sword",
	"enderio:item_travel_staff",
	"cyclicmagic:book_ender"
] as string[] {
	mods.ltt.LootTable.removeGlobalItem(item);
}


# ######################################################################
#
# Exchangers + gadgets
#
# ######################################################################

<ore:exchangersCoresTier3>.add(
	<exchangers:te_exchanger_core_tier3>,
	<exchangers:ie_exchanger_core_tier3>,
	<exchangers:mekanism_exchanger_core_tier3>
);

////////////////////////////////////
// Change gadgets
function gadgetCraft(name as string, item as IItemStack, matPrimary as IIngredient){
	recipes.addShaped(name, item, [
		[<ore:ingotIron>, matPrimary, <ore:ingotIron>], 
		[<ore:gemDiamond>, <ore:exchangersCoresTier3>, <ore:gemDiamond>], 
		[<ore:ingotIron>, <ore:gemLapis>, <ore:ingotIron>]
	]);
}

recipes.remove(<buildinggadgets:buildingtool>);
recipes.remove(<buildinggadgets:copypastetool>);
recipes.remove(<buildinggadgets:destructiontool>);
recipes.remove(<buildinggadgets:exchangertool>);
gadgetCraft("buildinggadgets_buildingtool",    <buildinggadgets:buildingtool>.withTag({blockstate: {Name: "minecraft:air"}}), 
	<openblocks:guide>);
gadgetCraft("buildinggadget_copypastetool",   <buildinggadgets:copypastetool>.withTag({mode: "Copy"}), 
	<cyclicmagic:builder_pattern>);
gadgetCraft("buildinggadgets_destructiontool", <buildinggadgets:destructiontool>.withTag({overlay: 1 as byte, fuzzy: 1 as byte}), 
	<cyclicmagic:trash>);
gadgetCraft("buildinggadgets_exchangingtool",  <buildinggadgets:exchangertool>.withTag({blockstate: {Name: "minecraft:air"}}), 
	<cyclicmagic:tool_swap>);


# ######################################################################
#
# Misc
#
# ######################################################################

# Time in bottle
remake("randomthings_timeinabottle", <randomthings:timeinabottle>, [
	[null, <animania:milk_bottle>, null], 
	[<rats:little_black_squash_balls>, <minecraft:clock>, <rats:little_black_squash_balls>], 
	[<animania:milk_bottle>, <extrautils2:klein>, <animania:milk_bottle>]
]);

# Khopesh
remake("animus_kama_diamond", <animus:kama_diamond>, [
	[null, <ore:gemDiamond>, null], 
	[<ore:gemDiamond>, null, <ore:blockDiamond>], 
	[null, null, <forestry:oak_stick>]
]);



# Atomic disassembler
recipes.removeShaped(<mekanism:atomicdisassembler>);
var anyDragonsteelRod = <tconstruct:tough_tool_rod>.withTag({Material: "dragonsteel_ice"}) |
												<tconstruct:tough_tool_rod>.withTag({Material: "dragonsteel_fire"});
recipes.addShaped(<mekanism:atomicdisassembler>, [
	[<ore:ingotPlatinum>, <mekanism:tierinstaller:2>, <ore:ingotPlatinum>], 
	[<ore:ingotPlatinum>, anyDragonsteelRod, null], 
	[null, anyDragonsteelRod, null]
]);

# Effortless Building
remakeEx(<effortlessbuilding:reach_upgrade1>, [
	[<tconstruct:slime_congealed>, <rats:psionic_rat_brain>, <tconstruct:slime_congealed>], 
	[<tconstruct:slime_congealed>, <ore:ballVibrantAlloy>, <tconstruct:slime_congealed>], 
	[<tconstruct:slime_congealed>, <exchangers:ie_exchanger_core_tier3>, <tconstruct:slime_congealed>]
]);
remakeEx(<effortlessbuilding:reach_upgrade2>, [
	[<tconstruct:slime_congealed:4>, <ore:blockFireDragonsteel> | <ore:blockIceDragonsteel>, <tconstruct:slime_congealed:4>], 
	[<tconstruct:slime_congealed:4>, <effortlessbuilding:reach_upgrade1>, <tconstruct:slime_congealed:4>], 
	[<tconstruct:slime_congealed:4>, <exchangers:mekanism_exchanger_core_tier3>, <tconstruct:slime_congealed:4>]
]);
remakeEx(<effortlessbuilding:reach_upgrade3>, [
	[<tconstruct:slime_congealed:2>, <scalinghealth:difficultychanger:1>, <tconstruct:slime_congealed:2>], 
	[<tconstruct:slime_congealed:2>, <effortlessbuilding:reach_upgrade2>, <tconstruct:slime_congealed:2>], 
	[<tconstruct:slime_congealed:2>, <exchangers:te_exchanger_core_tier3>, <tconstruct:slime_congealed:2>]
]);

# Night goggles
recipes.remove(<conarm:travel_night>);
recipes.addShapeless(<conarm:travel_night>, [<conarm:travel_goggles_base>, <ic2:nightvision_goggles:26>.anyDamage()]);
recipes.addShapeless(<conarm:travel_night>, [<conarm:travel_goggles_base>, <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:enabled": 1 as byte})]);
recipes.addShapeless(<conarm:travel_night>, [<conarm:travel_goggles_base>, <mysticalagriculture:charm:1>]);

# Soul goggles
remakeEx(<conarm:travel_soul>, [
	[null, <rats:ratlantean_flame>, null], 
	[<ore:ingotRefinedGlowstone>, <conarm:travel_goggles_base>, <ore:ingotRefinedGlowstone>], 
	[null, <rats:ratlantean_flame>, null]
]);

# Goggles base
remakeEx(<conarm:travel_goggles_base>, [
	[<ore:string>, <rats:rat_toga>, <ore:string>], 
	[<ore:blockGlassColorless>, <ore:string>, <ore:blockGlassColorless>], 
	[null, null, null]
]);

# gauntlet base
remakeEx(<conarm:gauntlet_mat>, [
	[null, null, <ore:deathwormChitin>], 
	[<ore:ingotIron>, <ore:ingotIron>, <ore:deathwormChitin>], 
	[null, <ore:deathwormChitin>, <ore:deathwormChitin>]
]);

# Travel sack
remakeEx(<conarm:travel_sack>, [
	[<rats:rat_toga>, <minecraft:rabbit_hide>, <rats:rat_toga>], 
	[<minecraft:rabbit_hide>, <actuallyadditions:block_giant_chest>, <minecraft:rabbit_hide>], 
	[<minecraft:rabbit_hide>, <minecraft:rabbit_hide>, <minecraft:rabbit_hide>]
]);


//Item won't be consumed and will stay in the grid
# transformedItem = item.reuse();

#recipes.remove(<effortlessbuilding:reach_upgrade1>);
/* 
recipes.addShapeless("effortlessbuilding_reach_upgrade1", 
    <effortlessbuilding:reach_upgrade1>.withLore(["Consume 1 Minute from bottle"]), [
    
    <randomthings:timeinabottle>
        .marked("timeinabottle")
        .transformNew(function(item) {
			return item.updateTag({timeData: {storedTime: item.tag.timeData.storedTime - 20*60}});
        }),
    <minecraft:book>], 
    
    function(out, ins, cInfo) {
        if(ins.timeinabottle.tag.timeData.storedTime >= 20*60) {
            return <effortlessbuilding:reach_upgrade1>;
        }
        return null;
    }, 
    null);
*/

print("--- end of Equipment.zs ---");