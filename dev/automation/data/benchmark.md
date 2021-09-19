## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
590.05 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.83 min
<!---->
)</sub></sup>
</p>

<br>

<!--

Note for image scripts:
- Newlines are ignored
- This characters cant be used: +<"%

-->

<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label: 'MODS:', data: [/*TOTAL_MODS_TIME*/
        386.31
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        203.74
      /**/]}
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
      `${context.dataset.label} ${value}s`
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  options: {
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>`${v.labels[v.dataIndex]} ${(v.percent*1000|0)/10}%25`
      }
    }
  },
  type: 'outlabeledPie',
  data: {...
/*mods_loading_time*/
`
3C639D  17.07s Just Enough Items;
36598D  27.29s Just Enough Items (Plugins);
36598D  23.41s Just Enough Items (Ingredient Filter);
9D3C66   5.24s Tinkers' Construct;
8D365C  31.25s Tinkers' Construct (Oredict Melting);
733C9D  15.34s Immersive Engineering;
979D3C  14.02s Minecraft Forge;
9D5E3C   7.26s CraftTweaker2;
8D5536   6.74s CraftTweaker2 (Script Loading);
3C9D59  12.90s Ender IO;
9D3C8F  12.85s IndustrialCraft 2;
8D9D3C  11.97s Forge Mod Loader;
599D3C   8.70s OpenComputers;
3C9D86   7.83s Astral Sorcery;
3C9A9D   6.76s Animania;
4F9D3C   6.12s Dynamic Surroundings;
9D3C3C   5.46s Forestry;
563C9D   5.19s DiscordSuite;
3C759D   4.59s Applied Energistics 2;
4C9D3C   4.52s Recurrent Complex;
923C9D   4.16s Integrated Dynamics;
9D6B3C   3.80s Cyclic;
3C9D3C   3.61s Extra Utilities 2;
3C939D   3.51s Quark;
444444  78.60s 43 Other mods;
333333  52.01s 151 'Fast' mods (load 1.0s - 0.1s);
222222   6.12s 210 'Instant' mods (load %3C 0.1s)
`
/**/
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [`${String.fromCharCode(35)}${a}`, parseFloat(a), a][i])
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
<img src="https://quickchart.io/chart?w=400&h=450&c={options: {
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
            : `${((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex], 0) * 10) | 0) /10}s`
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(()=>{
let a={labels:[],datasets:[]};
/*FML_STEPS*/
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
/**/
.split(';')
.map(l=>l.match(/\d: (.*)/).slice(1))
.forEach(([name])=>a.datasets.push({label:name,data:[]}));
/*FML_STEPS_DETAILS*/
`
                          1      2      3      4      5      6      7      8  ;
Tinkers' Construct    |  1.13|  0.01|  0.16|  0.05|  0.01| 35.12|  0.00|  0.00;
Immersive Engineering |  0.99|  0.00|  1.28|  0.90|  0.00| 12.17|  0.00|  0.00;
CraftTweaker2         |  0.67|  0.00|  3.46|  0.00|  0.00|  9.84|  0.02|  0.00;
Ender IO              |  1.86|  0.01|  4.77|  0.58|  4.23|  0.17|  0.00|  1.29;
IndustrialCraft 2     |  0.88|  0.01|  9.73|  1.11|  0.00|  1.12|  0.00|  0.00;
OpenComputers         |  0.16|  0.01|  5.28|  3.02|  0.23|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.34|  0.00|  4.91|  1.61|  0.00|  0.96|  0.00|  0.00;
Animania              |  0.32|  0.00|  3.15|  0.10|  0.00|  3.19|  0.00|  0.00;
Dynamic Surroundings  |  0.20|  0.00|  0.36|  0.12|  0.00|  0.06|  5.38|  0.00;
Forestry              |  0.40|  0.01|  3.57|  1.06|  0.00|  0.43|  0.00|  0.00;
DiscordSuite          |  5.19|  0.00|  0.00|  0.00|  0.00|  0.00|  0.00|  0.00;
Applied Energistics 2 |  0.19|  0.01|  3.28|  0.35|  0.19|  0.57|  0.00|  0.00
`
/**/
.split(';').slice(1)
.map(l=>l.split('|').map(s=>s.trim()))
.forEach(([name, ...arr],i)=>{
  a.labels.push(name);
  arr.forEach((v,j)=>a.datasets[j].data[i]=v)
});return a})()}}"/>
</p>

<br>

# TOP JEI Registered Plugis
<p align="center">
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: {rectangle: {borderWidth: 1}},
    legend: false
  },
  type: 'horizontalBar',
  data: {...(()=>{
let a={labels:[],datasets:[{
  backgroundColor: 'rgba(0, 99, 132, 0.5)',
  borderColor: 'rgb(0, 99, 132)',
  data: []
}]};
/*JEI_PLUGINS*/
`
  3.65: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.52: mezz.jei.plugins.vanilla.VanillaPlugin;
  2.80: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.77: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.38: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.37: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.16: jeresources.jei.JEIConfig;
  1.14: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.08: com.buuz135.industrial.jei.JEICustomPlugin;
  0.90: ic2.jeiIntegration.SubModule;
  0.70: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.62: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.62: mctmods.smelteryio.library.util.jei.JEI;
  0.52: nc.integration.jei.NCJEI;
  0.34: crazypants.enderio.base.integration.jei.JeiPlugin;
  3.72: Other 117 Plugins
`
/**/
.split(';')
.map(l=>l.split(':'))
.forEach(([time, name])=>{
  a.labels.push(name);
  a.datasets[0].data.push(time)
})
;return a})()
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
            text: `${/*TOTAL_STUF_TIME*/
              203.74
            /**/}s`,
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(()=>{
let a = {
  labels:[],
  datasets:[{
    backgroundColor: [],
    data: [],
    borderColor: 'rgba(22,22,22,0.3)',
    borderWidth: 2
  }]
};
/*FML_STUFF_TABLE*/
`
993A00   2.10s Loading sounds;
994400   2.16s Loading Resource - SoundHandler;
994F00  29.32s ModelLoader: blocks;
995900   9.38s ModelLoader: items;
996300   8.70s ModelLoader: baking;
996D00   4.77s Applying remove recipe actions;
997700   3.82s Applying remove furnace recipe actions;
998200  23.34s Indexing ingredients;
444444 120.15s Other
`
/**/
.split(';')
.map(l=>l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
.forEach(([, col, time, name])=>{
  a.labels.push([name, ' ', time, 's'].join(''));
  a.datasets[0].data.push(parseFloat(time));
  a.datasets[0].backgroundColor.push(
    `${String.fromCharCode(35)}${col}`
  )
})
;return a})()
  }
}"/>
</p>