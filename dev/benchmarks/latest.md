## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
510.32 sec
<br>
<sup><sub>(
8:30 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [297.33]},
      {label: 'FML stuff:', data: [212.98]}
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
436e17  44.14s Had Enough Items;
516fa8  12.93s Ender IO;
a651a8  10.55s IndustrialCraft 2;
8f3087  10.23s Forge Mod Loader;
813e81   9.36s OpenComputers;
8f304e   7.47s Astral Sorcery;
5161a8  -1.56s CraftTweaker2;
495797   8.76s CraftTweaker2 (Script Loading);
8c2ccd   5.86s Immersive Engineering;
213664   5.39s Forestry;
6e175e   5.14s Recurrent Complex;
436e17   4.45s Integrated Dynamics;
308f53   4.34s Village Names;
538f30   4.32s Animania;
a86e51   4.32s Extra Utilities 2;
ba3eb8   3.80s Cyclic;
308f7e   3.74s Quark: RotN Edition;
3e68ba   3.55s AE2 Unofficial Extended Life;
649e21   3.34s OpenBlocks;
3eb2ba   3.17s Botania;
814a3e   3.04s RFTools;
444444  79.20s 47 Other mods;
333333  54.84s 167 'Fast' mods (load 1.0s - 0.1s);
222222   6.94s 216 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.08|  0.00|  2.87|  0.02|  0.00|  0.00| 41.16|  0.00;
Ender IO              |  1.79|  0.01|  4.74|  0.60|  3.74|  0.14|  0.00|  1.91;
IndustrialCraft 2     |  0.77|  0.02|  8.58|  0.93|  0.00|  0.26|  0.00|  0.00;
OpenComputers         |  0.19|  0.02|  5.42|  3.53|  0.21|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.26|  0.01|  4.99|  1.68|  0.00|  0.53|  0.00|  0.00;
CraftTweaker2         |  0.58|  0.00|  3.40|  0.01|  0.00|  3.19|  0.03|  0.00;
Immersive Engineering |  0.97|  0.01|  1.25|  1.09|  0.00|  2.54|  0.00|  0.00;
Forestry              |  0.37|  0.01|  3.56|  1.17|  0.00|  0.27|  0.00|  0.00;
Recurrent Complex     |  0.27|  0.01|  0.70|  0.98|  0.00|  3.18|  0.00|  0.00;
Integrated Dynamics   |  0.24|  0.01|  4.11|  0.09|  0.00|  0.00|  0.00|  0.00;
Village Names         |  0.15|  0.00|  4.01|  0.18|  0.00|  0.00|  0.00|  0.00;
Animania              |  0.29|  0.00|  3.55|  0.10|  0.00|  0.39|  0.00|  0.00
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
            text: [212.98,'s'].join(''),
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
993A00   1.57s Loading sounds;
994400   1.63s Loading Resource - SoundHandler;
994F00  30.96s ModelLoader: blocks;
995900  10.40s ModelLoader: items;
996300  11.06s ModelLoader: baking;
996D00   1.66s Applying remove recipe actions;
997700   0.27s Applying remove furnace recipe actions;
998200   1.30s Indexing ingredients;
444444 154.14s Other
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
