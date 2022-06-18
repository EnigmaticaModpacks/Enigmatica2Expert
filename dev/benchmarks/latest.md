## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
477.22 sec
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
      {label:      'MODS:', data: [278.00]},
      {label: 'FML stuff:', data: [199.21]}
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
436e17  37.13s Had Enough Items;
516fa8  11.90s Ender IO;
a651a8  10.92s IndustrialCraft 2;
8f3087  10.63s Forge Mod Loader;
813e81   8.75s OpenComputers;
8f304e   7.24s Astral Sorcery;
8c2ccd   7.11s Immersive Engineering;
5161a8  -1.96s CraftTweaker2;
495797   8.80s CraftTweaker2 (Script Loading);
213664   4.94s Forestry;
6e175e   4.87s Recurrent Complex;
538f30   4.10s Animania;
436e17   4.01s Integrated Dynamics;
308f53   3.87s Village Names;
a86e51   3.60s Extra Utilities 2;
3e68ba   3.46s AE2 Unofficial Extended Life;
ba3eb8   3.36s Cyclic;
308f7e   3.33s Quark: RotN Edition;
649e21   3.18s OpenBlocks;
cd922c   3.07s NuclearCraft;
3e8160   2.95s The Twilight Forest;
444444  68.52s 41 Other mods;
333333  57.41s 167 'Fast' mods (load 1.0s - 0.1s);
222222   6.81s 214 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.06|  0.00|  1.85|  0.02|  0.00|  0.00| 35.20|  0.00;
Ender IO              |  1.77|  0.01|  4.20|  0.59|  3.72|  0.26|  0.00|  1.36;
IndustrialCraft 2     |  0.69|  0.02|  8.68|  0.88|  0.00|  0.65|  0.00|  0.00;
OpenComputers         |  0.18|  0.02|  5.07|  3.31|  0.18|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.27|  0.01|  4.75|  1.61|  0.00|  0.60|  0.00|  0.00;
Immersive Engineering |  0.96|  0.01|  1.17|  1.06|  0.00|  3.90|  0.00|  0.00;
CraftTweaker2         |  0.54|  0.00|  3.29|  0.01|  0.00|  2.98|  0.02|  0.00;
Forestry              |  0.41|  0.01|  3.04|  1.05|  0.00|  0.43|  0.00|  0.00;
Recurrent Complex     |  0.25|  0.01|  0.63|  1.19|  0.00|  2.79|  0.00|  0.00;
Animania              |  0.31|  0.00|  3.27|  0.10|  0.00|  0.42|  0.00|  0.00;
Integrated Dynamics   |  0.25|  0.01|  3.70|  0.06|  0.00|  0.00|  0.00|  0.00;
Village Names         |  0.11|  0.00|  3.55|  0.21|  0.00|  0.00|  0.00|  0.00
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
            text: [199.21,'s'].join(''),
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
993A00   1.33s Loading sounds;
994400   1.39s Loading Resource - SoundHandler;
994F00  28.39s ModelLoader: blocks;
995900   9.63s ModelLoader: items;
996300  10.03s ModelLoader: baking;
996D00   1.60s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
998200   0.95s Indexing ingredients;
444444 145.73s Other
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
