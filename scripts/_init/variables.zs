import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import mods.zenutils.I18n;

#priority 3000

# Importand preprocessor!
# Significantly speedup CR load time (about 20s in 9m load time)
#no_fix_recipe_book

static meltingExceptions as IData = ['Amber','Redstone','Coal','Diamond'] as IData;


static bookWriters        as  string[string]     = {} as string[string];
static bookWrittenBy      as  IItemStack[string] = {} as IItemStack[string];
static bookWrittenBy_ingr as IIngredient[string] = {} as IItemStack[string];

function addWrittenBook(
  name as string,
  id as string,
  lookupText as string[]
) as void {
  bookWriters[name] = id;
  bookWrittenBy[name] = <minecraft:written_book>.withTag(
    {
      display:{Name: I18n.format(game.localize("e2ee.written_book.by"), game.localize("e2ee.written_book."~name))},
      author: name,
      pages: [lookupText[0]~'?', lookupText[1]~'?', ]
    }
  , false);

  bookWrittenBy_ingr[name] = bookWrittenBy[name].only(function(book) {
    if(!book.hasTag) return false;
    if(isNull(book.tag.pages) || isNull(book.tag.pages.asList())) return false;
    val list = book.tag.pages.asList();
    if(list.length < 8) return false;
    for page in list {
      if(isNull(page)) return false;
      val any_str = page.asString();
      if(isNull(any_str)) return false;
      val str = any_str.toLowerCase();
      if (str.split(lookupText[0].toLowerCase()).length +
          str.split(lookupText[1].toLowerCase()).length < 5) return false;
    }
    return true;
  });
}

addWrittenBook('Cow'     , 'minecraft:cow'     , ["Moo"          , "Moam"]);
addWrittenBook('Pig'     , 'minecraft:pig'     , ["Oink"         , "Weeeet"]);
addWrittenBook('Cat'     , 'minecraft:ocelot'  , ["Meeeoow"      , "Rreraow"]);
addWrittenBook('Enderman', 'minecraft:enderman', ["Darkness"     , "Shhhh"]);
addWrittenBook('Chicken' , 'minecraft:chicken' , ["Cock A Doodle", "Cluck"]);
addWrittenBook('Dog'     , 'minecraft:wolf'    , ["Wooof"        , "Ruff"]);
addWrittenBook('Sheep'   , 'minecraft:sheep'   , ["Baa"          , "Maaaa"]);
addWrittenBook('Creeper' , 'minecraft:creeper' , ["Sssss"        , "Hsssss"]);
addWrittenBook('Zombie'  , 'minecraft:zombie'  , ["Brains"       , "Eeehhhahhh"]);