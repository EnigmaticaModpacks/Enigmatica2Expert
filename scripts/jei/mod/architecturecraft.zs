
import crafttweaker.item.IItemStack;

function getArchSphere(block as IItemStack) as IItemStack {
  return <architecturecraft:shape>.withTag({Shape: 33, BaseName: block.definition.id, BaseData: block.damage});
}