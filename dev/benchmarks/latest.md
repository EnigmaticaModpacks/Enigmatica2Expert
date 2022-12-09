## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
523.31 sec
<br>
<sup><sub>(
8:43 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [299.87]},
      {label: 'FML stuff:', data: [223.44]}
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
436e17  15.77s Had Enough Items;
3C6315  19.12s Had Enough Items (Plugins);
516fa8  13.52s Ender IO;
a651a8  11.75s IndustrialCraft 2;
813e81  10.06s OpenComputers;
8f3087   9.92s Forge Mod Loader;
8f304e   8.10s Astral Sorcery;
5161a8   7.68s CraftTweaker2;
495797   9.56s CraftTweaker2 (Script Loading);
8c2ccd   6.17s Immersive Engineering;
538f30   5.94s Animania;
213664   5.48s Forestry;
6e175e   4.74s Recurrent Complex;
436e17   4.24s Integrated Dynamics;
176e43   4.19s Thaumic Additions: Reconstructed;
308f53   4.16s Village Names;
3e68ba   3.90s AE2 Unofficial Extended Life;
a86e51   3.81s Extra Utilities 2;
ba3eb8   3.80s Cyclic;
308f7e   3.65s Quark: RotN Edition;
649e21   3.58s OpenBlocks;
216364   3.41s Thermal Expansion;
444444  80.75s 45 Other mods;
333333  58.88s 172 'Fast' mods (load 1.0s - 0.1s);
222222   7.25s 218 'Instant' mods (load %3C 0.1s)
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
Ender IO                         |  1.75|  0.02|  4.24|  0.92|  3.66|  1.20|  0.00|  1.74;
IndustrialCraft 2                |  0.80|  0.02|  9.39|  1.28|  0.00|  0.26|  0.00|  0.00;
OpenComputers                    |  0.19|  0.02|  6.11|  3.54|  0.20|  0.00|  0.00|  0.00;
Astral Sorcery                   |  0.26|  0.01|  4.82|  1.68|  0.00|  1.34|  0.00|  0.00;
CraftTweaker2                    |  0.64|  0.00|  3.62|  0.01|  0.00|  3.40|  0.01|  0.00;
Immersive Engineering            |  0.96|  0.01|  1.45|  0.99|  0.00|  2.75|  0.00|  0.00;
Animania                         |  0.36|  0.00|  4.97|  0.10|  0.00|  0.51|  0.00|  0.00;
Forestry                         |  0.39|  0.01|  3.64|  1.14|  0.00|  0.30|  0.00|  0.00;
Recurrent Complex                |  0.29|  0.01|  0.74|  0.93|  0.00|  2.77|  0.00|  0.00;
Integrated Dynamics              |  0.25|  0.01|  3.93|  0.06|  0.00|  0.00|  0.00|  0.00;
Thaumic Additions: Reconstructed |  0.20|  0.00|  0.76|  0.34|  0.00|  2.90|  0.00|  0.00;
Village Names                    |  0.16|  0.00|  3.81|  0.19|  0.00|  0.00|  0.00|  0.00
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
  2.60: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.54: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.51: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.31: jeresources.jei.JEIConfig;
  1.10: knightminer.tcomplement.plugin.jei.JEIPlugin;
  1.01: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.94: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.93: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.82: ic2.jeiIntegration.SubModule;
  0.80: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.56: nc.integration.jei.NCJEI;
  0.55: com.buuz135.industrial.jei.JEICustomPlugin;
  0.38: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.31: mctmods.smelteryio.library.util.jei.JEI;
  0.27: zmaster587.advancedRocketry.integration.jei.ARPlugin;
  4.51: Other 130 Plugins
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
            text: [223.44,'s'].join(''),
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
993A00   1.46s Loading sounds;
994400   1.53s Loading Resource - SoundHandler;
994F00  34.02s ModelLoader: blocks;
995900  12.41s ModelLoader: items;
996300  11.39s ModelLoader: baking;
996D00   1.91s Applying remove recipe actions;
997700   0.25s Applying remove furnace recipe actions;
998200   1.01s Indexing ingredients;
444444 159.47s Other
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
