/*



*/

/* TODO:


## ⚙️ Process.zs

- [ ] `scripts.process` files should be rewritten to work with classes. Then:
- [ ] Exceptions union and substraction for Benification
- [ ] Batch alloy craftings
- [ ] "Soft" and "Hard" versions of functions, add Pam's machines to functions
- [ ] Ingredients with chance should multiplied if chance > 1.0

*/

import scripts.process.work.Work;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#priority 2000


zenClass Process {
	zenConstructor() {}

  #------------------------------------------------------------------
  # Public Methods
  #------------------------------------------------------------------
  function work(tags as string, input as IIngredient, output as IItemStack) as Work {
    return Work();
  }

  #------------------------------------------------------------------
  # Private Methods
  #------------------------------------------------------------------

}
global process as Process = Process();