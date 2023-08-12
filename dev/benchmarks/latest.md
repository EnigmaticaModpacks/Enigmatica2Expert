## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
465.23 sec
<br>
<sup><sub>(
7:45 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [301.85]},
      {label: 'FML stuff:', data: [163.37]}
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
436e17  28.16s Had Enough Items;
3C6315  15.75s Had Enough Items (Plugins);
813e81  12.36s OpenComputers;
516fa8  10.58s Ender IO;
5161a8   0.09s CraftTweaker2;
495797   9.85s CraftTweaker2 (Script Loading);
8f3087   9.26s Forge Mod Loader;
8f304e   6.95s Astral Sorcery;
a651a8   6.14s IndustrialCraft 2;
cd922c   6.07s NuclearCraft;
8c2ccd   5.43s Immersive Engineering;
213664   5.15s Forestry;
6e175e   5.07s Recurrent Complex;
436e17   4.31s Integrated Dynamics;
649e21   4.24s OpenBlocks;
8f6c30   4.19s Dynamic Surroundings;
8f4d30   4.09s Open Terrain Generator;
216364   4.01s Thermal Expansion;
a86e51   3.95s Extra Utilities 2;
308f53   3.87s Village Names;
308f7e   3.39s Quark: RotN Edition;
ba3eb8   3.26s Cyclic;
444444  77.22s 43 Other mods;
333333  61.47s 179 'Fast' mods (load 1.0s - 0.1s);
222222   7.03s 206 'Instant' mods (load %3C 0.1s)
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
OpenComputers         |  0.18|  0.02|  8.69|  3.26|  0.21|  0.00|  0.00|  0.00;
Ender IO              |  1.61|  0.01|  3.86|  0.58|  3.30|  0.14|  0.00|  1.09;
CraftTweaker2         |  0.68|  0.00|  4.46|  0.01|  0.00|  4.77|  0.02|  0.00;
Astral Sorcery        |  0.22|  0.01|  4.67|  1.49|  0.00|  0.57|  0.00|  0.00;
IndustrialCraft 2     |  0.77|  0.02|  4.14|  0.95|  0.00|  0.26|  0.00|  0.00;
NuclearCraft          |  0.56|  0.01|  4.31|  0.44|  0.00|  0.70|  0.00|  0.06;
Immersive Engineering |  0.81|  0.01|  1.14|  1.10|  0.00|  2.38|  0.00|  0.00;
Forestry              |  0.41|  0.01|  3.25|  1.19|  0.00|  0.29|  0.00|  0.00;
Recurrent Complex     |  0.32|  0.00|  0.71|  0.92|  0.00|  3.13|  0.00|  0.00;
Integrated Dynamics   |  0.24|  0.01|  4.02|  0.05|  0.00|  0.00|  0.00|  0.00;
OpenBlocks            |  0.28|  0.00|  3.70|  0.10|  0.00|  0.16|  0.00|  0.00;
Dynamic Surroundings  |  0.54|  0.00|  0.23|  0.13|  0.00|  0.03|  3.25|  0.00
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
  2.24: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.34: jeresources.jei.JEIConfig;
  1.26: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.20: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.86: ic2.jeiIntegration.SubModule;
  0.77: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.76: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.64: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.59: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.50: nc.integration.jei.NCJEI;
  0.49: com.buuz135.industrial.jei.JEICustomPlugin;
  0.39: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.25: net.bdew.jeibees.BeesJEIPlugin;
  0.23: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.20: forestry.factory.recipes.jei.FactoryJeiPlugin;
  4.02: Other 124 Plugins
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
            text: [163.37,'s'].join(''),
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
993A00   1.19s Loading sounds;
994400   1.25s Loading Resource - SoundHandler;
994F00   2.08s Applying remove recipe actions;
995900   0.14s Applying remove furnace recipe actions;
996300   0.76s Indexing ingredients;
996D00   8.46s Indexing ingredients;
444444 149.49s Other
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
