## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
505.74 sec
<br>
<sup><sub>(
8:25 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [297.82]},
      {label: 'FML stuff:', data: [207.93]}
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
436e17  18.99s Had Enough Items;
3C6315  23.65s Had Enough Items (Plugins);
516fa8  12.34s Ender IO;
8f3087  11.23s Forge Mod Loader;
a651a8  10.84s IndustrialCraft 2;
813e81   8.96s OpenComputers;
5161a8   7.91s CraftTweaker2;
495797   9.35s CraftTweaker2 (Script Loading);
8f304e   6.86s Astral Sorcery;
8c2ccd   5.94s Immersive Engineering;
213664   5.39s Forestry;
6e175e   4.90s Recurrent Complex;
436e17   4.49s Integrated Dynamics;
308f53   4.46s Village Names;
538f30   4.43s Animania;
308f7e   3.98s Quark: RotN Edition;
a86e51   3.73s Extra Utilities 2;
3e68ba   3.72s AE2 Unofficial Extended Life;
ba3eb8   3.58s Cyclic;
649e21   3.30s OpenBlocks;
cd922c   3.13s NuclearCraft;
3eb2ba   3.12s Botania;
444444  74.03s 42 Other mods;
333333  61.88s 177 'Fast' mods (load 1.0s - 0.1s);
222222   6.97s 220 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.79|  0.01|  4.60|  0.57|  3.68|  0.14|  0.00|  1.56;
IndustrialCraft 2     |  0.82|  0.02|  8.88|  0.87|  0.00|  0.25|  0.00|  0.00;
OpenComputers         |  0.19|  0.02|  5.32|  3.25|  0.19|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.68|  0.00|  3.95|  0.01|  0.00|  3.26|  0.01|  0.00;
Astral Sorcery        |  0.24|  0.01|  4.47|  1.66|  0.00|  0.48|  0.00|  0.00;
Immersive Engineering |  0.96|  0.01|  1.41|  1.00|  0.00|  2.57|  0.00|  0.00;
Forestry              |  0.47|  0.01|  3.40|  1.16|  0.00|  0.35|  0.00|  0.00;
Recurrent Complex     |  0.28|  0.01|  0.69|  1.18|  0.00|  2.75|  0.00|  0.00;
Integrated Dynamics   |  0.27|  0.01|  3.97|  0.24|  0.00|  0.00|  0.00|  0.00;
Village Names         |  0.13|  0.00|  4.14|  0.19|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.37|  0.00|  3.54|  0.10|  0.00|  0.42|  0.00|  0.00;
Quark: RotN Edition   |  0.03|  0.01|  3.66|  0.12|  0.00|  0.17|  0.00|  0.00
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
  2.98: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.50: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.73: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.51: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.32: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.29: jeresources.jei.JEIConfig;
  1.13: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.07: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.00: ic2.jeiIntegration.SubModule;
  0.80: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.80: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.67: nc.integration.jei.NCJEI;
  0.53: com.buuz135.industrial.jei.JEICustomPlugin;
  0.40: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.29: xt9.deepmoblearning.plugins.jei.Plugin;
  5.63: Other 128 Plugins
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
            text: [207.93,'s'].join(''),
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
993A00   1.47s Loading sounds;
994400   1.52s Loading Resource - SoundHandler;
994F00  30.36s ModelLoader: blocks;
995900  11.30s ModelLoader: items;
996300  10.57s ModelLoader: baking;
996D00   1.86s Applying remove recipe actions;
997700   0.16s Applying remove furnace recipe actions;
998200   1.13s Indexing ingredients;
444444 149.55s Other
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
