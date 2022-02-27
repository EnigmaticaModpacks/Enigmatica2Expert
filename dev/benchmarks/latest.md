## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
701.29 sec
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
      {label:      'MODS:', data: [453.06]},
      {label: 'FML stuff:', data: [248.23]}
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
3e76ba  19.04s Just Enough Items;
386AA7  32.19s Just Enough Items (Plugins);
386AA7  50.96s Just Enough Items (Ingredient Filter);
9e2174   4.18s Tinkers' Construct;
8E1E68  30.48s Tinkers' Construct (Oredict Melting);
516fa8  19.30s Ender IO;
8c2ccd  18.33s Immersive Engineering;
214d9e  16.42s Minecraft Forge;
a651a8  11.52s IndustrialCraft 2;
8f3087  11.20s Forge Mod Loader;
5161a8  -0.23s CraftTweaker2;
495797  10.43s CraftTweaker2 (Script Loading);
176e43  10.14s Thaumic Additions: Reconstructed;
813e81   8.60s OpenComputers;
7c813e   8.02s Thaumcraft;
8f304e   7.72s Astral Sorcery;
538f30   7.68s Animania;
8f6c30   5.54s Dynamic Surroundings;
213664   5.10s Forestry;
6e175e   5.07s Recurrent Complex;
216364   4.10s Thermal Expansion;
436e17   4.10s Integrated Dynamics;
308f53   4.02s Village Names;
a86e51   3.84s Extra Utilities 2;
444444  96.58s 51 Other mods;
333333  52.48s 160 'Fast' mods (load 1.0s - 0.1s);
222222   6.27s 210 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct               |  1.01|  0.01|  0.21|  0.07|  0.00| 33.36|  0.00|  0.00;
Ender IO                         |  1.74|  0.01|  4.35|  0.75|  3.88|  7.26|  0.00|  1.32;
Immersive Engineering            |  0.87|  0.01|  1.16|  1.09|  0.00| 15.21|  0.00|  0.00;
IndustrialCraft 2                |  0.87|  0.01|  8.00|  1.31|  0.00|  1.33|  0.00|  0.00;
CraftTweaker2                    |  0.64|  0.00|  3.41|  0.01|  0.00|  6.12|  0.02|  0.00;
Thaumic Additions: Reconstructed |  0.23|  0.00|  0.64|  0.33|  0.00|  8.94|  0.00|  0.00;
OpenComputers                    |  0.16|  0.01|  5.27|  2.97|  0.19|  0.00|  0.00|  0.00;
Thaumcraft                       |  0.73|  0.01|  0.18|  0.44|  0.01|  6.65|  0.00|  0.00;
Astral Sorcery                   |  0.33|  0.00|  4.53|  1.70|  0.00|  1.16|  0.00|  0.00;
Animania                         |  0.32|  0.00|  3.05|  0.12|  0.00|  4.19|  0.00|  0.00;
Dynamic Surroundings             |  0.16|  0.01|  0.20|  0.13|  0.00|  0.06|  4.99|  0.00;
Forestry                         |  0.47|  0.01|  3.19|  1.17|  0.00|  0.26|  0.00|  0.00
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
  4.98: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.70: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  3.02: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.58: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.37: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.60: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.47: ic2.jeiIntegration.SubModule;
  1.40: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.37: jeresources.jei.JEIConfig;
  1.03: com.buuz135.industrial.jei.JEICustomPlugin;
  0.93: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.80: nc.integration.jei.NCJEI;
  0.67: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.64: mctmods.smelteryio.library.util.jei.JEI;
  0.44: crazypants.enderio.base.integration.jei.JeiPlugin;
  5.19: Other 119 Plugins
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
            text: [248.23,'s'].join(''),
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
994400   2.14s Loading Resource - SoundHandler;
994F00  51.72s ModelLoader: blocks;
995900  11.92s ModelLoader: items;
996300  10.28s ModelLoader: baking;
996D00   4.81s Applying remove recipe actions;
997700   0.16s Applying remove furnace recipe actions;
444444 165.11s Other
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
