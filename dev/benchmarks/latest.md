## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
578.93 sec
<br>
<sup><sub>(
9:38 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [340.88]},
      {label: 'FML stuff:', data: [238.05]}
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
436e17  72.95s Had Enough Items;
8c2ccd  14.92s Immersive Engineering;
214d9e  14.13s Minecraft Forge;
516fa8  11.34s Ender IO;
a651a8  11.04s IndustrialCraft 2;
8f3087  10.16s Forge Mod Loader;
5161a8   0.56s CraftTweaker2;
495797   8.81s CraftTweaker2 (Script Loading);
813e81   8.11s OpenComputers;
538f30   7.71s Animania;
8f304e   7.51s Astral Sorcery;
213664   5.15s Forestry;
8f6c30   5.12s Dynamic Surroundings;
6e175e   4.59s Recurrent Complex;
9e2174   4.03s Tinkers' Construct;
436e17   3.84s Integrated Dynamics;
308f53   3.82s Village Names;
a86e51   3.57s Extra Utilities 2;
308f7e   3.43s Quark: RotN Edition;
ba3eb8   3.28s Cyclic;
3e68ba   3.11s AE2 Unofficial Extended Life;
444444  74.14s 42 Other mods;
333333  52.49s 155 'Fast' mods (load 1.0s - 0.1s);
222222   7.09s 223 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.08|  0.00|  2.38|  0.02|  0.00|  0.00| 70.48|  0.00;
Immersive Engineering |  0.89|  0.01|  1.10|  0.90|  0.00| 12.03|  0.00|  0.00;
Ender IO              |  1.72|  0.01|  3.96|  0.62|  3.71|  0.15|  0.00|  1.17;
IndustrialCraft 2     |  0.71|  0.01|  8.31|  0.84|  0.00|  1.18|  0.00|  0.00;
CraftTweaker2         |  0.57|  0.00|  3.17|  0.01|  0.00|  5.60|  0.01|  0.00;
OpenComputers         |  0.17|  0.01|  4.89|  2.85|  0.18|  0.00|  0.00|  0.00;
Animania              |  0.30|  0.00|  3.14|  0.10|  0.00|  4.17|  0.00|  0.00;
Astral Sorcery        |  0.28|  0.00|  4.63|  1.71|  0.00|  0.89|  0.00|  0.00;
Forestry              |  0.39|  0.01|  3.30|  1.07|  0.00|  0.38|  0.00|  0.00;
Dynamic Surroundings  |  0.19|  0.00|  0.20|  0.16|  0.00|  0.06|  4.51|  0.00;
Recurrent Complex     |  0.24|  0.00|  0.72|  0.89|  0.00|  2.74|  0.00|  0.00;
Tinkers' Construct    |  1.02|  0.01|  0.16|  0.05|  0.00|  2.79|  0.00|  0.00
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
  2.92: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  2.90: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.87: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.56: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.98: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.38: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.36: jeresources.jei.JEIConfig;
  1.20: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.98: ic2.jeiIntegration.SubModule;
  0.85: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.84: com.buuz135.industrial.jei.JEICustomPlugin;
  0.66: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.53: nc.integration.jei.NCJEI;
  0.53: mctmods.smelteryio.library.util.jei.JEI;
  0.40: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.57: Other 119 Plugins
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
            text: [238.05,'s'].join(''),
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
993A00   2.08s Loading sounds;
994400   2.13s Loading Resource - SoundHandler;
994F00  48.87s ModelLoader: blocks;
995900  10.40s ModelLoader: items;
996300   9.54s ModelLoader: baking;
996D00   4.33s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
444444 160.53s Other
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
