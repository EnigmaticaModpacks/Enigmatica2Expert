## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
485.67 sec
<br>
<sup><sub>(
8:5 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [287.05]},
      {label: 'FML stuff:', data: [198.63]}
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
436e17  42.65s Had Enough Items;
516fa8  12.43s Ender IO;
a651a8  10.71s IndustrialCraft 2;
8f3087  10.45s Forge Mod Loader;
813e81   9.27s OpenComputers;
8f304e   7.68s Astral Sorcery;
5161a8  -0.44s CraftTweaker2;
495797   7.54s CraftTweaker2 (Script Loading);
8c2ccd   5.78s Immersive Engineering;
213664   4.97s Forestry;
6e175e   4.85s Recurrent Complex;
436e17   4.15s Integrated Dynamics;
a86e51   4.08s Extra Utilities 2;
538f30   4.07s Animania;
308f53   3.96s Village Names;
3e68ba   3.47s AE2 Unofficial Extended Life;
308f7e   3.42s Quark: RotN Edition;
ba3eb8   3.37s Cyclic;
649e21   3.12s OpenBlocks;
cd922c   3.06s NuclearCraft;
814a3e   2.92s RFTools;
444444  74.90s 45 Other mods;
333333  53.59s 159 'Fast' mods (load 1.0s - 0.1s);
222222   7.07s 219 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.07|  0.00|  2.92|  0.02|  0.00|  0.00| 39.64|  0.00;
Ender IO              |  2.06|  0.01|  4.08|  0.54|  3.51|  0.16|  0.00|  2.07;
IndustrialCraft 2     |  0.81|  0.02|  8.39|  0.83|  0.00|  0.66|  0.00|  0.00;
OpenComputers         |  0.16|  0.02|  5.99|  2.90|  0.20|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.25|  0.01|  4.97|  1.57|  0.00|  0.89|  0.00|  0.00;
CraftTweaker2         |  0.60|  0.00|  3.45|  0.00|  0.00|  3.03|  0.01|  0.00;
Immersive Engineering |  0.93|  0.01|  1.17|  0.98|  0.00|  2.69|  0.00|  0.00;
Forestry              |  0.37|  0.01|  3.06|  1.14|  0.00|  0.38|  0.00|  0.00;
Recurrent Complex     |  0.26|  0.01|  0.69|  0.87|  0.00|  3.02|  0.00|  0.00;
Integrated Dynamics   |  0.27|  0.01|  3.83|  0.05|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2     |  0.06|  0.01|  3.69|  0.07|  0.00|  0.25|  0.00|  0.00;
Animania              |  0.36|  0.00|  3.25|  0.10|  0.00|  0.36|  0.00|  0.00
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
            text: [198.63,'s'].join(''),
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
993A00   1.43s Loading sounds;
994400   1.49s Loading Resource - SoundHandler;
994F00  28.05s ModelLoader: blocks;
995900   9.58s ModelLoader: items;
996300  10.11s ModelLoader: baking;
996D00   1.61s Applying remove recipe actions;
997700   0.18s Applying remove furnace recipe actions;
998200   1.10s Indexing ingredients;
444444 145.09s Other
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
