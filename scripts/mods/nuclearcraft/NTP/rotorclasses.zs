#norun
#priority 2147483647
 
#loader preinit nc_preinit crafttweaker
 
 import crafttweaker.item.IIngredient;
 import crafttweaker.liquid.ILiquidStack;
 
 
  zenClass StatorInfo {
	var name as string;
	var item as string;
	var expansion as double;
	
	
	
	zenConstructor(name as string,item as string, expansion as double){
					this.name = name;	
					this.item = item;						
					this.expansion = expansion;					
					}
		}	
		
  zenClass BladeInfo {
	var name as string;
	var item as string;
	var blade as string;
	var efficiency as double;
	var expansion as double;
	
	
	
	zenConstructor(name as string, item as string, blade as string, efficiency as double expansion as double){
					this.name = name;	
					this.item = item;
					this.blade = blade;					
					this.efficiency = efficiency;					
					this.expansion = expansion;					
					}
		}			
		
	  zenClass qmdBladeInfo {
	var name as string;
	var item1 as string;
	var item2 as string;
	var blade as string;
	var efficiency as double;
	var expansion as double;
	
	
	
	zenConstructor(name as string,item1 as string,item2 as string,blade as string, efficiency as double expansion as double){
					this.name = name;	
					this.item1 = item1;
					this.item2 = item2;
					this.blade = blade;					
					this.efficiency = efficiency;					
					this.expansion = expansion;					
					}
		}		