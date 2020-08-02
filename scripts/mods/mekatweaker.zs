#loader mekatweaker

import mods.mekatweaker.InfuserType;

/*
Code and textures from: https://github.com/Redfire75369/Nucleon
*/

InfuserType.addType("GLOWSTONE");
InfuserType.addTypeObject(oreDict["dustGlowstone"], "GLOWSTONE", 100);
InfuserType.addTypeObject(oreDict["blockGlowstone"], "GLOWSTONE", 400);
InfuserType.addTypeObject(oreDict["itemCompressedGlowstone"], "GLOWSTONE", 800);

InfuserType.addType("ENDER");
InfuserType.addTypeObject(oreDict["dustEnderPearl"], "ENDER", 100);
InfuserType.addTypeObject(oreDict["pearlEnder"], "ENDER", 100);
InfuserType.addTypeObject(oreDict["itemCompressedEnder"], "ENDER", 800);