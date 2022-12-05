#modloaded fluxnetworks

# Flux Core
craft.remake(<fluxnetworks:fluxcore> * 2, ["pretty",
  "A B A",
  "B C B",
  "A B A"], {
  A: <ore:clathrateEnder>,
  B: <fluxnetworks:flux>,
  C: <fluxnetworks:fluxcore>,
  });