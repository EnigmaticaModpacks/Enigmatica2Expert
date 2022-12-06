
import crafttweaker.item.IItemStack;

<entity:netherendingores:netherfish>.addPlayerOnlyDrop(<forestry:ash>, 3, 12);

/*

// setHarvestLevel doesnt change harvest level of netherendingores.
// Neither block_overrites.cfg
// Dont know why.

for item in [
  <netherendingores:ore_end_modded_1:14>,
] as IItemStack[] {
  val def = item.asBlock().definition;
  def.setHarvestLevel('pickaxe', 13, def.getStateFromMeta(item.damage));
}
 */

/*

    S:"netherendingores:ore_nether_modded_1:0"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_1:1"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_1:3"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_1:7"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_1:8"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_1:9"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_1:13"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:1"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:2"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:3"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:5"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:6"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:7"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:8"=pickaxe=5@32
    S:"netherendingores:ore_nether_modded_2:9"=pickaxe=5@32
    S:"netherendingores:ore_nether_vanilla:0"=pickaxe=5@32
    S:"netherendingores:ore_nether_vanilla:3"=pickaxe=5@32
    S:"netherendingores:ore_nether_vanilla:4"=pickaxe=5@32
    S:"netherendingores:ore_nether_vanilla:5"=pickaxe=5@32
    S:"netherendingores:ore_nether_vanilla:6"=pickaxe=5@32

    S:"netherendingores:ore_end_modded_1:0"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_1:1"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_1:3"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_1:7"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_1:8"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_1:9"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_1:13"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:1"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:2"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:3"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:5"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:6"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:7"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:8"=pickaxe=6@48
    S:"netherendingores:ore_end_modded_2:9"=pickaxe=6@48
    S:"netherendingores:ore_end_vanilla:0"=pickaxe=6@48
    S:"netherendingores:ore_end_vanilla:3"=pickaxe=6@48
    S:"netherendingores:ore_end_vanilla:4"=pickaxe=6@48
    S:"netherendingores:ore_end_vanilla:5"=pickaxe=6@48
    S:"netherendingores:ore_end_vanilla:6"=pickaxe=6@48
    S:"netherendingores:ore_nether_modded_1:11"=pickaxe=6@32
    S:"netherendingores:ore_nether_vanilla:1"=pickaxe=6@32
    S:"netherendingores:ore_nether_vanilla:2"=pickaxe=6@32
    S:"netherendingores:ore_end_modded_1:11"=pickaxe=7@48
    S:"netherendingores:ore_end_vanilla:1"=pickaxe=7@48
    S:"netherendingores:ore_end_vanilla:2"=pickaxe=7@48
    S:"netherendingores:ore_nether_modded_1:5"=pickaxe=7@32
    S:"netherendingores:ore_end_modded_1:5"=pickaxe=8@48
    S:"netherendingores:ore_nether_modded_1:10"=pickaxe=8@32
    S:"netherendingores:ore_nether_modded_1:12"=pickaxe=8@32
    S:"netherendingores:ore_end_modded_1:10"=pickaxe=9@48
    S:"netherendingores:ore_end_modded_1:12"=pickaxe=9@48
    S:"netherendingores:ore_nether_modded_1:4"=pickaxe=10@32
    S:"netherendingores:ore_nether_modded_1:6"=pickaxe=10@32
    S:"netherendingores:ore_end_modded_1:4"=pickaxe=11@48
    S:"netherendingores:ore_end_modded_1:6"=pickaxe=11@48
    S:"netherendingores:ore_nether_modded_1:2"=pickaxe=11@32
    S:"netherendingores:ore_end_modded_1:2"=pickaxe=12@48
    S:"netherendingores:ore_nether_modded_1:14"=pickaxe=12@32
    S:"netherendingores:ore_end_modded_1:14"=pickaxe=13@48

*/
