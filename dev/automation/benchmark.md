## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
580.84 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.68 min
<!---->
)</sub></sup>
</p>

<br>

<!--

Note for image scripts:
- Newlines are ignored
- This characters cant be used: +<"%

-->

<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label: 'MODS:', data: [/*TOTAL_MODS_TIME*/
        374.17
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        206.66
      /**/]}
    ]
  },
  options: {
    scales: {
      xAxes: [{display: false,stacked: true}],
      yAxes: [{display: false,stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false,},
    plugins: {datalabels: {color: 'white',formatter: (value, context) =>
      `${context.dataset.label} ${value}s`
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  options: {
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>`${v.labels[v.dataIndex]} ${(v.percent*1000|0)/10}%25`
      }
    }
  },
  type: 'outlabeledPie',
  data: {...
/*mods_loading_time*/
`
3C639D  16.00s Just Enough Items;
36598D  24.50s Just Enough Items (Plugins);
36598D  36.09s Just Enough Items (Ingredient Filter);
9D3C66   3.43s Tinkers' Construct;
8D365C  26.11s Tinkers' Construct (Oredict Melting);
979D3C  14.30s Minecraft Forge;
9D3C8F  12.09s IndustrialCraft 2;
8D9D3C  11.98s Forge Mod Loader;
3C9D59  11.90s Ender IO;
733C9D  11.03s Immersive Engineering;
9D5E3C   3.55s CraftTweaker2;
8D5536   6.76s CraftTweaker2 (Script Loading);
599D3C   8.82s OpenComputers;
3C9D86   7.56s Astral Sorcery;
4F9D3C   6.78s Dynamic Surroundings;
3C9A9D   6.14s Animania;
9D3C3C   4.86s Forestry;
3C759D   4.68s Applied Energistics 2;
923C9D   4.51s Integrated Dynamics;
3C9D3C   4.42s Extra Utilities 2;
4C9D3C   4.30s Recurrent Complex;
9D6B3C   4.03s Cyclic;
3C939D   3.62s Quark;
3F3C9D   3.52s Thermal Expansion;
444444  74.80s 43 Other mods;
333333  52.36s 152 'Fast' mods (load 1.0s - 0.1s);
222222   6.03s 209 'Instant' mods (load %3C 0.1s)
`
/**/
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [`${String.fromCharCode(35)}${a}`, parseFloat(a), a][i])
      .forEach((s, i) => 
        [a.datasets[0].backgroundColor, a.datasets[0].data, a.labels][i].push(s)
      );
      return a
    }, {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 1
      }]
    })
  }
}"/>
</p>

<br>

# Top Mods Details (except JEI, FML and Forge)
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=450&c={options: {
    scales: {
      xAxes: [{stacked: true}],
      yAxes: [{stacked: true}],
    },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'top',
        color: 'white',
        backgroundColor: 'rgba(46, 140, 171, 0.6)',
        borderColor: 'rgba(41, 168, 194, 1.0)',
        borderWidth: 0.5,
        borderRadius: 3,
        padding: 0,
        font: {size:10},
        formatter: (v,ctx) => 
          ctx.datasetIndex!=ctx.chart.data.datasets.length-1 ? null
            : `${((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex], 0) * 10) | 0) /10}s`
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(()=>{
let a={labels:[],datasets:[]};
/*FML_STEPS*/
`
1: Construction;
2: Loading Resources;
3: PreInitialization;
4: Initialization;
5: InterModComms$IMC;
6: PostInitialization;
7: LoadComplete;
8: ModIdMapping
`
/**/
.split(';')
.map(l=>l.match(/\d: (.*)/).slice(1))
.forEach(([name])=>a.datasets.push({label:name,data:[]}));
/*FML_STEPS_DETAILS*/
`
                          1      2      3      4      5      6      7      8  ;
Tinkers' Construct    |  1.26|  0.01|  0.17|  0.05|  0.00| 28.05|  0.00|  0.00;
IndustrialCraft 2     |  0.78|  0.01|  9.43|  0.78|  0.00|  1.10|  0.00|  0.00;
Ender IO              |  1.86|  0.01|  4.32|  0.58|  3.42|  0.46|  0.00|  1.26;
Immersive Engineering |  1.12|  0.01|  1.28|  0.94|  0.00|  7.70|  0.00|  0.00;
CraftTweaker2         |  0.57|  0.00|  3.39|  0.01|  0.00|  6.32|  0.02|  0.00;
OpenComputers         |  0.16|  0.01|  5.61|  2.85|  0.19|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.22|  0.00|  5.25|  1.36|  0.00|  0.73|  0.00|  0.00;
Dynamic Surroundings  |  0.19|  0.00|  0.31|  0.27|  0.00|  0.07|  5.95|  0.00;
Animania              |  0.31|  0.00|  3.11|  0.10|  0.00|  2.62|  0.00|  0.00;
Forestry              |  0.37|  0.01|  3.18|  1.08|  0.00|  0.23|  0.00|  0.00;
Applied Energistics 2 |  0.23|  0.01|  3.35|  0.35|  0.17|  0.58|  0.00|  0.00;
Integrated Dynamics   |  0.22|  0.00|  4.24|  0.05|  0.00|  0.00|  0.00|  0.00
`
/**/
.split(';').slice(1)
.map(l=>l.split('|').map(s=>s.trim()))
.forEach(([name, ...arr],i)=>{
  a.labels.push(name);
  arr.forEach((v,j)=>a.datasets[j].data[i]=v)
});return a})()}}"/>
</p>

<br>

# TOP JEI Registered Plugis
<p align="center">
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: {rectangle: {borderWidth: 1}},
    legend: false
  },
  type: 'horizontalBar',
  data: {...(()=>{
let a={labels:[],datasets:[{
  backgroundColor: 'rgba(0, 99, 132, 0.5)',
  borderColor: 'rgb(0, 99, 132)',
  data: []
}]};
/*JEI_PLUGINS*/
`
  2.81: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  2.57: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.48: mezz.jei.plugins.vanilla.VanillaPlugin;
  2.28: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.24: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.35: jeresources.jei.JEIConfig;
  1.33: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.05: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.87: ic2.jeiIntegration.SubModule;
  0.82: com.buuz135.industrial.jei.JEICustomPlugin;
  0.68: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.64: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.54: nc.integration.jei.NCJEI;
  0.36: mctmods.smelteryio.library.util.jei.JEI;
  0.34: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.15: Other 117 Plugins
`
/**/
.split(';')
.map(l=>l.split(':'))
.forEach(([time, name])=>{
  a.labels.push(name);
  a.datasets[0].data.push(time)
})
;return a})()
  }
}"/>
</p>

<br>

# FML Stuff
<p align="center">
<img src="https://quickchart.io/chart?w=500&h=400&c={
  options: {
    rotation: Math.PI,
    cutoutPercentage: 55,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v)=>v.labels
      },
      doughnutlabel: {
        labels: [
          {
            text: 'FML stuff:',
            color: 'rgba(128, 128, 128, 0.5)',
            font: {size: 18}
          },
          {
            text: `${/*TOTAL_STUF_TIME*/
              206.66
            /**/}s`,
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(()=>{
let a = {
  labels:[],
  datasets:[{
    backgroundColor: [],
    data: [],
    borderColor: 'rgba(22,22,22,0.3)',
    borderWidth: 2
  }]
};
/*FML_STUFF_TABLE*/
`
993A00   2.18s Loading sounds;
994400   2.23s Loading Resource - SoundHandler;
994F00  29.49s ModelLoader: blocks;
995900   9.62s ModelLoader: items;
996300  10.00s ModelLoader: baking;
996D00   3.19s Applying remove recipe actions;
997700   2.15s Applying remove furnace recipe actions;
998200  36.02s Indexing ingredients;
444444 111.79s Other
`
/**/
.split(';')
.map(l=>l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
.forEach(([, col, time, name])=>{
  a.labels.push([name, ' ', time, 's'].join(''));
  a.datasets[0].data.push(parseFloat(time));
  a.datasets[0].backgroundColor.push(
    `${String.fromCharCode(35)}${col}`
  )
})
;return a})()
  }
}"/>
</p>