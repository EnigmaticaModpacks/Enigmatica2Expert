## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
620.21 sec
<br>
<sup><sub>(
10:20 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [375.11]},
      {label: 'FML stuff:', data: [245.10]}
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
3e76ba  17.29s Just Enough Items;
386AA7  28.88s Just Enough Items (Plugins);
386AA7  47.75s Just Enough Items (Ingredient Filter);
8c2ccd  17.65s Immersive Engineering;
214d9e  15.71s Minecraft Forge;
516fa8  12.20s Ender IO;
a651a8  11.44s IndustrialCraft 2;
8f3087  10.68s Forge Mod Loader;
5161a8   1.70s CraftTweaker2;
495797   8.47s CraftTweaker2 (Script Loading);
813e81   8.93s OpenComputers;
538f30   7.61s Animania;
8f304e   7.47s Astral Sorcery;
8f6c30   5.24s Dynamic Surroundings;
213664   4.81s Forestry;
6e175e   4.75s Recurrent Complex;
9e2174   4.37s Tinkers' Construct;
436e17   4.01s Integrated Dynamics;
308f53   3.95s Village Names;
ba3eb8   3.68s Cyclic;
6e3a17   3.54s Quark;
a86e51   3.42s Extra Utilities 2;
3e68ba   3.41s AE2 Unofficial Extended Life;
444444  79.04s 44 Other mods;
333333  52.24s 157 'Fast' mods (load 1.0s - 0.1s);
222222   6.89s 224 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering |  0.86|  0.01|  1.20|  1.00|  0.00| 14.59|  0.00|  0.00;
Ender IO              |  1.79|  0.01|  4.04|  0.55|  4.08|  0.17|  0.00|  1.56;
IndustrialCraft 2     |  0.79|  0.01|  8.35|  0.82|  0.00|  1.47|  0.00|  0.00;
CraftTweaker2         |  0.58|  0.00|  3.49|  0.00|  0.00|  6.08|  0.01|  0.00;
OpenComputers         |  0.25|  0.01|  4.90|  3.57|  0.19|  0.00|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.12|  0.10|  0.00|  4.08|  0.00|  0.00;
Astral Sorcery        |  0.25|  0.00|  4.64|  1.52|  0.00|  1.06|  0.00|  0.00;
Dynamic Surroundings  |  0.18|  0.00|  0.20|  0.16|  0.00|  0.06|  4.63|  0.00;
Forestry              |  0.39|  0.01|  2.98|  1.00|  0.00|  0.43|  0.00|  0.00;
Recurrent Complex     |  0.27|  0.00|  0.77|  0.98|  0.00|  2.73|  0.00|  0.00;
Tinkers' Construct    |  1.00|  0.01|  0.17|  0.05|  0.00|  3.14|  0.00|  0.00;
Integrated Dynamics   |  0.21|  0.01|  3.74|  0.05|  0.00|  0.00|  0.00|  0.00
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
  4.06: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.27: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.98: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.78: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.01: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.49: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.38: jeresources.jei.JEIConfig;
  1.38: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.23: ic2.jeiIntegration.SubModule;
  0.85: com.buuz135.industrial.jei.JEICustomPlugin;
  0.76: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.73: nc.integration.jei.NCJEI;
  0.59: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.54: mctmods.smelteryio.library.util.jei.JEI;
  0.43: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.41: Other 118 Plugins
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
            text: [245.10,'s'].join(''),
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
993A00   2.01s Loading sounds;
994400   2.06s Loading Resource - SoundHandler;
994F00  56.86s ModelLoader: blocks;
995900  11.74s ModelLoader: items;
996300   9.25s ModelLoader: baking;
996D00   4.77s Applying remove recipe actions;
997700   0.16s Applying remove furnace recipe actions;
444444 158.27s Other
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
