## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
594.78 sec
<br>
<sup><sub>(
9:54 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [359.58]},
      {label: 'FML stuff:', data: [235.20]}
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
436e17  67.54s Had Enough Items;
9e2174   2.42s Tinkers' Construct;
8E1E68  33.05s Tinkers' Construct (Oredict Melting);
516fa8  13.14s Ender IO;
a651a8  12.28s IndustrialCraft 2;
214d9e  11.39s Minecraft Forge;
8f3087  10.84s Forge Mod Loader;
813e81   8.96s OpenComputers;
5161a8   1.31s CraftTweaker2;
495797   8.79s CraftTweaker2 (Script Loading);
8f304e   7.43s Astral Sorcery;
213664   5.56s Forestry;
8c2ccd   5.35s Immersive Engineering;
6e175e   4.85s Recurrent Complex;
436e17   4.47s Integrated Dynamics;
538f30   4.19s Animania;
308f53   3.91s Village Names;
a86e51   3.79s Extra Utilities 2;
3e68ba   3.51s AE2 Unofficial Extended Life;
ba3eb8   3.49s Cyclic;
308f7e   3.46s Quark: RotN Edition;
649e21   3.23s OpenBlocks;
444444  80.90s 46 Other mods;
333333  51.83s 159 'Fast' mods (load 1.0s - 0.1s);
222222   6.50s 213 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.08|  0.00|  1.82|  0.27|  0.00|  0.00| 65.36|  0.00;
Tinkers' Construct    |  1.16|  0.01|  0.17|  0.05|  0.01| 34.07|  0.00|  0.00;
Ender IO              |  1.80|  0.01|  4.38|  0.56|  3.66|  1.19|  0.00|  1.54;
IndustrialCraft 2     |  0.81|  0.02|  9.89|  0.91|  0.00|  0.66|  0.00|  0.00;
OpenComputers         |  0.17|  0.02|  5.71|  2.86|  0.20|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.56|  0.00|  3.81|  0.01|  0.00|  3.09|  0.01|  0.00;
Astral Sorcery        |  0.28|  0.01|  4.99|  1.66|  0.00|  0.51|  0.00|  0.00;
Forestry              |  0.38|  0.01|  3.65|  0.96|  0.00|  0.57|  0.00|  0.00;
Immersive Engineering |  0.96|  0.01|  1.25|  0.99|  0.00|  2.15|  0.00|  0.00;
Recurrent Complex     |  0.24|  0.01|  0.71|  0.98|  0.00|  2.92|  0.00|  0.00;
Integrated Dynamics   |  0.22|  0.01|  4.19|  0.05|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.32|  0.10|  0.00|  0.45|  0.00|  0.00
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
  2.75: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.14: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.58: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.58: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.25: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.18: jeresources.jei.JEIConfig;
  1.17: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.05: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.96: ic2.jeiIntegration.SubModule;
  0.76: nc.integration.jei.NCJEI;
  0.70: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.54: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.46: net.bdew.jeibees.BeesJEIPlugin;
  0.43: com.buuz135.industrial.jei.JEICustomPlugin;
  0.35: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.57: Other 123 Plugins
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
            text: [235.20,'s'].join(''),
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
993A00   1.29s Loading sounds;
994400   1.35s Loading Resource - SoundHandler;
994F00  48.91s ModelLoader: blocks;
995900   9.78s ModelLoader: items;
996300  10.72s ModelLoader: baking;
996D00   1.75s Applying remove recipe actions;
997700   0.16s Applying remove furnace recipe actions;
444444 161.24s Other
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
