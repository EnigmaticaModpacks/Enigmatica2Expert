/*
D.zs
Safe working with IData.

Use global function D(data) to wrap IData and get values from it.

Source: https://github.com/Krutoy242/D.zs


Example
  var data as IData = {
    ench: [
      {lvl: 1, id: 0},
      {lvl: 3, id: 2}
    ]
  };

  // returns "2"
  D(data).get("ench[1].id").asString();

  // returns 1
  D(data).getInt("ench[0].lvl");
*/


import crafttweaker.data.IData;
#priority 4010

zenClass D_zs {
  /*
    Stored original IData
  */
  var d as IData;

	zenConstructor(data as IData) {
    d = data;
  }

  /*
    Safe extracting values from stored data by string or numeric keys. All parameters can be null.

    path - Path to required data, separated with "." or "[]"
    default - An IData object with required path "d", example {d:0}

    Example:
    val d = D({Fluid:{name:"water"}, A:[{B:1},{C:2}]});

    // Note: all returned values is IData
    d.get("Fluid.name") // "water"
    d.get("A[1].C")     // 2
    d.get("A[4].C")     // null
  */
  function get() as IData { return d; }
  function get(path as string) as IData { return get(path, null); }
  function get(path as string, default as IData) as IData {
    val def as IData = isNull(default) ? null : default.d;

    if (isNull(path) || path == "" || isNull(d)) return def;

    var descend as IData = null;
    for tag in path.split("[\\.\\[\\]]") {
      if (tag == "") continue;
      if(isNull(descend)) descend = d;

      var member as IData = null;
      if (tag.matches("\\d+")) {
        var num = tag as int;
        if (descend.length > num) {
          member = descend[num];
        }
      } else if(!isNull(descend.asMap())) {
        member = descend.memberGet(tag);
      }
      if (!isNull(member)) descend = member;
      else return def;
    }
    return descend;
  }

  /*
    Same as get(), but working with typed values
  */
  function getBool  () as bool   { val r = get(); return isNull(r) ? false      : r.asBool  (); }
  function getByte  () as byte   { val r = get(); return isNull(r) ? 0 as byte  : r.asByte  (); }
  function getDouble() as double { val r = get(); return isNull(r) ? 0 as double: r.asDouble(); }
  function getFloat () as float  { val r = get(); return isNull(r) ? 0 as float : r.asFloat (); }
  function getInt   () as int    { val r = get(); return isNull(r) ? 0 as int   : r.asInt   (); }
  function getList  () as IData  { val r = get(); return isNull(r) ? null       : r.asList  (); }
  function getLong  () as long   { val r = get(); return isNull(r) ? 0 as long  : r.asLong  (); }
  function getMap   () as IData  { val r = get(); return isNull(r) ? null       : r.asMap   (); }
  function getShort () as short  { val r = get(); return isNull(r) ? 0 as short : r.asShort (); }
  function getString() as string { val r = get(); return isNull(r) ? null       : r.asString(); }
  function getBool  (path as string) as bool   { val r = get(path); return isNull(r) ? false      : r.asBool  (); }
  function getByte  (path as string) as byte   { val r = get(path); return isNull(r) ? 0 as byte  : r.asByte  (); }
  function getDouble(path as string) as double { val r = get(path); return isNull(r) ? 0 as double: r.asDouble(); }
  function getFloat (path as string) as float  { val r = get(path); return isNull(r) ? 0 as float : r.asFloat (); }
  function getInt   (path as string) as int    { val r = get(path); return isNull(r) ? 0 as int   : r.asInt   (); }
  function getList  (path as string) as IData  { val r = get(path); return isNull(r) ? null       : r.asList  (); }
  function getLong  (path as string) as long   { val r = get(path); return isNull(r) ? 0 as long  : r.asLong  (); }
  function getMap   (path as string) as IData  { val r = get(path); return isNull(r) ? null       : r.asMap   (); }
  function getShort (path as string) as short  { val r = get(path); return isNull(r) ? 0 as short : r.asShort (); }
  function getString(path as string) as string { val r = get(path); return isNull(r) ? null       : r.asString(); }
  function getBool  (path as string, default as bool   ) as bool   { return get(path, {d: default}).asBool  (); }
  function getByte  (path as string, default as byte   ) as byte   { return get(path, {d: default}).asByte  (); }
  function getDouble(path as string, default as double ) as double { return get(path, {d: default}).asDouble(); }
  function getFloat (path as string, default as float  ) as float  { return get(path, {d: default}).asFloat (); }
  function getInt   (path as string, default as int    ) as int    { return get(path, {d: default}).asInt   (); }
  function getList  (path as string, default as IData  ) as IData  { return get(path, {d: default}).asList  (); }
  function getLong  (path as string, default as long   ) as long   { return get(path, {d: default}).asLong  (); }
  function getMap   (path as string, default as IData  ) as IData  { return get(path, {d: default}).asMap   (); }
  function getShort (path as string, default as short  ) as short  { return get(path, {d: default}).asShort (); }
  function getString(path as string, default as string ) as string { return get(path, {d: default}).asString(); }

  /*
    Check if this path or array of paths is valid
  */
  function check(path as string) as bool { return !isNull(get(path, null)); }
  function check(paths as string[]) as bool {
    for f in paths {
      if(!check(f)) return false;
    }
    return true;
  }

  /*  
    Safe asString() call (prevents exception if stored data is null)
  */
  function asString() as string { return isNull(d) ? "null" : d.asString(); }

  /*
    Checks if stored data is null
  */
  function isNil() as bool { return isNull(d); }
  function isPresent() as bool { return !isNull(d); }

/* 
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
*/
}

global D as function(IData)D_zs = function (data as IData) as D_zs  {
  return D_zs(data);
};