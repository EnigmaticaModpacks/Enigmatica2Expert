#modloaded botanicadds

# Fix recipe that appears on every item in game
recipes.remove(<botanicadds:mana_tesseract>);
recipes.addHiddenShapeless("mana_tesseract_bind", <botanicadds:mana_tesseract>, [<botanicadds:mana_tesseract:*>, <*>.marked('marked')],
  function(out, ins, cInfo) {
    return out.updateTag({Channel: ins.marked.commandString.hashCode()});
  }, 
null);