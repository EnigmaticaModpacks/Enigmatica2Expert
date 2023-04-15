## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
553.11 sec
<br>
<sup><sub>(
9:13 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [313.54]},
      {label: 'FML stuff:', data: [239.56]}
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
436e17  32.65s Had Enough Items;
3C6315  16.26s Had Enough Items (Plugins);
813e81  13.79s OpenComputers;
516fa8  11.20s Ender IO;
5161a8   1.15s CraftTweaker2;
495797   8.98s CraftTweaker2 (Script Loading);
8f3087   9.79s Forge Mod Loader;
a651a8   9.14s IndustrialCraft 2;
8f304e   7.12s Astral Sorcery;
cd922c   6.73s NuclearCraft;
8c2ccd   6.32s Immersive Engineering;
6e175e   5.72s Recurrent Complex;
213664   5.05s Forestry;
436e17   4.36s Integrated Dynamics;
538f30   4.35s Animania;
308f53   4.17s Village Names;
a86e51   3.86s Extra Utilities 2;
8f4d30   3.83s Open Terrain Generator;
308f7e   3.77s Quark: RotN Edition;
ba3eb8   3.42s Cyclic;
649e21   3.33s OpenBlocks;
3e68ba   3.28s AE2 Unofficial Extended Life;
444444  76.43s 42 Other mods;
333333  61.72s 176 'Fast' mods (load 1.0s - 0.1s);
222222   7.10s 207 'Instant' mods (load %3C 0.1s)
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
OpenComputers         |  0.20|  0.02| 10.02|  3.36|  0.19|  0.00|  0.00|  0.00;
Ender IO              |  1.64|  0.01|  4.19|  0.57|  3.34|  0.15|  0.00|  1.30;
CraftTweaker2         |  0.68|  0.00|  4.26|  0.00|  0.00|  5.18|  0.01|  0.00;
IndustrialCraft 2     |  0.80|  0.02|  7.15|  0.92|  0.00|  0.25|  0.00|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.80|  1.58|  0.00|  0.51|  0.00|  0.00;
NuclearCraft          |  0.57|  0.01|  4.52|  0.38|  0.00|  1.20|  0.00|  0.05;
Immersive Engineering |  0.91|  0.01|  2.09|  1.00|  0.00|  2.31|  0.00|  0.00;
Recurrent Complex     |  0.26|  0.00|  0.75|  1.15|  0.00|  3.56|  0.00|  0.00;
Forestry              |  0.37|  0.01|  3.31|  1.08|  0.00|  0.28|  0.00|  0.00;
Integrated Dynamics   |  0.30|  0.01|  4.01|  0.05|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.32|  0.00|  3.50|  0.11|  0.00|  0.42|  0.00|  0.00;
Village Names         |  0.15|  0.00|  3.83|  0.19|  0.00|  0.00|  0.00|  0.00
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
  2.65: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.23: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.13: jeresources.jei.JEIConfig;
  1.03: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.82: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.80: ic2.jeiIntegration.SubModule;
  0.80: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.76: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.55: com.buuz135.industrial.jei.JEICustomPlugin;
  0.54: nc.integration.jei.NCJEI;
  0.54: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.42: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.26: lach_01298.qmd.jei.QMDJEI;
  0.25: ninjabrain.gendustryjei.GendustryJEIPlugin;
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
            text: [239.56,'s'].join(''),
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
993A00   1.54s Loading sounds;
994400   1.61s Loading Resource - SoundHandler;
994F00  45.38s ModelLoader: blocks;
995900  15.14s ModelLoader: items;
996300  14.11s ModelLoader: baking;
996D00   2.05s Applying remove recipe actions;
997700   0.21s Applying remove furnace recipe actions;
998200   1.05s Indexing ingredients;
998C00  15.64s Indexing ingredients;
444444 142.84s Other
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
