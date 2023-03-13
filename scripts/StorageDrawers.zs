import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.ITooltipFunction;
import crafttweaker.recipes.IRecipeFunction;
#modloaded storagedrawers


# *======= Recipes =======*

# Drawer Controller
	recipes.remove(<storagedrawers:controller>);
	recipes.addShaped("Drawer Controller", 
	<storagedrawers:controller>, 
	[[<ic2:resource:11>, <ic2:resource:11>, <ic2:resource:11>],
	[<immersiveengineering:metal_decoration0:3>, <ore:drawerBasic>, <immersiveengineering:metal_decoration0:3>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <ore:gemDiamond>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Drawer 1x1
	recipes.addShapedMirrored("Drawer 1x1",
	<storagedrawers:basicdrawers>, 
	[[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
	[null, <ore:chest>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
	
# Drawer 1x2
	recipes.addShapedMirrored("Drawer 1x2",
	<storagedrawers:basicdrawers:1> * 2, 
	[[<ore:plankWood>, <ore:chest>, <ore:plankWood>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:plankWood>, <ore:chest>, <ore:plankWood>]]);

# Drawer 2x2
	recipes.addShapedMirrored("Drawer 2x2", 
	<storagedrawers:basicdrawers:2> * 4, 
	[[<ore:chest>, <ore:plankWood>, <ore:chest>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:chest>, <ore:plankWood>, <ore:chest>]]);

# Half Drawer 1x2
	recipes.addShapedMirrored("Half Drawer 1x2", 
	<storagedrawers:basicdrawers:3> * 2, 
	[[<ore:slabWood>, <ore:chest>, <ore:slabWood>],
	[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>], 
	[<ore:slabWood>, <ore:chest>, <ore:slabWood>]]);

# Half Drawer 2x2
	recipes.addShapedMirrored("Half Drawer 2x2", 
	<storagedrawers:basicdrawers:4> * 4, 
	[[<ore:chest>, <ore:slabWood>, <ore:chest>],
	[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>], 
	[<ore:chest>, <ore:slabWood>, <ore:chest>]]);

# Trim
	recipes.addShapedMirrored("Trim", 
	<storagedrawers:trim> * 4, 
	[[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>]]);

# [Creative Storage Upgrade] from [Black Hole Unit][+3]
craft.remake(<storagedrawers:upgrade_creative>, ["pretty",
  "# S #",
  "U B U",
  "# S #"], {
  "B": <industrialforegoing:black_hole_unit>, # Black Hole Unit
  "#": <ore:stickWood>,                       # Stick
  "S": <storagedrawers:upgrade_storage:3>,    # Storage Upgrade (IV)
  "U": <storagedrawers:upgrade_template>      # Upgrade Template
});


# Upgrades
function remakeDrawerUpgrade(item as IItemStack, primary as IIngredient){
	recipes.remove(item);
	recipes.addShaped(item, [
		[primary, <ore:stickWood>, primary],
		[<ore:stickWood>, <storagedrawers:upgrade_template>, <ore:stickWood>],
		[primary, <ore:stickWood>, primary]]);
}

remakeDrawerUpgrade(<storagedrawers:upgrade_storage:0>, <ore:nuggetLead>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:1>, <ore:nuggetDarkSteel>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:2>, <ore:nuggetCrystaltine>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:3>, <actuallyadditions:item_crystal_empowered:4>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:4>, <ore:crystalLitherite>);


#----------------------------------------------------------------
# Add Sealed content Tooltip
static empty as string = '§8Empty§r';

# Drawer sealed content
function sealed(name as string) as string {
	if(isNull(name)) return empty;
	return "§2Sealed: §a" ~ name ~ '§r';
}

function firstItemInList(data as IData) as string {
	if(isNull(data) || isNull(data.asList())) return empty;

	for itemStorage in data.asList() {
		val itemData = itemStorage.Item;
		if(isNull(itemData) || isNull(itemData.id)) continue;
		val id = itemData.id.asString();
		val meta = isNull(itemData.Damage) ? 0 : itemData.Damage.asInt();
		val item = itemUtils.getItem(id, meta);
		if(!isNull(item)) return item.displayName;
	}
	return empty;
}

// Basic Drawers
val basicDrawerTooltip as ITooltipFunction = function(item) {
	return sealed(firstItemInList(D(item.tag).get("tile.Drawers")));
};
<storagedrawers:basicdrawers:*>.addAdvancedTooltip(basicDrawerTooltip);
<storagedrawers:customdrawers:*>.addAdvancedTooltip(basicDrawerTooltip);


// Compact Drawers
val compactDrawerTooltip as ITooltipFunction = function(item) {
	return sealed(firstItemInList(D(item.tag).get("tile.Drawers.Items")));
};
<storagedrawers:compdrawers>.addAdvancedTooltip(compactDrawerTooltip);
#----------------------------------------------------------------


//Frame drawers without a framing table
//All hail Eutro 
val framingMaterial as IIngredient = <*>.only(function(stack as IItemStack) as bool {
    if(!stack.isItemBlock) {
        return false;
    }
    return stack.asBlock().definition.getStateFromMeta(stack.metadata).opaqueCube;
});

val customDrawerOut = <storagedrawers:customdrawers>.withTag({
    display: {
        Name: "§6Frame your drawers by hand!",
        Lore: [
            "§cTop left: sides",
            "§aTop middle: trim",
            "§9Middle left: front"
        ]
    },
    MatS: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 14 as short
    },
	MatT: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 5 as short
    },
	MatF: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 11 as short
    }
});

val dummyItem = <minecraft:barrier>.withTag({
	display: {
        Name: "This is an example recipe",
        Lore: [
            "This item is here to prevent conflicts with the real recipes.",
            "Just ignore it."
        ]
    }
});

function asData(stack as IItemStack) as IData {
    return {
        id: stack.definition.id,
        Count: 1 as byte,
        Damage: stack.metadata
    } as IData;
}

<ore:handFramedThree>.add(<storagedrawers:customdrawers:*>,
                          <framedcompactdrawers:framed_drawer_controller>, // remove these three if you don't have Framed Compacting Drawers
                          <framedcompactdrawers:framed_compact_drawer>,
                          <framedcompactdrawers:framed_slave>);

<ore:handFramed>.addAll(<ore:handFramedThree>);
<ore:handFramed>.add(<storagedrawers:customtrim>);

for side in [true, false] as bool[] {
	for front in [true, false] as bool[] {
		for trim in [true, false] as bool[] {
			if !side && !front && !trim continue;
			val ingredients as IIngredient[][] = [
				[
					side ? framingMaterial.marked("MatS") : null,
					trim ? framingMaterial.marked("MatT") : null
				],
				[
					front ? framingMaterial.marked("MatF") : null,
					(front ? <ore:handFramedThree> : <ore:handFramed>).marked("drawer")
				]
			];

			recipes.addHiddenShaped(
				"hand_framing_" + (trim ? "trim_" : "") + (front ? "front_" : "") + (side ? "side" : ""),
				customDrawerOut,
				ingredients,
				function(out, ins, cInfo) {
					var tag = {} as IData[string];
					for key, stack in ins {
						if(key != "drawer") {
							tag[key] = asData(stack);
						}
					}
					val ret as any[any] = tag;
					if ins.drawer.tag.tile {
						return ins.drawer.withTag(ins.drawer.tag+(ret as IData)+{tile: ret as IData}) * 1;
					} else {
						return ins.drawer.withTag(ins.drawer.tag+(ret as IData)) * 1;
					}
				} as IRecipeFunction
			);
		}
	}
}
//exaple recipes for JEI
for i in 0 to 5 {
	recipes.addShaped(
		"hand_framing_example"+i,
		customDrawerOut.withDamage(i),
		[[<minecraft:wool:14>,<minecraft:wool:5>, dummyItem],
		[<minecraft:wool:11>, <storagedrawers:customdrawers>.withDamage(i)]]
	);
}
recipes.addShaped(
	"hand_framing_example_trim",
	<storagedrawers:customtrim>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>,<minecraft:wool:5>, dummyItem],
	[<minecraft:book>.withTag({display: {Name: "Trims don't have a front face"}}), <storagedrawers:customtrim>]]
);
recipes.addShaped(
	"hand_framing_example_compacting",
	<framedcompactdrawers:framed_compact_drawer>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_compact_drawer>]]
);
recipes.addShaped(
	"hand_framing_example_controller",
	<framedcompactdrawers:framed_drawer_controller>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_drawer_controller>]]
);
recipes.addShaped(
	"hand_framing_example_slave",
	<framedcompactdrawers:framed_slave>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_slave>]]
);