## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
588.98 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
9.82 min
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
        392.95
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        196.04
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
3C639D  16.60s Just Enough Items;
36598D  32.14s Just Enough Items (Plugins);
36598D  29.52s Just Enough Items (Ingredient Filter);
9D5E3C  33.22s CraftTweaker2;
8D5536   7.23s CraftTweaker2 (Script Loading);
9D3C66   3.33s Tinkers' Construct;
8D365C  28.23s Tinkers' Construct (Oredict Melting);
979D3C  15.37s Minecraft Forge;
733C9D  15.12s Immersive Engineering;
3C9D59  11.16s Ender IO;
3C5F9D  10.72s Sampling Performance Profiler;
9D3C8F  10.07s IndustrialCraft 2;
599D3C   7.92s OpenComputers;
3C9A9D   7.40s Animania;
3C9D86   6.81s Astral Sorcery;
4F9D3C   6.00s Dynamic Surroundings;
4C9D3C   4.38s Recurrent Complex;
3C759D   4.17s Applied Energistics 2;
3C9D3C   3.76s Extra Utilities 2;
9D3C3C   3.72s Forestry;
923C9D   3.69s Integrated Dynamics;
9D6B3C   3.11s Cyclic;
3C459D   3.10s OpenSecurity;
3F3C9D   3.06s Thermal Expansion;
444444  64.02s 37 Other mods;
333333  52.35s 149 'Fast' mods (load 1.0s - 0.1s);
222222   6.76s 214 'Instant' mods (load %3C 0.1s)
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
CraftTweaker2                 |  0.53|  0.00|  3.00|  0.01|  0.00| 10.26| 26.65|  0.00;
Tinkers' Construct            |  0.89|  0.01|  0.16|  0.05|  0.01| 30.45|  0.00|  0.00;
Minecraft Forge               |  0.05|  0.00|  0.75|  0.00|  0.00|  0.00|  0.01| 14.56;
Immersive Engineering         |  0.91|  0.01|  1.04|  0.85|  0.00| 12.32|  0.00|  0.00;
Ender IO                      |  1.88|  0.01|  3.56|  0.67|  3.71|  0.18|  0.00|  1.16;
Sampling Performance Profiler | 10.68|  0.00|  0.04|  0.00|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2             |  0.75|  0.01|  7.20|  0.84|  0.00|  1.27|  0.00|  0.00;
OpenComputers                 |  0.15|  0.01|  4.86|  2.67|  0.23|  0.00|  0.00|  0.00;
Animania                      |  0.34|  0.00|  2.19|  0.11|  0.00|  4.76|  0.00|  0.00;
Astral Sorcery                |  0.27|  0.01|  4.28|  1.33|  0.00|  0.93|  0.00|  0.00
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
  4.31: mezz.jei.plugins.vanilla.VanillaPlugin;
  3.89: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.78: li.cil.oc.integration.jei.ModPluginOpenComputers;
  3.22: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.72: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.17: jeresources.jei.JEIConfig;
  1.61: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.20: com.buuz135.industrial.jei.JEICustomPlugin;
  1.19: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.17: ic2.jeiIntegration.SubModule;
  0.82: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.74: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.58: mctmods.smelteryio.library.util.jei.JEI;
  0.38: nc.integration.jei.NCJEI;
  0.22: exnihilocreatio.compatibility.jei.CompatJEI;
  4.17: Other 117 Plugins
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