/**
 * @file Remove all items and their OreDicts BEFORE other scripts loads
 * to prevent iterating over purged items
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#priority 3000
	
# MFE -> MFSU Upgrade Kit removal
utils.rh(<ic2:upgrade_kit>);

# Industrial Diamond (Replaced with regular diamond)
utils.rh(<ic2:crafting:19>);
utils.rh(<ic2:ingot:8>);

# Unused dusts
utils.rh(<ic2:dust:4>);
utils.rh(<ic2:dust:7>);
utils.rh(<ic2:dust:10>);
utils.rh(<ic2:dust:12>);
utils.rh(<ic2:dust:14>);
utils.rh(<ic2:dust:17>);
utils.rh(<ic2:dust:25>);
utils.rh(<ic2:nuclear:6>);
utils.rh(<ic2:nuclear:8>);
utils.rh(<ic2:nuclear:9>);
utils.rh(<ic2:resource:8>); # Steel blocks
utils.rh(<ic2:resource:6>); # Copper blocks
utils.rh(<ic2:resource:9>); # Tin blocks
utils.rh(<ic2:resource:15>); # Silver blocks
utils.rh(<ic2:resource:7>); # Lead blocks
utils.rh(<ic2:misc_resource:5>); # Slag

# TC nuggets
for i in 0 .. 5 {
	utils.rh(<thaumcraft:nugget>.definition.makeStack(i));
}

/*

_.uniq(
getFurnaceRecipes()
.map(r=>[[r.in_id, r.in_meta], [r.out_id, r.out_meta]])
.flat(1)
.filter(([id,meta])=>isJEIBlacklisted(id,meta))
.map(([id,meta])=>itemize(id,meta??0))
).sort(naturalSort)

*/