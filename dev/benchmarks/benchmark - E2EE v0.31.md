## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
536.50 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
8.94 min
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
        353.45
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        183.06
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
3C639D  16.87s Just Enough Items;
36598D  28.51s Just Enough Items (Plugins);
36598D  27.05s Just Enough Items (Ingredient Filter);
9D3C66   4.10s Tinkers' Construct;
8D365C  26.25s Tinkers' Construct (Oredict Melting);
733C9D  16.58s Immersive Engineering;
979D3C  14.00s Minecraft Forge;
9D5E3C   7.31s CraftTweaker2;
8D5536   6.17s CraftTweaker2 (Script Loading);
8D9D3C  11.97s Forge Mod Loader;
3C9D59  11.46s Ender IO;
9D3C8F  10.30s IndustrialCraft 2;
3C9A9D   8.03s Animania;
599D3C   7.77s OpenComputers;
3C9D86   6.95s Astral Sorcery;
4F9D3C   5.46s Dynamic Surroundings;
9D3C3C   4.16s Forestry;
4C9D3C   4.09s Recurrent Complex;
3C759D   4.06s Applied Energistics 2;
923C9D   3.70s Integrated Dynamics;
3C9D3C   3.20s Extra Utilities 2;
3F3C9D   3.16s Thermal Expansion;
3C939D   3.07s Quark;
9D6B3C   2.98s Cyclic;
444444  58.41s 35 Other mods;
333333  51.56s 151 'Fast' mods (load 1.0s - 0.1s);
222222   6.30s 218 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.02|  0.01|  0.15|  0.05|  0.00| 29.13|  0.00|  0.00;
Immersive Engineering |  0.87|  0.01|  1.04|  0.81|  0.00| 13.86|  0.00|  0.00;
CraftTweaker2         |  0.55|  0.00|  2.81|  0.00|  0.00| 10.09|  0.02|  0.00;
Ender IO              |  1.83|  0.01|  4.16|  0.45|  3.55|  0.16|  0.00|  1.31;
IndustrialCraft 2     |  0.79|  0.01|  7.27|  0.88|  0.00|  1.34|  0.00|  0.00;
Animania              |  0.27|  0.00|  2.64|  0.08|  0.00|  5.04|  0.00|  0.00;
OpenComputers         |  0.17|  0.01|  4.79|  2.64|  0.16|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.22|  0.00|  4.37|  1.39|  0.00|  0.97|  0.00|  0.00;
Dynamic Surroundings  |  0.21|  0.00|  0.33|  0.12|  0.00|  0.06|  4.74|  0.00;
Forestry              |  0.38|  0.01|  2.57|  0.86|  0.00|  0.34|  0.00|  0.00;
Recurrent Complex     |  0.24|  0.00|  0.55|  0.86|  0.00|  2.44|  0.00|  0.00;
Applied Energistics 2 |  0.19|  0.01|  2.92|  0.28|  0.14|  0.53|  0.00|  0.00
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
  4.08: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.53: mezz.jei.plugins.vanilla.VanillaPlugin;
  3.17: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.75: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.30: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.27: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.26: com.buuz135.industrial.jei.JEICustomPlugin;
  1.14: jeresources.jei.JEIConfig;
  1.12: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.88: ic2.jeiIntegration.SubModule;
  0.85: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.65: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.61: mctmods.smelteryio.library.util.jei.JEI;
  0.59: nc.integration.jei.NCJEI;
  0.37: crazypants.enderio.base.integration.jei.JeiPlugin;
  3.93: Other 117 Plugins
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
              183.06
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
993A00   1.87s Loading sounds;
994400   1.92s Loading Resource - SoundHandler;
994F00  25.69s ModelLoader: blocks;
995900   8.29s ModelLoader: items;
996300   9.12s ModelLoader: baking;
996D00   4.90s Applying remove recipe actions;
997700   4.25s Applying remove furnace recipe actions;
998200  26.98s Indexing ingredients;
444444 100.04s Other
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