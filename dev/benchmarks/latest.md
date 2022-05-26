## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
491.47 sec
<br>
<sup><sub>(
8:11 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [293.21]},
      {label: 'FML stuff:', data: [198.26]}
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
436e17  42.70s Had Enough Items;
516fa8  12.22s Ender IO;
a651a8  10.59s IndustrialCraft 2;
8f3087  10.47s Forge Mod Loader;
813e81   9.14s OpenComputers;
8f304e   7.20s Astral Sorcery;
5161a8  -1.07s CraftTweaker2;
495797   8.21s CraftTweaker2 (Script Loading);
8c2ccd   5.60s Immersive Engineering;
6e175e   5.10s Recurrent Complex;
213664   4.78s Forestry;
538f30   4.30s Animania;
308f53   4.25s Village Names;
436e17   4.03s Integrated Dynamics;
ba3eb8   3.99s Cyclic;
a86e51   3.94s Extra Utilities 2;
3e68ba   3.89s AE2 Unofficial Extended Life;
308f7e   3.37s Quark: RotN Edition;
cd922c   3.33s NuclearCraft;
649e21   3.32s OpenBlocks;
814a3e   3.16s RFTools;
444444  77.36s 45 Other mods;
333333  56.36s 164 'Fast' mods (load 1.0s - 0.1s);
222222   6.98s 214 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.07|  0.00|  2.68|  0.02|  0.00|  0.00| 39.94|  0.00;
Ender IO              |  1.85|  0.01|  4.27|  0.58|  3.86|  0.16|  0.00|  1.50;
IndustrialCraft 2     |  0.77|  0.02|  8.12|  1.04|  0.00|  0.64|  0.00|  0.00;
OpenComputers         |  0.19|  0.02|  5.33|  3.41|  0.19|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.28|  0.01|  4.89|  1.54|  0.00|  0.50|  0.00|  0.00;
CraftTweaker2         |  0.58|  0.00|  3.69|  0.01|  0.00|  2.86|  0.01|  0.00;
Immersive Engineering |  0.99|  0.01|  1.08|  0.92|  0.00|  2.60|  0.00|  0.00;
Recurrent Complex     |  0.29|  0.01|  0.69|  1.02|  0.00|  3.10|  0.00|  0.00;
Forestry              |  0.45|  0.01|  3.01|  0.86|  0.00|  0.45|  0.00|  0.00;
Animania              |  0.34|  0.00|  3.24|  0.11|  0.00|  0.62|  0.00|  0.00;
Village Names         |  0.13|  0.00|  3.96|  0.17|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics   |  0.24|  0.01|  3.73|  0.05|  0.00|  0.00|  0.00|  0.00
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
  0.00: Other -15 Plugins
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
            text: [198.26,'s'].join(''),
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
993A00   1.73s Loading sounds;
994400   1.80s Loading Resource - SoundHandler;
994F00  29.29s ModelLoader: blocks;
995900   9.33s ModelLoader: items;
996300  10.45s ModelLoader: baking;
996D00   1.47s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
998200   1.08s Indexing ingredients;
444444 142.94s Other
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
