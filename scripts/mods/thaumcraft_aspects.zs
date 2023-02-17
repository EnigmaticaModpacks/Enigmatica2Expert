import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import thaumcraft.aspect.CTAspectStack;

#modloaded thaumcraft

/*
 █████╗ ███████╗██████╗ ███████╗ ██████╗████████╗███████╗
██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔════╝
███████║███████╗██████╔╝█████╗  ██║        ██║   ███████╗
██╔══██║╚════██║██╔═══╝ ██╔══╝  ██║        ██║   ╚════██║
██║  ██║███████║██║     ███████╗╚██████╗   ██║   ███████║
╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝
*/

# Removing wrong aspects from stuff
<conarm:armor_trim:*>.setAspects(<aspect:terra>);
<harvestcraft:freshwateritem>.removeAspects(<aspect:metallum>);

# Override aspects
<rats:rat_diamond>                             .setAspects(<aspect:desiderium>*4  ,<aspect:vitreus>*4      , <aspect:rattus>*4);
<enderio:block_enderman_skull>                 .setAspects(<aspect:mortuus>*40    ,<aspect:alienis>*50     ,<aspect:tenebrae>*60);
<ic2:dust:5>                                   .setAspects(<aspect:desiderium>*20 ,<aspect:vitreus>*15);
<additionalcompression:gemdiamond_compressed:1>.setAspects(<aspect:desiderium>*500,<aspect:vitreus>*500);
<additionalcompression:gemdiamond_compressed:2>.setAspects(<aspect:desiderium>*500,<aspect:vitreus>*500    ,<aspect:caeles>*100);
<mekanism:compresseddiamond>                   .setAspects(<aspect:desiderium>*20 ,<aspect:vitreus>*20);
<avaritia:resource>                            .setAspects(<aspect:desiderium>*250,<aspect:vitreus>*250);
<thermalfoundation:material:26>                .setAspects(<aspect:desiderium>*50 ,<aspect:machina>*40);
<actuallyadditions:item_crystal:2>             .setAspects(<aspect:desiderium>*20 ,<aspect:vitreus>*20     , <aspect:potentia>*80);
<actuallyadditions:block_crystal:2>            .setAspects(<aspect:desiderium>*140,<aspect:vitreus>*140    , <aspect:potentia>*80);
<actuallyadditions:item_crystal_empowered:2>   .setAspects(<aspect:desiderium>*60 ,<aspect:vitreus>*60     , <aspect:potentia>*150);
<actuallyadditions:block_crystal_empowered:2>  .setAspects(<aspect:desiderium>*400,<aspect:vitreus>*400    , <aspect:potentia>*400);
<forestry:candle>                              .setAspects(<aspect:lux>*20        , <aspect:herba>*5       , <aspect:aer>*5);
<forestry:stump>                               .setAspects(<aspect:lux>*20        , <aspect:herba>*5       , <aspect:aer>*5);
<forestry:beeswax>                             .setAspects(<aspect:lux>*5         , <aspect:aer>*2);
<extrautils2:compressedcobblestone:0>          .setAspects(<aspect:terra>*45      , <aspect:perditio>*9);
<extrautils2:compressedcobblestone:1>          .setAspects(<aspect:terra>*405     , <aspect:perditio>*81);
<extrautils2:compressedcobblestone:2>          .setAspects(<aspect:terra>*500     , <aspect:perditio>*500);
<biomesoplenty:hard_ice>                       .setAspects(<aspect:gelum>*21);
<appliedenergistics2:sky_stone_block>          .setAspects(<aspect:alienis>*2     , <aspect:tenebrae>*7);
<minecraft:sugar>                              .setAspects(<aspect:desiderium>    , <aspect:aqua>);
<thaumcraft:alumentum>                         .setAspects(<aspect:ignis>*2       , <aspect:potentia>*2);
<thaumcraft:condenser_lattice_dirty>           .setAspects(<aspect:vitium>*10); #that one is an interesting item
<thaumcraft:ingot:2>                           .setAspects(<aspect:metallum>*5    , <aspect:instrumentum>*2);

val nitor = [
<thaumcraft:nitor_white>,
<thaumcraft:nitor_orange>,
<thaumcraft:nitor_magenta>,
<thaumcraft:nitor_lightblue>,
<thaumcraft:nitor_yellow>,
<thaumcraft:nitor_lime>,
<thaumcraft:nitor_pink>,
<thaumcraft:nitor_gray>,
<thaumcraft:nitor_silver>,
<thaumcraft:nitor_cyan>,
<thaumcraft:nitor_purple>,
<thaumcraft:nitor_blue>,
<thaumcraft:nitor_brown>,
<thaumcraft:nitor_green>,
<thaumcraft:nitor_red>,
<thaumcraft:nitor_black>
 ] as IItemStack[];
for nitor in nitor{
  nitor.setAspects(<aspect:lux>*2,<aspect:sensus>);
}



# New aspects support
#[Sanguis aspect] source
mods.bloodmagic.BloodAltar.addRecipe(
<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "sanguis"}]}), #output
<thaumcraft:phial>, #input
1, #tier
1000, #blood_essence_drain (how much essence crafting recipe require)
20, #consume_rate (how fast it will take essence from altar)
0); #drain_rate (how fast crafting process will decay if there is no blood in altar, 0 means no loss)

#[Mana aspect] source
mods.botania.ManaInfusion.addAlchemy(<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "mana"}]}),<thaumcraft:phial>,5000);
