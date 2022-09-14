
import crafttweaker.item.IItemStack;

function getLittleSphere(block as IItemStack) as IItemStack {
  return <littletiles:multitiles>.withTag({tiles: [{
    boxes: [
      [0,2,3,1,3,5] as int[],[0,3,2,1,5,6] as int[],[0,5,3,1,6,5] as int[],[1,1,2,2,2,6] as int[],
      [1,2,1,2,6,7] as int[],[1,6,2,2,7,6] as int[],[2,0,3,3,1,5] as int[],[2,1,1,3,3,7] as int[],
      [2,3,0,3,5,8] as int[],[2,5,1,3,7,7] as int[],[2,7,3,3,8,5] as int[],[3,0,2,5,1,6] as int[],
      [3,1,1,6,2,7] as int[],[3,2,0,5,6,8] as int[],[3,6,1,6,7,7] as int[],[3,7,2,5,8,6] as int[],
      [5,0,3,6,1,5] as int[],[5,2,1,7,3,7] as int[],[5,3,0,6,5,8] as int[],[5,5,1,7,6,7] as int[],
      [5,7,3,6,8,5] as int[],[6,1,2,7,2,6] as int[],[6,3,1,7,5,7] as int[],[6,6,2,7,7,6] as int[],
      [7,2,3,8,3,5] as int[],[7,3,2,8,5,6] as int[],[7,5,3,8,6,5] as int[]
    ],tile: {block: block.definition.id + (block.damage==0 ? '' : ':'+block.damage)}}],
    min: [0,0,0] as int[],size: [8,8,8] as int[],grid: 8,count: 27,structure: {blocks: [] as int[],id: "fixed"}}
  );
}