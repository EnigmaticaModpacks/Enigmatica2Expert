## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
587.36 sec
<br>
<sup><sub>(
9:47 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [344.07]},
      {label: 'FML stuff:', data: [243.28]}
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
436e17  73.93s Had Enough Items;
8c2ccd  16.62s Immersive Engineering;
214d9e  13.96s Minecraft Forge;
516fa8  11.77s Ender IO;
a651a8  10.68s IndustrialCraft 2;
8f3087   9.63s Forge Mod Loader;
5161a8   0.34s CraftTweaker2;
495797   8.80s CraftTweaker2 (Script Loading);
813e81   8.11s OpenComputers;
8f304e   7.51s Astral Sorcery;
538f30   6.47s Animania;
213664   4.98s Forestry;
8f6c30   4.95s Dynamic Surroundings;
6e175e   4.58s Recurrent Complex;
9e2174   4.32s Tinkers' Construct;
436e17   4.03s Integrated Dynamics;
308f53   3.86s Village Names;
a86e51   3.64s Extra Utilities 2;
308f7e   3.41s Quark: RotN Edition;
ba3eb8   3.36s Cyclic;
cd922c   3.35s NuclearCraft;
444444  77.11s 44 Other mods;
333333  51.60s 154 'Fast' mods (load 1.0s - 0.1s);
222222   7.09s 222 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.07|  0.00|  2.79|  0.14|  0.00|  0.00| 70.92|  0.00;
Immersive Engineering |  0.89|  0.01|  1.15|  0.92|  0.00| 13.65|  0.00|  0.00;
Ender IO              |  1.75|  0.01|  4.07|  0.59|  3.89|  0.22|  0.00|  1.24;
IndustrialCraft 2     |  0.73|  0.01|  7.99|  0.88|  0.00|  1.07|  0.00|  0.00;
CraftTweaker2         |  0.60|  0.00|  3.11|  0.01|  0.00|  5.41|  0.01|  0.00;
OpenComputers         |  0.17|  0.02|  4.98|  2.77|  0.19|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.30|  0.01|  4.65|  1.62|  0.00|  0.94|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.22|  0.10|  0.00|  2.84|  0.00|  0.00;
Forestry              |  0.36|  0.01|  2.89|  1.17|  0.00|  0.56|  0.00|  0.00;
Dynamic Surroundings  |  0.17|  0.01|  0.20|  0.12|  0.00|  0.06|  4.41|  0.00;
Recurrent Complex     |  0.24|  0.01|  0.65|  0.87|  0.00|  2.82|  0.00|  0.00;
Tinkers' Construct    |  1.04|  0.01|  0.16|  0.13|  0.00|  2.99|  0.00|  0.00
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
  3.06: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  2.89: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.87: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.55: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.82: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.39: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.27: jeresources.jei.JEIConfig;
  1.10: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.98: ic2.jeiIntegration.SubModule;
  0.79: com.buuz135.industrial.jei.JEICustomPlugin;
  0.66: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.65: nc.integration.jei.NCJEI;
  0.63: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.49: mctmods.smelteryio.library.util.jei.JEI;
  0.45: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.33: Other 120 Plugins
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
            text: [243.28,'s'].join(''),
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
993A00   2.00s Loading sounds;
994400   2.06s Loading Resource - SoundHandler;
994F00  49.21s ModelLoader: blocks;
995900  10.24s ModelLoader: items;
996300   9.36s ModelLoader: baking;
996D00   4.08s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
444444 166.17s Other
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
