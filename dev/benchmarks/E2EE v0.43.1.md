## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
634.65 sec
<br>
<sup><sub>(
10:34 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [392.45]},
      {label: 'FML stuff:', data: [242.21]}
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
3e76ba  18.22s Just Enough Items;
386AA7  29.94s Just Enough Items (Plugins);
386AA7  28.97s Just Enough Items (Ingredient Filter);
8c2ccd  20.07s Immersive Engineering;
516fa8  18.65s Ender IO;
214d9e  15.51s Minecraft Forge;
176e43  13.59s Thaumic Additions: Reconstructed;
a651a8  12.74s IndustrialCraft 2;
5161a8   4.43s CraftTweaker2;
495797   7.93s CraftTweaker2 (Script Loading);
8f3087  10.14s Forge Mod Loader;
7c813e   9.43s Thaumcraft;
813e81   8.85s OpenComputers;
538f30   7.63s Animania;
8f304e   7.58s Astral Sorcery;
8f6c30   5.08s Dynamic Surroundings;
213664   4.94s Forestry;
6e175e   4.44s Recurrent Complex;
9e2174   4.37s Tinkers' Construct;
436e17   3.99s Integrated Dynamics;
308f53   3.72s Village Names;
a86e51   3.52s Extra Utilities 2;
ba3eb8   3.46s Cyclic;
444444  84.81s 44 Other mods;
333333  53.65s 155 'Fast' mods (load 1.0s - 0.1s);
222222   6.77s 222 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering            |  0.93|  0.01|  1.37|  0.94|  0.00| 16.82|  0.00|  0.00;
Ender IO                         |  1.77|  0.01|  4.35|  0.53|  3.90|  6.86|  0.00|  1.24;
Thaumic Additions: Reconstructed |  0.27|  0.00|  0.75|  0.33|  0.00| 12.23|  0.00|  0.00;
IndustrialCraft 2                |  0.77|  0.01|  9.39|  1.21|  0.00|  1.36|  0.00|  0.00;
CraftTweaker2                    |  0.62|  0.00|  3.76|  0.01|  0.00|  7.96|  0.01|  0.00;
Thaumcraft                       |  0.78|  0.01|  0.20|  0.39|  0.01|  8.04|  0.00|  0.00;
OpenComputers                    |  0.18|  0.01|  5.48|  3.00|  0.18|  0.00|  0.00|  0.00;
Animania                         |  0.37|  0.00|  3.40|  0.10|  0.00|  3.77|  0.00|  0.00;
Astral Sorcery                   |  0.24|  0.00|  4.64|  1.57|  0.00|  1.13|  0.00|  0.00;
Dynamic Surroundings             |  0.17|  0.00|  0.22|  0.13|  0.00|  0.05|  4.51|  0.00;
Forestry                         |  0.38|  0.01|  3.20|  0.97|  0.00|  0.39|  0.00|  0.00;
Recurrent Complex                |  0.33|  0.01|  0.62|  0.84|  0.00|  2.65|  0.00|  0.00
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
  4.72: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.64: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.74: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.35: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.33: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.38: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.36: jeresources.jei.JEIConfig;
  1.25: ic2.jeiIntegration.SubModule;
  1.19: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.14: nc.integration.jei.NCJEI;
  1.00: com.buuz135.industrial.jei.JEICustomPlugin;
  0.73: mctmods.smelteryio.library.util.jei.JEI;
  0.73: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.68: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.39: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.33: Other 118 Plugins
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
            text: [242.21,'s'].join(''),
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
994400   2.14s Loading Resource - SoundHandler;
994F00  49.49s ModelLoader: blocks;
995900  10.72s ModelLoader: items;
996300  11.04s ModelLoader: baking;
996D00   5.96s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
998200  28.89s Indexing ingredients;
444444 131.72s Other
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
