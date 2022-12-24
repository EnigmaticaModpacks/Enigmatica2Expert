## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
528.25 sec
<br>
<sup><sub>(
8:48 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [301.49]},
      {label: 'FML stuff:', data: [226.76]}
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
436e17  16.50s Had Enough Items;
3C6315  17.72s Had Enough Items (Plugins);
516fa8  13.15s Ender IO;
a651a8  11.70s IndustrialCraft 2;
8f3087  11.64s Forge Mod Loader;
813e81  10.37s OpenComputers;
5161a8   0.32s CraftTweaker2;
495797   9.48s CraftTweaker2 (Script Loading);
8f304e   7.73s Astral Sorcery;
8c2ccd   7.14s Immersive Engineering;
213664   5.52s Forestry;
6e175e   4.84s Recurrent Complex;
538f30   4.40s Animania;
436e17   4.26s Integrated Dynamics;
a86e51   4.04s Extra Utilities 2;
308f53   4.00s Village Names;
3e68ba   3.96s AE2 Unofficial Extended Life;
308f7e   3.83s Quark: RotN Edition;
ba3eb8   3.64s Cyclic;
3e8160   3.41s The Twilight Forest;
216364   3.23s Thermal Expansion;
cd922c   3.22s NuclearCraft;
444444  83.16s 46 Other mods;
333333  56.82s 169 'Fast' mods (load 1.0s - 0.1s);
222222   7.43s 218 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.92|  0.02|  4.42|  0.56|  3.81|  0.15|  0.00|  2.28;
IndustrialCraft 2     |  1.05|  0.02|  9.39|  0.98|  0.00|  0.26|  0.00|  0.00;
OpenComputers         |  0.17|  0.02|  6.37|  3.60|  0.20|  0.00|  0.00|  0.00;
CraftTweaker2         |  1.09|  0.00|  4.04|  0.01|  0.00|  4.65|  0.01|  0.00;
Astral Sorcery        |  0.36|  0.01|  5.20|  1.63|  0.00|  0.54|  0.00|  0.00;
Immersive Engineering |  1.01|  0.01|  1.28|  1.12|  0.00|  3.72|  0.00|  0.00;
Forestry              |  0.53|  0.02|  3.73|  0.96|  0.00|  0.28|  0.00|  0.00;
Recurrent Complex     |  0.28|  0.01|  0.72|  0.87|  0.00|  2.96|  0.00|  0.00;
Animania              |  0.44|  0.00|  3.46|  0.10|  0.00|  0.40|  0.00|  0.00;
Integrated Dynamics   |  0.23|  0.01|  3.96|  0.06|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.09|  0.01|  3.64|  0.08|  0.00|  0.23|  0.00|  0.00;
Village Names         |  0.13|  0.00|  3.68|  0.19|  0.00|  0.00|  0.00|  0.00
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
  2.44: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.68: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.35: jeresources.jei.JEIConfig;
  1.06: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  0.90: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.85: ic2.jeiIntegration.SubModule;
  0.83: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.81: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.71: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.63: nc.integration.jei.NCJEI;
  0.60: com.lothrazar.cyclicmagic.compat.jei.JEIPlugin;
  0.56: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.48: com.buuz135.industrial.jei.JEICustomPlugin;
  0.39: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.21: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.23: Other 130 Plugins
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
            text: [226.76,'s'].join(''),
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
993A00   1.31s Loading sounds;
994400   1.39s Loading Resource - SoundHandler;
994F00  38.16s ModelLoader: blocks;
995900  14.34s ModelLoader: items;
996300  10.96s ModelLoader: baking;
996D00   1.82s Applying remove recipe actions;
997700   0.31s Applying remove furnace recipe actions;
998200   0.77s Indexing ingredients;
444444 157.71s Other
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
