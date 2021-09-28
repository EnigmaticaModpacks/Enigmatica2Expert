#modloaded vaultopic

# [Vault Searcher] from [Redstone][+2]
craft.remake(<vaultopic:vault_searcher> * 2, ["pretty",
  "▬ ▬",
  "♥ •"], {
  "•": <ore:gemQuartz>,    # Nether Quartz
  "♥": <ore:dustRedstone>, # Redstone
  "▬": <ore:ingotBrick>,   # Brick
});

# [V.I.E.W. (Vaultopic Inventory Explorer Workbot)] from [Vault Searcher]
craft.remake(<vaultopic:view_small>, ["pretty",
  "V V",
  "V V"], {
  "V": <vaultopic:vault_searcher>, # Vault Searcher
});

recipes.remove(<vaultopic:view_big>);
scripts.process.fill(<vaultopic:view_small>, <fluid:menrilresin> * 500, <vaultopic:view_big>, "no exceptions");


recipes.remove(<vaultopic:vice>);
scripts.process.compress(<vaultopic:view_big>, <vaultopic:vice>, "no exceptions");
scripts.process.crush(<vaultopic:view_big>, <vaultopic:vice>, "only: crushingBlock",null,null);