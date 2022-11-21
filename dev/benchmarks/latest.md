## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
481.67 sec
<br>
<sup><sub>(
8:01 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [284.45]},
      {label: 'FML stuff:', data: [197.22]}
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
436e17  17.11s Had Enough Items;
3C6315  22.36s Had Enough Items (Plugins);
516fa8  13.67s Ender IO;
a651a8  11.01s IndustrialCraft 2;
813e81   9.95s OpenComputers;
8f3087   8.61s Forge Mod Loader;
5161a8   7.77s CraftTweaker2;
495797   8.72s CraftTweaker2 (Script Loading);
8f304e   6.84s Astral Sorcery;
8c2ccd   5.55s Immersive Engineering;
213664   5.11s Forestry;
6e175e   4.94s Recurrent Complex;
538f30   4.28s Animania;
308f53   4.10s Village Names;
436e17   4.09s Integrated Dynamics;
a86e51   3.71s Extra Utilities 2;
3e68ba   3.53s AE2 Unofficial Extended Life;
308f7e   3.48s Quark: RotN Edition;
ba3eb8   3.40s Cyclic;
649e21   3.20s OpenBlocks;
216364   3.04s Thermal Expansion;
3e8160   3.04s The Twilight Forest;
444444  69.90s 41 Other mods;
333333  58.75s 173 'Fast' mods (load 1.0s - 0.1s);
222222   7.01s 226 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.80|  0.01|  4.34|  0.89|  4.06|  0.15|  0.00|  2.43;
IndustrialCraft 2     |  0.75|  0.02|  8.94|  1.05|  0.00|  0.25|  0.00|  0.00;
OpenComputers         |  0.19|  0.02|  6.05|  3.51|  0.20|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.59|  0.00|  3.55|  0.01|  0.00|  3.61|  0.01|  0.00;
Astral Sorcery        |  0.24|  0.01|  4.51|  1.56|  0.00|  0.52|  0.00|  0.00;
Immersive Engineering |  0.98|  0.01|  1.23|  0.96|  0.00|  2.37|  0.00|  0.00;
Forestry              |  0.38|  0.01|  3.40|  1.01|  0.00|  0.30|  0.00|  0.00;
Recurrent Complex     |  0.25|  0.01|  0.74|  0.89|  0.00|  3.06|  0.00|  0.00;
Animania              |  0.30|  0.00|  3.47|  0.10|  0.00|  0.40|  0.00|  0.00;
Village Names         |  0.11|  0.00|  3.79|  0.19|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics   |  0.23|  0.01|  3.80|  0.05|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.07|  0.01|  3.35|  0.07|  0.00|  0.21|  0.00|  0.00
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
  2.86: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.43: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.08: jeresources.jei.JEIConfig;
  1.77: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.62: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.32: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.91: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.87: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.75: ic2.jeiIntegration.SubModule;
  0.65: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.58: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  0.55: nc.integration.jei.NCJEI;
  0.51: com.buuz135.industrial.jei.JEICustomPlugin;
  0.46: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.26: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.74: Other 130 Plugins
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
            text: [197.22,'s'].join(''),
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
993A00   1.27s Loading sounds;
994400   1.33s Loading Resource - SoundHandler;
994F00  27.87s ModelLoader: blocks;
995900   9.74s ModelLoader: items;
996300   9.82s ModelLoader: baking;
996D00   2.12s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200   0.88s Indexing ingredients;
444444 144.02s Other
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
