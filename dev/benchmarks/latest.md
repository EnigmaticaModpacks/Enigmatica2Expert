## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
497.62 sec
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
      {label:      'MODS:', data: [298.04]},
      {label: 'FML stuff:', data: [199.58]}
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
436e17  17.88s Had Enough Items;
3C6315  23.17s Had Enough Items (Plugins);
516fa8  13.47s Ender IO;
a651a8  10.94s IndustrialCraft 2;
8f3087  10.75s Forge Mod Loader;
8f304e   7.40s Astral Sorcery;
5161a8   7.38s CraftTweaker2;
495797   8.68s CraftTweaker2 (Script Loading);
8c2ccd   6.37s Immersive Engineering;
813e81   6.10s OpenComputers;
213664   5.63s Forestry;
436e17   4.81s Integrated Dynamics;
6e175e   4.63s Recurrent Complex;
538f30   4.38s Animania;
81493e   4.04s Block Drops;
308f53   3.95s Village Names;
ba3eb8   3.84s Cyclic;
a86e51   3.77s Extra Utilities 2;
3e68ba   3.57s AE2 Unofficial Extended Life;
308f7e   3.39s Quark: RotN Edition;
649e21   3.35s OpenBlocks;
cd922c   3.29s NuclearCraft;
444444  81.50s 44 Other mods;
333333  57.68s 168 'Fast' mods (load 1.0s - 0.1s);
222222   6.76s 221 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.85|  0.01|  4.28|  0.57|  3.95|  1.25|  0.00|  1.56;
IndustrialCraft 2     |  0.83|  0.02|  8.91|  0.91|  0.00|  0.27|  0.00|  0.00;
Astral Sorcery        |  0.25|  0.01|  4.88|  1.70|  0.00|  0.57|  0.00|  0.00;
CraftTweaker2         |  0.62|  0.00|  3.56|  0.00|  0.00|  3.18|  0.02|  0.00;
Immersive Engineering |  0.92|  0.01|  1.10|  0.99|  0.00|  3.34|  0.00|  0.00;
OpenComputers         |  0.17|  0.02|  2.52|  3.19|  0.19|  0.00|  0.00|  0.00;
Forestry              |  0.44|  0.01|  3.52|  1.17|  0.00|  0.48|  0.00|  0.00;
Integrated Dynamics   |  0.27|  0.01|  4.47|  0.07|  0.00|  0.00|  0.00|  0.00;
Recurrent Complex     |  0.28|  0.01|  0.70|  1.00|  0.00|  2.64|  0.00|  0.00;
Animania              |  0.32|  0.00|  3.51|  0.10|  0.00|  0.46|  0.00|  0.00;
Block Drops           |  0.04|  0.00|  0.01|  0.00|  0.00|  4.00|  0.00|  0.00;
Village Names         |  0.11|  0.00|  3.64|  0.20|  0.00|  0.00|  0.00|  0.00
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
  3.12: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.56: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.54: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.51: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.51: jeresources.jei.JEIConfig;
  1.33: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.27: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.03: ic2.jeiIntegration.SubModule;
  0.96: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.78: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.71: nc.integration.jei.NCJEI;
  0.67: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.50: com.buuz135.industrial.jei.JEICustomPlugin;
  0.39: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.34: xt9.deepmoblearning.plugins.jei.Plugin;
  4.96: Other 126 Plugins
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
            text: [199.58,'s'].join(''),
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
993A00   1.45s Loading sounds;
994400   1.51s Loading Resource - SoundHandler;
994F00  27.87s ModelLoader: blocks;
995900   9.77s ModelLoader: items;
996300   9.88s ModelLoader: baking;
996D00   1.75s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
998200   1.26s Indexing ingredients;
444444 145.92s Other
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
