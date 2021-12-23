## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
701.52 sec
<br>
<sup><sub>(
11:41 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [453.50]},
      {label: 'FML stuff:', data: [248.01]}
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
3e76ba  19.83s Just Enough Items;
386AA7  31.55s Just Enough Items (Plugins);
386AA7  29.03s Just Enough Items (Ingredient Filter);
8c2ccd  19.46s Immersive Engineering;
516fa8  18.80s Ender IO;
5161a8   6.29s CraftTweaker2;
495797  11.58s CraftTweaker2 (Script Loading);
214d9e  16.14s Minecraft Forge;
176e43  13.95s Thaumic Additions: Reconstructed;
a651a8  11.75s IndustrialCraft 2;
8f3087  11.72s Forge Mod Loader;
813e81   8.20s OpenComputers;
538f30   8.03s Animania;
8f304e   7.97s Astral Sorcery;
7c813e   7.64s Thaumcraft;
8f6c30   5.35s Dynamic Surroundings;
6e175e   5.13s Recurrent Complex;
213664   5.08s Forestry;
9e2174   4.78s Tinkers' Construct;
436e17   4.34s Integrated Dynamics;
308f53   4.01s Village Names;
6e3a17   3.82s Quark;
a86e51   3.73s Extra Utilities 2;
444444 103.59s 53 Other mods;
333333  89.91s 329 'Fast' mods (load 1.0s - 0.1s);
222222   1.82s 36 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering            |  0.96|  0.01|  1.25|  0.93|  0.00| 16.30|  0.02|  0.00;
Ender IO                         |  1.77|  0.02|  4.56|  0.57|  3.94|  6.84|  0.02|  1.09;
CraftTweaker2                    |  0.52|  0.00|  3.34|  0.03|  0.00| 13.88|  0.09|  0.00;
Thaumic Additions: Reconstructed |  0.20|  0.00|  0.71|  0.35|  0.00| 12.67|  0.02|  0.00;
IndustrialCraft 2                |  0.75|  0.02|  8.54|  0.97|  0.00|  1.45|  0.02|  0.00;
OpenComputers                    |  0.20|  0.02|  4.85|  2.88|  0.21|  0.02|  0.02|  0.00;
Animania                         |  0.32|  0.00|  3.34|  0.11|  0.00|  4.23|  0.02|  0.00;
Astral Sorcery                   |  0.24|  0.01|  4.99|  1.57|  0.00|  1.15|  0.02|  0.00;
Thaumcraft                       |  0.54|  0.01|  0.21|  0.47|  0.01|  6.38|  0.02|  0.00;
Dynamic Surroundings             |  0.23|  0.01|  0.23|  0.16|  0.00|  0.07|  4.65|  0.00;
Recurrent Complex                |  0.26|  0.01|  0.87|  0.89|  0.00|  3.08|  0.02|  0.00;
Forestry                         |  0.37|  0.02|  2.95|  1.21|  0.00|  0.51|  0.02|  0.00
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
  4.53: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.83: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.77: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.58: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.39: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.67: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.64: com.buuz135.industrial.jei.JEICustomPlugin;
  1.64: jeresources.jei.JEIConfig;
  1.62: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.09: ic2.jeiIntegration.SubModule;
  0.86: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.84: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.63: mctmods.smelteryio.library.util.jei.JEI;
  0.56: nc.integration.jei.NCJEI;
  0.45: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.47: Other 118 Plugins
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
            text: [248.01,'s'].join(''),
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
993A00   2.03s Loading sounds;
994400   2.10s Loading Resource - SoundHandler;
994F00  53.60s ModelLoader: blocks;
995900  11.07s ModelLoader: items;
996300   9.83s ModelLoader: baking;
996D00   6.24s Applying remove recipe actions;
997700   6.11s Applying remove furnace recipe actions;
998200  28.96s Indexing ingredients;
444444 128.07s Other
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
