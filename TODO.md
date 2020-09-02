# Ideas list

## Finished

-----------


## Planned

-----------

#### Other:

- 🔷 [x] Processed cheese material (molten cheese, molten cheese rivers in Ratlantis)
- 🧩 [x] Random Tweaks
- 🧩 [ ] Remap New tconevo materials to tool levels
- 🧩 [ ] Review melting temperatures for liquids (higher temperature for most of them)
- 🧱 [ ] Magic Ore Processing . 📦 poop + Cluster => 📦hunk -> 📦 small piece -> 💧 washed -> ?
- 🔷 [ ] Remake creatures drop items
- 🔷 [ ] Jumps.zs should store jump amount
- 🔨 [ ] Jump modifier
- 🔨 [ ] Thaum Curiocity drop
- 💥 [ ] Give uses to singularities (Coal - burn time, etc)
- 💥 [ ] New 🐝 for endgame
- 💥 [ ] **Rats** Structures Generation
- 🔴 [ ] Backpack
- 🔷 [ ] Fix XML recipes missed inputs (crystalline ingor in electric arc for example)
- 🔷 [ ] Check why Gas intake was modified
- 🔷 [ ] Reload JER world data
- 🟢 [x] Alfinivia (milking)
- 🟢 [x] Better Hurt Timers (mobs do not deals damage)
- 🌿 [ ] Patchouli book texture
- 🔨 [ ] Tweak TConEvo energy usage
- 🔷 [ ] Rename Terrestial -> Terrestrial
- 🔷 [ ] AdvRock crystal hard tool level
- 🟢 [ ] Biome Tweaker (make planets ground higher, deep ocean biomes)

### Do after process.zs class rework:

- 𝓩𝒮 [ ] Process rework in zenClass
- ⚙️ [ ] Process: change "Exception" string to IData
- ⚙️ [ ] Process: Exceptions union and substraction for Benification
- ⚙️ [ ] ImmerEng mixer to Process
- ⚙️ [ ] Liquid Concrete
- ⚙️ [ ] TconEvo plates, gears and dusts
- ⚙️ [ ] Batch alloy craftings
- ⚙️ [ ] Florbs filling (probably in Artisan's)
- ⚙️ [ ] "Soft" and "Hard" versions of functions, add Pam's machines to functions
- ⚙️ [ ] bonusType for SAG mill
- ⚙️ [ ] AdvRock Electrolyser should accept any amount of output but cut if > 2
- ⚙️ [ ] Chained crafting (Solar Panels in precision assembler)

## Long-term

-----------

- [ ] Make some ORE spawn only on planets
- [ ] Check why magnet shapeless recipes dissapeared
- [ ] ⚙️ Primal Mana in other machines (no machines accept 3 liquids yet)
- [ ] Fake players can use cans ?
- 🔴 [ ] Replace Extended Crafting -> EC Omnifactory (oreDict bug, reported)
- 💜 [ ] Account Thaumcraft's aspects cost
- 💜 [ ] Check why Lumium so pricy
- 💜 [ ] UU Forbid ME drives to be replicable
- 💜 [ ] UU Silicon Wafer cant be seen in UU
- 🔷 [ ] Prefect Fuel. Summ of several best fuels. Probably bunch of drums together
- 🔷 [ ] Tcon Armor that speed up time in bottle


## Unused TC traits

-----------

- 


## Items for crafting

-----------

- ✏️ Flux to early crafts
- ✏️ More mechanics explosions
- ✏️ More using for fluid Latex
- ✏️ Plasma to craft
- ✏️ To Crafts pile of neutronium
- ✏️ Topaz To Crafts
- ✏️ IC2 liquids to craft
- ✏️ Forestry Phosphor
- ✏️ Infinity Reagent
- ✏️ Crystallized Obsidian
- ✏️ Forestry's Carton
- Bibliocraft Printing Press
- TwiFrst Firefly
- Iridium Rod
- Titan-Alum rod
- Titan-Alum Sheet
- Spectre Illuminator
- End Stone Dust
- Rare Earth
- Ectoplasm
- Blood Stone
- Nano-Particles
- Emeraldic
- HSLA ingot
- 💧 Crystallized Obsidian
- 💧 Menril Resin
- 💧 Liquid Chorus
- 💧 Enriched Lava
- 💧 Hot Spring Water


---------------------
ITEMS OF INTEREST
---------------------
<botania_tweaks:compressed_tiny_potato_7>
<twilightforest:castle_door:*>
<twilightforest:firefly>
<twilightforest:raw_venison>
<twilightforest:cooked_venison>
<randomthings:spectreilluminator>

<bibliocraft:enchantedplate>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 0 as short}]})
<thaumcraft:nugget:10> -- Rare Earth
<randomthings:ingredient:2> -- Ectoplasm
<tombmanygraves:death_list>
<randomthings:rezstone> -- Bloodstone
<advancedrocketry:blocklens> - Lence (required precision assembler)
<enderio:block_holy_fog> -- Nano-particles
randomthings:strong_collapse -- Turnd upsidedown potion

<liquid:hot_spring_water>
<liquid:liquid_sunshine>
<liquid:blockfluiddirt> -- Liquid Dirt from Animus
<liquid:enrichedlava>
<liquid:liquidchorus>
<liquid:menrilresin>
<liquid:crystal> -- Crystallized obsidian
<liquid:amber> -- Crystallized amber

---------------------
CRAFTS OF INTEREST
---------------------
- **Burst Seed**
- **Crushing Block**
- **Imbuing Station** (Note: IItemstacks must be in singletons or it will not work)
mods.rt.RandomThingsTweaker.addImbuingRecipe(IItemStack top, IItemStack leftside, IItemStack bottom, IItemStack center, IItemStack result);


### More info:

/ct thaumcraftDump


## Ideas for singularities

- ">"            ,**Coal Singularity**         - Huge Burn Time
- ":1>"          ,**Iron Singularity**         - Press Plates
- ":2>"          ,**Lapis Lazuli Singularity** - Turns water into coolant
- ":3>"          ,**Redstone Singularity**     - Produce Power
- ":4>"          ,**Glowstone Singularity**    - Infinite glowing nano-particles
- ":5>"          ,**Gold Singularity**         - ? infinity gold when smelted
- ":6>"          ,**Diamond Singularity**      - Give indestructible to Tinkers tools and armor
- ":7>"          ,**Emerald Singularity**      - ? Cycle Villagers
- ":16>"         ,**Aluminum Singularity**     - ? Infinity ImmersEngin wires (click to create wire coil)
- ":17>"         ,**Copper Singularity**       - ? Steam Powered
- ":18>"         ,**Tin Singularity**          - ? Free cans when picking up liquids
- ":19>"         ,**Bronze Singularity**       - ? Something about breaking blocks
- ":22>"         ,**Silver Singularity**       - Holy damage zombies
- ":23>"         ,**Lead Singularity**         - ? Radiation protection
- ":24>"         ,**Steel Singularity**        - ? Machine case
- ":25>"         ,**Nickel Singularity**       - ? Something about fuel
- ":26>"         ,**Constantan Singularity**   - Shell and bullets for railgun or revolver
- ":27>"         ,**Electrum Singularity**     - Capacitor upgrades
- ":28>"         ,**Invar Singularity**        - Hardening Cell Frames
- ":29>"         ,**Mithril Singularity**      - ? Turn manasteel blocks into mithril
- ":32>"         ,**Uranium Singularity**      - Nuclear Fuel
- ":34>"         ,**Platinum Singularity**     - ? Chemical reaction catalyst
- ":35>"         ,**Iridium Singularity**      - ? RF for tinkers tools
- ":48>"         ,**Signalum Singularity**     - Create destabilized redstone ORE from regular redstone ORE
- ":49>"         ,**Lumium Singularity**       -
- ":50>"         ,**Enderium Singularity**     -
- ":64>"         ,**Ardite Singularity**       - ? Durability of tools
- ":65>"         ,**Cobalt Singularity**       - Starts a blue fire
- ":66>"         ,**Manyullyn Singularity**    - 
- "_custom:100>" ,**Quartz Singularity**       - ? Something about chiseling
- "_custom:101>" ,**Certus Quartz**            - Instantly grow quartz crystals
- "_custom:102>" ,**Black Quartz**             -
- "_custom:103>" ,**Hard Carbon Alloy**        - Can be used as previous tier for crafting armor
- "_custom:104>" ,**Magnesium Diboride**       - Black Iron crafting catalyst
- "_custom:105>" ,**Thorium Singularity**      - Nuclear fuel
- "_custom:106>" ,**Fluxed Electrum ingula**   - Produce Power
- "_custom:107>" ,**Flux Crystal ingularit**   - Charge items in hand
- "_custom:108>" ,**Fluix Singularity**        - Free wires
- "_custom:109>" ,**Titanium Singularity**     - Increase Mining speed
- "_ultimate>"   ,**The Ultimate Singularity** - ? All above

/cofh clearblocks LD01 100 200 100 packed_ice ice water lava dirt stone snow snow_layer gravel

## Characters to use in crafts:

!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¢£¤¥¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿĀāĂăĄąĆćĈĉĊċČčĎďĐđĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłŃńŅņŇňŉŊŋŌōŎŏŐőŒœŔŕŖŗŘřŚśŜŝŞşŠšŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžƎƒƬƮƵǍǎǏǐǑǒǓǔǕǖǗǘǙǚǛǜǞǟǠǡǢǣǦǧǨǩǰǴǵǸǹǺǻǼǽǾǿȀȁȄȅȆȈȉȌȍȐȑȔȕȘșȚțȞȟȢȤȦȧȨȩȪȫȬȭȮȯȰȱȲȳȷȽȾɆɚɶʮʯʹʺʼˆˇˉ˘˙˚˛˜˝ͰͱͲͳʹ͵Ͷͷͺͻͼͽ;Ϳ΄΅Ά·ΈΉΊΌΎΏΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμνξοπρςστυφχψωϊϋόύώϏϐϑϒϓϔϕϖϗϘϙϚϛϜϝϞϟϠϡϤϰϱϲϳϴϵ϶ϷϸϹϺϻϼϽϾϿЀЁЂЃЄЅІЇЈЉЊЋЌЍЎЏАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяѐёђѓєѕіїјљњћќѝўџѠѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲѳѴѵѶѷѸѹѿҊҋҌҍҎҏҐґҒғҔҕҖҗҘҙҚқҜҝҞҟҠҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰұҲҳҴҵҶҷҸҹҺһҼҽҾҿӀӁӂӃӄӅӆӇӈӉӊӋӌӍӎӏӐӑӒӓӔӕӖӗӘәӚӛӜӝӞӟӠӡӢӣӤӥӦӧӨөӪӫӬӭӮӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿԀԁԂԃԄԅԆԇԈԉԊԋԌԍԎԏԐԑԒԓԔԕԖԗԘԙԚԛԜԝԞԟԠԡԢԣԤԥԦԧԨԩԪԫԬԭԮԯש؆؇؉كڬڭڮ۩܋ܡܣܤݿދޖޛߐߚߜߡࢴगतदधनऩपबयषहग़य़॥५६ॸॺॻॿচটঢণবরহৎঢ়ৰৱ৻ਏਝਭਰ੧ੲઙઠઢ૩૪ଓ୦୫గశ౾กขคฅฉชฎฏดตนบปผฝภมลฦศสอฮ๏๐๑ຂຈຊຍຢຣລວສອຮ໓໔໕༆༞༟༭༶࿃࿇࿎࿏ခဂငစဉဋဌဍဎဓပဖဗမဝဠဥဦဨ၀၁၃၄၅၆၇၈၉၌၎ၐၑၒၓၔၕၚၜၝၥၦၵၶၷၿႁႎ႑႒႕႘႙ႲჍჱሀሂሄህለልሪሰሳስሶሸሻሾበባቦቨቫቮንኘኛኝከካክኮያጋጟ፦ᎴᎵᏄᏒᏙᏟᏰᏵᐅᐊᓶᓷᓸᓹᓺᓻᓽᓿᔀᔁᔂᔃᔄᔯᔰᔱᔲᔳᔴᔵᔶᔷᔸᔹᔺᔻᔼᔽᕼᖅᘼᘽᘾᘿᙷᙺᙻᚢᚤᚥᚺᚻᛖᛗᛞᛥᛪឲៗ᠃᠛ᠥᠦᡡᥒᥙᥛᥰᦅᦆᦇᦋᦌᦑᦙᦢᦥᦨᦩᦫᧂᧄᧇ᧐ᨂ᱐᱙ᱞᱠᱤᱥᱧᱩᲐᲕᲙᲛᲜᲞᲩᲫᲮᲰᲳᲴᳲᳵᴍᶃḂḃḈḉḊḋḐḑḔḕḖḗḘḚḜḝḞḟḠḡḢḣḦḧḨḩḮḯḰḱḶḸḺḼḾḿṀṁṄṅṌṍṎṏṐṑṒṓṔṕṖṗṘṙṠṡṤṥṦṧṪṫṬṮṰṸṹṺṻṼṽẀẁẂẃẄẅẆẇẊẋẌẍẎẏẐẑẒẔẗẘẙẞẤấẦầẪẫẮắẰằẴẵẸẺẼẽẾếỀềỂỄễỆỐốỒồỖỗỲỳỸỹἀἁἂἃἄἅἆἇἈἉἊἋἌἍἎἏἐἑἒἓἔἕἘἙἚἛἜἝἠἡἢἣἤἥἦἧἨἩἪἫἬἭἮἯἰἱἲἳἴἵἶἷἸἹἺἻἼἽἾἿὀὁὂὃὄὅὈὉὊὋὌὍὐὑὒὓὔὕὖὗὙὛὝὟὠὡὢὣὤὥὦὧὨὩὪὫὬὭὮὯὰάὲέὴήὶίὸόὺύὼώᾀᾁᾂᾃᾄᾅᾆᾇᾈᾉᾊᾋᾌᾍᾎᾏᾐᾑᾒᾓᾔᾕᾖᾗᾘᾙᾚᾛᾜᾝᾞᾟᾠᾡᾢᾣᾤᾥᾦᾧᾨᾩᾪᾫᾬᾭᾮᾯᾰᾱᾲᾳᾴᾶᾷᾸᾹᾺΆᾼ᾽ι᾿῀῁ῂῃῄῆῇῈΈῊΉῌ῍῎῏ῐῑῒΐῖῗῘῙῚΊ῝῞῟ῠῡῢΰῤῥῦῧῨῩῪΎῬ῭΅`ῲῳῴῶῷῸΌῺΏῼ´῾  ‒–—―‖‗‘’‚“”„†‡•…‰‹›⁊⁘⁰⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎₠€₮₯₸₹₺₽ℂ℄ℍℓℕ№ℙℚℝ™ℤΩKÅ℮ℰ⅊⅓⅔⅕⅖⅗⅘⅙⅚⅛⅜⅝⅞⅟Ⅼ↊↋←↑→↓↔↕↖↗↘↙↩↴⇞⇟⇤⇥⇦⇧⇨⇩⇪⇫⇬⇭⇮⇯⇳∀∂∃∄∅∆∇∈∉∊∋∌∍∏∑−∕∙√∛∜∞∧∨∩∪∫∮∱∲∴∵≈≠≡≢≤≥⊂⊃⊄⊅⊆⊇⊈⊉⊊⊋⊌⊍⊎⊢⊣⊤⊥⊦⊧⊨⊩⊪⊫⊬⊭⊮⊯⋰⋱⋳⋵⋶⋸⋹⋻⋽⌀⌁⌂⌃⌄⌅⌆⌐⌘⌠⌡⌤⌥⌦⌧⌨⌫⌷⍘⍛⍣⍤⍪⍮⎇⎋⎛⎜⎝⎞⎟⎠⎡⎢⎣⎤⎥⎦⎧⎨⎩⎪⎫⎬⎭⎴⎵⏎⏏⏜⏝⏞⏟⏠⏯␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡␢␣␤␥␦─━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋╌╍╎╏═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬╭╮╯╰╱╲╳╴╵╶╷╸╹╺╻╼╽╾╿▀▁▂▃▄▅▆▇█▉▊▋▌▍▎▏▐░▒▓▔▕▖▗▘▙▚▛▜▝▞▟■□▢▣▤▥▦▧▨▩▪▫▬▭▮▯▲▶►▼◀◄◆◇◉◊○◎●◐◑◒◓◕◖◗◘◙◚◛◜◝◞◟◠◡◢◣◤◥◧◨◩◪◫◯◰◱◲◳◴◵◶◷◽◾☐☑☒☠☦☧☨☰☱☲☳☴☵☶☷☹☺☻☼♀♂♠♣♥♦♪♫♰♱✓✝➡➧⟨⟩⟰⟱⥾⥿⦀⨞⩈⩉⫲⫳⫴⫼⬅⬆⬇⮬⮭⮮⮯ⰀⰱⰷⰻⱄⱋⱎⱠⱢⱫⱱⱿⲆⲈⲙⲤⲬⲯⲶⲺⳄⳈⳌⳎⳚⳢ⳥⳦⳨⳩⳺⳻ⴋⴡⴶⴹⴺⴽⴿⵆⵇⵋⵎⵖⵟⷛ⸔⸕⸪⸫「」ꓚꓛꓣꓤꓥꓦ꓾ꔹꔿꕪꘉꘫꙀꚉꚌꚐꜩꜹꜻꜽꝈꝒꝓꝙꞀꞆꞮꞱ꠲꠳꠴꠵ꡡꡦꡧꣲꣳꣴꣵꣶꣷꣽꧠ꧲꧳꧴꧵꧶꧸ꧽꬃꬅꬆꭌꭳꮉꮴꮵꯖꯜ꯫꯰꯲꯵꯸ﬀﬡﬣﬧשׁשׂשּׁשּׂשּﯓﯔﷻﻙﻚﻶﻸﻺﻼ｢｣𐊍𐊜𐊵𐋀𐌀𐌌𐌑𐌞𐌡𐌰𐌶𐌺𐌻𐍂𐎒𐎓𐐀𐐂𐐌𐐍𐐐𐐚𐐜𐐞𐐡𐑍𐑸𐒀𐒆𐒒𐒔𐒠𐒡𐒢𐒣𐒤𐒥𐒧𐒨𐒩𐒰𐒱𐒲𐒴𐒼𐒽𐒾𐓄𐓅𐓊𐓋𐓌𐓓𐓟𐓠𐠌𐠑𐠙𐠨𐠰𐠿𐡌𐡐𐡙𐤃𐤆𐤉𐤗𐤢𐤧𐤮𐤶𐦥𐦬𐦰𐨐𐨥𐨦𐨭𐨲𐩃𐩇𐩠𐩣𐩦𐩪𐩫𐩭𐩮𐩯𐩱𐩸𐭙𐭝𐭢𐭨𐭹𐭾𐰎𐰓𐰡𐰵𐰶𐰷𐱆𑀅𑀛𑀡𑀦𑀶𑁖𑁗𑁘𑁧𑁭𑁯𑃡𑃢𒈫𒌋𓀀𓀁𓀂𓀄𓀆𓀔𓀷𓁁𓁃𓁎𓁕𓁡𓃠𓄁𓄪𓅈𓅉𓅝𓅦𓆀𓆉𓆦𓆽𓉵𓉷𓊾𓋔𓋖𓋨𓋺𓋻𓌖𓍓𓎈𓎉𓎏𓏞𓏟𓐧