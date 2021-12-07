## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
651.59 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
10.86 min
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
        427.52
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        224.06
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
3C639D  17.57s Just Enough Items;
36598D  30.99s Just Enough Items (Plugins);
36598D  28.46s Just Enough Items (Ingredient Filter);
9D3C66   4.37s Tinkers' Construct;
8D365C  30.08s Tinkers' Construct (Oredict Melting);
733C9D  19.12s Immersive Engineering;
9D5E3C  11.60s CraftTweaker2;
8D5536   6.98s CraftTweaker2 (Script Loading);
979D3C  15.28s Minecraft Forge;
8D9D3C  11.72s Forge Mod Loader;
3C9D59  11.43s Ender IO;
9D3C8F  11.08s IndustrialCraft 2;
599D3C   8.51s OpenComputers;
3C9D86   7.42s Astral Sorcery;
3C9A9D   6.95s Animania;
4F9D3C   5.42s Dynamic Surroundings;
4C9D3C   4.44s Recurrent Complex;
9D3C3C   4.28s Forestry;
3C939D   3.82s Quark;
923C9D   3.74s Integrated Dynamics;
633C9D   3.61s Village Names;
3C9D3C   3.44s Extra Utilities 2;
9D6B3C   3.27s Cyclic;
599D3C   3.25s NuclearCraft;
444444  82.95s 47 Other mods;
333333  85.42s 329 'Fast' mods (load 1.0s - 0.1s);
222222   2.33s 40 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  0.96|  0.01|  0.17|  0.07|  0.00| 33.23|  0.02|  0.00;
Immersive Engineering |  0.82|  0.01|  1.16|  0.87|  0.00| 16.23|  0.02|  0.00;
CraftTweaker2         |  0.56|  0.00|  3.25|  0.02|  0.00| 14.67|  0.07|  0.00;
Ender IO              |  1.59|  0.01|  4.05|  0.58|  3.91|  0.21|  0.02|  1.06;
IndustrialCraft 2     |  0.76|  0.02|  7.85|  1.00|  0.00|  1.43|  0.02|  0.00;
OpenComputers         |  0.17|  0.02|  5.36|  2.74|  0.17|  0.02|  0.02|  0.00;
Astral Sorcery        |  0.22|  0.01|  4.37|  1.75|  0.00|  1.06|  0.02|  0.00;
Animania              |  0.29|  0.00|  3.00|  0.12|  0.00|  3.53|  0.02|  0.00;
Dynamic Surroundings  |  0.24|  0.01|  0.28|  0.39|  0.00|  0.08|  4.42|  0.00;
Recurrent Complex     |  0.23|  0.01|  0.59|  0.94|  0.00|  2.66|  0.02|  0.00;
Forestry              |  0.44|  0.02|  2.61|  0.88|  0.00|  0.32|  0.02|  0.00;
Quark                 |  0.02|  0.01|  3.41|  0.11|  0.00|  0.25|  0.02|  0.00
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
  4.43: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  4.23: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.97: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.69: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.38: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.74: com.buuz135.industrial.jei.JEICustomPlugin;
  1.44: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.43: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.29: jeresources.jei.JEIConfig;
  1.05: ic2.jeiIntegration.SubModule;
  0.74: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.70: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.64: mctmods.smelteryio.library.util.jei.JEI;
  0.59: nc.integration.jei.NCJEI;
  0.45: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.21: Other 118 Plugins
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
              224.06
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
993A00   1.97s Loading sounds;
444444 222.09s Other
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