## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
489.73 sec
<br>
<sup><sub>(
8:9 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [292.72]},
      {label: 'FML stuff:', data: [197.01]}
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
436e17  45.11s Had Enough Items;
516fa8  12.74s Ender IO;
a651a8  11.29s IndustrialCraft 2;
8f3087  10.68s Forge Mod Loader;
813e81   8.81s OpenComputers;
8f304e   7.43s Astral Sorcery;
5161a8  -1.45s CraftTweaker2;
495797   8.64s CraftTweaker2 (Script Loading);
8c2ccd   6.25s Immersive Engineering;
213664   5.28s Forestry;
6e175e   5.14s Recurrent Complex;
538f30   4.48s Animania;
a86e51   4.13s Extra Utilities 2;
436e17   4.06s Integrated Dynamics;
3e68ba   3.99s AE2 Unofficial Extended Life;
308f53   3.88s Village Names;
ba3eb8   3.50s Cyclic;
308f7e   3.29s Quark: RotN Edition;
649e21   3.19s OpenBlocks;
cd922c   3.14s NuclearCraft;
814a3e   3.09s RFTools;
444444  73.51s 43 Other mods;
333333  55.55s 163 'Fast' mods (load 1.0s - 0.1s);
222222   7.02s 217 'Instant' mods (load %3C 0.1s)
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
Had Enough Items      |  0.07|  0.00|  1.73|  0.02|  0.00|  0.00| 43.29|  0.00;
Ender IO              |  1.86|  0.01|  4.32|  0.75|  3.71|  0.19|  0.00|  1.90;
IndustrialCraft 2     |  0.79|  0.02|  8.85|  0.94|  0.00|  0.70|  0.00|  0.00;
OpenComputers         |  0.18|  0.02|  5.02|  3.41|  0.18|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.24|  0.01|  4.82|  1.79|  0.00|  0.58|  0.00|  0.00;
CraftTweaker2         |  0.71|  0.00|  3.32|  0.01|  0.00|  3.13|  0.02|  0.00;
Immersive Engineering |  0.95|  0.01|  1.16|  0.88|  0.00|  3.25|  0.00|  0.00;
Forestry              |  0.40|  0.01|  3.51|  0.88|  0.00|  0.48|  0.00|  0.00;
Recurrent Complex     |  0.25|  0.01|  0.68|  1.02|  0.00|  3.18|  0.00|  0.00;
Animania              |  0.34|  0.00|  3.64|  0.10|  0.00|  0.41|  0.00|  0.00;
Extra Utilities 2     |  0.07|  0.01|  3.64|  0.08|  0.00|  0.34|  0.00|  0.00;
Integrated Dynamics   |  0.22|  0.01|  3.76|  0.07|  0.00|  0.00|  0.00|  0.00
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
            text: [197.01,'s'].join(''),
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
993A00   1.51s Loading sounds;
994400   1.57s Loading Resource - SoundHandler;
994F00  28.78s ModelLoader: blocks;
995900   9.73s ModelLoader: items;
996300   9.79s ModelLoader: baking;
996D00   1.66s Applying remove recipe actions;
997700   0.17s Applying remove furnace recipe actions;
998200   1.10s Indexing ingredients;
444444 142.70s Other
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
