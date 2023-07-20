# v1.14.1 (2023-07-20)


## 🐛 Fixes


#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/924bbd40ed7d38c493c37e2a99de376fcae8fd5e)🐝![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/adventurer_bag__0.png "Adventuring Backpack") reconfigure, add more items
  > Also improve storage whitelist for other backpacks.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ac5e50f389c018733ab4c035adeef30f468ebdc0)🧙‍♂️remove unused Cyclic's blocks and technical items
  > Instead of hiding items and blocks in JEI, disable their registration.
  > 
  > This would also fix crash when looking on Poison.
  > 
  > List of disabled registrations:
  > - Milk, Poison, Glowing Helmet, Miner Block, Creative Battery, Biomass
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d14a28d79709e2fd97516043b544a040509bce01)🧩Hide `no fruit available for biome` message in logs
  > This happens every time you generate OTG world. Its not causing issues actually, just flooding log.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/dac6656fd8e9b068e4506dabf6f90bf98b90a7fe)🧩Return hunger death penalty
  > Now player would reset with `6` hunger after death, preventing exploit to die instead of eating.

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/01c1d0c5d1fbee6d0f4d519960ad7f1be6bace8c)🐝![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/miner_bag_t2__0.png "Woven Mining Backpack")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/digger_bag_t2__0.png "Woven Digging Backpack")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/hunter_bag_t2__0.png "Woven Hunting Backpack")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/builder_bag_t2__0.png "Woven Building Backpack")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/forester_bag_t2__0.png "Woven Foresting Backpack")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/adventurer_bag_t2__0.png "Woven Adventuring Backpack") cheaper

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ba1236b9732b94fd6ae65c52a2b17c461b92482a)🌍Remove Dim3 generation of bedrock layer
  > There is option when players can play normal Overworld on the same server as Skyblock players. But world was generated with bedrock what was a bug.



