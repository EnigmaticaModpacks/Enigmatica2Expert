import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

#priority 3000

# Importand preprocessor!
# Significantly speedup CR load time (about 20s in 9m load time)
#no_fix_recipe_book


static cowWrittenBook as IItemStack = <minecraft:written_book>.withTag(
  {
    display:{Name:"§6A book written by a Cow"},
    author: "Cow",
    pages: ["Mooo?"]
  }
, false);

static cowWrittenBook_ingr as IIngredient = cowWrittenBook.only(function(book) {
  if(!book.hasTag) return false;
  if(isNull(book.tag.pages) || isNull(book.tag.pages.asList())) return false;
  val list = book.tag.pages.asList();
  if(list.length < 8) return false;
  for page in list {
    if(isNull(page)) return false;
    val str = page.asString();
    if(isNull(str) || str.split("[Mm]oo").length < 5) return false;
  }
  return true;
});