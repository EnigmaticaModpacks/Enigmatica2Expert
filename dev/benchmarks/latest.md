## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
533.71 sec
<br>
<sup><sub>(
8:53 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [326.17]},
      {label: 'FML stuff:', data: [207.53]}
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
436e17  17.04s Had Enough Items;
3C6315  21.01s Had Enough Items (Plugins);
9e2174   2.67s Tinkers' Construct;
8E1E68  30.97s Tinkers' Construct (Oredict Melting);
516fa8  13.06s Ender IO;
a651a8  10.67s IndustrialCraft 2;
813e81   9.87s OpenComputers;
8f3087   9.18s Forge Mod Loader;
8f304e   7.61s Astral Sorcery;
5161a8   7.41s CraftTweaker2;
495797   9.35s CraftTweaker2 (Script Loading);
213664   5.87s Forestry;
8c2ccd   5.86s Immersive Engineering;
6e175e   4.68s Recurrent Complex;
436e17   4.33s Integrated Dynamics;
538f30   4.17s Animania;
308f53   4.15s Village Names;
ba3eb8   3.95s Cyclic;
a86e51   3.93s Extra Utilities 2;
3e68ba   3.84s AE2 Unofficial Extended Life;
308f7e   3.58s Quark: RotN Edition;
649e21   3.40s OpenBlocks;
cd922c   3.30s NuclearCraft;
444444  78.92s 43 Other mods;
333333  59.65s 175 'Fast' mods (load 1.0s - 0.1s);
222222   7.07s 217 'Instant' mods (load %3C 0.1s)
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
Tinkers' Construct    |  1.17|  0.01|  0.18|  0.05|  0.00| 32.23|  0.00|  0.00;
Ender IO              |  1.97|  0.01|  4.17|  0.56|  3.69|  1.24|  0.00|  1.42;
IndustrialCraft 2     |  0.75|  0.02|  8.77|  0.88|  0.00|  0.25|  0.00|  0.00;
OpenComputers         |  0.17|  0.02|  6.20|  3.27|  0.22|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.31|  0.01|  5.06|  1.74|  0.00|  0.49|  0.00|  0.00;
CraftTweaker2         |  0.59|  0.00|  3.74|  0.01|  0.00|  3.07|  0.01|  0.00;
Forestry              |  0.43|  0.01|  3.83|  1.24|  0.00|  0.34|  0.00|  0.00;
Immersive Engineering |  1.00|  0.01|  1.50|  1.11|  0.00|  2.24|  0.00|  0.00;
Recurrent Complex     |  0.29|  0.01|  0.79|  0.95|  0.00|  2.65|  0.00|  0.00;
Integrated Dynamics   |  0.24|  0.01|  4.03|  0.06|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.34|  0.00|  3.20|  0.10|  0.00|  0.54|  0.00|  0.00;
Village Names         |  0.14|  0.00|  3.81|  0.20|  0.00|  0.00|  0.00|  0.00
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
  2.51: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.40: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.62: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.45: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.33: jeresources.jei.JEIConfig;
  1.29: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.05: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.83: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.79: ic2.jeiIntegration.SubModule;
  0.62: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.58: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.57: nc.integration.jei.NCJEI;
  0.49: com.buuz135.industrial.jei.JEICustomPlugin;
  0.40: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.26: xt9.deepmoblearning.plugins.jei.Plugin;
  4.82: Other 130 Plugins
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
            text: [207.53,'s'].join(''),
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
993A00   1.30s Loading sounds;
994400   1.38s Loading Resource - SoundHandler;
994F00  29.03s ModelLoader: blocks;
995900  11.74s ModelLoader: items;
996300  10.28s ModelLoader: baking;
996D00   1.58s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200   1.01s Indexing ingredients;
444444 151.03s Other
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
