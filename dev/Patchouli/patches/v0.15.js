/* eslint-disable no-undef */
defaultFileContent.v0_15 = {
  description: 'Space update!$(br2)Changes in this patch ->',
  icon: 'artisanworktables:artisans_grimoire_copper'
}

Patchouli_js([{
	type:  'item_spread',
	title: 'Bean Pod Buff',
	item : 'randomthings:beanpod',
  ...item$i([1,2,3,4,5,6], i=>'biomesoplenty:gem:'+i),
	_text: `
		$(l)Bean Pod/$ now drop BoP gems in addition to its old drops
	`,
},{
	title: 'Bees',
	item:  'gendustry:honey_comb:15',
	_text: `There is $(l)16/$ new Bee species.
		Vanilla Bees was buffed too.`
},{
	title: 'Planets',
	item:  'advancedrocketry:spacehelmet',
	_text: `Barely every planet in space was $(l)changed/$
		Generation, ores and landscapes was changed`
},{
	title: 'Tesla Coil',
	item:  'immersiveengineering:metal_device1:8',
	_text: 'Now deals $(#F31)90/$ damage but consume more RF'
},{
	title: 'Torches',
	item:  'minecraft:torch',
	_text: 'Light level was nerfed to $(#F31)10/$'
},{
	title: 'Excavation',
	item:  'oeintegration:excavatemodifier',
	_text: 'Excavation over Bedrock Ores was $(#F31)disabled/$'
},{
	title: 'Cyclic Machines',
	item:  'cyclicmagic:auto_crafter',
  type:  'grid_text',
	text:  `These machines don't use $(l)RF/$ anymore`,
  ...item$i([
		'auto_crafter',
		'auto_packager',
		'block_fishing',
		'block_hydrator',
		'block_user',
		'dehydrator',
		'dropper_exact',
		'fire_starter',
		'solidifier',
	], i=>'cyclicmagic:'+i)
}])

Patchouli_js('Nuclear', [{
	title: 'Coolers Buff',
	item:  'nuclearcraft:nuclear_furnace_idle',
	_text: 'Active reactor coolers was buffed'
},{
	title: 'Excess Mixings',
	item:  'nuclearcraft:salt_mixer_idle',
	_text: `Useless fluid mixings was removed.
		For example Depleted Fuel mixing with salt`
},{
	title: 'Radiation',
	item:  'nuclearcraft:rtg_plutonium',
	_text: 'Radiation was added to various $(l)Avaritia/$ and $(l)Extended Crafting/$ items'
}])

Patchouli_js('Tinker\'s Construct', [{
	title: 'Materials Tweaks',
	item:  'plustic:osgloglasingot',
	_text: `$(l)Osgloglas/$ was significantly nerfed.
		Other materials was tweaked too, including assign $(l)new traits/$`
},{
	title: 'Tool recycling',
	item:  'artisanworktables:worktable:3',
	_text: `Recycling of TCon tools and armor now possible.
		$(l:items/recycling)<<See more>>/$`
}])

Patchouli_js('Recipes', [{
	title: 'Satchels',
	item:  'thermalexpansion:satchel:2',
	_text: 'Satchels was simplified'
},{
	title: 'Fake Iron',
	item:  'enderio:block_alloy:9',
	_text: '$(l)Fake Iron/$ now has much more uses'
}])