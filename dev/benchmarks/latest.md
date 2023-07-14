## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
411.81 sec
<br>
<sup><sub>(
6:51 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [308.72]},
      {label: 'FML stuff:', data: [103.09]}
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
436e17  22.47s Had Enough Items;
3C6315  17.40s Had Enough Items (Plugins);
9e2174   2.57s Tinkers' Construct;
8E1E68  23.63s Tinkers' Construct (Oredict Melting);
813e81  11.49s OpenComputers;
516fa8  10.50s Ender IO;
8f3087   9.80s Forge Mod Loader;
5161a8   0.21s CraftTweaker2;
495797   9.19s CraftTweaker2 (Script Loading);
8f304e   6.80s Astral Sorcery;
a651a8   6.18s IndustrialCraft 2;
cd922c   5.71s NuclearCraft;
8c2ccd   4.90s Immersive Engineering;
213664   4.83s Forestry;
6e175e   4.80s Recurrent Complex;
538f30   4.08s Animania;
308f53   3.80s Village Names;
a86e51   3.63s Extra Utilities 2;
436e17   3.59s Integrated Dynamics;
8f4d30   3.35s Open Terrain Generator;
308f7e   3.35s Quark: RotN Edition;
ba3eb8   3.20s Cyclic;
649e21   3.00s OpenBlocks;
444444  73.52s 41 Other mods;
333333  59.89s 178 'Fast' mods (load 1.0s - 0.1s);
222222   6.85s 207 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.06|  0.01|  0.17|  0.05|  0.00| 24.92|  0.00|  0.00;
OpenComputers         |  0.43|  0.02|  7.96|  2.88|  0.20|  0.00|  0.00|  0.00;
Ender IO              |  1.56|  0.01|  3.79|  0.51|  3.08|  0.57|  0.00|  0.98;
CraftTweaker2         |  0.73|  0.00|  3.98|  0.01|  0.00|  4.67|  0.01|  0.00;
Astral Sorcery        |  0.22|  0.01|  4.64|  1.40|  0.00|  0.53|  0.00|  0.00;
IndustrialCraft 2     |  0.74|  0.02|  4.11|  1.08|  0.00|  0.24|  0.00|  0.00;
NuclearCraft          |  0.59|  0.01|  4.00|  0.40|  0.00|  0.66|  0.00|  0.05;
Immersive Engineering |  0.83|  0.01|  1.10|  0.87|  0.00|  2.10|  0.00|  0.00;
Forestry              |  0.41|  0.01|  3.13|  1.01|  0.00|  0.26|  0.00|  0.00;
Recurrent Complex     |  0.28|  0.01|  0.69|  0.83|  0.00|  3.00|  0.00|  0.00;
Animania              |  0.33|  0.00|  3.21|  0.11|  0.00|  0.43|  0.00|  0.00;
Village Names         |  0.12|  0.00|  3.51|  0.17|  0.00|  0.00|  0.00|  0.00
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
  4.18: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.14: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.16: jeresources.jei.JEIConfig;
  1.09: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  0.75: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.73: ic2.jeiIntegration.SubModule;
  0.67: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.55: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.50: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.49: com.buuz135.industrial.jei.JEICustomPlugin;
  0.48: nc.integration.jei.NCJEI;
  0.34: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.23: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.21: net.bdew.jeibees.BeesJEIPlugin;
  0.19: forestry.factory.recipes.jei.FactoryJeiPlugin;
  3.68: Other 124 Plugins
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
            text: [103.09,'s'].join(''),
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
993A00   0.60s Loading sounds;
994400   0.65s Loading Resource - SoundHandler;
994F00   1.88s Applying remove recipe actions;
995900   0.11s Applying remove furnace recipe actions;
996300   0.65s Indexing ingredients;
996D00   7.77s Indexing ingredients;
444444  91.43s Other
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
