## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
601.48 sec
<br>
<sup><sub>(
10:1 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [373.67]},
      {label: 'FML stuff:', data: [227.81]}
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
3e76ba  17.34s Just Enough Items;
386AA7  29.24s Just Enough Items (Plugins);
386AA7  28.20s Just Enough Items (Ingredient Filter);
8c2ccd  18.44s Immersive Engineering;
516fa8  17.86s Ender IO;
214d9e  15.61s Minecraft Forge;
176e43  12.20s Thaumic Additions: Reconstructed;
a651a8  11.79s IndustrialCraft 2;
5161a8   4.48s CraftTweaker2;
495797   7.26s CraftTweaker2 (Script Loading);
8f3087   9.98s Forge Mod Loader;
7c813e   8.46s Thaumcraft;
813e81   8.20s OpenComputers;
8f304e   7.60s Astral Sorcery;
538f30   6.95s Animania;
8f6c30   5.10s Dynamic Surroundings;
6e175e   4.61s Recurrent Complex;
213664   4.31s Forestry;
9e2174   4.12s Tinkers' Construct;
436e17   3.85s Integrated Dynamics;
308f53   3.71s Village Names;
a86e51   3.50s Extra Utilities 2;
6e3a17   3.37s Quark;
444444  79.37s 43 Other mods;
333333  51.68s 157 'Fast' mods (load 1.0s - 0.1s);
222222   6.45s 221 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering            |  0.82|  0.01|  1.10|  0.89|  0.00| 15.62|  0.00|  0.00;
Ender IO                         |  1.62|  0.01|  4.05|  0.52|  3.85|  6.47|  0.00|  1.34;
Thaumic Additions: Reconstructed |  0.17|  0.00|  0.62|  0.32|  0.00| 11.08|  0.00|  0.00;
IndustrialCraft 2                |  0.71|  0.01|  8.64|  1.16|  0.00|  1.27|  0.00|  0.00;
CraftTweaker2                    |  0.57|  0.00|  3.27|  0.01|  0.00|  7.88|  0.01|  0.00;
Thaumcraft                       |  0.74|  0.00|  0.19|  0.37|  0.01|  7.15|  0.00|  0.00;
OpenComputers                    |  0.17|  0.01|  5.01|  2.83|  0.18|  0.00|  0.00|  0.00;
Astral Sorcery                   |  0.29|  0.01|  4.61|  1.61|  0.00|  1.09|  0.00|  0.00;
Animania                         |  0.29|  0.00|  3.07|  0.10|  0.00|  3.49|  0.00|  0.00;
Dynamic Surroundings             |  0.15|  0.00|  0.19|  0.12|  0.00|  0.11|  4.52|  0.00;
Recurrent Complex                |  0.23|  0.00|  0.80|  0.92|  0.00|  2.65|  0.00|  0.00;
Forestry                         |  0.39|  0.01|  2.79|  0.90|  0.00|  0.23|  0.00|  0.00
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
  4.56: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.51: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.99: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.58: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.31: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.53: jeresources.jei.JEIConfig;
  1.37: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.11: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.10: ic2.jeiIntegration.SubModule;
  0.91: com.buuz135.industrial.jei.JEICustomPlugin;
  0.75: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.74: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.61: mctmods.smelteryio.library.util.jei.JEI;
  0.59: nc.integration.jei.NCJEI;
  0.37: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.20: Other 118 Plugins
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
            text: [227.81,'s'].join(''),
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
993A00   2.05s Loading sounds;
994400   2.11s Loading Resource - SoundHandler;
994F00  48.76s ModelLoader: blocks;
995900  10.22s ModelLoader: items;
996300   9.05s ModelLoader: baking;
996D00   6.08s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200  28.15s Indexing ingredients;
444444 121.22s Other
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
