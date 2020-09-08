defaultFileContent.v0_14 = {
  description: "Fluid update! Many things...$(br2)List of things was added in this patch ->",
  icon: "artisanworktables:artisans_grimoire_platinum"
};

Patchouli_js({
	title: "MEGA potion!",
	_text: `
		Now you can:
    $(li)Combine Vanilla potions
    $(li)Extend Durations of Rustic's Elixirs
    $(li)Increase Potency of Blood Magic's Flasks
    And finally...
    $(li)Combine this three types into one MEGA potion
	`,
	item: `bloodmagic:potion_flask{\"PotionMEGA\":1,\"ench\":[{\"lvl\":1,\"id\":36}],\"enchantmentColor\":15326208,\"display\":{\"Name\":\"§eMEGA Potion\"},\"CustomPotionEffects\":[{\"Id\":1,\"Duration\":2400,\"Amplifier\":5}]}`
});

Patchouli_js({
	title: "ExNihilio Hammers",
	icon: "exnihilocreatio:hammer_gold",
	type:  "spotlight_advanced",
  ...item$i(["_","wood","stone","iron","gold"], m=>"exnihilocreatio:hammer_"+m),
	_text: `
		$(l)ExNihilio/$ hammers and their $(l)ExCompressum/$ analogs was removed. Use $(l)Tinker's/$ sledge hammers instead.
	`,
})

Patchouli_js("Liquid Interactions", {
	item:  "astralsorcery:blockchalice",
	_text: `Not only Water+Lava!
		Now many kinds of liquids can provide blocks when interacting in the World or in Containtment Chalice$(br2)
		$(l:knowledge/liquids/liquid_interactions)<<See more>>/$`
})

var btweaks = config("botaniatweaks.cfg");
Patchouli_js("Botania", [
  {
    item: "botania:kingkey",
    _text: `$(l)Key of the King's Law/$ was significally buffed.
      Now each projectile deals $(l)$(#d11)${ btweaks.balance.keyDamageScale * 20 }/$ damage.`,
  }, {
    item: "botania:manabomb",
    _text: `$(l)Manastorm Charge/$ was $(l)${
      btweaks.balance.manastormScaleFactor }/$x times buffed.`,
  }, {
    item: "botania:rfgenerator",
    _text: `Buffed, produced up to $(l)${
			numeral(
      	btweaks.balance.fluxfield.fePerBurst * 10 / btweaks.balance.fluxfield.shotsPerBurst
			).format('0,0')
			}/$ RF/t`,
  }, {
    item: "botania:manaresource:15",
    _text: `Dispensers shoot glass bottles to turn them in to Ender Air in the End dimension.`,
  }
  ].map(o=>({...{
    type: "spotlight",
	},...o}))
)

Patchouli_js("Recipe Changes",{
	title: "Draconium chest",
	item: "draconicevolution:draconium_chest",
	_text: `$(l)Draconium chest/$ now can be crafted earlier in $(l)Empowerer/$ or $(l)Combination Crafting/$.`,
})

Patchouli_js({
	title: "EvT Solar Panels",
	icon:	"environmentaltech:solar_cont_1",
	type:	"spotlight_advanced",
	item0: "_",
  item1: "environmentaltech:solar_cont_1",
  item2: "environmentaltech:solar_cell_litherite",
  item3: "environmentaltech:void_ore_miner_cont_1",
	uneven: true,
	_text: `
		All 6 $(l)Void Miner/$ and $(l)Solar/$ Controller's recipes was changed.
    Energy output was significally changed too.
    $(l:knowledge/energy/environmental_tech)<<See more>>/$
	`,
})

Patchouli_js("Bug Fixes", [
	{
		item: "forestry:chipsets:3{T:3}",
		title: "Circuits ME fix",
		_text: `
			Forestry's $(l)Circuits/$ finally can be used in ME autocrafting!
			Before this update, pattern for recipe should be created manually (not with $(l)[+]/$ JEI button)`
	},{
		item: "mekanism:machineblock2:11",
		title: "Mekanism Tanks Fix",
		_text: `
			Mekanism's Fluid and Gas$(l)Tanks/$ finally can be used in ME autocrafting!
			Before this update, pattern for recipe should be created manually (not with $(l)[+]/$ JEI button)`
	}
])

Patchouli_js("Recipe Changes", {
  title: 'MA Crystals Craft',
	type:  "spotlight_advanced",
	icon: "matc:supremiumcrystal",
  uneven: true,
  item0: 'matc:inferiumcrystal',
  item1: 'matc:prudentiumcrystal',
  item2: 'matc:intermediumcrystal',
  item3: 'matc:superiumcrystal',
  item4: 'matc:supremiumcrystal',
	_text: `
		Now upgrading $(#972b4a)Mystical Agriculture/$ $(l)Infusion Crystals/$ consume previous crystal and keep its damage.`
})

Patchouli_js("Recipe Changes", {
  title: 'Supremium Armor',
	icon:  "contenttweaker:supremium_chest_base",
	type:  "spotlight_advanced",
  item1: 'contenttweaker:supremium_helmet_base',
  item2: 'contenttweaker:supremium_chest_base',
  item3: 'contenttweaker:supremium_leggings_base',
  item4: 'contenttweaker:supremium_boots_base',
	_text: `
		$(#BA0014)Supremium/$ Cores now grants $(l)Creative Flight/$, but they cant be casted straight from smeltery.`
})

Patchouli_js("Cluster Processing", {
	type:  "item_spread",
	item : "jaopca:item_clusterdraconium",
	item0: "draconicevolution:draconium_ingot",
	item1: "draconicevolution:draconium_dust",
	item2: "jaopca:item_clumpdraconium",
	item3: "jaopca:item_sharddraconium",
	item4: "jaopca:item_crusheddraconium",
	item5: "forge:bucketfilled{FluidName:\"draconium\",Amount:1000}",
	_text: `
		Thaumcraft's $(l)Native Clusters/$ now can be benificated in various machines to provide additional outputs
	`,
})