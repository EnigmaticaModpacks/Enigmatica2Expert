## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
612.88 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
10.21 min
<!---->
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label: 'MODS:', data: [/*TOTAL_MODS_TIME*/
        404.10
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        208.78
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
        padding: 1
      }
    }
  },
  type: 'outlabeledPie',
  data: {...
/*mods_loading_time*/
`
3C639D  16.24s Just Enough Items;
36598D  27.94s Just Enough Items (Plugins);
36598D  27.01s Just Enough Items (Ingredient Filter);
9D5E3C  27.23s CraftTweaker2;
8D5536   8.72s CraftTweaker2 (Script Loading);
9D3C66   3.36s Tinkers' Construct;
8D365C  28.76s Tinkers' Construct (Oredict Melting);
979D3C  13.04s Minecraft Forge;
3C9D59  12.74s Ender IO;
9D3C8F  12.24s IndustrialCraft 2;
3C5F9D  12.00s Sampling Performance Profiler;
733C9D  11.41s Immersive Engineering;
599D3C   9.34s OpenComputers;
3C9D86   7.69s Astral Sorcery;
3C9A9D   7.69s Animania;
4F9D3C   6.47s Dynamic Surroundings;
9D3C3C   4.75s Forestry;
3C759D   4.59s Applied Energistics 2;
4C9D3C   4.57s Recurrent Complex;
923C9D   4.01s Integrated Dynamics;
9D6B3C   3.76s Cyclic;
3C9D3C   3.68s Extra Utilities 2;
3C459D   3.38s OpenSecurity;
3C939D   3.32s Quark;
444444  79.60s 43 Other mods;
333333  54.09s 151 'Fast' mods (load 1.0s - 0.1s);
222222   6.48s 209 'Instant' mods (load %3C 0.1s)
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

# Top Mods Details (except JEI)
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
        borderWidth: 1,
        borderRadius: 3,
        padding: 0,
        formatter: (v,ctx) => 
          ctx.datasetIndex!=ctx.chart.data.datasets.length-1 ? null
            : `${((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex], 0) * 100) | 0) /100}s`
      },
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
CraftTweaker2                 |  0.56|  0.00|  3.12|  0.01|  0.00|  7.65| 24.62|  0.00;
Tinkers' Construct            |  1.18|  0.01|  0.16|  0.05|  0.00| 30.71|  0.00|  0.00;
Minecraft Forge               |  0.04|  0.00|  0.43|  0.00|  0.00|  0.00|  0.01| 12.55;
Ender IO                      |  1.96|  0.01|  4.52|  0.65|  4.18|  0.17|  0.00|  1.26;
IndustrialCraft 2             |  0.86|  0.01|  9.19|  1.14|  0.00|  1.04|  0.00|  0.00;
Sampling Performance Profiler | 11.95|  0.00|  0.05|  0.00|  0.00|  0.00|  0.00|  0.00;
Immersive Engineering         |  1.04|  0.01|  1.22|  0.95|  0.00|  8.20|  0.00|  0.00;
OpenComputers                 |  0.17|  0.01|  5.83|  3.13|  0.20|  0.00|  0.00|  0.00;
Astral Sorcery                |  0.23|  0.01|  4.82|  1.85|  0.00|  0.79|  0.00|  0.00;
Animania                      |  0.33|  0.00|  3.74|  0.13|  0.00|  3.49|  0.00|  0.00
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
  3.41: li.cil.oc.integration.jei.ModPluginOpenComputers;
  3.07: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  2.72: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.37: jeresources.jei.JEIConfig;
  2.34: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.19: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.63: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.23: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.23: ic2.jeiIntegration.SubModule;
  0.86: com.buuz135.industrial.jei.JEICustomPlugin;
  0.78: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.61: nc.integration.jei.NCJEI;
  0.55: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.38: mctmods.smelteryio.library.util.jei.JEI;
  0.26: ninjabrain.gendustryjei.GendustryJEIPlugin;
  4.32: Other 117 Plugins
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