## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
488.64 sec
<br>
<sup><sub>(
8:8 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [277.84]},
      {label: 'FML stuff:', data: [210.80]}
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
436e17  14.70s Had Enough Items;
3C6315  16.31s Had Enough Items (Plugins);
516fa8  15.58s Ender IO;
813e81  11.65s OpenComputers;
5161a8   1.84s CraftTweaker2;
495797   8.14s CraftTweaker2 (Script Loading);
a651a8   8.59s IndustrialCraft 2;
8f3087   8.40s Forge Mod Loader;
8f304e   6.48s Astral Sorcery;
cd922c   5.35s NuclearCraft;
8c2ccd   5.30s Immersive Engineering;
6e175e   5.05s Recurrent Complex;
213664   4.63s Forestry;
436e17   4.04s Integrated Dynamics;
a86e51   3.88s Extra Utilities 2;
308f53   3.88s Village Names;
538f30   3.87s Animania;
308f7e   3.32s Quark: RotN Edition;
ba3eb8   3.24s Cyclic;
3eb2ba   3.10s Botania;
649e21   3.06s OpenBlocks;
3e8160   2.82s The Twilight Forest;
444444  68.92s 40 Other mods;
333333  58.18s 169 'Fast' mods (load 1.0s - 0.1s);
222222   7.53s 219 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.56|  0.01|  3.86|  0.52|  3.17|  0.14|  0.00|  6.31;
OpenComputers         |  0.17|  0.02|  8.12|  3.15|  0.20|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.58|  0.00|  4.49|  0.01|  0.00|  4.89|  0.01|  0.00;
IndustrialCraft 2     |  0.72|  0.02|  6.75|  0.85|  0.00|  0.26|  0.00|  0.00;
Astral Sorcery        |  0.22|  0.01|  4.31|  1.45|  0.00|  0.49|  0.00|  0.00;
NuclearCraft          |  0.38|  0.01|  3.84|  0.37|  0.00|  0.68|  0.00|  0.07;
Immersive Engineering |  0.88|  0.01|  1.14|  0.95|  0.00|  2.32|  0.00|  0.00;
Recurrent Complex     |  0.26|  0.01|  0.68|  1.02|  0.00|  3.09|  0.00|  0.00;
Forestry              |  0.38|  0.01|  3.02|  0.94|  0.00|  0.27|  0.00|  0.00;
Integrated Dynamics   |  0.22|  0.01|  3.76|  0.06|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.06|  0.00|  3.54|  0.07|  0.00|  0.20|  0.00|  0.00;
Village Names         |  0.11|  0.00|  3.57|  0.19|  0.00|  0.00|  0.00|  0.00
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
  2.27: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.24: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.14: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.06: jeresources.jei.JEIConfig;
  1.00: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.75: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.74: ic2.jeiIntegration.SubModule;
  0.71: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.67: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.61: com.buuz135.industrial.jei.JEICustomPlugin;
  0.54: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.53: nc.integration.jei.NCJEI;
  0.35: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.24: xt9.deepmoblearning.plugins.jei.Plugin;
  0.23: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.23: Other 127 Plugins
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
            text: [210.80,'s'].join(''),
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
993A00   1.41s Loading sounds;
994400   1.47s Loading Resource - SoundHandler;
994F00  40.57s ModelLoader: blocks;
995900  14.34s ModelLoader: items;
996300  12.93s ModelLoader: baking;
996D00   2.10s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200   0.82s Indexing ingredients;
444444 136.97s Other
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
