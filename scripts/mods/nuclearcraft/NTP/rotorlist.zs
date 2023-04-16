#norun
#priority 2147483645

#loader preinit nc_preinit crafttweaker

import scripts.mods.nuclearcraft.NTP.rotorclasses.StatorInfo;
import scripts.mods.nuclearcraft.NTP.rotorclasses.BladeInfo;
import scripts.mods.nuclearcraft.NTP.rotorclasses.qmdBladeInfo;

static StatorInfoList as [StatorInfo] = [

					StatorInfo("thorium","TBU", 0.65),
					StatorInfo("uranium","Uranium238",0.70),
					StatorInfo("trinitite","Trinitite", 0.60),
					StatorInfo("elektron","Elektron", 0.80)
					];			
					
static BladeInfoList as [BladeInfo] = [

					BladeInfo("neptunium","Neptunium237All","Steel",1.03, 1.45),
					BladeInfo("plutonium","Plutonium242All","Steel",1.06, 1.50),
					BladeInfo("niosteel","Niobium","Steel",1.00, 1.35),
					BladeInfo("americium","Americium243All","Extreme",1.13, 1.65),
					BladeInfo("curium","Curium246All","Extreme",1.16, 1.70),
					BladeInfo("extremenio","Niobium","Extreme",1.10, 1.55),
					BladeInfo("berkelium","Berkelium247All","SiCSiCCmC",   1.23, 1.90),
					BladeInfo("californium","Californium250All","SiCSiCCmC", 1.27, 2.20),
					BladeInfo("sicnio","Niobium","SiCSiCCmC", 1.20, 1.75),
					BladeInfo("copernicum","Copernicium291All","SuperAlloy", 1.27, 2.20)
					
					];	
					
static qmdBladeInfoList as [qmdBladeInfo] = [

					qmdBladeInfo("elektron90","Magnesium24","Strontium90","Steel", 1.00, 0.85),
					qmdBladeInfo("elektron192","Beryllium7","Iridium192","Extreme", 1.05, 0.90),
					qmdBladeInfo("elektron231","Uranium234","Protactinium231","SiCSiCCmC", 1.10, 0.95)
					
					];	
				