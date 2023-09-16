## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
473.25 sec
<br>
<sup><sub>(
7:53 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [303.37]},
      {label: 'FML stuff:', data: [169.88]}
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
436e17  24.72s Had Enough Items;
3C6315  16.12s Had Enough Items (Plugins);
813e81  12.71s OpenComputers;
516fa8  10.52s Ender IO;
5161a8   0.16s CraftTweaker2;
495797  10.06s CraftTweaker2 (Script Loading);
8f304e   6.93s Astral Sorcery;
8f3087   6.86s Forge Mod Loader;
cd922c   6.51s NuclearCraft;
a651a8   6.50s IndustrialCraft 2;
8c2ccd   5.46s Immersive Engineering;
213664   5.22s Forestry;
6e175e   5.01s Recurrent Complex;
5c308f   4.96s Mod Tweaker;
8f6c30   4.14s Dynamic Surroundings;
8f4d30   4.08s Open Terrain Generator;
a86e51   3.84s Extra Utilities 2;
308f53   3.76s Village Names;
436e17   3.65s Integrated Dynamics;
308f7e   3.32s Quark: RotN Edition;
ba3eb8   3.25s Cyclic;
649e21   3.11s OpenBlocks;
444444  84.05s 45 Other mods;
333333  61.45s 181 'Fast' mods (load 1.0s - 0.1s);
222222   6.97s 204 'Instant' mods (load %3C 0.1s)
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
OpenComputers          |  0.22|  0.02|  9.10|  3.15|  0.22|  0.00|  0.00|  0.00;
Ender IO               |  1.66|  0.01|  3.84|  0.57|  3.28|  0.14|  0.00|  1.01;
CraftTweaker2          |  0.53|  0.00|  4.59|  0.01|  0.00|  5.08|  0.01|  0.00;
Astral Sorcery         |  0.24|  0.01|  4.62|  1.49|  0.00|  0.58|  0.00|  0.00;
NuclearCraft           |  0.60|  0.01|  4.21|  0.44|  0.00|  1.21|  0.00|  0.06;
IndustrialCraft 2      |  0.70|  0.02|  4.33|  1.20|  0.00|  0.27|  0.00|  0.00;
Immersive Engineering  |  0.87|  0.01|  1.20|  0.98|  0.00|  2.41|  0.00|  0.00;
Forestry               |  0.37|  0.01|  3.29|  1.15|  0.00|  0.39|  0.00|  0.00;
Recurrent Complex      |  0.30|  0.00|  0.72|  0.93|  0.00|  3.06|  0.00|  0.00;
Mod Tweaker            |  0.00|  0.00|  0.01|  0.00|  0.00|  0.00|  4.95|  0.00;
Dynamic Surroundings   |  0.41|  0.01|  0.22|  0.14|  0.00|  0.03|  3.34|  0.00;
Open Terrain Generator |  0.07|  0.01|  0.00|  4.00|  0.00|  0.00|  0.00|  0.00
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
  2.48: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.36: jeresources.jei.JEIConfig;
  1.34: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.13: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.78: ic2.jeiIntegration.SubModule;
  0.76: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.75: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.55: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.54: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.51: com.buuz135.industrial.jei.JEICustomPlugin;
  0.47: nc.integration.jei.NCJEI;
  0.41: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.24: lach_01298.qmd.jei.QMDJEI;
  0.24: net.bdew.jeibees.BeesJEIPlugin;
  0.23: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.34: Other 125 Plugins
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
            text: [169.88,'s'].join(''),
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
993A00   1.23s Loading sounds;
994400   1.29s Loading Resource - SoundHandler;
994F00   2.15s Applying remove recipe actions;
995900   0.13s Applying remove furnace recipe actions;
996300   0.93s Indexing ingredients;
996D00   8.46s Indexing ingredients;
444444 155.69s Other
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
