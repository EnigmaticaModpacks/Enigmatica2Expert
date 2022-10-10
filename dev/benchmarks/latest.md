## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
497.92 sec
<br>
<sup><sub>(
8:17 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [301.61]},
      {label: 'FML stuff:', data: [196.31]}
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
436e17  18.69s Had Enough Items;
3C6315  23.24s Had Enough Items (Plugins);
516fa8  12.68s Ender IO;
a651a8  11.32s IndustrialCraft 2;
8f3087  10.51s Forge Mod Loader;
813e81   9.20s OpenComputers;
5161a8   8.34s CraftTweaker2;
495797   9.73s CraftTweaker2 (Script Loading);
8f304e   7.44s Astral Sorcery;
8c2ccd   6.41s Immersive Engineering;
213664   5.38s Forestry;
6e175e   4.85s Recurrent Complex;
436e17   4.33s Integrated Dynamics;
538f30   4.29s Animania;
a86e51   4.06s Extra Utilities 2;
308f53   4.00s Village Names;
3e68ba   3.90s AE2 Unofficial Extended Life;
ba3eb8   3.86s Cyclic;
308f7e   3.61s Quark: RotN Edition;
649e21   3.60s OpenBlocks;
cd922c   3.40s NuclearCraft;
814a3e   3.30s RFTools;
444444  80.15s 47 Other mods;
333333  57.90s 170 'Fast' mods (load 1.0s - 0.1s);
222222   7.15s 222 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.80|  0.01|  4.48|  0.66|  3.82|  0.15|  0.00|  1.76;
IndustrialCraft 2     |  0.88|  0.02|  8.94|  1.15|  0.00|  0.34|  0.00|  0.00;
OpenComputers         |  0.22|  0.02|  5.24|  3.53|  0.20|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.61|  0.00|  4.14|  0.01|  0.00|  3.56|  0.01|  0.00;
Astral Sorcery        |  0.27|  0.01|  4.71|  1.76|  0.00|  0.69|  0.00|  0.00;
Immersive Engineering |  1.04|  0.01|  1.38|  1.26|  0.00|  2.72|  0.00|  0.00;
Forestry              |  0.40|  0.01|  3.52|  1.10|  0.00|  0.35|  0.00|  0.00;
Recurrent Complex     |  0.25|  0.01|  0.65|  0.93|  0.00|  3.02|  0.00|  0.00;
Integrated Dynamics   |  0.22|  0.01|  4.04|  0.06|  0.00|  0.01|  0.00|  0.00;
Animania              |  0.34|  0.00|  3.40|  0.12|  0.00|  0.44|  0.00|  0.00;
Extra Utilities 2     |  0.07|  0.01|  3.61|  0.07|  0.00|  0.30|  0.00|  0.00;
Village Names         |  0.11|  0.00|  3.71|  0.18|  0.00|  0.00|  0.00|  0.00
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
  2.59: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.46: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.21: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.47: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.44: jeresources.jei.JEIConfig;
  1.39: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.18: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.97: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.91: ic2.jeiIntegration.SubModule;
  0.79: com.buuz135.industrial.jei.JEICustomPlugin;
  0.78: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.73: nc.integration.jei.NCJEI;
  0.61: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.46: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.35: mctmods.smelteryio.library.util.jei.JEI;
  4.92: Other 128 Plugins
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
            text: [196.31,'s'].join(''),
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
993A00   1.57s Loading sounds;
994400   1.62s Loading Resource - SoundHandler;
994F00  27.19s ModelLoader: blocks;
995900   9.91s ModelLoader: items;
996300  10.50s ModelLoader: baking;
996D00   1.96s Applying remove recipe actions;
997700   0.19s Applying remove furnace recipe actions;
998200   0.97s Indexing ingredients;
444444 142.40s Other
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
