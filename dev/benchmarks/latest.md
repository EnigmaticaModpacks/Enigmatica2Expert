## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
633.19 sec
<br>
<sup><sub>(
10:33 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [374.51]},
      {label: 'FML stuff:', data: [258.69]}
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
436e17  31.06s Had Enough Items;
3C6315  18.97s Had Enough Items (Plugins);
813e81  14.02s OpenComputers;
516fa8  13.15s Ender IO;
5161a8   2.23s CraftTweaker2;
495797  10.90s CraftTweaker2 (Script Loading);
a651a8  10.64s IndustrialCraft 2;
8f3087   9.64s Forge Mod Loader;
8f304e   8.57s Astral Sorcery;
cd922c   7.69s NuclearCraft;
8c2ccd   6.91s Immersive Engineering;
6e175e   6.48s Recurrent Complex;
213664   5.97s Forestry;
538f30   5.36s Animania;
a86e51   5.13s Extra Utilities 2;
308f53   4.95s Village Names;
436e17   4.81s Integrated Dynamics;
308f7e   4.60s Quark: RotN Edition;
8f4d30   4.51s Open Terrain Generator;
ba3eb8   4.50s Cyclic;
649e21   4.19s OpenBlocks;
3e68ba   4.06s AE2 Unofficial Extended Life;
444444 113.93s 57 Other mods;
333333  65.87s 186 'Fast' mods (load 1.0s - 0.1s);
222222   6.37s 181 'Instant' mods (load %3C 0.1s)
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
OpenComputers         |  0.30|  0.02|  9.56|  3.90|  0.24|  0.00|  0.00|  0.00;
Ender IO              |  1.74|  0.01|  5.10|  0.61|  4.28|  0.19|  0.00|  1.22;
CraftTweaker2         |  0.75|  0.00|  6.06|  0.01|  0.00|  6.30|  0.02|  0.00;
IndustrialCraft 2     |  0.81|  0.02|  8.27|  0.99|  0.00|  0.56|  0.00|  0.00;
Astral Sorcery        |  0.27|  0.01|  5.84|  1.89|  0.00|  0.56|  0.00|  0.00;
NuclearCraft          |  0.62|  0.01|  5.55|  0.51|  0.00|  0.90|  0.00|  0.11;
Immersive Engineering |  0.93|  0.01|  1.59|  1.48|  0.00|  2.90|  0.00|  0.00;
Recurrent Complex     |  0.40|  0.01|  0.82|  1.35|  0.00|  3.90|  0.00|  0.00;
Forestry              |  0.44|  0.01|  4.08|  1.15|  0.00|  0.29|  0.00|  0.00;
Animania              |  0.36|  0.00|  4.27|  0.12|  0.00|  0.61|  0.00|  0.00;
Extra Utilities 2     |  0.13|  0.00|  4.58|  0.08|  0.00|  0.35|  0.00|  0.00;
Village Names         |  0.20|  0.00|  4.53|  0.22|  0.00|  0.00|  0.00|  0.00
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
  3.06: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.51: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.46: jeresources.jei.JEIConfig;
  1.23: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.05: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.98: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.88: ic2.jeiIntegration.SubModule;
  0.65: nc.integration.jei.NCJEI;
  0.64: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.63: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.59: com.buuz135.industrial.jei.JEICustomPlugin;
  0.56: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.44: zmaster587.advancedRocketry.integration.jei.ARPlugin;
  0.27: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.26: net.bdew.jeibees.BeesJEIPlugin;
  4.77: Other 127 Plugins
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
            text: [258.69,'s'].join(''),
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
993A00   2.27s Loading sounds;
994400   2.36s Loading Resource - SoundHandler;
994F00  54.35s ModelLoader: blocks;
995900  15.38s ModelLoader: items;
996300  12.59s ModelLoader: baking;
996D00   2.43s Applying remove recipe actions;
997700   0.19s Applying remove furnace recipe actions;
998200   1.22s Indexing ingredients;
998C00  10.45s Indexing ingredients;
444444 157.44s Other
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
