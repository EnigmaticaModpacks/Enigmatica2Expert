## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
592.92 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.88 min
<!---->
)</sub></sup>
</p>

<br>

<!--

Note for image scripts:
- Newlines are ignored
- This characters cant be used: +<"%#

-->

<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label: 'MODS:', data: [/*TOTAL_MODS_TIME*/
        378.58
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        214.33
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
3C639D  16.54s Just Enough Items;
36598D  27.46s Just Enough Items (Plugins);
36598D  26.79s Just Enough Items (Ingredient Filter);
733C9D  16.37s Immersive Engineering;
9D5E3C   9.68s CraftTweaker2;
8D5536   6.58s CraftTweaker2 (Script Loading);
979D3C  14.43s Minecraft Forge;
8D9D3C  11.98s Forge Mod Loader;
9D3C8F  11.42s IndustrialCraft 2;
3C9D59  11.39s Ender IO;
599D3C   8.46s OpenComputers;
3C9D86   7.10s Astral Sorcery;
3C9A9D   6.32s Animania;
4F9D3C   5.08s Dynamic Surroundings;
9D3C3C   4.42s Forestry;
4C9D3C   4.38s Recurrent Complex;
923C9D   3.95s Integrated Dynamics;
9D3C66   3.87s Tinkers' Construct;
633C9D   3.69s Village Names;
3C9D3C   3.38s Extra Utilities 2;
3C939D   3.16s Quark;
9D6B3C   3.07s Cyclic;
9D903C   2.98s OpenBlocks;
444444  77.15s 44 Other mods;
333333  86.83s 334 'Fast' mods (load 1.0s - 0.1s);
222222   2.14s 38 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering |  0.87|  0.01|  1.10|  0.93|  0.00| 13.44|  0.02|  0.00;
CraftTweaker2         |  0.53|  0.00|  3.05|  0.03|  0.00| 12.61|  0.03|  0.00;
IndustrialCraft 2     |  0.84|  0.02|  8.48|  0.89|  0.00|  1.18|  0.02|  0.00;
Ender IO              |  1.56|  0.01|  4.04|  0.52|  3.73|  0.16|  0.02|  1.33;
OpenComputers         |  0.18|  0.03|  5.22|  2.82|  0.17|  0.02|  0.02|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.33|  1.52|  0.00|  1.00|  0.02|  0.00;
Animania              |  0.27|  0.00|  2.91|  0.11|  0.00|  3.01|  0.02|  0.00;
Dynamic Surroundings  |  0.24|  0.01|  0.20|  0.14|  0.00|  0.07|  4.42|  0.00;
Forestry              |  0.36|  0.02|  2.64|  1.05|  0.00|  0.33|  0.02|  0.00;
Recurrent Complex     |  0.26|  0.01|  0.63|  0.92|  0.00|  2.53|  0.02|  0.00;
Integrated Dynamics   |  0.24|  0.01|  3.59|  0.07|  0.00|  0.02|  0.02|  0.00;
Tinkers' Construct    |  0.96|  0.01|  0.22|  0.08|  0.01|  2.57|  0.02|  0.00
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
  3.94: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.09: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.53: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.41: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.97: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.44: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.35: jeresources.jei.JEIConfig;
  1.32: com.buuz135.industrial.jei.JEICustomPlugin;
  1.21: ic2.jeiIntegration.SubModule;
  1.06: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.77: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.62: nc.integration.jei.NCJEI;
  0.60: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.57: mctmods.smelteryio.library.util.jei.JEI;
  0.35: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.25: Other 118 Plugins
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
              214.33
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
993A00   1.85s Loading sounds;
444444 212.48s Other
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