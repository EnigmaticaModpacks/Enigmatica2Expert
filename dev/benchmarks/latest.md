## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
553.63 sec
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
      {label:      'MODS:', data: [370.84]},
      {label: 'FML stuff:', data: [182.79]}
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
436e17  31.65s Had Enough Items;
3C6315  19.86s Had Enough Items (Plugins);
9e2174   3.06s Tinkers' Construct;
8E1E68  28.00s Tinkers' Construct (Oredict Melting);
813e81  14.27s OpenComputers;
516fa8  12.79s Ender IO;
5161a8  11.60s CraftTweaker2;
495797  14.80s CraftTweaker2 (Script Loading);
8f3087   9.64s Forge Mod Loader;
8f304e   9.38s Astral Sorcery;
a651a8   6.76s IndustrialCraft 2;
cd922c   6.67s NuclearCraft;
8c2ccd   6.24s Immersive Engineering;
6e175e   6.20s Recurrent Complex;
213664   5.68s Forestry;
8f6c30   5.08s Dynamic Surroundings;
436e17   4.56s Integrated Dynamics;
8f4d30   4.43s Open Terrain Generator;
a86e51   4.31s Extra Utilities 2;
308f7e   3.89s Quark: RotN Edition;
ba3eb8   3.89s Cyclic;
3e68ba   3.76s AE2 Unofficial Extended Life;
3eb2ba   3.42s Botania;
444444  94.75s 50 Other mods;
333333  64.21s 184 'Fast' mods (load 1.0s - 0.1s);
222222   6.75s 194 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.08|  0.01|  0.20|  0.06|  0.00| 29.70|  0.00|  0.00;
OpenComputers         |  0.79|  0.02|  9.72|  3.50|  0.25|  0.00|  0.00|  0.00;
Ender IO              |  1.92|  0.01|  4.25|  0.62|  4.11|  0.68|  0.00|  1.20;
CraftTweaker2         |  0.79|  0.00|  5.30|  0.01|  0.00|  5.49|  0.02|  0.00;
Astral Sorcery        |  0.25|  0.01|  6.59|  1.86|  0.00|  0.68|  0.00|  0.00;
IndustrialCraft 2     |  0.76|  0.02|  4.67|  1.05|  0.00|  0.26|  0.00|  0.00;
NuclearCraft          |  0.64|  0.01|  4.72|  0.45|  0.00|  0.79|  0.00|  0.06;
Immersive Engineering |  0.97|  0.01|  1.71|  1.22|  0.00|  2.34|  0.00|  0.00;
Recurrent Complex     |  0.32|  0.00|  0.79|  1.40|  0.00|  3.70|  0.00|  0.00;
Forestry              |  0.38|  0.01|  3.72|  1.20|  0.00|  0.36|  0.00|  0.00;
Dynamic Surroundings  |  0.53|  0.01|  0.32|  0.15|  0.00|  0.04|  4.04|  0.00;
Integrated Dynamics   |  0.59|  0.01|  3.90|  0.06|  0.00|  0.00|  0.00|  0.00
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
  3.55: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.55: jeresources.jei.JEIConfig;
  1.39: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.24: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.96: ic2.jeiIntegration.SubModule;
  0.91: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.89: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.74: com.buuz135.industrial.jei.JEICustomPlugin;
  0.71: nc.integration.jei.NCJEI;
  0.70: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.65: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.53: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.34: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.28: net.bdew.jeibees.BeesJEIPlugin;
  0.27: forestry.factory.recipes.jei.FactoryJeiPlugin;
  5.16: Other 124 Plugins
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
            text: [182.79,'s'].join(''),
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
993A00   1.26s Loading sounds;
994400   1.33s Loading Resource - SoundHandler;
994F00   2.32s Applying remove recipe actions;
995900   0.18s Applying remove furnace recipe actions;
996300   5.22s Indexing ingredients;
996D00   9.06s Indexing ingredients;
444444 163.42s Other
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
