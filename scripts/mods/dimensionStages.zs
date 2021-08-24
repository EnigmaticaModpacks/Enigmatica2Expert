// #modloaded DimensionStages
// import mods.DimensionStages;

// DimensionStages.stageDimensionWithMessage("minecraft:the_nether", "tooltips.dim_stages.healthy", "healthy");
mods.DimensionStages.addDimensionStage("healthy", -1);

for dim in [
/*Inject_js(
getCSV('config/tellme/dimensions-csv.csv')
.filter(l=>![0,-1,144,-343800852,2].includes(parseInt(l.ID)))
.map(l=>`  ${l.ID},`)
)*/
  14676,
  -11325,
  -8,
  1,
  7,
  -2,
  100,
  101,
  102,
  103,
  105,
  106,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  118,
  119,
  120,
  121,
  122,
  123,
/**/
] as int[] {
  mods.DimensionStages.addDimensionStage("normal_world", dim);
}