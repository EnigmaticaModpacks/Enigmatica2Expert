## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
623.04 sec
<br>
<sup><sub>(
10:23 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [382.48]},
      {label: 'FML stuff:', data: [240.57]}
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
436e17  80.07s Had Enough Items;
516fa8  17.80s Ender IO;
8c2ccd  15.46s Immersive Engineering;
214d9e  14.51s Minecraft Forge;
a651a8  11.05s IndustrialCraft 2;
176e43  10.64s Thaumic Additions: Reconstructed;
8f3087   9.90s Forge Mod Loader;
5161a8   1.43s CraftTweaker2;
495797   8.40s CraftTweaker2 (Script Loading);
813e81   8.18s OpenComputers;
8f304e   7.44s Astral Sorcery;
538f30   7.18s Animania;
7c813e   6.46s Thaumcraft;
8f6c30   5.39s Dynamic Surroundings;
213664   5.26s Forestry;
81493e   5.01s Block Drops;
6e175e   4.77s Recurrent Complex;
9e2174   4.16s Tinkers' Construct;
216364   3.98s Thermal Expansion;
436e17   3.95s Integrated Dynamics;
308f53   3.85s Village Names;
444444  85.90s 45 Other mods;
333333  54.74s 158 'Fast' mods (load 1.0s - 0.1s);
222222   6.95s 217 'Instant' mods (load %3C 0.1s)
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
Had Enough Items                 |  0.07|  0.00|  3.36|  0.02|  0.00|  0.00| 76.63|  0.00;
Ender IO                         |  1.81|  0.01|  4.27|  0.63|  3.60|  6.28|  0.00|  1.20;
Immersive Engineering            |  1.09|  0.01|  1.10|  0.93|  0.00| 12.34|  0.00|  0.00;
IndustrialCraft 2                |  0.82|  0.01|  8.26|  0.90|  0.00|  1.06|  0.00|  0.00;
Thaumic Additions: Reconstructed |  0.19|  0.00|  0.70|  0.32|  0.00|  9.44|  0.00|  0.00;
CraftTweaker2                    |  0.56|  0.00|  3.70|  0.01|  0.00|  5.54|  0.02|  0.00;
OpenComputers                    |  0.19|  0.02|  5.04|  2.76|  0.19|  0.00|  0.00|  0.00;
Astral Sorcery                   |  0.28|  0.01|  4.63|  1.56|  0.00|  0.97|  0.00|  0.00;
Animania                         |  0.32|  0.00|  3.28|  0.10|  0.00|  3.49|  0.00|  0.00;
Thaumcraft                       |  0.78|  0.01|  0.21|  0.38|  0.01|  5.08|  0.00|  0.00;
Dynamic Surroundings             |  0.19|  0.01|  0.20|  0.12|  0.00|  0.06|  4.82|  0.00;
Forestry                         |  0.41|  0.01|  3.42|  0.92|  0.00|  0.50|  0.00|  0.00
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
  3.47: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  3.42: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.25: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.79: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.92: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.55: jeresources.jei.JEIConfig;
  1.54: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.38: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.22: ic2.jeiIntegration.SubModule;
  1.00: com.buuz135.industrial.jei.JEICustomPlugin;
  0.75: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.64: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.58: mctmods.smelteryio.library.util.jei.JEI;
  0.55: nc.integration.jei.NCJEI;
  0.40: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.85: Other 119 Plugins
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
            text: [240.57,'s'].join(''),
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
993A00   2.11s Loading sounds;
994400   2.18s Loading Resource - SoundHandler;
994F00  51.04s ModelLoader: blocks;
995900  10.45s ModelLoader: items;
996300   9.42s ModelLoader: baking;
996D00   4.23s Applying remove recipe actions;
997700   0.16s Applying remove furnace recipe actions;
444444 160.97s Other
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
