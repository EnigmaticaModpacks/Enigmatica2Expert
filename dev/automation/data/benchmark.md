## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
570.63 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.51 min
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
        373.49
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        197.14
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
3C639D  15.87s Just Enough Items;
36598D  25.49s Just Enough Items (Plugins);
36598D  27.30s Just Enough Items (Ingredient Filter);
9D3C66   4.22s Tinkers' Construct;
8D365C  28.08s Tinkers' Construct (Oredict Melting);
733C9D  15.50s Immersive Engineering;
979D3C  14.96s Minecraft Forge;
9D5E3C   6.92s CraftTweaker2;
8D5536   6.58s CraftTweaker2 (Script Loading);
9D3C8F  12.30s IndustrialCraft 2;
3C9D59  11.94s Ender IO;
8D9D3C  11.74s Forge Mod Loader;
599D3C   8.51s OpenComputers;
3C9A9D   8.10s Animania;
3C9D86   7.05s Astral Sorcery;
4F9D3C   5.43s Dynamic Surroundings;
9D3C3C   5.33s Forestry;
4C9D3C   4.59s Recurrent Complex;
3C759D   4.42s Applied Energistics 2;
923C9D   4.09s Integrated Dynamics;
3C9D3C   4.02s Extra Utilities 2;
3F3C9D   3.77s Thermal Expansion;
9D6B3C   3.38s Cyclic;
3C939D   3.30s Quark;
444444  71.86s 41 Other mods;
333333  52.84s 155 'Fast' mods (load 1.0s - 0.1s);
222222   5.91s 208 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.09|  0.01|  0.16|  0.06|  0.00| 30.99|  0.00|  0.00;
Immersive Engineering |  0.85|  0.00|  1.16|  0.86|  0.00| 12.62|  0.00|  0.00;
CraftTweaker2         |  0.55|  0.00|  3.07|  0.01|  0.00|  9.87|  0.00|  0.00;
IndustrialCraft 2     |  0.89|  0.01|  9.34|  0.87|  0.00|  1.19|  0.00|  0.00;
Ender IO              |  1.69|  0.01|  4.37|  0.51|  3.81|  0.25|  0.00|  1.29;
OpenComputers         |  0.15|  0.01|  5.26|  2.92|  0.17|  0.00|  0.00|  0.00;
Animania              |  0.32|  0.00|  3.16|  0.11|  0.00|  4.52|  0.00|  0.00;
Astral Sorcery        |  0.25|  0.00|  4.42|  1.39|  0.00|  1.00|  0.00|  0.00;
Dynamic Surroundings  |  0.27|  0.00|  0.28|  0.12|  0.00|  0.06|  4.71|  0.00;
Forestry              |  0.43|  0.01|  3.62|  0.94|  0.00|  0.33|  0.00|  0.00;
Recurrent Complex     |  0.25|  0.00|  0.70|  0.91|  0.00|  2.73|  0.00|  0.00;
Applied Energistics 2 |  0.18|  0.01|  3.22|  0.30|  0.15|  0.57|  0.00|  0.00
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
  3.98: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.26: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.81: li.cil.oc.integration.jei.ModPluginOpenComputers;
  1.89: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.72: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.27: jeresources.jei.JEIConfig;
  1.19: com.buuz135.industrial.jei.JEICustomPlugin;
  1.17: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.04: ic2.jeiIntegration.SubModule;
  0.69: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.62: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.56: mctmods.smelteryio.library.util.jei.JEI;
  0.50: nc.integration.jei.NCJEI;
  0.42: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.36: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.03: Other 117 Plugins
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
              197.14
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
993A00   2.21s Loading sounds;
994400   2.27s Loading Resource - SoundHandler;
994F00  27.42s ModelLoader: blocks;
995900   9.98s ModelLoader: items;
996300   9.03s ModelLoader: baking;
996D00   4.86s Applying remove recipe actions;
997700   4.04s Applying remove furnace recipe actions;
998200  27.23s Indexing ingredients;
444444 110.10s Other
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