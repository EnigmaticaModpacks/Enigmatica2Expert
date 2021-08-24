
if(isNull(itemUtils.getItem("appliedenergistics2:controller"))) {
	val anyFluix = <ore:crystalFluix> | <appliedenergistics2:material:12>;
  recipes.remove(<rf-capability-adapter:aecapabilityadapter>);
  recipes.addShaped("Capability Adapter", 
  <rf-capability-adapter:aecapabilityadapter>, 
  [[<ore:ingotFakeIron>, anyFluix, <ore:ingotFakeIron>], 
  [anyFluix, <enderio:item_me_conduit:1>, anyFluix],
  [<ore:ingotFakeIron>, anyFluix, <ore:ingotFakeIron>]]);
}