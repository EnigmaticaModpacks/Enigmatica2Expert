## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
527.02 sec
<br>
<sup><sub>(
8:47 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [303.79]},
      {label: 'FML stuff:', data: [223.22]}
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
436e17  24.96s Had Enough Items;
3C6315  16.20s Had Enough Items (Plugins);
813e81  13.71s OpenComputers;
516fa8  10.77s Ender IO;
5161a8   1.18s CraftTweaker2;
495797   8.98s CraftTweaker2 (Script Loading);
a651a8   9.24s IndustrialCraft 2;
8f3087   8.41s Forge Mod Loader;
3ebab8   7.29s CoFH World;
8f304e   7.05s Astral Sorcery;
cd922c   6.39s NuclearCraft;
8c2ccd   6.09s Immersive Engineering;
6e175e   5.37s Recurrent Complex;
213664   5.04s Forestry;
308f53   4.23s Village Names;
538f30   4.23s Animania;
8f4d30   3.85s Open Terrain Generator;
a86e51   3.81s Extra Utilities 2;
436e17   3.74s Integrated Dynamics;
308f7e   3.56s Quark: RotN Edition;
ba3eb8   3.36s Cyclic;
3eb2ba   3.19s Botania;
444444  76.88s 43 Other mods;
333333  58.84s 171 'Fast' mods (load 1.0s - 0.1s);
222222   7.45s 211 'Instant' mods (load %3C 0.1s)
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
OpenComputers         |  0.19|  0.02| 10.02|  3.26|  0.22|  0.00|  0.00|  0.00;
Ender IO              |  1.57|  0.01|  4.02|  0.53|  3.38|  0.17|  0.00|  1.10;
CraftTweaker2         |  0.64|  0.00|  4.24|  0.00|  0.00|  5.27|  0.02|  0.00;
IndustrialCraft 2     |  0.73|  0.02|  7.35|  0.86|  0.00|  0.29|  0.00|  0.00;
CoFH World            |  0.04|  0.00|  0.18|  0.00|  0.00|  0.00|  7.07|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.74|  1.55|  0.00|  0.53|  0.00|  0.00;
NuclearCraft          |  0.51|  0.01|  4.17|  0.43|  0.00|  1.21|  0.00|  0.06;
Immersive Engineering |  0.86|  0.01|  1.85|  1.05|  0.00|  2.32|  0.00|  0.00;
Recurrent Complex     |  0.27|  0.01|  0.77|  1.06|  0.00|  3.26|  0.00|  0.00;
Forestry              |  0.40|  0.01|  3.37|  0.97|  0.00|  0.29|  0.00|  0.00;
Village Names         |  0.13|  0.00|  3.90|  0.20|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.38|  0.10|  0.00|  0.43|  0.00|  0.00
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
  2.62: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.45: jeresources.jei.JEIConfig;
  1.20: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  0.99: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.82: ic2.jeiIntegration.SubModule;
  0.77: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.72: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.67: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.60: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.52: com.buuz135.industrial.jei.JEICustomPlugin;
  0.51: nc.integration.jei.NCJEI;
  0.43: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.26: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.25: lach_01298.qmd.jei.QMDJEI;
  0.25: net.bdew.jeibees.BeesJEIPlugin;
  4.15: Other 127 Plugins
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
            text: [223.22,'s'].join(''),
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
993A00   1.49s Loading sounds;
994400   1.56s Loading Resource - SoundHandler;
994F00  43.84s ModelLoader: blocks;
995900  14.48s ModelLoader: items;
996300   9.02s ModelLoader: baking;
996D00   2.03s Applying remove recipe actions;
997700   0.38s Applying remove furnace recipe actions;
998200   0.59s Indexing ingredients;
998C00   8.52s Indexing ingredients;
444444 141.33s Other
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
