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

#---------------------------------------------------------------------------
#---------------------------------------------------------------------------
static empty as string = '§8Empty§r';

# Drawer sealed content
function sealed(name as string, amount as int = 0) as string {
  if(isNull(name)) return empty;
  return amount > 0
    ? "§2Sealed: §a" ~ name ~ ' §2(§ax' ~ amount ~ '§2)'
    : "§2Sealed: §a" ~ name;
}
function sealedItem(item as IItemStack) as string {
  if(isNull(item)) return empty;
  return sealed(item.displayName, item.amount);
}

function firstItemInList(data as IData, amount as int = 0) as IItemStack {
  if(isNull(data) || isNull(data.asList())) return null;

  for itemStorage in data.asList() {
    val itemData = itemStorage.Item;
    if(isNull(itemData)) continue;
    val item = IItemStack.fromData(itemData);
    if(isNull(item) || item.isEmpty) continue;
    return item * max(1, 
      amount != 0
      ? amount / D(itemStorage).getInt("Conv", 1)
      : D(itemStorage).getInt("Count", 1)
    );
  }
  return null;
}

// Basic Drawers
val basicDrawerTooltip as ITooltipFunction = function(item) {
  return sealedItem(firstItemInList(D(item.tag).get("tile.Drawers")));
};
<storagedrawers:basicdrawers:*>.addAdvancedTooltip(basicDrawerTooltip);
<storagedrawers:customdrawers:*>.addAdvancedTooltip(basicDrawerTooltip);


// Compact Drawers
val compactDrawerTooltip as ITooltipFunction = function(item) {
  val d = D(item.tag);
  return sealedItem(firstItemInList(d.get("tile.Drawers.Items"), d.getInt('tile.Drawers.Count')));
};
<storagedrawers:compdrawers>.addAdvancedTooltip(compactDrawerTooltip);

// Framed Drawers
if(!isNull(loadedMods["framedcompactdrawers"])) {
  itemUtils.getItem("framedcompactdrawers:framed_compact_drawer").addAdvancedTooltip(compactDrawerTooltip);
}

// Fluid Drawers
if(!isNull(loadedMods["fluiddrawers"])) {
  val fluidDrawerTooltip as ITooltipFunction = function(item) {
    val dTag = D(item.tag);
    val fluidName = dTag.getString("Tile.Drawer.Fluid.FluidName");
    if(isNull(fluidName)) return empty;
    val fluid = game.getLiquid(fluidName);
    if(isNull(fluid)) return empty;
    val fluidAmount = dTag.getInt("Tile.Drawer.Fluid.Amount");
    return sealed(fluid.displayName, fluidAmount);
  };
  <fluiddrawers:tank_custom>.addAdvancedTooltip(fluidDrawerTooltip);
  <fluiddrawers:tank>.addAdvancedTooltip(fluidDrawerTooltip);
}
#---------------------------------------------------------------------------
/*

Frame drawers without a framing table

Taken from:
https://github.com/ThePansmith/Enigmatica2ExpertUnofficial/blob/d37db7fddaa4e2ede28c68898e7a8aa710094195/scripts/StorageDrawers.zs#L129-L259

*/
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

<ore:handFramedThree>.add(
  <storagedrawers:customdrawers:*>,
  <framedcompactdrawers:framed_drawer_controller>, // remove these three if you don't have Framed Compacting Drawers
  <framedcompactdrawers:framed_compact_drawer>,
  <framedcompactdrawers:framed_slave>
);

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
        } as crafttweaker.recipes.IRecipeFunction
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
