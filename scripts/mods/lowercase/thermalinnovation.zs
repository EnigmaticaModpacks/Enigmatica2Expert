import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#modloaded thermalinnovation

# Remove and hide creative innovation items
utils.rh(<thermalinnovation:quiver:32000>.withTag({}));
utils.rh(<thermalinnovation:injector:32000>.withTag({}));
utils.rh(<thermalinnovation:magnet:32000>.withTag({Energy: 600000}));
utils.rh(<thermalinnovation:drill:32000>.withTag({Energy: 600000, Mode: 4}));
utils.rh(<thermalinnovation:saw:32000>.withTag({Energy: 600000, Mode: 4}));

# Remake magnet
recipes.removeByRecipeName("thermalinnovation:magnet");
recipes.removeByRecipeName("thermalinnovation:magnet_1");
recipes.removeByRecipeName("thermalinnovation:magnet_2");
recipes.removeByRecipeName("thermalinnovation:magnet_3");
recipes.removeByRecipeName("thermalinnovation:magnet_4");

# First level magnet
recipes.addShaped(<thermalinnovation:magnet>, [
	[<ore:ingotConductiveIron>, null, <ore:ingotConductiveIron>],
	[<ore:ingotLead>, null, <ore:ingotLead>],
	[null, <ore:ingotHeavy>, null]]);

function remakeMagnet(meta as int, i1 as IIngredient, i2 as IIngredient){
	var item = itemUtils.getItem("thermalinnovation:magnet", meta);
	var prev = itemUtils.getItem("thermalinnovation:magnet", meta - 1).withTag({});
	recipes.addShaped("TE Magnet " ~ meta, item, [
		[null, i2, null],
		[i1, prev.marked("marked"), i1],
		[i2, null, i2]],
	utils.upgradeFnc, null);
}

remakeMagnet(1, <thermalfoundation:material:162>, <enderio:item_alloy_nugget:0>);
remakeMagnet(2, <thermalfoundation:material:161>, <enderio:item_alloy_nugget:3>);
remakeMagnet(3, <thermalfoundation:material:165>, <enderio:item_alloy_nugget:1>);
remakeMagnet(4, <thermalfoundation:material:167>, <enderio:item_alloy_nugget:2>);

val drillIngrs = {
  "S": <immersiveengineering:drillhead>, # Steel Drill Head
  "l": <ore:gearSilver>,                 # Silver Gear
  "□": <ore:plateElectrumFlux>,          # Fluxed Electrum Plate
  "¤": <ore:gearIronInfinity>,           # Infinity Bimetal Gear
  "⌂": <thermalfoundation:material:640>, # Tool Casing
  "P": <ore:gearPlatinum>,               # Platinum Gear
  "F": <thermalinnovation:drill>.withTag({Energy: 0, Mode: 1}), # Fluxbore (Basic)
  "n": <ore:gearEnergized>,              # Energized Bimetal Gear
  "L": <ore:gearLumium>,                 # Lumium Gear
  "x": <thermalinnovation:drill:1>.withTag({Energy: 0, Mode: 2}), # Fluxbore (Hardened)
  "V": <ore:gearVibrant>,                # Vibrant Bimetal Gear
  "i": <ore:gearSignalum>,               # Signalum Gear
  "u": <thermalinnovation:drill:2>.withTag({Energy: 0, Mode: 2}), # Fluxbore (Reinforced)
  "☼": <ore:gearTitanium>,               # Titanium Gear
  "E": <ore:gearEnderium>,               # Enderium Gear
  "○": <thermalinnovation:drill:3>.withTag({Energy: 0, Mode: 3}), # Fluxbore (Signalum)
  "T": <ore:gearTitaniumIridium>,        # Titanium Iridium Alloy Gear
} as IIngredient[string];

# [Fluxbore (Basic)] from [Fluxed Electrum Plate][+4]
recipes.removeByRecipeName("thermalinnovation:drill");
craft.make(<thermalinnovation:drill>.withTag({Energy: 0, Mode: 1}), ["pretty",
  "  S  ",
  "l □ l",
  "¤ ⌂ ¤"], drillIngrs
);

# [Fluxbore (Hardened)] from [Fluxbore (Basic)][+4]
recipes.removeByRecipeName("thermalinnovation:drill_1");
craft.make(<thermalinnovation:drill:1>.withTag({Energy: 0, Mode: 2}), ["pretty",
  "  S  ",
  "P F P",
  "n ⌂ n"], drillIngrs
);

# [Fluxbore (Reinforced)] from [Fluxbore (Hardened)][+4]
recipes.removeByRecipeName("thermalinnovation:drill_2");
craft.make(<thermalinnovation:drill:2>.withTag({Energy: 0, Mode: 2}), ["pretty",
  "  S  ",
  "L x L",
  "V ⌂ V"], drillIngrs
);

# [Fluxbore (Signalum)] from [Fluxbore (Reinforced)][+4]
recipes.removeByRecipeName("thermalinnovation:drill_3");
craft.make(<thermalinnovation:drill:3>.withTag({Energy: 0, Mode: 3}), ["pretty",
  "  S  ",
  "i u i",
  "☼ ⌂ ☼"], drillIngrs
);

# [Fluxbore (Resonant)] from [Fluxbore (Signalum)][+4]
recipes.removeByRecipeName("thermalinnovation:drill_4");
craft.make(<thermalinnovation:drill:4>.withTag({Energy: 0, Mode: 4}), ["pretty",
  "  S  ",
  "E ○ E",
  "T ⌂ T"], drillIngrs
);
