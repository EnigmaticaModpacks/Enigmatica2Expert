## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
676.31 sec
<br>
<sup><sub>(
11:16 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [421.89]},
      {label: 'FML stuff:', data: [254.42]}
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
436e17  82.03s Had Enough Items;
9e2174   4.12s Tinkers' Construct;
8E1E68  31.87s Tinkers' Construct (Oredict Melting);
516fa8  19.15s Ender IO;
8c2ccd  16.49s Immersive Engineering;
214d9e  14.88s Minecraft Forge;
a651a8  11.77s IndustrialCraft 2;
5161a8   0.87s CraftTweaker2;
495797   9.30s CraftTweaker2 (Script Loading);
8f3087   9.93s Forge Mod Loader;
176e43   8.80s Thaumic Additions: Reconstructed;
7c813e   8.34s Thaumcraft;
813e81   8.23s OpenComputers;
8f304e   7.83s Astral Sorcery;
538f30   6.88s Animania;
213664   5.31s Forestry;
8f6c30   5.13s Dynamic Surroundings;
6e175e   4.64s Recurrent Complex;
436e17   4.51s Integrated Dynamics;
308f53   4.10s Village Names;
a86e51   3.97s Extra Utilities 2;
308f7e   3.75s Quark: RotN Edition;
444444  87.65s 45 Other mods;
333333  55.52s 159 'Fast' mods (load 1.0s - 0.1s);
222222   6.82s 216 'Instant' mods (load %3C 0.1s)
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
Had Enough Items                 |  0.10|  0.00|  2.41|  0.02|  0.00|  0.00| 79.50|  0.00;
Tinkers' Construct               |  1.05|  0.01|  0.17|  0.06|  0.01| 34.70|  0.00|  0.00;
Ender IO                         |  1.75|  0.01|  4.35|  0.57|  4.12|  6.95|  0.00|  1.40;
Immersive Engineering            |  0.89|  0.01|  1.12|  1.03|  0.00| 13.45|  0.00|  0.00;
IndustrialCraft 2                |  0.88|  0.01|  8.41|  0.98|  0.00|  1.49|  0.00|  0.00;
CraftTweaker2                    |  0.63|  0.00|  3.46|  0.01|  0.00|  6.06|  0.01|  0.00;
Thaumic Additions: Reconstructed |  0.17|  0.00|  0.66|  0.39|  0.00|  7.57|  0.00|  0.00;
Thaumcraft                       |  0.71|  0.01|  0.21|  0.42|  0.01|  6.98|  0.00|  0.00;
OpenComputers                    |  0.17|  0.01|  5.06|  2.81|  0.18|  0.00|  0.00|  0.00;
Astral Sorcery                   |  0.24|  0.01|  4.76|  1.77|  0.00|  1.05|  0.00|  0.00;
Animania                         |  0.32|  0.00|  3.20|  0.10|  0.00|  3.27|  0.00|  0.00;
Forestry                         |  0.39|  0.01|  3.47|  1.17|  0.00|  0.27|  0.00|  0.00
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
  3.94: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.54: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  3.41: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.49: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.30: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.68: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.48: ic2.jeiIntegration.SubModule;
  1.26: jeresources.jei.JEIConfig;
  1.15: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.85: com.buuz135.industrial.jei.JEICustomPlugin;
  0.82: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.73: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.71: nc.integration.jei.NCJEI;
  0.54: mctmods.smelteryio.library.util.jei.JEI;
  0.45: crazypants.enderio.base.integration.jei.JeiPlugin;
  5.01: Other 119 Plugins
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
            text: [254.42,'s'].join(''),
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
993A00   2.09s Loading sounds;
994400   2.15s Loading Resource - SoundHandler;
994F00  53.40s ModelLoader: blocks;
995900  11.33s ModelLoader: items;
996300   9.55s ModelLoader: baking;
996D00   4.71s Applying remove recipe actions;
997700   0.19s Applying remove furnace recipe actions;
444444 171.00s Other
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
