import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.ITooltipFunction;

#modloaded storagedrawers

# *======= Recipes =======*

# Drawer Controller
	recipes.remove(<storagedrawers:controller>);
	recipes.addShaped("Drawer Controller", 
	<storagedrawers:controller>, 
	[[<ic2:resource:11>, <ic2:resource:11>, <ic2:resource:11>],
	[<immersiveengineering:metal_decoration0:3>, <ore:drawerBasic>, <immersiveengineering:metal_decoration0:3>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <ore:gemDiamondRat>, <appliedenergistics2:smooth_sky_stone_block>]]);

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

# [Creative Storage Upgrade]*4 from [Black Hole Unit][+8]
craft.remake(<storagedrawers:upgrade_creative> * 4, ["pretty",
  "i M # # # M i",
  "M M T ‚ T M M",
  "# T S ⌃ S T #",
  "# ‚ t B t ‚ #",
  "# T S ⌃ S T #",
  "M M T ‚ T M M",
  "i M # # # M i"], {
  "B": <industrialforegoing:black_hole_unit>, # Black Hole Unit
  "#": <randomthings:spectreplank>,           # Spectre Planks
  "S": <storagedrawers:upgrade_storage:2>,    # Storage Upgrade (III)
  "⌃": <extrautils2:decorativesolid:6>,       # Blue Quartz
  "T": <thaumcraft:taint_log>,                # Taintwood Log
  "t": <storagedrawers:upgrade_storage:3>,    # Storage Upgrade (IV)
  "i": <rftools:storage_module:2>,            # Tier 3 Storage Module
  "‚": <draconicevolution:infused_obsidian>,
  "M": <extrautils2:decorativesolidwood>,     # Magical Planks
});

# Upgrades
function remakeDrawerUpgrade(item as IItemStack, primary as IIngredient){
	remakeEx(item, [
		[primary, <ore:stickWood>, primary],
		[<ore:stickWood>, <storagedrawers:upgrade_template>, <ore:stickWood>],
		[primary, <ore:stickWood>, primary]]);
}

remakeDrawerUpgrade(<storagedrawers:upgrade_storage:0>, <ore:nuggetLead>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:1>, <ore:nuggetEndSteel>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:2>, <ore:nuggetMirion>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:3>, <ore:nuggetUltimate>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:4>, <draconicevolution:chaos_shard:3>);

# [Upgrade Template]*2 from [Basic Drawer][+2]
craft.remake(<storagedrawers:upgrade_template> * 2, ["pretty",
  "# D #",
  "# B #",
  "# D #"], {
  "B": <ore:drawerBasic>,    # Basic Drawer
  "#": <ore:stickWood>,      # Stick
  "D": <minecraft:deadbush>, # Dead Bush
});

# Drawers clearing
function clearDrawer(inputs as IItemStack[]) as void  {
	for it in inputs {
		recipes.addShapeless("Clearing " ~ getItemName(it), it, [it]);
	}
}
// clearDrawer(<ore:drawerBasic>.items); # Somehow it still give oredict
clearDrawer([<storagedrawers:compdrawers>]);

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

if(!isNull(loadedMods["framedcompactdrawers"])) {
	itemUtils.getItem("framedcompactdrawers:framed_compact_drawer").addAdvancedTooltip(compactDrawerTooltip);
}

// Fluid Drawers
val fluidDrawerTooltip as ITooltipFunction = function(item) {
	val d = D(item.tag).getString("Tile.Drawer.Fluid.FluidName");
	if(isNull(d)) return empty;
	val fluid = game.getLiquid(d);
	if(isNull(fluid)) return empty;
	return sealed(fluid.displayName);
};
<fluiddrawers:tank_custom>.addAdvancedTooltip(fluidDrawerTooltip);
<fluiddrawers:tank>.addAdvancedTooltip(fluidDrawerTooltip);

# [Basic Tank] from [Block of Black Quartz][+2]
craft.remake(<fluiddrawers:tank>, ["pretty",
  "Q ⌃ Q",
  "F   F",
  "Q ⌃ Q"], {
  "Q": <immersiveengineering:stone_decoration:9>, # Quickdry Concrete
  "⌃": <ore:blockQuartzBlack>,                    # Block of Black Quartz
  "F": <flopper:flopper>,                         # Flopper
});
craft.make(<fluiddrawers:tank>, ["pretty",
  "Q ⌃ Q",
  "F   F",
  "Q ⌃ Q"], {
  "Q": <forestry:propolis:*>,
  "⌃": <ore:blockQuartzBlack>,                    # Block of Black Quartz
  "F": <flopper:flopper>,                         # Flopper
});