## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
524.42 sec
<br>
<sup><sub>(
8:44 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [318.09]},
      {label: 'FML stuff:', data: [206.33]}
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
436e17  16.57s Had Enough Items;
3C6315  18.43s Had Enough Items (Plugins);
9e2174   2.55s Tinkers' Construct;
8E1E68  25.62s Tinkers' Construct (Oredict Melting);
813e81  13.06s OpenComputers;
516fa8  12.80s Ender IO;
a651a8   9.48s IndustrialCraft 2;
5161a8   1.26s CraftTweaker2;
495797   7.89s CraftTweaker2 (Script Loading);
8f3087   8.41s Forge Mod Loader;
8f304e   7.04s Astral Sorcery;
6e175e   5.91s Recurrent Complex;
8c2ccd   5.68s Immersive Engineering;
213664   5.10s Forestry;
538f30   4.45s Animania;
436e17   4.31s Integrated Dynamics;
a86e51   4.27s Extra Utilities 2;
308f53   4.02s Village Names;
ba3eb8   3.75s Cyclic;
3e68ba   3.71s AE2 Unofficial Extended Life;
308f7e   3.44s Quark: RotN Edition;
649e21   3.28s OpenBlocks;
cd922c   3.11s NuclearCraft;
444444  79.55s 44 Other mods;
333333  56.96s 168 'Fast' mods (load 1.0s - 0.1s);
222222   7.46s 214 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.18|  0.01|  0.18|  0.06|  0.00| 26.74|  0.00|  0.00;
OpenComputers         |  0.61|  0.02|  9.04|  3.21|  0.19|  0.00|  0.00|  0.00;
Ender IO              |  1.81|  0.01|  4.66|  0.65|  3.35|  1.10|  0.00|  1.21;
IndustrialCraft 2     |  0.75|  0.02|  7.60|  0.87|  0.00|  0.25|  0.00|  0.00;
CraftTweaker2         |  0.59|  0.00|  3.67|  0.01|  0.00|  4.87|  0.01|  0.00;
Astral Sorcery        |  0.26|  0.01|  4.69|  1.49|  0.00|  0.60|  0.00|  0.00;
Recurrent Complex     |  0.27|  0.01|  0.67|  1.07|  0.00|  3.90|  0.00|  0.00;
Immersive Engineering |  0.95|  0.01|  1.39|  0.97|  0.00|  2.36|  0.00|  0.00;
Forestry              |  0.45|  0.01|  3.40|  0.97|  0.00|  0.25|  0.00|  0.00;
Animania              |  0.33|  0.00|  3.46|  0.10|  0.00|  0.55|  0.00|  0.00;
Integrated Dynamics   |  0.24|  0.01|  4.00|  0.06|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.06|  0.00|  3.86|  0.07|  0.00|  0.28|  0.00|  0.00
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
  2.03: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.67: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.31: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.15: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.15: jeresources.jei.JEIConfig;
  1.10: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.89: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.80: ic2.jeiIntegration.SubModule;
  0.74: nc.integration.jei.NCJEI;
  0.68: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.67: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.54: com.buuz135.industrial.jei.JEICustomPlugin;
  0.40: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.28: xt9.deepmoblearning.plugins.jei.Plugin;
  0.27: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.74: Other 129 Plugins
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
            text: [206.33,'s'].join(''),
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
993A00   1.37s Loading sounds;
994400   1.51s Loading Resource - SoundHandler;
994F00  29.51s ModelLoader: blocks;
995900  13.47s ModelLoader: items;
996300  12.56s ModelLoader: baking;
996D00   2.02s Applying remove recipe actions;
997700   0.15s Applying remove furnace recipe actions;
998200   0.60s Indexing ingredients;
444444 145.15s Other
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
