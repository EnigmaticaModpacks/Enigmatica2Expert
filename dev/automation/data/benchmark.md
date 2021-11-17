## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
584.40 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.74 min
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
        375.59
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        208.80
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
3C639D  18.81s Just Enough Items;
36598D  30.01s Just Enough Items (Plugins);
36598D  27.95s Just Enough Items (Ingredient Filter);
733C9D  22.20s Immersive Engineering;
9D5E3C   7.48s CraftTweaker2;
8D5536   9.58s CraftTweaker2 (Script Loading);
979D3C  16.60s Minecraft Forge;
3C9D59  12.44s Ender IO;
8D9D3C  12.32s Forge Mod Loader;
9D3C8F  11.01s IndustrialCraft 2;
599D3C   8.15s OpenComputers;
3C9A9D   7.69s Animania;
3C9D86   7.51s Astral Sorcery;
9D3C66   5.57s Tinkers' Construct;
4F9D3C   5.40s Dynamic Surroundings;
9D3C3C   5.13s Forestry;
4C9D3C   4.25s Recurrent Complex;
633C9D   4.11s Village Names;
923C9D   3.94s Integrated Dynamics;
3C9D3C   3.69s Extra Utilities 2;
3C939D   3.56s Quark;
3F3C9D   3.42s Thermal Expansion;
3C9D66   3.38s Applied Energistics 2 Trousers Edition;
444444  77.68s 41 Other mods;
333333  56.59s 154 'Fast' mods (load 1.0s - 0.1s);
222222   7.16s 213 'Instant' mods (load %3C 0.1s)
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
Immersive Engineering |  0.94|  0.01|  1.13|  1.09|  0.00| 19.03|  0.00|  0.00;
CraftTweaker2         |  0.58|  0.00|  3.83|  0.01|  0.00| 12.58|  0.06|  0.00;
Ender IO              |  2.09|  0.01|  4.75|  0.54|  3.85|  0.15|  0.00|  1.05;
IndustrialCraft 2     |  0.98|  0.01|  7.58|  0.84|  0.00|  1.61|  0.00|  0.00;
OpenComputers         |  0.18|  0.01|  4.86|  2.91|  0.19|  0.00|  0.00|  0.00;
Animania              |  0.27|  0.00|  3.07|  0.09|  0.00|  4.25|  0.00|  0.00;
Astral Sorcery        |  0.23|  0.00|  4.82|  1.36|  0.00|  1.10|  0.00|  0.00;
Tinkers' Construct    |  1.17|  0.01|  0.17|  0.05|  0.01|  4.18|  0.00|  0.00;
Dynamic Surroundings  |  0.18|  0.00|  0.18|  0.12|  0.00|  0.06|  4.85|  0.00;
Forestry              |  0.41|  0.01|  2.98|  1.51|  0.00|  0.23|  0.00|  0.00;
Recurrent Complex     |  0.26|  0.00|  0.67|  0.82|  0.00|  2.49|  0.00|  0.00;
Village Names         |  0.15|  0.00|  3.74|  0.22|  0.00|  0.00|  0.00|  0.00
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
  4.91: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.76: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  3.02: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.36: mezz.jei.plugins.vanilla.VanillaPlugin;
  2.18: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.66: com.buuz135.industrial.jei.JEICustomPlugin;
  1.37: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.28: jeresources.jei.JEIConfig;
  1.10: ic2.jeiIntegration.SubModule;
  1.07: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.83: mctmods.smelteryio.library.util.jei.JEI;
  0.75: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.65: nc.integration.jei.NCJEI;
  0.62: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.39: crazypants.enderio.base.integration.jei.JeiPlugin;
  4.05: Other 118 Plugins
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
              208.80
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
993A00   2.06s Loading sounds;
444444 206.74s Other
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