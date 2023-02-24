## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
551.06 sec
<br>
<sup><sub>(
9:11 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [304.17]},
      {label: 'FML stuff:', data: [246.89]}
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
436e17  14.83s Had Enough Items;
3C6315  19.83s Had Enough Items (Plugins);
813e81  13.24s OpenComputers;
516fa8  11.82s Ender IO;
5161a8   0.46s CraftTweaker2;
495797   9.07s CraftTweaker2 (Script Loading);
a651a8   9.28s IndustrialCraft 2;
8f3087   9.26s Forge Mod Loader;
8f304e   7.53s Astral Sorcery;
cd922c   7.08s NuclearCraft;
8c2ccd   5.70s Immersive Engineering;
6e175e   5.23s Recurrent Complex;
213664   5.19s Forestry;
436e17   4.92s Integrated Dynamics;
308f53   4.40s Village Names;
a86e51   4.35s Extra Utilities 2;
538f30   4.29s Animania;
308f7e   4.21s Quark: RotN Edition;
ba3eb8   3.74s Cyclic;
3e68ba   3.64s AE2 Unofficial Extended Life;
649e21   3.51s OpenBlocks;
814a3e   3.32s RFTools;
444444  81.35s 45 Other mods;
333333  60.77s 175 'Fast' mods (load 1.0s - 0.1s);
222222   7.17s 210 'Instant' mods (load %3C 0.1s)
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
OpenComputers         |  0.18|  0.02|  9.42|  3.43|  0.20|  0.00|  0.00|  0.00;
Ender IO              |  1.65|  0.01|  4.67|  0.57|  3.41|  0.15|  0.00|  1.36;
CraftTweaker2         |  0.61|  0.00|  3.96|  0.00|  0.00|  4.95|  0.01|  0.00;
IndustrialCraft 2     |  0.79|  0.02|  7.32|  0.90|  0.00|  0.25|  0.00|  0.00;
Astral Sorcery        |  0.24|  0.01|  5.11|  1.55|  0.00|  0.63|  0.00|  0.00;
NuclearCraft          |  0.42|  0.01|  4.98|  0.39|  0.00|  1.22|  0.00|  0.07;
Immersive Engineering |  0.89|  0.01|  1.46|  0.99|  0.00|  2.35|  0.00|  0.00;
Recurrent Complex     |  0.27|  0.00|  0.85|  0.94|  0.00|  3.17|  0.00|  0.00;
Forestry              |  0.46|  0.01|  3.49|  0.98|  0.00|  0.26|  0.00|  0.00;
Integrated Dynamics   |  0.22|  0.01|  4.64|  0.06|  0.00|  0.00|  0.00|  0.00;
Village Names         |  0.12|  0.00|  4.09|  0.19|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.06|  0.00|  3.99|  0.08|  0.00|  0.22|  0.00|  0.00
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
  5.14: jeresources.jei.JEIConfig;
  2.26: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.31: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.00: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.89: ic2.jeiIntegration.SubModule;
  0.77: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.74: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.58: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.58: nc.integration.jei.NCJEI;
  0.53: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.51: com.buuz135.industrial.jei.JEICustomPlugin;
  0.37: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.26: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.25: xt9.deepmoblearning.plugins.jei.Plugin;
  0.24: net.bdew.jeibees.BeesJEIPlugin;
  4.42: Other 128 Plugins
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
            text: [246.89,'s'].join(''),
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
993A00   1.86s Loading sounds;
994400   1.94s Loading Resource - SoundHandler;
994F00  48.87s ModelLoader: blocks;
995900  17.25s ModelLoader: items;
996300  13.62s ModelLoader: baking;
996D00   2.14s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200   0.59s Indexing ingredients;
444444 160.43s Other
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
