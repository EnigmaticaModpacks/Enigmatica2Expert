## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
599.79 sec
<br>
<sup><sub>(
9:59 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [351.69]},
      {label: 'FML stuff:', data: [248.10]}
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
436e17  76.43s Had Enough Items;
8c2ccd  15.99s Immersive Engineering;
214d9e  14.16s Minecraft Forge;
516fa8  12.21s Ender IO;
a651a8  10.78s IndustrialCraft 2;
8f3087  10.52s Forge Mod Loader;
5161a8   1.42s CraftTweaker2;
495797   8.49s CraftTweaker2 (Script Loading);
813e81   8.16s OpenComputers;
538f30   7.39s Animania;
8f304e   7.24s Astral Sorcery;
8f6c30   5.40s Dynamic Surroundings;
6e175e   5.22s Recurrent Complex;
213664   4.52s Forestry;
436e17   4.02s Integrated Dynamics;
9e2174   3.99s Tinkers' Construct;
308f53   3.89s Village Names;
ba3eb8   3.57s Cyclic;
a86e51   3.55s Extra Utilities 2;
216364   3.47s Thermal Expansion;
3e68ba   3.43s AE2 Unofficial Extended Life;
444444  77.18s 43 Other mods;
333333  53.77s 160 'Fast' mods (load 1.0s - 0.1s);
222222   6.90s 218 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.07|  0.00|  2.45|  0.02|  0.00|  0.00| 73.89|  0.00;
Immersive Engineering |  0.89|  0.01|  1.16|  0.92|  0.00| 13.01|  0.00|  0.00;
Ender IO              |  1.72|  0.01|  4.04|  0.55|  4.52|  0.16|  0.00|  1.21;
IndustrialCraft 2     |  0.70|  0.01|  7.92|  0.95|  0.00|  1.20|  0.00|  0.00;
CraftTweaker2         |  0.56|  0.00|  3.28|  0.01|  0.00|  6.04|  0.01|  0.00;
OpenComputers         |  0.17|  0.02|  4.97|  2.83|  0.19|  0.00|  0.00|  0.00;
Animania              |  0.29|  0.00|  3.11|  0.20|  0.00|  3.79|  0.00|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.55|  1.45|  0.00|  1.00|  0.00|  0.00;
Dynamic Surroundings  |  0.17|  0.01|  0.20|  0.11|  0.00|  0.07|  4.85|  0.00;
Recurrent Complex     |  0.26|  0.01|  0.73|  1.12|  0.00|  3.09|  0.00|  0.00;
Forestry              |  0.36|  0.01|  2.94|  0.94|  0.00|  0.27|  0.00|  0.00;
Integrated Dynamics   |  0.25|  0.01|  3.71|  0.05|  0.00|  0.00|  0.00|  0.00
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
  3.21: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.19: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.88: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.64: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.12: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.54: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.33: jeresources.jei.JEIConfig;
  1.04: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.01: ic2.jeiIntegration.SubModule;
  0.90: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.85: com.buuz135.industrial.jei.JEICustomPlugin;
  0.66: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.56: nc.integration.jei.NCJEI;
  0.53: mctmods.smelteryio.library.util.jei.JEI;
  0.42: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.67: Other 121 Plugins
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
            text: [248.10,'s'].join(''),
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
993A00   2.04s Loading sounds;
994400   2.09s Loading Resource - SoundHandler;
994F00  51.82s ModelLoader: blocks;
995900  10.97s ModelLoader: items;
996300   9.70s ModelLoader: baking;
996D00   4.73s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
444444 166.58s Other
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
