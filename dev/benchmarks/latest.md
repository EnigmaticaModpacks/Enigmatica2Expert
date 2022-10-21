## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
492.11 sec
<br>
<sup><sub>(
8:12 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [288.14]},
      {label: 'FML stuff:', data: [203.97]}
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
436e17  17.72s Had Enough Items;
3C6315  22.76s Had Enough Items (Plugins);
516fa8  12.39s Ender IO;
a651a8  10.87s IndustrialCraft 2;
8f3087   9.37s Forge Mod Loader;
813e81   9.29s OpenComputers;
5161a8   7.35s CraftTweaker2;
495797   9.74s CraftTweaker2 (Script Loading);
8f304e   7.14s Astral Sorcery;
8c2ccd   5.70s Immersive Engineering;
213664   5.15s Forestry;
6e175e   4.84s Recurrent Complex;
436e17   4.21s Integrated Dynamics;
538f30   4.10s Animania;
308f53   4.07s Village Names;
a86e51   3.80s Extra Utilities 2;
308f7e   3.63s Quark: RotN Edition;
ba3eb8   3.49s Cyclic;
3e68ba   3.48s AE2 Unofficial Extended Life;
8f308f   3.34s JourneyMap;
649e21   3.23s OpenBlocks;
3e8160   3.07s The Twilight Forest;
444444  73.34s 42 Other mods;
333333  58.66s 172 'Fast' mods (load 1.0s - 0.1s);
222222   7.15s 225 'Instant' mods (load %3C 0.1s)
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
Ender IO              |  1.81|  0.01|  4.29|  0.60|  3.79|  0.22|  0.00|  1.66;
IndustrialCraft 2     |  0.69|  0.02|  8.98|  0.91|  0.00|  0.27|  0.00|  0.00;
OpenComputers         |  0.21|  0.02|  5.54|  3.22|  0.32|  0.00|  0.00|  0.00;
CraftTweaker2         |  0.63|  0.00|  3.70|  0.01|  0.00|  3.00|  0.01|  0.00;
Astral Sorcery        |  0.24|  0.01|  4.77|  1.64|  0.00|  0.48|  0.00|  0.00;
Immersive Engineering |  0.94|  0.01|  1.28|  1.07|  0.00|  2.40|  0.00|  0.00;
Forestry              |  0.41|  0.01|  3.38|  0.99|  0.00|  0.36|  0.00|  0.00;
Recurrent Complex     |  0.26|  0.01|  0.68|  0.92|  0.00|  2.97|  0.00|  0.00;
Integrated Dynamics   |  0.23|  0.01|  3.91|  0.06|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.30|  0.00|  3.27|  0.11|  0.00|  0.42|  0.00|  0.00;
Village Names         |  0.12|  0.00|  3.75|  0.20|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.07|  0.01|  3.43|  0.07|  0.00|  0.22|  0.00|  0.00
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
  2.33: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.64: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.57: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  1.35: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.31: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.30: jeresources.jei.JEIConfig;
  1.10: ic2.jeiIntegration.SubModule;
  1.03: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.75: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.71: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.64: nc.integration.jei.NCJEI;
  0.48: com.buuz135.industrial.jei.JEICustomPlugin;
  0.38: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.37: vazkii.botania.client.integration.jei.JEIBotaniaPlugin;
  4.81: Other 129 Plugins
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
            text: [203.97,'s'].join(''),
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
993A00   1.50s Loading sounds;
994400   1.56s Loading Resource - SoundHandler;
994F00  28.50s ModelLoader: blocks;
995900  10.55s ModelLoader: items;
996300  10.26s ModelLoader: baking;
996D00   1.64s Applying remove recipe actions;
997700   0.16s Applying remove furnace recipe actions;
998200   0.92s Indexing ingredients;
444444 148.90s Other
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
