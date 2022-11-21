## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
524.22 sec
<br>
<sup><sub>(
8:44 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [312.92]},
      {label: 'FML stuff:', data: [211.30]}
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
436e17  19.05s Had Enough Items;
3C6315  22.01s Had Enough Items (Plugins);
516fa8  14.24s Ender IO;
a651a8  11.90s IndustrialCraft 2;
813e81  10.49s OpenComputers;
8f3087   8.71s Forge Mod Loader;
81493e   8.34s Block Drops;
8f304e   7.56s Astral Sorcery;
5161a8   7.51s CraftTweaker2;
495797   9.66s CraftTweaker2 (Script Loading);
8c2ccd   6.96s Immersive Engineering;
213664   5.52s Forestry;
6e175e   4.62s Recurrent Complex;
538f30   4.57s Animania;
436e17   4.25s Integrated Dynamics;
176e43   4.16s Thaumic Additions: Reconstructed;
308f53   4.12s Village Names;
a86e51   4.01s Extra Utilities 2;
308f7e   3.83s Quark: RotN Edition;
3e68ba   3.77s AE2 Unofficial Extended Life;
ba3eb8   3.61s Cyclic;
cd922c   3.54s NuclearCraft;
444444  82.65s 44 Other mods;
333333  60.11s 171 'Fast' mods (load 1.0s - 0.1s);
222222   7.41s 225 'Instant' mods (load %3C 0.1s)
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
Ender IO                         |  1.88|  0.01|  4.66|  0.60|  3.94|  1.41|  0.00|  1.73;
IndustrialCraft 2                |  0.80|  0.02|  9.77|  1.02|  0.00|  0.29|  0.00|  0.00;
OpenComputers                    |  0.18|  0.02|  6.22|  3.88|  0.19|  0.00|  0.00|  0.00;
Block Drops                      |  0.05|  0.00|  0.01|  0.00|  0.00|  8.29|  0.00|  0.00;
Astral Sorcery                   |  0.30|  0.01|  4.78|  1.71|  0.00|  0.77|  0.00|  0.00;
CraftTweaker2                    |  0.62|  0.00|  3.68|  0.01|  0.00|  3.19|  0.01|  0.00;
Immersive Engineering            |  0.97|  0.01|  1.36|  1.12|  0.00|  3.49|  0.00|  0.00;
Forestry                         |  0.41|  0.01|  3.70|  1.02|  0.00|  0.38|  0.00|  0.00;
Recurrent Complex                |  0.28|  0.01|  0.71|  0.94|  0.00|  2.69|  0.00|  0.00;
Animania                         |  0.32|  0.00|  3.67|  0.10|  0.00|  0.48|  0.00|  0.00;
Integrated Dynamics              |  0.24|  0.01|  3.94|  0.06|  0.00|  0.00|  0.00|  0.00;
Thaumic Additions: Reconstructed |  0.22|  0.00|  0.73|  0.42|  0.00|  2.79|  0.00|  0.00
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
  3.01: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.27: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.53: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.50: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.22: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.22: jeresources.jei.JEIConfig;
  1.15: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.11: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.07: ic2.jeiIntegration.SubModule;
  0.68: nc.integration.jei.NCJEI;
  0.59: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.59: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.49: com.buuz135.industrial.jei.JEICustomPlugin;
  0.41: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.32: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.87: Other 130 Plugins
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
            text: [211.30,'s'].join(''),
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
994400   2.09s Loading Resource - SoundHandler;
994F00  31.30s ModelLoader: blocks;
995900  10.09s ModelLoader: items;
996300  11.07s ModelLoader: baking;
996D00   1.69s Applying remove recipe actions;
997700   0.20s Applying remove furnace recipe actions;
998200   0.84s Indexing ingredients;
444444 152.00s Other
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
