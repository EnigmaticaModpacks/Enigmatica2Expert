## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
620.90 sec
<br>
<sup><sub>(
10:20 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [373.90]},
      {label: 'FML stuff:', data: [247.00]}
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
3e76ba  17.60s Just Enough Items;
386AA7  27.72s Just Enough Items (Plugins);
386AA7  45.82s Just Enough Items (Ingredient Filter);
8c2ccd  17.50s Immersive Engineering;
214d9e  14.34s Minecraft Forge;
516fa8  12.53s Ender IO;
a651a8  12.13s IndustrialCraft 2;
8f3087  10.63s Forge Mod Loader;
5161a8   0.25s CraftTweaker2;
495797   9.50s CraftTweaker2 (Script Loading);
813e81   8.41s OpenComputers;
8f304e   7.67s Astral Sorcery;
538f30   6.82s Animania;
8f6c30   5.71s Dynamic Surroundings;
9e2174   5.26s Tinkers' Construct;
213664   4.98s Forestry;
6e175e   4.56s Recurrent Complex;
436e17   4.18s Integrated Dynamics;
3e68ba   4.01s AE2 Unofficial Extended Life;
308f53   3.73s Village Names;
a86e51   3.50s Extra Utilities 2;
6e3a17   3.40s Quark;
ba3eb8   3.36s Cyclic;
444444  78.75s 43 Other mods;
333333  54.60s 159 'Fast' mods (load 1.0s - 0.1s);
222222   6.94s 221 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering |  1.19|  0.01|  1.17|  1.01|  0.00| 14.13|  0.00|  0.00;
Ender IO              |  1.89|  0.01|  4.82|  0.55|  3.84|  0.15|  0.00|  1.28;
IndustrialCraft 2     |  0.77|  0.01|  9.09|  1.04|  0.00|  1.22|  0.00|  0.00;
CraftTweaker2         |  0.62|  0.00|  3.37|  0.01|  0.00|  5.75|  0.01|  0.00;
OpenComputers         |  0.18|  0.01|  5.13|  2.90|  0.19|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.31|  0.01|  4.72|  1.64|  0.00|  0.99|  0.00|  0.00;
Animania              |  0.30|  0.00|  3.33|  0.09|  0.00|  3.09|  0.00|  0.00;
Dynamic Surroundings  |  0.17|  0.00|  0.20|  0.12|  0.00|  0.06|  5.17|  0.00;
Tinkers' Construct    |  1.22|  0.01|  0.25|  0.05|  0.00|  3.73|  0.00|  0.00;
Forestry              |  0.42|  0.01|  3.21|  0.91|  0.00|  0.44|  0.00|  0.00;
Recurrent Complex     |  0.24|  0.00|  0.69|  1.04|  0.00|  2.59|  0.00|  0.00;
Integrated Dynamics   |  0.29|  0.01|  3.84|  0.05|  0.00|  0.00|  0.00|  0.00
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
  4.00: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.03: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.82: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.62: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.88: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.38: jeresources.jei.JEIConfig;
  1.38: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.25: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.05: com.buuz135.industrial.jei.JEICustomPlugin;
  0.99: ic2.jeiIntegration.SubModule;
  0.72: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.66: nc.integration.jei.NCJEI;
  0.63: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.52: mctmods.smelteryio.library.util.jei.JEI;
  0.42: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.38: Other 118 Plugins
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
            text: [247.00,'s'].join(''),
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
993A00   2.29s Loading sounds;
994400   2.35s Loading Resource - SoundHandler;
994F00  50.10s ModelLoader: blocks;
995900  11.07s ModelLoader: items;
996300   9.39s ModelLoader: baking;
996D00   4.40s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
444444 167.23s Other
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
