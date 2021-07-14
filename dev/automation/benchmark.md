## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
559.19 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.32 min
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
        378.78
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        180.41
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
3C639D  15.59s Just Enough Items;
36598D  27.26s Just Enough Items (Plugins);
36598D  23.02s Just Enough Items (Ingredient Filter);
9D5E3C  30.87s CraftTweaker2;
8D5536   7.27s CraftTweaker2 (Script Loading);
9D3C66   3.51s Tinkers' Construct;
8D365C  25.83s Tinkers' Construct (Oredict Melting);
733C9D  14.04s Immersive Engineering;
979D3C  13.52s Minecraft Forge;
3C5F9D  12.23s Sampling Performance Profiler;
9D3C8F  11.87s IndustrialCraft 2;
3C9D59  11.71s Ender IO;
599D3C   8.58s OpenComputers;
3C9A9D   7.30s Animania;
3C9D86   6.86s Astral Sorcery;
4F9D3C   5.54s Dynamic Surroundings;
9D3C3C   4.25s Forestry;
3C759D   4.20s Applied Energistics 2;
4C9D3C   3.91s Recurrent Complex;
923C9D   3.73s Integrated Dynamics;
3F3C9D   3.63s Thermal Expansion;
3C939D   3.50s Quark;
3C9D3C   3.41s Extra Utilities 2;
9D6B3C   3.23s Cyclic;
444444  64.35s 37 Other mods;
333333  53.02s 148 'Fast' mods (load 1.0s - 0.1s);
222222   6.55s 214 'Instant' mods (load %3C 0.1s)
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
CraftTweaker2                 |  0.65|  0.00|  3.05|  0.01|  0.00|  9.57| 24.87|  0.00;
Tinkers' Construct            |  1.17|  0.03|  0.16|  0.05|  0.00| 27.93|  0.00|  0.00;
Immersive Engineering         |  0.92|  0.01|  1.12|  1.11|  0.00| 10.89|  0.00|  0.00;
Minecraft Forge               |  0.04|  0.00|  0.41|  0.00|  0.00|  0.00|  0.01| 13.07;
Sampling Performance Profiler | 12.18|  0.00|  0.05|  0.00|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2             |  0.85|  0.01|  9.20|  0.77|  0.00|  1.05|  0.00|  0.00;
Ender IO                      |  1.96|  0.01|  4.13|  0.47|  3.62|  0.16|  0.00|  1.37;
OpenComputers                 |  0.18|  0.01|  5.42|  2.81|  0.16|  0.00|  0.00|  0.00;
Animania                      |  0.30|  0.00|  2.91|  0.10|  0.00|  4.00|  0.00|  0.00;
Astral Sorcery                |  0.25|  0.00|  4.49|  1.28|  0.00|  0.85|  0.00|  0.00
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
  3.50: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.00: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.75: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.31: mezz.jei.plugins.vanilla.VanillaPlugin;
  2.28: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.24: jeresources.jei.JEIConfig;
  1.75: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.20: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.06: com.buuz135.industrial.jei.JEICustomPlugin;
  0.92: ic2.jeiIntegration.SubModule;
  0.74: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.54: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.47: mctmods.smelteryio.library.util.jei.JEI;
  0.47: nc.integration.jei.NCJEI;
  0.22: net.bdew.jeibees.BeesJEIPlugin;
  3.82: Other 116 Plugins
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