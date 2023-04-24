## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
574.95 sec
<br>
<sup><sub>(
9:34 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [341.41]},
      {label: 'FML stuff:', data: [233.54]}
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
436e17  32.63s Had Enough Items;
3C6315  17.10s Had Enough Items (Plugins);
9e2174   2.61s Tinkers' Construct;
8E1E68  27.27s Tinkers' Construct (Oredict Melting);
813e81  14.14s OpenComputers;
516fa8  12.12s Ender IO;
5161a8   0.94s CraftTweaker2;
495797   9.18s CraftTweaker2 (Script Loading);
8f3087   9.96s Forge Mod Loader;
a651a8   8.88s IndustrialCraft 2;
8f304e   7.06s Astral Sorcery;
cd922c   6.15s NuclearCraft;
8c2ccd   5.43s Immersive Engineering;
6e175e   5.32s Recurrent Complex;
213664   4.92s Forestry;
a86e51   4.30s Extra Utilities 2;
538f30   4.20s Animania;
436e17   4.14s Integrated Dynamics;
8f4d30   4.00s Open Terrain Generator;
308f53   4.00s Village Names;
308f7e   3.62s Quark: RotN Edition;
ba3eb8   3.52s Cyclic;
3e68ba   3.22s AE2 Unofficial Extended Life;
444444  81.38s 46 Other mods;
333333  58.25s 173 'Fast' mods (load 1.0s - 0.1s);
222222   7.08s 206 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.05|  0.01|  0.22|  0.06|  0.00| 28.54|  0.00|  0.00;
OpenComputers         |  0.18|  0.02| 10.64|  3.11|  0.19|  0.00|  0.00|  0.00;
Ender IO              |  1.59|  0.01|  4.09|  0.61|  3.37|  1.43|  0.00|  1.02;
CraftTweaker2         |  0.61|  0.00|  4.64|  0.01|  0.00|  4.84|  0.01|  0.00;
IndustrialCraft 2     |  0.74|  0.02|  6.98|  0.89|  0.00|  0.25|  0.00|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.78|  1.56|  0.00|  0.49|  0.00|  0.00;
NuclearCraft          |  0.64|  0.01|  4.12|  0.40|  0.00|  0.69|  0.00|  0.29;
Immersive Engineering |  0.87|  0.01|  1.23|  1.01|  0.00|  2.32|  0.00|  0.00;
Recurrent Complex     |  0.27|  0.01|  0.80|  0.96|  0.00|  3.29|  0.00|  0.00;
Forestry              |  0.39|  0.01|  3.12|  0.99|  0.00|  0.40|  0.00|  0.00;
Extra Utilities 2     |  0.07|  0.01|  3.95|  0.06|  0.00|  0.21|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.30|  0.13|  0.00|  0.47|  0.00|  0.00
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
  2.61: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.39: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.22: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.15: jeresources.jei.JEIConfig;
  1.02: ic2.jeiIntegration.SubModule;
  0.80: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.76: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.64: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.63: nc.integration.jei.NCJEI;
  0.58: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.53: com.buuz135.industrial.jei.JEICustomPlugin;
  0.35: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.31: com.lothrazar.cyclicmagic.compat.jei.JEIPlugin;
  0.25: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.25: forestry.factory.recipes.jei.FactoryJeiPlugin;
  4.61: Other 127 Plugins
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
            text: [233.54,'s'].join(''),
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
993A00   1.46s Loading sounds;
994400   1.53s Loading Resource - SoundHandler;
994F00  46.17s ModelLoader: blocks;
995900  16.29s ModelLoader: items;
996300   8.93s ModelLoader: baking;
996D00   1.91s Applying remove recipe actions;
997700   0.20s Applying remove furnace recipe actions;
998200   0.97s Indexing ingredients;
998C00  15.50s Indexing ingredients;
444444 140.58s Other
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
