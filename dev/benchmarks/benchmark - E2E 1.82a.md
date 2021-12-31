## Minecraft load time benchmark
### Enigmatica 2: Expert

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
387.68s
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
6.46 min
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
        281.26
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        106.41
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
549D3C  48.46s Thaumcraft;
3C639D  12.34s Just Enough Items;
36598D  20.13s Just Enough Items (Plugins);
36598D  10.18s Just Enough Items (Ingredient Filter);
9D5E3C  22.23s CraftTweaker2;
8D5536   2.12s CraftTweaker2 (Script Loading);
9D3C66   1.86s Tinkers' Construct;
8D365C  14.18s Tinkers' Construct (Oredict Melting);
733C9D  11.49s Immersive Engineering;
9D3C8F   9.89s IndustrialCraft 2;
979D3C   9.22s Minecraft Forge;
3C9D59   7.46s Ender IO;
8D9D3C   5.89s Forge Mod Loader;
3C9D86   5.80s Astral Sorcery;
599D3C   4.04s OpenComputers;
3C759D   3.79s Applied Energistics 2;
3C9A9D   3.71s Animania;
4C9D3C   3.35s Recurrent Complex;
9D3C3C   3.31s Forestry;
923C9D   2.90s Integrated Dynamics;
3F3C9D   2.87s Thermal Expansion;
3C939D   2.31s Quark;
3C9D3C   2.27s Extra Utilities 2;
9D6B3C   2.18s Cyclic;
444444  30.00s 20 Other mods;
333333  34.99s 98 'Fast' mods (load 1.0s - 0.1s);
222222   4.32s 133 'Instant' mods (load %3C 0.1s)
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
Thaumcraft            |  0.42|  0.01|  0.14|  0.37|  0.01| 47.51|  0.00|  0.00;
CraftTweaker2         |  0.36|  0.00|  1.26|  0.01|  0.00|  3.87| 18.85|  0.00;
Tinkers' Construct    |  0.66|  0.01|  0.13|  0.04|  0.00| 15.21|  0.00|  0.00;
Immersive Engineering |  0.82|  0.01|  0.91|  0.85|  0.00|  8.91|  0.00|  0.00;
IndustrialCraft 2     |  0.63|  0.01|  7.25|  0.63|  0.00|  1.36|  0.00|  0.00;
Minecraft Forge       |  0.04|  0.00|  0.23|  0.00|  0.00|  0.00|  0.00|  8.94;
Ender IO              |  1.33|  0.01|  2.38|  0.38|  2.12|  1.25|  0.00|  0.00;
Forge Mod Loader      |  5.88|  0.00|  0.00|  0.00|  0.00|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.22|  0.01|  3.62|  1.25|  0.00|  0.70|  0.00|  0.00;
OpenComputers         |  0.15|  0.01|  1.68|  2.03|  0.17|  0.00|  0.00|  0.00
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
  3.20: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  2.93: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.34: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  1.57: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  1.57: jeresources.jei.JEIConfig;
  1.28: mezz.jei.plugins.vanilla.VanillaPlugin;
  1.23: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.79: com.buuz135.industrial.jei.JEICustomPlugin;
  0.71: ic2.jeiIntegration.SubModule;
  0.69: tinker_io.plugins.jei.JEIPlugin;
  0.51: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.35: nc.integration.jei.NCJEI;
  0.25: com.buuz135.jeivillagers.jei.VillagerPlugin;
  0.19: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.17: exnihilocreatio.compatibility.jei.CompatJEI;
  2.34: Other 86 Plugins
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