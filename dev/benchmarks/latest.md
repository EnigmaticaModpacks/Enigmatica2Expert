## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
604.45 sec
<br>
<sup><sub>(
10:4 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [320.59]},
      {label: 'FML stuff:', data: [283.87]}
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
436e17  30.32s Had Enough Items;
3C6315  16.10s Had Enough Items (Plugins);
813e81  13.47s OpenComputers;
5161a8   2.47s CraftTweaker2;
495797   9.18s CraftTweaker2 (Script Loading);
516fa8  11.54s Ender IO;
a651a8   9.49s IndustrialCraft 2;
8f3087   9.20s Forge Mod Loader;
8f304e   7.76s Astral Sorcery;
cd922c   5.97s NuclearCraft;
8c2ccd   5.58s Immersive Engineering;
213664   5.34s Forestry;
6e175e   5.25s Recurrent Complex;
3eb2ba   4.53s Botania;
538f30   4.43s Animania;
a86e51   4.28s Extra Utilities 2;
308f53   4.14s Village Names;
436e17   3.93s Integrated Dynamics;
8f4d30   3.79s Open Terrain Generator;
308f7e   3.58s Quark: RotN Edition;
ba3eb8   3.52s Cyclic;
3e8160   3.44s The Twilight Forest;
444444  85.71s 47 Other mods;
333333  60.90s 181 'Fast' mods (load 1.0s - 0.1s);
222222   6.67s 198 'Instant' mods (load %3C 0.1s)
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
OpenComputers         |  0.36|  0.02|  9.40|  3.49|  0.20|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.67|  0.00|  5.75|  0.01|  0.00|  5.21|  0.01|  0.00;
Ender IO              |  1.63|  0.01|  4.24|  0.56|  3.64|  0.15|  0.00|  1.31;
IndustrialCraft 2     |  0.75|  0.02|  7.56|  0.88|  0.00|  0.28|  0.00|  0.00;
Astral Sorcery        |  0.22|  0.01|  5.31|  1.65|  0.00|  0.57|  0.00|  0.00;
NuclearCraft          |  0.65|  0.01|  4.12|  0.42|  0.00|  0.70|  0.00|  0.08;
Immersive Engineering |  0.85|  0.01|  1.22|  1.10|  0.00|  2.41|  0.00|  0.00;
Forestry              |  0.41|  0.01|  3.58|  1.05|  0.00|  0.29|  0.00|  0.00;
Recurrent Complex     |  0.29|  0.01|  0.73|  0.95|  0.00|  3.27|  0.00|  0.00;
Botania               |  1.60|  0.02|  2.33|  0.51|  0.01|  0.08|  0.00|  0.00;
Animania              |  0.34|  0.00|  3.54|  0.12|  0.00|  0.43|  0.00|  0.00;
Extra Utilities 2     |  0.08|  0.01|  3.91|  0.07|  0.00|  0.21|  0.00|  0.00
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
  2.51: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.39: jeresources.jei.JEIConfig;
  1.24: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.02: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.78: ic2.jeiIntegration.SubModule;
  0.77: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.77: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.66: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.56: nc.integration.jei.NCJEI;
  0.53: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.53: com.buuz135.industrial.jei.JEICustomPlugin;
  0.37: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.24: lach_01298.qmd.jei.QMDJEI;
  0.24: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.24: net.bdew.jeibees.BeesJEIPlugin;
  4.25: Other 127 Plugins
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
            text: [283.87,'s'].join(''),
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
993A00   1.65s Loading sounds;
994400   1.72s Loading Resource - SoundHandler;
994F00  45.11s ModelLoader: blocks;
995900  15.61s ModelLoader: items;
996300  19.03s ModelLoader: baking;
996D00   2.07s Applying remove recipe actions;
997700   0.31s Applying remove furnace recipe actions;
998200   0.61s Indexing ingredients;
998C00  14.10s Indexing ingredients;
444444 183.67s Other
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
