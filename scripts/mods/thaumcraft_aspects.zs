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

/*
#######################################################

Animus

#######################################################
*/

<animus:component>                              .setAspects(<aspect:praecantatio>*5  ,<aspect:fabrico>*10); #reagent builder T1
<animus:component:1>                            .setAspects(<aspect:praecantatio>*15 ,<aspect:imperium>*20); #reagent chains T3
<animus:component:2>                            .setAspects(<aspect:praecantatio>*15 ,<aspect:rattus>*40); #reagent consumption T3
<animus:component:3>                            .setAspects(<aspect:praecantatio>*10 ,<aspect:desiderium>*30); #reagent leech T2
<animus:component:4>                            .setAspects(<aspect:praecantatio>*10 ,<aspect:potentia>*50); #reagent storm T2
<animus:component:5>                            .setAspects(<aspect:praecantatio>*20 ,<aspect:motus>*20); #reagent acquisition T4

<animus:sigil_builder>                          .setAspects(<aspect:praecantatio>*5  ,<aspect:sanguis>*5         ,<aspect:fabrico>*10); #sigil builder T1
<animus:sigil_chains>                           .setAspects(<aspect:praecantatio>*15 ,<aspect:sanguis>*30        ,<aspect:imperium>*30); #sigil chains T3
<animus:sigil_consumption>                      .setAspects(<aspect:praecantatio>*15 ,<aspect:sanguis>*30        ,<aspect:rattus>*30); #sigil consumption T3
<animus:sigil_leech>                            .setAspects(<aspect:praecantatio>*10 ,<aspect:sanguis>*15        ,<aspect:desiderium>*20); #sigil leech T2
<animus:sigil_storm>                            .setAspects(<aspect:praecantatio>*10 ,<aspect:sanguis>*15        ,<aspect:potentia>*50); #sigil storm T2
<animus:sigil_transposition>                    .setAspects(<aspect:praecantatio>*20 ,<aspect:sanguis>*60        ,<aspect:motus>*40); #sigil acquisition T4

/*
#######################################################

Astral sorcery

#######################################################
*/

<astralsorcery:blockmarble>                     .setAspects(<aspect:terra>*4      ,<aspect:ordo>*2); #marble
<astralsorcery:blockblackmarble>                .setAspects(<aspect:terra>*4        ,<aspect:potentia>*1); #sooty marble

<astralsorcery:itemusabledust>                  .setAspects(<aspect:lux>*2          ,<aspect:sensus>*1); #illumination powder
<astralsorcery:itemusabledust:1>                .setAspects(<aspect:tenebrae>*10    ,<aspect:potentia>*20); #nocturnal powder
<astralsorcery:itemcraftingcomponent>           .setAspects(<aspect:aqua>*5         ,<aspect:vitreus>*5); #aquamarine
<astralsorcery:itemcraftingcomponent:4>         .setAspects(<aspect:praecantatio>*5 ,<aspect:ordo>*10); #resonating gem
<astralsorcery:itemcraftingcomponent:2>         .setAspects(<aspect:praecantatio>*5 ,<aspect:vitreus>*10        ,<aspect:tenebrae>*5); #stardust
<astralsorcery:itemcraftingcomponent:1>         .setAspects(<aspect:praecantatio>*5 ,<aspect:metallum>*10       ,<aspect:tenebrae>*5); #starmetal ingot
<astralsorcery:blockcustomsandore>              .setAspects(<aspect:aqua>*5         ,<aspect:terra>*5           ,<aspect:perditio>*5); #aquamarine ore
<astralsorcery:blockcustomore:1>                .setAspects(<aspect:praecantatio>*5 ,<aspect:metallum>*10       ,<aspect:terra>*5       ,<aspect:tenebrae>*5); #starmetal ore
<astralsorcery:blockinfusedwood>                .setAspects(<aspect:herba>*20        ,<aspect:praecantatio>*1); #infused wood
<astralsorcery:blockinfusedwood:6>              .setAspects(<aspect:herba>*20        ,<aspect:praecantatio>*1); #vibrant infused wood

<astralsorcery:itemcraftingcomponent:3>         .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10); #glass lens and bellow collores lenses
<astralsorcery:itemcoloredlens>                 .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:ignis>*20); #ignition
<astralsorcery:itemcoloredlens:1>               .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:exanimis>*20); #break
<astralsorcery:itemcoloredlens:2>               .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:herba>*20); #growth
<astralsorcery:itemcoloredlens:3>               .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:aversio>*20); #damage (emotional)
<astralsorcery:itemcoloredlens:4>               .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:victus>*20); #regeneration
<astralsorcery:itemcoloredlens:5>               .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:motus>*20); #push
<astralsorcery:itemcoloredlens:6>               .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:vitreus>*10    ,<aspect:spiritus>*20); #spectral

<astralsorcery:itemshiftingstar:*>              .setAspects(<aspect:praecantatio>*20); #shifting star

<astralsorcery:itemrockcrystalsimple>           .setAspects(<aspect:praecantatio>*5 ,<aspect:ordo>*10           ,<aspect:vitreus>*20);                      #rock crystal
<astralsorcery:blockcustomore>                  .setAspects(<aspect:praecantatio>*5 ,<aspect:ordo>*50           ,<aspect:vitreus>*50    ,<aspect:terra>*5); #rock crystal ore
<astralsorcery:itemcelestialcrystal>            .setAspects(<aspect:praecantatio>*20,<aspect:ordo>*10           ,<aspect:vitreus>*20    ,<aspect:tenebrae>*10); #celestial crystal
<astralsorcery:blockcelestialcrystals:4>        .setAspects(<aspect:praecantatio>*50,<aspect:ordo>*50           ,<aspect:vitreus>*100   ,<aspect:tenebrae>*50); #celestial crystal cluster
<astralsorcery:itemperkgem>                     .setAspects(<aspect:praecantatio>*20,<aspect:ordo>*10           ,<aspect:vitreus>*20    ,<aspect:sensus>*10); #orium gem (blue)
<astralsorcery:blockgemcrystals:2>              .setAspects(<aspect:praecantatio>*50,<aspect:ordo>*50           ,<aspect:vitreus>*100   ,<aspect:sensus>*50); #^that ore
<astralsorcery:itemperkgem:1>                   .setAspects(<aspect:praecantatio>*20,<aspect:ordo>*10           ,<aspect:vitreus>*20    ,<aspect:lux>*10); #ilium gem (orange)
<astralsorcery:blockgemcrystals:3>              .setAspects(<aspect:praecantatio>*50,<aspect:ordo>*50           ,<aspect:vitreus>*100   ,<aspect:lux>*50); #^that ore
<astralsorcery:itemperkgem:2>                   .setAspects(<aspect:praecantatio>*20,<aspect:ordo>*10           ,<aspect:vitreus>*20    ,<aspect:potentia>*10); #fengarum gem (white)
<astralsorcery:blockgemcrystals:4>              .setAspects(<aspect:praecantatio>*50,<aspect:ordo>*50           ,<aspect:vitreus>*100   ,<aspect:potentia>*50); #^that ore
<astralsorcery:blockcollectorcrystal>           .setAspects(<aspect:praecantatio>*30,<aspect:ordo>*50           ,<aspect:vitreus>*40);                          #collector crystal
<astralsorcery:blockcelestialcollectorcrystal>  .setAspects(<aspect:praecantatio>*100,<aspect:ordo>*100           ,<aspect:vitreus>*200 ,<aspect:tenebrae>*100); #celestial collector crystal

<astralsorcery:blockaltar>                      .setAspects(<aspect:praecantatio>*5 ,<aspect:fabrico>*10        ,<aspect:ordo>*5); #Altar T1
<astralsorcery:blockaltar:1>                    .setAspects(<aspect:praecantatio>*10,<aspect:fabrico>*20        ,<aspect:ordo>*20); #T2
<astralsorcery:blockaltar:2>                    .setAspects(<aspect:praecantatio>*50,<aspect:fabrico>*30        ,<aspect:ordo>*50); #T3
<astralsorcery:blockaltar:3>                    .setAspects(<aspect:praecantatio>*100,<aspect:fabrico>*40       ,<aspect:ordo>*100      ,<aspect:sanguis>*50); #T4

<astralsorcery:blockworldilluminator>           .setAspects(<aspect:lux>*5          ,<aspect:ordo>*5            ,<aspect:vitreus>*10); #Cave illuminator
<astralsorcery:blockattunementrelay>            .setAspects(<aspect:praecantatio>*10,<aspect:auram>*5           ,<aspect:permutatio>*5); #spectral realy
<astralsorcery:blocklens>                       .setAspects(<aspect:praecantatio>*10,<aspect:auram>*10          ,<aspect:ordo>*5        ,<aspect:vitreus>*20); #Lens
<astralsorcery:blockmachine:1>                  .setAspects(<aspect:terra>*5        ,<aspect:fabrico>*5         ,<aspect:machina>*5); #grindstone
<astralsorcery:itemconstellationpaper>          .setAspects(<aspect:praecantatio>*5 ,<aspect:cognitio>*20       ,<aspect:ordo>*10); #constelation paper
<astralsorcery:itemknowledgeshare>              .setAspects(<aspect:praecantatio>*5 ,<aspect:cognitio>*20       ,<aspect:ordo>*10); #scroll of written knowledge
<astralsorcery:blockprism>                      .setAspects(<aspect:praecantatio>*20,<aspect:vitreus>*30        ,<aspect:ordo>*30); #primslens
<astralsorcery:blockwell>                       .setAspects(<aspect:praecantatio>*5 ,<aspect:aqua>*10           ,<aspect:ordo>*5); #lightwell
<astralsorcery:blockbore>                       .setAspects(<aspect:praecantatio>*20,<aspect:desiderium>*20     ,<aspect:ordo>*20); #evershifting fountain
<astralsorcery:blockborehead>                   .setAspects(<aspect:praecantatio>*10,<aspect:desiderium>*20     ,<aspect:ordo>*15); #neromantic prime
<astralsorcery:blockborehead:1>                 .setAspects(<aspect:praecantatio>*10,<aspect:desiderium>*20     ,<aspect:tenebrae>*15); #fysallidic prime
<astralsorcery:blockrituallink>                 .setAspects(<aspect:praecantatio>*5 ,<aspect:vitreus>*10        ,<aspect:ordo>*5); #ritual anchor

<astralsorcery:itemsextant>                     .setAspects(<aspect:praecantatio>*5 ,<aspect:sensus>*10         ,<aspect:desiderium>*5); #sextant
<astralsorcery:itemhandtelescope>               .setAspects(<aspect:praecantatio>*10,<aspect:sensus>*20         ,<aspect:desiderium>*10); #looking glass
<astralsorcery:blockmachine>                    .setAspects(<aspect:praecantatio>*5 ,<aspect:sensus>*10         ,<aspect:desiderium>*20); #telescope
<astralsorcery:blockobservatory>                .setAspects(<aspect:praecantatio>*50,<aspect:sensus>*50         ,<aspect:visum>*30      ,<aspect:tenebrae>*20); #observatory

<astralsorcery:blockcelestialgateway>           .setAspects(<aspect:praecantatio>*10,<aspect:alienis>*20        ,<aspect:motus>*50); #celestial gateway
<astralsorcery:blockstarlightinfuser>           .setAspects(<aspect:praecantatio>*10,<aspect:permutatio>*20     ,<aspect:ordo>*20); #starlight infuser
<astralsorcery:blockattunementaltar>            .setAspects(<aspect:praecantatio>*10,<aspect:ordo>*10           ,<aspect:desiderium>*20); #attument altar
<astralsorcery:blockmapdrawingtable>            .setAspects(<aspect:praecantatio>*20,<aspect:sensus>*10         ,<aspect:desiderium>*20 ,<aspect:imperium>*10); #stellar refraction table
<astralsorcery:blockchalice>                    .setAspects(<aspect:praecantatio>*10,<aspect:tenebrae>*10       ,<aspect:desiderium>*20); #containment chalice
<astralsorcery:blockritualpedestal>             .setAspects(<aspect:praecantatio>*10,<aspect:ordo>*10           ,<aspect:desiderium>*20); #ritual pedestal

<astralsorcery:itemlinkingtool>                 .setAspects(<aspect:praecantatio>*5 ,<aspect:instrumentum>*10   ,<aspect:vitreus>*10); #linking tool
<astralsorcery:itemwand>                        .setAspects(<aspect:praecantatio>*5 ,<aspect:instrumentum>*10   ,<aspect:vitreus>*10); #resonating wand
<astralsorcery:itemilluminationwand>            .setAspects(<aspect:praecantatio>*10,<aspect:lux>*20            ,<aspect:vitreus>*20); #illumination wand
<astralsorcery:iteminfusedglass>                .setAspects(<aspect:praecantatio>*20,<aspect:auram>*10          ,<aspect:vitreus>*20    ,<aspect:ordo>*20); #infused glass
<astralsorcery:itemskyresonator>                .setAspects(<aspect:sensus>*10      ,<aspect:ordo>*5            ,<aspect:desiderium>*10); #fosic resonator
<astralsorcery:itemperkseal>                    .setAspects(<aspect:praecantatio>*10,<aspect:tenebrae>*10       ,<aspect:potentia>*20); #sealing sigil

<astralsorcery:itemenchantmentamulet>           .setAspects(<aspect:praecantatio>*30,<aspect:tenebrae>*10       ,<aspect:vitreus>*10); #resplendent prism


/*
#######################################################

Bloodmagic

#######################################################
*/

<bloodmagic:slate>                              .setAspects(<aspect:terra>*5        ,<aspect:sanguis>*5); #slate blank
<bloodmagic:slate:1>                            .setAspects(<aspect:terra>*5        ,<aspect:sanguis>*15); #slate reinforced
<bloodmagic:slate:2>                            .setAspects(<aspect:terra>*5        ,<aspect:sanguis>*30); #slate imbued
<bloodmagic:slate:3>                            .setAspects(<aspect:terra>*5        ,<aspect:sanguis>*66); #slate demonic
<bloodmagic:slate:4>                            .setAspects(<aspect:terra>*5        ,<aspect:sanguis>*100); #slate ethernal

<bloodmagic:blood_shard>                        .setAspects(<aspect:mortuus>*10     ,<aspect:exanimis>*10    ,<aspect:sanguis>*10); #weak blood shard
<bloodmagic:blood_shard:1>                      .setAspects(<aspect:caeles>*30      ,<aspect:infernum>*50    ,<aspect:sanguis>*20); #demon blood shard

<bloodmagic:activation_crystal>                 .setAspects(<aspect:praecantatio>*10,<aspect:desiderium>*20  ,<aspect:sanguis>*20); #weak activation crystal
<bloodmagic:activation_crystal:1>               .setAspects(<aspect:praecantatio>*40,<aspect:desiderium>*30  ,<aspect:sanguis>*50); #awekaned activation crystal

<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"})        .setAspects(<aspect:praecantatio>*10  ,<aspect:desiderium>*10   ,<aspect:sanguis>*10); #orb tier 1
<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"})  .setAspects(<aspect:praecantatio>*20  ,<aspect:victus>*10       ,<aspect:sanguis>*25); #orb tier 2
<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"})    .setAspects(<aspect:praecantatio>*30  ,<aspect:metallum>*50     ,<aspect:sanguis>*50); #orb tier 3
<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"})      .setAspects(<aspect:praecantatio>*40  ,<aspect:mortuus>*20      ,<aspect:sanguis>*80); #orb tier 4
<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"})    .setAspects(<aspect:praecantatio>*50  ,<aspect:ordo>*100        ,<aspect:sanguis>*100); #orb tier 5
<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}).setAspects(<aspect:praecantatio>*100 ,<aspect:caeles>*100      ,<aspect:sanguis>*300); #orb tier 6

<bloodmagic:soul_snare>                         .setAspects(<aspect:vinculum>*3     ,<aspect:imperium>*3     ,<aspect:ventus>*1); #rudimentary snare
<bloodmagic:arcane_ashes:*>                     .setAspects(<aspect:potentia>*10    ,<aspect:ignis>*10       ,<aspect:exitium>*5); #arcane ashes

<bloodmagic:soul_forge>                         .setAspects(<aspect:instrumentum>*20,<aspect:spiritus>*30    ,<aspect:praecantatio>*15); #rudimentary snare
<bloodmagic:demon_pylon>                        .setAspects(<aspect:infernum>*30    ,<aspect:spiritus>*20    ,<aspect:desiderium>*20); #rudimentary snare
<bloodmagic:demon_crucible>                     .setAspects(<aspect:infernum>*30    ,<aspect:spiritus>*20    ,<aspect:fluctus>*15); #rudimentary snare
<bloodmagic:demon_crystallizer>                 .setAspects(<aspect:infernum>*30    ,<aspect:spiritus>*20    ,<aspect:fluctus>*15); #rudimentary snare
<bloodmagic:alchemy_table>                      .setAspects(<aspect:alkimia>*25     ,<aspect:ordo>*20        ,<aspect:praecantatio>*20); #rudimentary snare
<bloodmagic:altar>                              .setAspects(<aspect:terra>*15       ,<aspect:praecantatio>*10,<aspect:aversio>*30); #rudimentary snare

<bloodmagic:monster_soul>                       .setAspects(<aspect:spiritus>*2     ,<aspect:infernum>*2);                       #demonic will
<bloodmagic:monster_soul:1>                     .setAspects(<aspect:spiritus>*2     ,<aspect:infernum>*2     ,<aspect:alkimia>*1); #corrosive
<bloodmagic:monster_soul:2>                     .setAspects(<aspect:spiritus>*2     ,<aspect:infernum>*2     ,<aspect:exitium>*1); #destructive
<bloodmagic:monster_soul:3>                     .setAspects(<aspect:spiritus>*2     ,<aspect:infernum>*2     ,<aspect:mortuus>*1); #vengeful
<bloodmagic:monster_soul:4>                     .setAspects(<aspect:spiritus>*2     ,<aspect:infernum>*2     ,<aspect:alienis>*1); #steadfast

<bloodmagic:item_demon_crystal>                 .setAspects(<aspect:spiritus>*30    ,<aspect:infernum>*25);                       #demonic will crystal
<bloodmagic:item_demon_crystal:1>               .setAspects(<aspect:spiritus>*30    ,<aspect:infernum>*25    ,<aspect:alkimia>*20); #corrosive
<bloodmagic:item_demon_crystal:2>               .setAspects(<aspect:spiritus>*30    ,<aspect:infernum>*25    ,<aspect:exitium>*20); #destructive
<bloodmagic:item_demon_crystal:3>               .setAspects(<aspect:spiritus>*30    ,<aspect:infernum>*25    ,<aspect:mortuus>*20); #vengeful
<bloodmagic:item_demon_crystal:4>               .setAspects(<aspect:spiritus>*30    ,<aspect:infernum>*25    ,<aspect:alienis>*20); #steadfast

<bloodmagic:sentient_sword>                     .setAspects(<aspect:spiritus>*20    ,<aspect:aversio>*30);
<bloodmagic:sentient_bow>                       .setAspects(<aspect:spiritus>*20    ,<aspect:aversio>*15     ,<aspect:ventus>*15);
<bloodmagic:sentient_axe>                       .setAspects(<aspect:spiritus>*20    ,<aspect:instrumentum>*20);
<bloodmagic:sentient_pickaxe>                   .setAspects(<aspect:spiritus>*20    ,<aspect:instrumentum>*20);
<bloodmagic:sentient_shovel>                    .setAspects(<aspect:spiritus>*20    ,<aspect:instrumentum>*20);

<bloodmagic:sacrificial_dagger>                 .setAspects(<aspect:alienis>*5      ,<aspect:aversio>*5      ,<aspect:mortuus>*10);
<bloodmagic:dagger_of_sacrifice>                .setAspects(<aspect:sanguis>*15     ,<aspect:instrumentum>*10,<aspect:aversio>*10);

<bloodmagic:component:8>                        .setAspects(<aspect:praecantatio>*5  ,<aspect:aqua>*10); #reagent binding
<bloodmagic:sigil_whirlwind>                    .setAspects(<aspect:praecantatio>*5  ,<aspect:sanguis>*5   ,<aspect:aer>*20); #sigil wirldwind
<bloodmagic:component:29>                       .setAspects(<aspect:praecantatio>*5  ,<aspect:alkimia>*5  ,<aspect:potentia>*10); #simple power catalyst
<bloodmagic:component:28>                       .setAspects(<aspect:praecantatio>*5  ,<aspect:alkimia>*5  ,<aspect:sensus>*10); #simple lengthening catalyst

# TIERED REAGENTS AND SIGILS
# Tier 1

<bloodmagic:component>                          .setAspects(<aspect:praecantatio>*5  ,<aspect:aqua>*10); #reagent water
<bloodmagic:component:1>                        .setAspects(<aspect:praecantatio>*5  ,<aspect:ignis>*10); #reagent lava

<bloodmagic:sigil_water>                        .setAspects(<aspect:praecantatio>*5  ,<aspect:sanguis>*5     ,<aspect:aqua>*10); #sigil water
<bloodmagic:sigil_lava>                         .setAspects(<aspect:praecantatio>*5  ,<aspect:sanguis>*5     ,<aspect:ignis>*10); #sigil lava
<bloodmagic:sigil_divination>                   .setAspects(<aspect:praecantatio>*5  ,<aspect:sanguis>*5     ,<aspect:cognitio>*10); #sigil divination

#Tier 2

<bloodmagic:component:5>                        .setAspects(<aspect:praecantatio>*10  ,<aspect:herba>*20); #reagent growth
<bloodmagic:component:31>                       .setAspects(<aspect:praecantatio>*10  ,<aspect:praecantatio>*20); #reagent elasticy
<bloodmagic:component:2>                        .setAspects(<aspect:praecantatio>*10  ,<aspect:volatus>*20); #reagent air
<bloodmagic:component:7>                        .setAspects(<aspect:praecantatio>*10  ,<aspect:sensus>*20); #reagent sight
<bloodmagic:component:3>                        .setAspects(<aspect:praecantatio>*10  ,<aspect:exitium>*20); #reagent mining
<bloodmagic:component:32>                       .setAspects(<aspect:praecantatio>*10  ,<aspect:gelum>*20); #reagent frost
<bloodmagic:component:4>                        .setAspects(<aspect:praecantatio>*10  ,<aspect:vacuos>*20); #reagent void

<bloodmagic:sigil_green_grove>                  .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:herba>*20); #sigil growth
<bloodmagic:sigil_bounce>                       .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:praemunio>*20); #sigil elasticy
<bloodmagic:sigil_air>                          .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:volatus>*20); #sigil air
<bloodmagic:sigil_seer>                         .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:sensus>*20); #sigil sight
<bloodmagic:sigil_fast_miner>                   .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:exitium>*20); #sigil mining
<bloodmagic:sigil_frost>                        .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:gelum>*20); #sigil frost
<bloodmagic:sigil_void>                         .setAspects(<aspect:praecantatio>*10  ,<aspect:sanguis>*15   ,<aspect:vacuos>*20); #sigil void

#Tier 3

<bloodmagic:component:12>                       .setAspects(<aspect:praecantatio>*15  ,<aspect:metallum>*30); #reagent magnetism
<bloodmagic:component:27>                       .setAspects(<aspect:praecantatio>*15  ,<aspect:vinculum>*30); #reagent holding
<bloodmagic:component:11>                       .setAspects(<aspect:praecantatio>*15  ,<aspect:lux>*30); #reagent blood lamp
<bloodmagic:component:30>                       .setAspects(<aspect:praecantatio>*15  ,<aspect:bestia>*30); #reagent claw
<bloodmagic:component:6>                        .setAspects(<aspect:praecantatio>*15  ,<aspect:aer>*10,<aspect:ignis>*10,<aspect:terra>*10,<aspect:aqua>*10); #reagent elemental affinity

<bloodmagic:sigil_magnetism>                    .setAspects(<aspect:praecantatio>*15  ,<aspect:sanguis>*30   ,<aspect:metallum>*30); #sigil magnetism
<bloodmagic:sigil_holding>                      .setAspects(<aspect:praecantatio>*15  ,<aspect:sanguis>*30   ,<aspect:vinculum>*30); #sigil holding
<bloodmagic:sigil_blood_light>                  .setAspects(<aspect:praecantatio>*15  ,<aspect:sanguis>*30   ,<aspect:vacuos>*30); #sigil blood lamp
<bloodmagic:sigil_claw>                         .setAspects(<aspect:praecantatio>*15  ,<aspect:sanguis>*30   ,<aspect:bestia>*30); #sigil claw
<bloodmagic:sigil_elemental_affinity>           .setAspects(<aspect:praecantatio>*15  ,<aspect:sanguis>*30   ,<aspect:aer>*10,<aspect:ignis>*10,<aspect:terra>*10,<aspect:aqua>*10); #sigil elemental affinity

#Tier 4

<bloodmagic:component:18>                       .setAspects(<aspect:praecantatio>*20  ,<aspect:permutatio>*40); #reagent transposition
<bloodmagic:component:17>                       .setAspects(<aspect:praecantatio>*20  ,<aspect:alienis>*40); #reagent teleposition
<bloodmagic:component:9>                        .setAspects(<aspect:praecantatio>*20  ,<aspect:perditio>*40); #reagent supression
<bloodmagic:component:15>                       .setAspects(<aspect:praecantatio>*20  ,<aspect:spiritus>*40); #reagent phantom bridge
<bloodmagic:component:13>                       .setAspects(<aspect:praecantatio>*20  ,<aspect:ventus>*40); #reagent haste
<bloodmagic:component:16>                       .setAspects(<aspect:praecantatio>*20  ,<aspect:tenebrae>*40); #reagent severance
<bloodmagic:component:14>                       .setAspects(<aspect:praecantatio>*20  ,<aspect:ordo>*40); #reagent compression

<bloodmagic:sigil_transposition>                .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:permutatio>*40); #sigil transposition
<bloodmagic:sigil_teleposition>                 .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:alienis>*40); #sigil teleposiotion
<bloodmagic:sigil_suppression>                  .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:perditio>*40); #sigil supression
<bloodmagic:sigil_phantom_bridge>               .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:spiritus>*40); #sigil phantom bridge
<bloodmagic:sigil_haste>                        .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:ventus>*40); #sigil haste
<bloodmagic:sigil_ender_severance>              .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:tenebrae>*40); #sigil severance
<bloodmagic:sigil_compression>                  .setAspects(<aspect:praecantatio>*20  ,<aspect:sanguis>*60   ,<aspect:ordo>*40); #sigil compression

/*
#######################################################

Botania

#######################################################
*/

<botania:manaresource>                          .setAspects(<aspect:metallum>*10  ,<aspect:mana>*5); #manasteel
<botania:manaresource:1>                        .setAspects(<aspect:alienis>*10   ,<aspect:motus>*5           ,<aspect:mana>*10); #manapearl
<botania:manaresource:2>                        .setAspects(<aspect:vitreus>*15   ,<aspect:desiderium>*15     ,<aspect:mana>*10); #manadiamond
<botania:manaresource:4>                        .setAspects(<aspect:terra>*20     ,<aspect:praecantatio>*20   ,<aspect:mana>*10         ,<aspect:metallum>*10); #terrasteel
<botania:manaresource:7>                        .setAspects(<aspect:alienis>*5    ,<aspect:metallum>*10       ,<aspect:mana>*5); #elementium
<botania:manaresource:8>                        .setAspects(<aspect:alienis>*20   ,<aspect:mythus>*5          ,<aspect:mana>*10); #pixie dust
<botania:manaresource:9>                        .setAspects(<aspect:alienis>*10   ,<aspect:vitreus>*15        ,<aspect:mana>*10         ,<aspect:desiderium>*15); #dragon gem
<botania:manaresource:16>                       .setAspects(<aspect:bestia>*5     ,<aspect:fabrico>*2         ,<aspect:mana>*2); #mana string
<botania:manaresource:23>                       .setAspects(<aspect:potentia>*5   ,<aspect:mana>*5); #mana powder
<botania:manaresource:22>                       .setAspects(<aspect:praemunio>*10 ,<aspect:mana>*5); #manaweave cloth
<botania:manabottle:*>                          .setAspects(<aspect:mana>*10); #mana bottle
<botania:managlass>                             .setAspects(<aspect:vitreus>*5    ,<aspect:mana>*2); #mana glass
<botania:monocle>                               .setAspects(<aspect:sensus>*10    ,<aspect:visum>*20          ,<aspect:mana>*6); #monocle
<botania:blacklotus>                            .setAspects(<aspect:alienis>*10   ,<aspect:ordo>*10           ,<aspect:mana>*15); #monocle
<botania:blacklotus:1>                          .setAspects(<aspect:alienis>*20   ,<aspect:ordo>*20           ,<aspect:mana>*50); #monocle

<botania:rune:3>                                .setAspects(<aspect:terra>*5      ,<aspect:aer>*25            ,<aspect:mana>*5); #rune air
<botania:rune:2>                                .setAspects(<aspect:terra>*30     ,<aspect:mana>*5); #rune earth
<botania:rune:1>                                .setAspects(<aspect:terra>*5      ,<aspect:ignis>*25          ,<aspect:mana>*5); #rune fire
<botania:rune>                                  .setAspects(<aspect:terra>*5      ,<aspect:aqua>*25           ,<aspect:mana>*5); #rune water

<botania:rune:7>                                .setAspects(<aspect:terra>*5      ,<aspect:gelum>*25          ,<aspect:mana>*10); #rune winter
<botania:rune:6>                                .setAspects(<aspect:terra>*5      ,<aspect:mortuus>*25        ,<aspect:mana>*10); #rune autumn
<botania:rune:5>                                .setAspects(<aspect:terra>*5      ,<aspect:victus>*25         ,<aspect:mana>*10); #rune summer
<botania:rune:4>                                .setAspects(<aspect:terra>*5      ,<aspect:herba>*25          ,<aspect:mana>*10); #rune spring
<botania:rune:8>                                .setAspects(<aspect:terra>*5      ,<aspect:auram>*25          ,<aspect:mana>*15); #rune of mana

<botania:rune:15>                               .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:mythus>*30       ,<aspect:mana>*15); #rune pride
<botania:rune:14>                               .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:spiritus>*30     ,<aspect:mana>*15); #rune envy
<botania:rune:13>                               .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:aversio>*30      ,<aspect:mana>*15); #rune wrath
<botania:rune:12>                               .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:imperium>*30     ,<aspect:mana>*15); #rune sloth
<botania:rune:11>                               .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:humanus>*30      ,<aspect:mana>*15); #rune greed
<botania:rune:10>                               .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:vacuos>*30       ,<aspect:mana>*15); #rune gluttony
<botania:rune:9>                                .setAspects(<aspect:terra>*5      ,<aspect:desiderium>*20     ,<aspect:fluctus>*30      ,<aspect:mana>*15); #rune lust

/*
#######################################################

Chisell/Quark - general stones

#######################################################
*/

<chisel:basalt2:7>                              .setAspects(<aspect:terra>*4      ,<aspect:tenebrae>*2); #basalt
<chisel:marble2:7>                              .setAspects(<aspect:terra>*4      ,<aspect:ordo>*2); #marble
<quark:jasper>                                  .setAspects(<aspect:terra>*4      ,<aspect:ignis>*2); #jasper

<quark:black_ash>                               .setAspects(<aspect:perditio>*4      ,<aspect:tenebrae>*2); #wither ash

/*
#######################################################

Draconic evolution

#######################################################
*/

<draconicevolution:dragon_heart>                .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*50   ,<aspect:spiritus>*30     ,<aspect:victus>*100); #dragon heart

/*
#######################################################

Ice and fire

#######################################################
*/

#General

<iceandfire:manuscript>                        .setAspects(<aspect:cognitio>*20); #manuscript
<iceandfire:witherbone>                        .setAspects(<aspect:mortuus>*10      ,<aspect:infernum>*10     ,<aspect:tenebrae>*5       ,<aspect:perditio>*5); #wither bone
<iceandfire:myrmex_stinger>                    .setAspects(<aspect:mythus>*5        ,<aspect:aversio>*6       ,<aspect:alkimia>*5);

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:myrmex_worker"}})
                                                .setAspects(<aspect:mythus>*10       ,<aspect:bestia>*10      ,<aspect:fabrico>*5);
<entity:iceandfire:myrmex_worker>               .setAspects(<aspect:mythus>*10       ,<aspect:bestia>*10      ,<aspect:fabrico>*5);
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:myrmex_soldier"}})
                                                .setAspects(<aspect:mythus>*15       ,<aspect:bestia>*15      ,<aspect:aversio>*20);
<entity:iceandfire:myrmex_soldier>              .setAspects(<aspect:mythus>*15       ,<aspect:bestia>*15      ,<aspect:aversio>*20);
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:myrmex_sentinel"}})
                                                .setAspects(<aspect:mythus>*20       ,<aspect:bestia>*20      ,<aspect:sensus>*50);
<entity:iceandfire:myrmex_sentinel>             .setAspects(<aspect:mythus>*20       ,<aspect:bestia>*20      ,<aspect:sensus>*50);
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:myrmex_royal"}})
                                                .setAspects(<aspect:mythus>*30       ,<aspect:bestia>*30      ,<aspect:volatus>*50);
<entity:iceandfire:myrmex_royal>                .setAspects(<aspect:mythus>*30       ,<aspect:bestia>*30      ,<aspect:volatus>*50);
/*
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:myrmex_queen"}})
                                                .setAspects(<aspect:mythus>*300      ,<aspect:bestia>*300       ,<aspect:desiderium>*200);
<entity:iceandfire:myrmex_queen>                .setAspects(<aspect:mythus>*300      ,<aspect:bestia>*300       ,<aspect:desiderium>*200);
*/

#Dragons general

<iceandfire:dragonbone>                         .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*2    ,<aspect:mortuus>*5); #dragon bone
<iceandfire:dragon_meal>                        .setAspects(<aspect:victus>*20    ,<aspect:bestia>*10         ,<aspect:mortuus>*20); #dragon meal

#Fire
/*
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:firedragon"}})
                                                .setAspects(<aspect:draco>*500    ,<aspect:praecantatio>*500  ,<aspect:desiderium>*500  ,<aspect:victus>*500    ,<aspect:ignis>*500);
<entity:iceandfire:firedragon>                  .setAspects(<aspect:draco>*500    ,<aspect:praecantatio>*500  ,<aspect:desiderium>*500  ,<aspect:victus>*500    ,<aspect:ignis>*500);
*/
<iceandfire:fire_dragon_heart>                  .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*50   ,<aspect:spiritus>*30     ,<aspect:victus>*100    ,<aspect:ignis>*50); #heart
<iceandfire:fire_dragon_flesh>                  .setAspects(<aspect:draco>*10     ,<aspect:victus>*10         ,<aspect:mortuus>*20      ,<aspect:ignis>*20); #flesh
<iceandfire:fire_dragon_blood>                  .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*10   ,<aspect:alkimia>*10      ,<aspect:ignis>*10); #blood
<iceandfire:dragon_skull>                       .setAspects(<aspect:draco>*25     ,<aspect:spiritus>*10       ,<aspect:mortuus>*10      ,<aspect:ignis>*30); #skull
<iceandfire:dragonscales_red>                   .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*7       ,<aspect:infernum>*10     ,<aspect:ignis>*10); #scales red
<iceandfire:dragonscales_bronze>                .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*7       ,<aspect:desiderium>*10   ,<aspect:ignis>*10); #scales bronze
<iceandfire:dragonscales_green>                 .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*7       ,<aspect:visum>*10        ,<aspect:ignis>*10); #scales green
<iceandfire:dragonscales_gray>                  .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*7       ,<aspect:exitium>*10      ,<aspect:ignis>*10); #scales gray
<iceandfire:dragonegg_red>                      .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:infernum>*10     ,<aspect:ignis>*10); #egg red
<iceandfire:dragonegg_bronze>                   .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:desiderium>*10   ,<aspect:ignis>*10); #egg bronze
<iceandfire:dragonegg_green>                    .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:visum>*10        ,<aspect:ignis>*10); #egg green
<iceandfire:dragonegg_gray>                     .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:exitium>*10      ,<aspect:ignis>*10); #egg gray
<iceandfire:dragonsteel_fire_ingot>             .setAspects(<aspect:draco>*25     ,<aspect:metallum>*20       ,<aspect:desiderium>*40   ,<aspect:ignis>*50); #dragonsteel ingot
<iceandfire:fire_lily>                          .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*2    ,<aspect:herba>*5         ,<aspect:ignis>*5); #lily
<iceandfire:fire_stew>                          .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*5    ,<aspect:ignis>*20); #lily mixture

#Ice
/*
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:icedragon"}})
                                                .setAspects(<aspect:draco>*500    ,<aspect:praecantatio>*500  ,<aspect:desiderium>*500  ,<aspect:victus>*500    ,<aspect:gelum>*500);
<entity:iceandfire:icedragon>                   .setAspects(<aspect:draco>*500    ,<aspect:praecantatio>*500  ,<aspect:desiderium>*500  ,<aspect:victus>*500    ,<aspect:gelum>*500);
*/
<iceandfire:ice_dragon_heart>                   .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*50   ,<aspect:spiritus>*30     ,<aspect:victus>*100    ,<aspect:gelum>*50); #heart
<iceandfire:ice_dragon_flesh>                   .setAspects(<aspect:draco>*10     ,<aspect:victus>*10         ,<aspect:mortuus>*20      ,<aspect:gelum>*20); #flesh
<iceandfire:ice_dragon_blood>                   .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*10   ,<aspect:alkimia>*10      ,<aspect:gelum>*10); #blood
<iceandfire:dragon_skull:1>                     .setAspects(<aspect:draco>*25     ,<aspect:spiritus>*10       ,<aspect:mortuus>*10      ,<aspect:gelum>*30); #skull
<iceandfire:dragonscales_sapphire>              .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*15      ,<aspect:instrumentum>*10 ,<aspect:gelum>*10); #scales sapphire
<iceandfire:dragonscales_blue>                  .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*15      ,<aspect:vitreus>*10      ,<aspect:gelum>*10); #scales blue
<iceandfire:dragonscales_white>                 .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*15      ,<aspect:volatus>*10      ,<aspect:gelum>*10); #scales white
<iceandfire:dragonscales_silver>                .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*15      ,<aspect:fluctus>*10      ,<aspect:gelum>*10); #scales silver
<iceandfire:dragonegg_sapphire>                 .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:instrumentum>*10 ,<aspect:gelum>*10); #egg sapphire
<iceandfire:dragonegg_blue>                     .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:vitreus>*10      ,<aspect:gelum>*10); #egg blue
<iceandfire:dragonegg_white>                    .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:volatus>*10      ,<aspect:gelum>*10); #egg white
<iceandfire:dragonegg_silver>                   .setAspects(<aspect:draco>*100    ,<aspect:praecantatio>*10   ,<aspect:fluctus>*10      ,<aspect:gelum>*10); #egg silver
<iceandfire:dragonsteel_ice_ingot>              .setAspects(<aspect:draco>*25     ,<aspect:metallum>*20       ,<aspect:desiderium>*40   ,<aspect:gelum>*50); #dragonsteel ingot
<iceandfire:frost_lily>                         .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*2    ,<aspect:herba>*5         ,<aspect:gelum>*5); #lily
<iceandfire:frost_stew>                         .setAspects(<aspect:draco>*5      ,<aspect:praecantatio>*5    ,<aspect:gelum>*20); #lily mixture

#Ocean creatures
/*
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:seaserpent"}})
                                                .setAspects(<aspect:draco>*100    ,<aspect:aqua>*300         ,<aspect:mythus>*300);
<entity:iceandfire:seaserpent>                  .setAspects(<aspect:draco>*100    ,<aspect:aqua>*300         ,<aspect:mythus>*300);
*/
<iceandfire:sea_serpent_fang>                   .setAspects(<aspect:draco>*5      ,<aspect:aversio>*10        ,<aspect:aqua>*10         ,<aspect:mythus>*5); #fang
<iceandfire:sea_serpent_scales_teal>            .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:alkimia>*5       ,<aspect:mythus>*10); #scale teal
<iceandfire:sea_serpent_scales_deepblue>        .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:instrumentum>*5  ,<aspect:mythus>*10); #scale deepblue
<iceandfire:sea_serpent_scales_bronze>          .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:sonus>*5         ,<aspect:mythus>*10); #scale bronze
<iceandfire:sea_serpent_scales_blue>            .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:vitreus>*5       ,<aspect:mythus>*10); #scale blue
<iceandfire:sea_serpent_scales_green>           .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:visum>*5         ,<aspect:mythus>*10); #scale green
<iceandfire:sea_serpent_scales_purple>          .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:praecantatio>*5  ,<aspect:mythus>*10); #scale purple
<iceandfire:sea_serpent_scales_red>             .setAspects(<aspect:draco>*5      ,<aspect:praemunio>*10      ,<aspect:aqua>*10         ,<aspect:victus>*5        ,<aspect:mythus>*10); #scale red
<iceandfire:seaserpent_skull>                   .setAspects(<aspect:draco>*10     ,<aspect:spiritus>*20       ,<aspect:aqua>*20         ,<aspect:mythus>*50); #skull

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:siren"}})
                                                .setAspects(<aspect:sonus>*50     ,<aspect:imperium>*30       ,<aspect:aqua>*50         ,<aspect:mythus>*30);
<entity:iceandfire:siren>                       .setAspects(<aspect:sonus>*50     ,<aspect:imperium>*30       ,<aspect:aqua>*50         ,<aspect:mythus>*30);
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:hippocampus"}})
                                                .setAspects(<aspect:motus>*20     ,<aspect:mythus>*20         ,<aspect:aqua>*50);
<entity:iceandfire:hippocampus>                 .setAspects(<aspect:motus>*20     ,<aspect:mythus>*20         ,<aspect:aqua>*50);
<iceandfire:shiny_scales>                       .setAspects(<aspect:desiderium>*20,<aspect:praemunio>*5       ,<aspect:aqua>*10         ,<aspect:mythus>*2); #shiny scales
<iceandfire:siren_tear>                         .setAspects(<aspect:sonus>*100    ,<aspect:imperium>*50       ,<aspect:aqua>*50         ,<aspect:mythus>*50); #siren 
<iceandfire:hippocampus_fin>                    .setAspects(<aspect:motus>*100    ,<aspect:mythus>*50         ,<aspect:aqua>*50); #hippocampus 

#Beach creatures

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:gorgon"}})
                                                .setAspects(<aspect:mythus>*200   ,<aspect:praecantatio>*100  ,<aspect:exanimis>*200    ,<aspect:humanus>*400);
<entity:iceandfire:gorgon>                      .setAspects(<aspect:mythus>*200   ,<aspect:praecantatio>*100  ,<aspect:exanimis>*200    ,<aspect:humanus>*400);
<iceandfire:gorgon_head>                        .setAspects(<aspect:mythus>*50    ,<aspect:mortuus>*50        ,<aspect:exanimis>*40     ,<aspect:humanus>*50); #gorgon

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:cyclops"}})
                                                .setAspects(<aspect:mythus>*100   ,<aspect:visum>*100         ,<aspect:potentia>*200);
<entity:iceandfire:cyclops>                     .setAspects(<aspect:mythus>*400   ,<aspect:visum>*100         ,<aspect:potentia>*200);
<iceandfire:cyclops_eye>                        .setAspects(<aspect:mythus>*20    ,<aspect:visum>*30          ,<aspect:mortuus>*20      ,<aspect:bestia>*50); #cyclop
<iceandfire:cyclops_skull>                      .setAspects(<aspect:mythus>*30    ,<aspect:spiritus>*20       ,<aspect:potentia>*20     ,<aspect:terra>*50); 

#Underground

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:if_troll"}})
                                                .setAspects(<aspect:mythus>*50    ,<aspect:tenebrae>*50       ,<aspect:terra>*100);
<entity:iceandfire:if_troll>                    .setAspects(<aspect:mythus>*50    ,<aspect:tenebrae>*50       ,<aspect:terra>*100);
<iceandfire:troll_skull>                        .setAspects(<aspect:mythus>*20    ,<aspect:spiritus>*20       ,<aspect:tenebrae>*20     ,<aspect:terra>*30); #troll skull
<iceandfire:troll_leather_frost>                .setAspects(<aspect:mythus>*10    ,<aspect:praemunio>*10      ,<aspect:tenebrae>*10     ,<aspect:gelum>*15); #leather frost
<iceandfire:troll_leather_mountain>             .setAspects(<aspect:mythus>*10    ,<aspect:praemunio>*10      ,<aspect:tenebrae>*10     ,<aspect:terra>*15); #leather mountain
<iceandfire:troll_leather_forest>               .setAspects(<aspect:mythus>*10    ,<aspect:praemunio>*10      ,<aspect:tenebrae>*10     ,<aspect:herba>*15); #leather forest
<iceandfire:troll_weapon.trunk_frost>           .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); #troll weapons
<iceandfire:troll_weapon.hammer>                .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); 
<iceandfire:troll_weapon.column_forest>         .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); 
<iceandfire:troll_weapon.column_frost>          .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); 
<iceandfire:troll_weapon.trunk>                 .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); 
<iceandfire:troll_weapon.axe>                   .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); 
<iceandfire:troll_weapon.column>                .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*20        ,<aspect:tenebrae>*10     ,<aspect:praecantatio>*10); 

#Swamp

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:if_hydra"}})
                                                .setAspects(<aspect:mythus>*100   ,<aspect:praecantatio>*100  ,<aspect:alkimia>*100    ,<aspect:victus>*200); 
<entity:iceandfire:if_hydra>                    .setAspects(<aspect:mythus>*100   ,<aspect:praecantatio>*100  ,<aspect:alkimia>*100    ,<aspect:victus>*200); 
<iceandfire:hydra_skull>                        .setAspects(<aspect:mythus>*50    ,<aspect:spiritus>*20       ,<aspect:alkimia>*50     ,<aspect:victus>*50);  #hydra
<iceandfire:hydra_fang>                         .setAspects(<aspect:mythus>*10    ,<aspect:aversio>*10        ,<aspect:alkimia>*10);                          
<iceandfire:hydra_heart>                        .setAspects(<aspect:mythus>*50    ,<aspect:praecantatio>*30   ,<aspect:alkimia>*50     ,<aspect:victus>*200); 

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:stymphalianbird"}})
                                                .setAspects(<aspect:mythus>*20    ,<aspect:aer>*10            ,<aspect:volatus>*20     ,<aspect:ventus>*20); 
<entity:iceandfire:stymphalianbird>             .setAspects(<aspect:mythus>*20    ,<aspect:aer>*10            ,<aspect:volatus>*20     ,<aspect:ventus>*20); 
<iceandfire:stymphalian_skull>                  .setAspects(<aspect:mythus>*15    ,<aspect:spiritus>*20       ,<aspect:volatus>*40     ,<aspect:ventus>*40);  #ironbird
<iceandfire:stymphalian_bird_feather>           .setAspects(<aspect:mythus>*5     ,<aspect:aer>*5             ,<aspect:volatus>*5      ,<aspect:ventus>*5); 

#Jungle

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:amphithere"}})
                                                .setAspects(<aspect:mythus>*25    ,<aspect:aer>*15            ,<aspect:volatus>*15     ,<aspect:desiderium>*20); 
<entity:iceandfire:amphithere>                  .setAspects(<aspect:mythus>*25    ,<aspect:aer>*15            ,<aspect:volatus>*15     ,<aspect:desiderium>*20); 
<iceandfire:amphithere_feather>                 .setAspects(<aspect:mythus>*5     ,<aspect:aer>*5             ,<aspect:volatus>*5      ,<aspect:desiderium>*20);  #amphithere
<iceandfire:amphithere_skull>                   .setAspects(<aspect:mythus>*30    ,<aspect:spiritus>*20       ,<aspect:aer>*20         ,<aspect:volatus>*20);  

<iceandfire:myrmex_jungle_chitin>               .setAspects(<aspect:mythus>*5     ,<aspect:praemunio>*5       ,<aspect:herba>*5); #jungle myrmex
<iceandfire:myrmex_jungle_resin>                .setAspects(<aspect:mythus>*5     ,<aspect:permutatio>*5      ,<aspect:herba>*5); 
<iceandfire:myrmex_jungle_egg:*>                .setAspects(<aspect:mythus>*20    ,<aspect:victus>*10         ,<aspect:herba>*5); 

#Desert
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:deathworm"}})
                                                .setAspects(<aspect:mythus>*30    ,<aspect:vinculum>*20       ,<aspect:bestia>*50);
<entity:iceandfire:deathworm>                   .setAspects(<aspect:mythus>*30    ,<aspect:vinculum>*20       ,<aspect:bestia>*50);
<iceandfire:deathworm_chitin:*>                 .setAspects(<aspect:mythus>*5     ,<aspect:praemunio>*5       ,<aspect:bestia>*5); #deathworm
<iceandfire:iceandfire.deathworm_egg:*>         .setAspects(<aspect:mythus>*10    ,<aspect:victus>*20         ,<aspect:bestia>*20); 
<iceandfire:deathworm_tounge>                   .setAspects(<aspect:mythus>*20    ,<aspect:vinculum>*50       ,<aspect:bestia>*50);

<iceandfire:myrmex_desert_chitin>               .setAspects(<aspect:mythus>*5     ,<aspect:praemunio>*5       ,<aspect:ignis>*5); #desert myrmex
<iceandfire:myrmex_desert_resin>                .setAspects(<aspect:mythus>*5     ,<aspect:permutatio>*5      ,<aspect:ignis>*5); 
<iceandfire:myrmex_desert_egg:*>                .setAspects(<aspect:mythus>*20    ,<aspect:victus>*10         ,<aspect:ignis>*5); 

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:if_cockatrice"}})
                                                .setAspects(<aspect:mythus>*10    ,<aspect:mortuus>*20        ,<aspect:motus>*20        ,<aspect:perditio>*30); 
<entity:iceandfire:if_cockatrice>               .setAspects(<aspect:mythus>*10    ,<aspect:mortuus>*20        ,<aspect:motus>*20        ,<aspect:perditio>*30); 
<iceandfire:cockatrice_skull>                   .setAspects(<aspect:mythus>*10    ,<aspect:spiritus>*20       ,<aspect:motus>*10        ,<aspect:perditio>*20);  #cockatrice
<iceandfire:cockatrice_eye>                     .setAspects(<aspect:mythus>*20    ,<aspect:mortuus>*20        ,<aspect:motus>*10        ,<aspect:perditio>*50); 

#Forest/plains

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:hippogryph"}}) #hippogryph
                                                .setAspects(<aspect:mythus>*50    ,<aspect:ventus>*50         ,<aspect:victus>*50);
<entity:iceandfire:hippogryph>                  .setAspects(<aspect:mythus>*50    ,<aspect:ventus>*50         ,<aspect:victus>*50);
<iceandfire:hippogryph_skull>                   .setAspects(<aspect:mythus>*20    ,<aspect:spiritus>*20       ,<aspect:ventus>*20       ,<aspect:victus>*40);  
<iceandfire:hippogryph_egg:*>                   .setAspects(<aspect:mythus>*20    ,<aspect:victus>*40         ,<aspect:ventus>*40); 

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:if_pixie"}}) #pixie
                                                .setAspects(<aspect:mythus>*20    ,<aspect:praecantatio>*50   ,<aspect:humanus>*20      ,<aspect:desiderium>*50); 
<entity:iceandfire:if_pixie>                    .setAspects(<aspect:mythus>*20    ,<aspect:praecantatio>*50   ,<aspect:humanus>*20      ,<aspect:desiderium>*50); 
<iceandfire:pixie_dust>                         .setAspects(<aspect:mythus>*2     ,<aspect:praecantatio>*30   ,<aspect:humanus>*20      ,<aspect:desiderium>*5); 
<iceandfire:ambrosia>                           .setAspects(<aspect:mythus>*2     ,<aspect:praecantatio>*40   ,<aspect:victus>*20       ,<aspect:desiderium>*20); 
<iceandfire:jar_pixie:*>                        .setAspects(<aspect:mythus>*20    ,<aspect:praecantatio>*50   ,<aspect:humanus>*20      ,<aspect:desiderium>*50); 
<iceandfire:pixie_wings>                        .setAspects(<aspect:mythus>*20    ,<aspect:praecantatio>*50   ,<aspect:imperium>*20     ,<aspect:desiderium>*50); 
<iceandfire:pixie_house:*>                      .setAspects(<aspect:herba>*20     ,<aspect:auram>*5); 

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:snowvillager"}})
                                                .setAspects(<aspect:humanus>*20   ,<aspect:permutatio>*20     ,<aspect:desiderium>*20); 
<entity:iceandfire:snowvillager>                .setAspects(<aspect:humanus>*20   ,<aspect:permutatio>*20     ,<aspect:desiderium>*20); 

#Ice

<iceandfire:dread_shard>                        .setAspects(<aspect:exanimis>*10  ,<aspect:perditio>*10       ,<aspect:spiritus>*20); 

<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_thrall"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:perditio>*20       ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_thrall>                .setAspects(<aspect:exanimis>*20  ,<aspect:perditio>*20       ,<aspect:spiritus>*20); 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_beast"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:bestia>*20         ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_beast>                 .setAspects(<aspect:exanimis>*20  ,<aspect:bestia>*20         ,<aspect:spiritus>*20); 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_scuttler"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:alkimia>*20        ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_scuttler>              .setAspects(<aspect:exanimis>*20  ,<aspect:alkimia>*20        ,<aspect:spiritus>*20); 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_ghoul"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:perditio>*20       ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_ghoul>                 .setAspects(<aspect:exanimis>*20  ,<aspect:perditio>*20       ,<aspect:spiritus>*20); 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_knight"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:metallum>*20       ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_knight>                .setAspects(<aspect:exanimis>*20  ,<aspect:metallum>*20       ,<aspect:spiritus>*20); 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_horse"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:motus>*20          ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_horse>                 .setAspects(<aspect:exanimis>*20  ,<aspect:motus>*20          ,<aspect:spiritus>*20); 
<minecraft:spawn_egg>.withTag({EntityTag: {id: "iceandfire:dread_lich"}})
                                                .setAspects(<aspect:exanimis>*20  ,<aspect:praecantatio>*20   ,<aspect:spiritus>*20); 
<entity:iceandfire:dread_lich>                  .setAspects(<aspect:exanimis>*20  ,<aspect:praecantatio>*20   ,<aspect:spiritus>*20); 

/*
#######################################################

Tinker's construct

#######################################################
*/

<tconstruct:materials:17>                       .setAspects(<aspect:mortuus>*10      ,<aspect:infernum>*10    ,<aspect:tenebrae>*5       ,<aspect:perditio>*5); #wither bone

/*
#######################################################

Vanilla

#######################################################
*/

<minecraft:stone:3>                             .setAspects(<aspect:terra>*5      ,<aspect:ordo>); #diorite
<minecraft:stone:5>                             .setAspects(<aspect:terra>*5      ,<aspect:perditio>); #andesite
<minecraft:stone:1>                             .setAspects(<aspect:terra>*5      ,<aspect:ignis>); #granite

<minecraft:skull:1>                             .setAspects(<aspect:spiritus>*10      ,<aspect:infernum>*10    ,<aspect:tenebrae>*5       ,<aspect:perditio>*5); #wither skull

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
