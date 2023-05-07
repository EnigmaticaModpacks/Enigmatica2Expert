## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
553.19 sec
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
      {label:      'MODS:', data: [333.98]},
      {label: 'FML stuff:', data: [219.22]}
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
436e17  26.00s Had Enough Items;
3C6315  17.16s Had Enough Items (Plugins);
9e2174   2.76s Tinkers' Construct;
8E1E68  26.22s Tinkers' Construct (Oredict Melting);
813e81  13.22s OpenComputers;
516fa8  11.94s Ender IO;
8f3087   9.97s Forge Mod Loader;
5161a8   0.84s CraftTweaker2;
495797   9.03s CraftTweaker2 (Script Loading);
a651a8   8.90s IndustrialCraft 2;
8f304e   7.03s Astral Sorcery;
cd922c   5.97s NuclearCraft;
8c2ccd   5.48s Immersive Engineering;
6e175e   5.45s Recurrent Complex;
213664   4.96s Forestry;
538f30   4.36s Animania;
308f53   4.23s Village Names;
a86e51   3.97s Extra Utilities 2;
8f4d30   3.88s Open Terrain Generator;
436e17   3.78s Integrated Dynamics;
308f7e   3.54s Quark: RotN Edition;
ba3eb8   3.36s Cyclic;
649e21   3.30s OpenBlocks;
444444  81.57s 44 Other mods;
333333  60.13s 176 'Fast' mods (load 1.0s - 0.1s);
222222   6.96s 204 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.14|  0.01|  0.17|  0.07|  0.00| 27.59|  0.00|  0.00;
OpenComputers         |  0.25|  0.02|  9.25|  3.51|  0.20|  0.00|  0.00|  0.00;
Ender IO              |  1.57|  0.01|  3.92|  0.72|  3.22|  1.11|  0.00|  1.38;
CraftTweaker2         |  0.71|  0.00|  4.06|  0.01|  0.00|  5.09|  0.01|  0.00;
IndustrialCraft 2     |  0.82|  0.02|  6.90|  0.88|  0.00|  0.28|  0.00|  0.00;
Astral Sorcery        |  0.24|  0.01|  4.51|  1.74|  0.00|  0.54|  0.00|  0.00;
NuclearCraft          |  0.57|  0.01|  4.12|  0.50|  0.00|  0.72|  0.00|  0.06;
Immersive Engineering |  0.92|  0.01|  1.13|  1.08|  0.00|  2.34|  0.00|  0.00;
Recurrent Complex     |  0.26|  0.01|  0.78|  1.13|  0.00|  3.28|  0.00|  0.00;
Forestry              |  0.42|  0.01|  3.25|  0.98|  0.00|  0.29|  0.00|  0.00;
Animania              |  0.34|  0.00|  3.40|  0.15|  0.00|  0.47|  0.00|  0.00;
Village Names         |  0.12|  0.00|  3.91|  0.20|  0.00|  0.00|  0.00|  0.00
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
  3.08: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.43: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.26: jeresources.jei.JEIConfig;
  1.08: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.86: ic2.jeiIntegration.SubModule;
  0.82: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.79: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.64: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.55: nc.integration.jei.NCJEI;
  0.52: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.52: com.buuz135.industrial.jei.JEICustomPlugin;
  0.43: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.25: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.23: net.bdew.jeibees.BeesJEIPlugin;
  0.22: forestry.factory.recipes.jei.FactoryJeiPlugin;
  4.47: Other 127 Plugins
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
            text: [219.22,'s'].join(''),
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
993A00   1.59s Loading sounds;
994400   1.66s Loading Resource - SoundHandler;
994F00  41.92s ModelLoader: blocks;
995900  14.44s ModelLoader: items;
996300   9.14s ModelLoader: baking;
996D00   2.17s Applying remove recipe actions;
997700   0.11s Applying remove furnace recipe actions;
998200   0.60s Indexing ingredients;
998C00   9.42s Indexing ingredients;
444444 138.17s Other
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
