## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
616.55 sec
<br>
<sup><sub>(
10:16 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [364.92]},
      {label: 'FML stuff:', data: [251.63]}
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
      [context.dataset.label, value].join(' ')
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>[
          v.labels[v.dataIndex],' ',
          (v.percent*1000|0)/10,
          String.fromCharCode(37)].join('')
      }
    }
  },
  data: {...
`
436e17  78.54s Had Enough Items;
8c2ccd  18.53s Immersive Engineering;
214d9e  15.10s Minecraft Forge;
516fa8  12.04s Ender IO;
a651a8  11.71s IndustrialCraft 2;
5161a8   1.05s CraftTweaker2;
495797   9.26s CraftTweaker2 (Script Loading);
8f3087  10.19s Forge Mod Loader;
813e81   8.32s OpenComputers;
8f304e   7.50s Astral Sorcery;
538f30   6.75s Animania;
8f6c30   5.44s Dynamic Surroundings;
213664   5.16s Forestry;
6e175e   4.79s Recurrent Complex;
436e17   4.72s Integrated Dynamics;
9e2174   4.46s Tinkers' Construct;
a86e51   4.34s Extra Utilities 2;
308f53   4.05s Village Names;
ba3eb8   3.51s Cyclic;
308f7e   3.43s Quark: RotN Edition;
3e68ba   3.27s AE2 Unofficial Extended Life;
444444  81.73s 44 Other mods;
333333  54.44s 162 'Fast' mods (load 1.0s - 0.1s);
222222   6.61s 215 'Instant' mods (load %3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), parseFloat(a), a][i])
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
<img src="https://quickchart.io/chart?w=400&h=450&c={
  options: {
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
            : [((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex],0)*10)|0)/10,'s'].join('')
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(() => {
    let a = { labels: [], datasets: [] };
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
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                          1      2      3      4      5      6      7      8  ;
Had Enough Items      |  0.09|  0.00|  2.43|  0.02|  0.00|  0.00| 76.01|  0.00;
Immersive Engineering |  0.92|  0.01|  1.17|  1.08|  0.00| 15.34|  0.00|  0.00;
Ender IO              |  1.81|  0.01|  4.20|  0.57|  4.07|  0.17|  0.00|  1.22;
IndustrialCraft 2     |  0.87|  0.01|  8.64|  0.86|  0.00|  1.33|  0.00|  0.00;
CraftTweaker2         |  0.58|  0.00|  3.50|  0.01|  0.00|  6.21|  0.01|  0.00;
OpenComputers         |  0.16|  0.01|  4.95|  3.01|  0.20|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.26|  0.01|  4.69|  1.56|  0.00|  0.98|  0.00|  0.00;
Animania              |  0.32|  0.00|  3.10|  0.10|  0.00|  3.23|  0.00|  0.00;
Dynamic Surroundings  |  0.19|  0.00|  0.20|  0.13|  0.00|  0.06|  4.87|  0.00;
Forestry              |  0.41|  0.01|  3.39|  1.06|  0.00|  0.29|  0.00|  0.00;
Recurrent Complex     |  0.28|  0.00|  0.69|  1.16|  0.00|  2.66|  0.00|  0.00;
Integrated Dynamics   |  0.25|  0.01|  4.42|  0.05|  0.00|  0.00|  0.00|  0.00
`
    .split(';').slice(1)
      .map(l => l.split('|').map(s => s.trim()))
      .forEach(([name, ...arr], i) => {
        a.labels.push(name);
        arr.forEach((v, j) => a.datasets[j].data[i] = v)
      }); return a
  })()}
}"/>
</p>

<br>

# TOP JEI Registered Plugis
<p align="center">
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false
  },
  type: 'horizontalBar',
    data: {...(() => {
      let a = {
        labels: [], datasets: [{
          backgroundColor: 'rgba(0, 99, 132, 0.5)',
          borderColor: 'rgb(0, 99, 132)',
          data: []
        }]
      };
`
  3.42: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.24: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  3.22: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.55: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.92: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.46: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.45: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.35: ic2.jeiIntegration.SubModule;
  1.30: jeresources.jei.JEIConfig;
  1.00: com.buuz135.industrial.jei.JEICustomPlugin;
  0.72: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.71: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.58: nc.integration.jei.NCJEI;
  0.55: mctmods.smelteryio.library.util.jei.JEI;
  0.47: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.50: Other 119 Plugins
`
        .split(';')
        .map(l => l.split(':'))
        .forEach(([time, name]) => {
          a.labels.push(name);
          a.datasets[0].data.push(time)
        })
        ; return a
    })()
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
            text: [251.63,'s'].join(''),
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(() => {
    let a = {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 2
      }]
    };
`
993A00   2.16s Loading sounds;
994400   2.21s Loading Resource - SoundHandler;
994F00  50.52s ModelLoader: blocks;
995900  10.91s ModelLoader: items;
996300  10.30s ModelLoader: baking;
996D00   4.89s Applying remove recipe actions;
997700   0.19s Applying remove furnace recipe actions;
444444 170.44s Other
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
      .forEach(([, col, time, name]) => {
        a.labels.push([name, ' ', time, 's'].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>

<br>
