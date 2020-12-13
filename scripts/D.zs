#priority 3004

import crafttweaker.data.IData;


zenClass DD {
	zenConstructor() { }

  function includes(dataList as IData,                  value as IData) as bool {return includes(dataList,  null, value);}
  function includes(dataList as IData, field as string, value as IData) as bool {return  indexof(dataList, field, value) != -1;}

  function  indexof(dataList as IData, value as IData) as int {return indexof(dataList, null, value);}
  function  indexof(dataList as IData, field as string, value as IData) as int {
    if (isNull(dataList) || dataList.length <= 0) return -1 as int;

    for i in 0 to dataList.length {
      var sub = D(dataList[i], field);
      if (!isNull(sub) && sub.asString() == value) {
        return i;
      }
    }
    return -1 as int;
  }

  function find(dataList as IData, value as IData) as IData {return find(dataList, null, value);}
  function find(dataList as IData, field as string, value as IData) as IData {
    var index = indexof(dataList, field, value);
    if(index== -1) return null;
    return dataList[index];
  }

  function replace(dataList as IData, replaceIndex as int, value as IData) as IData {
    var newList = [] as IData;
    for k,v in dataList.asList() {
      if (replaceIndex != k)
        newList = newList + [v] as IData;
      else
        newList = newList + [value] as IData;
    }
    return newList;
  }

  function map(dataList as IData, newData as IData, fnc as function(IData,int,IData)IData) as IData {
    if (isNull(dataList) || dataList.length <= 0) return null;
    var result = [] as IData;

    for i,v in dataList.asList() {
      
      var elem = fnc(v,i,newData);
      if (!isNull(elem)) {
        result = result + [elem] as IData;
      }
    }

    if (result.length > 0)
      return result;
    else
      return null;
  }

  
  function unite(
    dataList as IData, 
    newData as IData, 
    predicate as function(IData,int,IData)bool, 
    mutateFnc as function(IData,int,IData)IData
  ) as IData {

    if (isNull(dataList) || dataList.length <= 0) {
      if (!isNull(newData)) {
        return [newData] as IData;
      } else {
        return null;
      }
    }

    var result = [] as IData;

    for i,v in dataList.asList() {
      if (predicate(v,i,newData)) {
        return replace(dataList, i, mutateFnc(v,i,newData));
      }
    }

    return dataList + [newData] as IData;
  }
}
global dd as DD = DD();