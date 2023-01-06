#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

# Create Anglesite:
var itemanglesite = VanillaFactory.createItem("anglesite");

# Create Benitoite:
var itembenitoite = VanillaFactory.createItem("benitoite");

# Register items
itemanglesite.register();
itembenitoite.register();