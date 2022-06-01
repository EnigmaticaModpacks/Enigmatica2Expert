## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
477.81 sec
<br>
<sup><sub>(
7:57 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [283.85]},
      {label: 'FML stuff:', data: [193.96]}
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
436e17  41.32s Had Enough Items;
516fa8  12.45s Ender IO;
a651a8  10.85s IndustrialCraft 2;
8f3087  10.50s Forge Mod Loader;
813e81   8.11s OpenComputers;
8f304e   7.40s Astral Sorcery;
5161a8  -1.26s CraftTweaker2;
495797   8.55s CraftTweaker2 (Script Loading);
8c2ccd   7.14s Immersive Engineering;
213664   5.00s Forestry;
6e175e   4.92s Recurrent Complex;
308f53   4.05s Village Names;
538f30   4.03s Animania;
436e17   3.85s Integrated Dynamics;
3e68ba   3.83s AE2 Unofficial Extended Life;
a86e51   3.73s Extra Utilities 2;
ba3eb8   3.62s Cyclic;
308f7e   3.50s Quark: RotN Edition;
649e21   3.17s OpenBlocks;
216364   3.11s Thermal Expansion;
3e8160   2.92s The Twilight Forest;
444444  72.01s 44 Other mods;
333333  54.07s 161 'Fast' mods (load 1.0s - 0.1s);
222222   6.97s 218 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.06|  0.00|  2.42|  0.02|  0.00|  0.00| 38.82|  0.00;
Ender IO              |  1.82|  0.01|  4.69|  0.54|  3.67|  0.17|  0.00|  1.55;
IndustrialCraft 2     |  0.67|  0.02|  8.60|  0.85|  0.00|  0.72|  0.00|  0.00;
OpenComputers         |  0.16|  0.02|  5.03|  2.72|  0.18|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.26|  0.01|  4.73|  1.83|  0.00|  0.59|  0.00|  0.00;
CraftTweaker2         |  0.47|  0.00|  3.44|  0.01|  0.00|  3.37|  0.01|  0.00;
Immersive Engineering |  0.90|  0.01|  1.44|  1.14|  0.00|  3.65|  0.00|  0.00;
Forestry              |  0.37|  0.01|  3.12|  1.05|  0.00|  0.45|  0.00|  0.00;
Recurrent Complex     |  0.32|  0.01|  0.69|  0.82|  0.00|  3.08|  0.00|  0.00;
Village Names         |  0.16|  0.00|  3.71|  0.18|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.20|  0.09|  0.00|  0.42|  0.00|  0.00;
Integrated Dynamics   |  0.21|  0.01|  3.58|  0.05|  0.00|  0.00|  0.00|  0.00
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
            text: [193.96,'s'].join(''),
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
993A00   1.38s Loading sounds;
994400   1.43s Loading Resource - SoundHandler;
994F00  27.96s ModelLoader: blocks;
995900  10.39s ModelLoader: items;
996300   9.60s ModelLoader: baking;
996D00   1.90s Applying remove recipe actions;
997700   0.20s Applying remove furnace recipe actions;
998200   1.17s Indexing ingredients;
444444 139.94s Other
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
