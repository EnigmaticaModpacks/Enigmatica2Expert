#norun
#priority 2147483647
 
#loader preinit nc_preinit crafttweaker
 
 import crafttweaker.item.IIngredient;
 import crafttweaker.liquid.ILiquidStack;
 
 zenClass MagnetInfo {
  var name as string;
  var efficiency as double;
  var rule as string;
  
  
  zenConstructor(name as string, efficiency as double, rule as string){
          this.name = name;
          this.efficiency = efficiency;
          this.rule = rule;					
          }
    }		
    

    
 zenClass StabilizerInfo {
  var name as string;
  var efficiency as double;
  var rule as string;
  
  
  zenConstructor(name as string, efficiency as double, rule as string){
          this.name = name;
          this.efficiency = efficiency;
          this.rule = rule;					
          }
    }
    
    
 zenClass LiquidStabilizerInfo {
  var name as string;
  var inliquid as ILiquidStack;
  var efficiency as double;
  var rule as string;
  
  
  zenConstructor(name as string, inliquid as ILiquidStack, efficiency as double, rule as string){
          this.name = name;
          this.inliquid = inliquid;
          this.efficiency = efficiency;
          this.rule = rule;					
          }
    }
    
    
 zenClass ConverterInfo {
  var name as string;
  var efficiency as double;
  var rule as string;
  
  
  zenConstructor(name as string, efficiency as double, rule as string){
          this.name = name;
          this.efficiency = efficiency;
          this.rule = rule;					
          }
    }
      
    
    
    
 zenClass ExtractorInfo {
  var name as string;
  var efficiency as double;
  var rule as string;
  
  
  zenConstructor(name as string, efficiency as double, rule as string){
          this.name = name;
          this.efficiency = efficiency;
          this.rule = rule;					
          }
    }
    
    
  