## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
495.22 sec
<br>
<sup><sub>(
8:15 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [296.68]},
      {label: 'FML stuff:', data: [198.54]}
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
436e17  18.13s Had Enough Items;
3C6315  21.68s Had Enough Items (Plugins);
516fa8  13.88s Ender IO;
8f3087  11.03s Forge Mod Loader;
a651a8  10.62s IndustrialCraft 2;
813e81   8.98s OpenComputers;
5161a8   7.63s CraftTweaker2;
495797   8.23s CraftTweaker2 (Script Loading);
8f304e   6.93s Astral Sorcery;
8c2ccd   5.99s Immersive Engineering;
213664   4.91s Forestry;
6e175e   4.75s Recurrent Complex;
538f30   4.47s Animania;
436e17   4.32s Integrated Dynamics;
308f53   4.28s Village Names;
a86e51   3.87s Extra Utilities 2;
216364   3.84s Thermal Expansion;
ba3eb8   3.73s Cyclic;
308f7e   3.67s Quark: RotN Edition;
3e68ba   3.63s AE2 Unofficial Extended Life;
3e8160   3.36s The Twilight Forest;
649e21   3.30s OpenBlocks;
444444  77.25s 43 Other mods;
333333  59.20s 171 'Fast' mods (load 1.0s - 0.1s);
222222   7.22s 224 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.81|  0.01|  4.30|  0.58|  3.66|  1.51|  0.00|  2.01;
IndustrialCraft 2     |  0.75|  0.02|  8.51|  0.99|  0.00|  0.36|  0.00|  0.00;
OpenComputers         |  0.19|  0.02|  5.31|  3.28|  0.19|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.60|  0.00|  3.81|  0.01|  0.00|  3.20|  0.01|  0.00;
Astral Sorcery        |  0.23|  0.01|  4.70|  1.46|  0.00|  0.53|  0.00|  0.00;
Immersive Engineering |  1.02|  0.01|  1.31|  0.96|  0.00|  2.70|  0.00|  0.00;
Forestry              |  0.39|  0.01|  3.24|  0.93|  0.00|  0.34|  0.00|  0.00;
Recurrent Complex     |  0.31|  0.01|  0.70|  1.00|  0.00|  2.74|  0.00|  0.00;
Animania              |  0.33|  0.00|  3.44|  0.11|  0.00|  0.60|  0.00|  0.00;
Integrated Dynamics   |  0.26|  0.01|  4.00|  0.05|  0.00|  0.00|  0.00|  0.00;
Village Names         |  0.15|  0.00|  3.94|  0.18|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.07|  0.01|  3.48|  0.08|  0.00|  0.24|  0.00|  0.00
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
  2.77: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.36: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.60: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.45: jeresources.jei.JEIConfig;
  1.38: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.37: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.36: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.86: ic2.jeiIntegration.SubModule;
  0.85: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.80: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.61: nc.integration.jei.NCJEI;
  0.60: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.49: com.buuz135.industrial.jei.JEICustomPlugin;
  0.35: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.25: net.bdew.jeibees.BeesJEIPlugin;
  4.58: Other 128 Plugins
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
            text: [198.54,'s'].join(''),
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
993A00   1.41s Loading sounds;
994400   1.47s Loading Resource - SoundHandler;
994F00  28.99s ModelLoader: blocks;
995900   9.71s ModelLoader: items;
996300  10.18s ModelLoader: baking;
996D00   1.69s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200   1.17s Indexing ingredients;
444444 143.75s Other
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
