## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
534.73 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
8.91 min
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
        345.07
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        189.66
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
3C639D  14.78s Just Enough Items;
36598D  22.14s Just Enough Items (Plugins);
36598D  25.48s Just Enough Items (Ingredient Filter);
9D3C66   3.70s Tinkers' Construct;
8D365C  27.11s Tinkers' Construct (Oredict Melting);
8D9D3C  12.62s Forge Mod Loader;
979D3C  12.55s Minecraft Forge;
733C9D  12.03s Immersive Engineering;
3C9D59  11.96s Ender IO;
9D5E3C   4.49s CraftTweaker2;
8D5536   6.44s CraftTweaker2 (Script Loading);
9D3C8F  10.37s IndustrialCraft 2;
599D3C   7.82s OpenComputers;
3C9D86   7.12s Astral Sorcery;
3C9A9D   5.67s Animania;
4F9D3C   5.25s Dynamic Surroundings;
9D3C3C   4.48s Forestry;
4C9D3C   4.37s Recurrent Complex;
3C759D   4.32s Applied Energistics 2;
3F3C9D   3.96s Thermal Expansion;
923C9D   3.94s Integrated Dynamics;
9D6B3C   3.58s Cyclic;
3C9D3C   3.40s Extra Utilities 2;
3C939D   3.26s Quark;
444444  65.38s 38 Other mods;
333333  52.51s 151 'Fast' mods (load 1.0s - 0.1s);
222222   6.35s 215 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  0.99|  0.01|  0.16|  0.05|  0.00| 29.60|  0.00|  0.00;
Immersive Engineering |  0.85|  0.01|  1.08|  0.87|  0.00|  9.23|  0.00|  0.00;
Ender IO              |  1.65|  0.01|  4.33|  0.50|  3.76|  0.40|  0.00|  1.31;
CraftTweaker2         |  0.57|  0.00|  2.94|  0.01|  0.00|  7.41|  0.00|  0.00;
IndustrialCraft 2     |  0.91|  0.01|  7.59|  0.82|  0.00|  1.04|  0.00|  0.00;
OpenComputers         |  0.15|  0.01|  4.71|  2.77|  0.18|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.21|  0.00|  4.53|  1.59|  0.00|  0.78|  0.00|  0.00;
Animania              |  0.29|  0.00|  2.91|  0.09|  0.00|  2.38|  0.00|  0.00;
Dynamic Surroundings  |  0.19|  0.00|  0.22|  0.12|  0.00|  0.06|  4.66|  0.00;
Forestry              |  0.38|  0.01|  2.91|  0.86|  0.00|  0.32|  0.00|  0.00;
Recurrent Complex     |  0.25|  0.00|  0.61|  0.98|  0.00|  2.53|  0.00|  0.00;
Applied Energistics 2 |  0.18|  0.01|  3.09|  0.31|  0.15|  0.58|  0.00|  0.00
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
  3.02: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  2.55: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.39: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.54: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.53: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.23: jeresources.jei.JEIConfig;
  1.11: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.92: com.buuz135.industrial.jei.JEICustomPlugin;
  0.88: ic2.jeiIntegration.SubModule;
  0.63: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.61: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.50: nc.integration.jei.NCJEI;
  0.49: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.41: mctmods.smelteryio.library.util.jei.JEI;
  0.39: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  3.95: Other 117 Plugins
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
              189.66
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
993A00   2.01s Loading sounds;
444444 187.64s Other
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