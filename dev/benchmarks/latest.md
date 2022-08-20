## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
451.91 sec
<br>
<sup><sub>(
7:31 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [266.55]},
      {label: 'FML stuff:', data: [185.36]}
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
436e17  16.93s Had Enough Items;
3C6315  21.03s Had Enough Items (Plugins);
516fa8  12.61s Ender IO;
8f3087  10.64s Forge Mod Loader;
a651a8  10.21s IndustrialCraft 2;
813e81   7.95s OpenComputers;
5161a8   7.03s CraftTweaker2;
495797   7.92s CraftTweaker2 (Script Loading);
8f304e   6.89s Astral Sorcery;
8c2ccd   5.31s Immersive Engineering;
6e175e   4.93s Recurrent Complex;
213664   4.93s Forestry;
538f30   4.09s Animania;
436e17   3.88s Integrated Dynamics;
308f53   3.65s Village Names;
a86e51   3.49s Extra Utilities 2;
308f7e   3.25s Quark: RotN Edition;
3e68ba   3.25s AE2 Unofficial Extended Life;
ba3eb8   3.17s Cyclic;
649e21   2.91s OpenBlocks;
814a3e   2.82s RFTools;
3e8160   2.76s The Twilight Forest;
444444  61.56s 38 Other mods;
333333  56.30s 167 'Fast' mods (load 1.0s - 0.1s);
222222   6.98s 227 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.71|  0.01|  4.21|  0.53|  3.61|  0.14|  0.00|  2.39;
IndustrialCraft 2     |  0.74|  0.02|  8.34|  0.86|  0.00|  0.26|  0.00|  0.00;
OpenComputers         |  0.16|  0.02|  4.87|  2.72|  0.18|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.57|  0.00|  3.34|  0.00|  0.00|  3.06|  0.06|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.56|  1.52|  0.00|  0.57|  0.00|  0.00;
Immersive Engineering |  0.89|  0.01|  1.13|  0.96|  0.00|  2.32|  0.00|  0.00;
Recurrent Complex     |  0.23|  0.01|  0.62|  0.84|  0.00|  3.24|  0.00|  0.00;
Forestry              |  0.35|  0.01|  3.33|  0.85|  0.00|  0.38|  0.00|  0.00;
Animania              |  0.27|  0.00|  3.13|  0.09|  0.00|  0.60|  0.00|  0.00;
Integrated Dynamics   |  0.24|  0.01|  3.58|  0.05|  0.00|  0.00|  0.00|  0.00;
Village Names         |  0.11|  0.00|  3.37|  0.17|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.06|  0.01|  3.09|  0.14|  0.00|  0.19|  0.00|  0.00
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
  2.63: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.48: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.45: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.44: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.40: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.21: jeresources.jei.JEIConfig;
  1.14: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.08: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.81: ic2.jeiIntegration.SubModule;
  0.73: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.70: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.66: nc.integration.jei.NCJEI;
  0.47: com.buuz135.industrial.jei.JEICustomPlugin;
  0.39: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.21: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.23: Other 126 Plugins
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
            text: [185.36,'s'].join(''),
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
994F00  26.49s ModelLoader: blocks;
995900   8.93s ModelLoader: items;
996300  10.53s ModelLoader: baking;
996D00   1.58s Applying remove recipe actions;
997700   0.15s Applying remove furnace recipe actions;
998200   0.99s Indexing ingredients;
444444 134.05s Other
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
