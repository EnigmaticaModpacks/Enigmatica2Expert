## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
522.64 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
8.71 min
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
        364.95
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        157.68
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
3C639D  15.04s Just Enough Items;
36598D  29.83s Just Enough Items (Plugins);
36598D  22.13s Just Enough Items (Ingredient Filter);
9D5E3C  32.66s CraftTweaker2;
8D5536   6.65s CraftTweaker2 (Script Loading);
9D3C66   3.74s Tinkers' Construct;
8D365C  24.01s Tinkers' Construct (Oredict Melting);
733C9D  17.15s Immersive Engineering;
979D3C  13.61s Minecraft Forge;
8D9D3C  12.48s Forge Mod Loader;
9D3C8F  11.37s IndustrialCraft 2;
3C9D59   8.56s Ender IO;
3C9D86   7.14s Astral Sorcery;
3C9A9D   7.06s Animania;
4F9D3C   5.15s Dynamic Surroundings;
599D3C   4.80s OpenComputers;
9D3C3C   4.26s Forestry;
3C759D   4.03s Applied Energistics 2;
4C9D3C   3.85s Recurrent Complex;
923C9D   3.37s Integrated Dynamics;
3C459D   3.30s OpenSecurity;
9D6B3C   3.04s Cyclic;
3F3C9D   3.00s Thermal Expansion;
429D3C   2.92s Modular Machinery;
444444  58.94s 35 Other mods;
333333  50.23s 150 'Fast' mods (load 1.0s - 0.1s);
222222   6.63s 210 'Instant' mods (load %3C 0.1s)
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
CraftTweaker2         |  0.63|  0.00|  3.91|  0.01|  0.00| 12.76| 22.00|  0.00;
Tinkers' Construct    |  1.18|  0.01|  0.23|  0.05|  0.00| 26.29|  0.00|  0.00;
Immersive Engineering |  1.30|  0.01|  1.10|  0.86|  0.00| 13.89|  0.00|  0.00;
Minecraft Forge       |  0.04|  0.00|  0.85|  0.00|  0.00|  0.00|  0.01| 12.71;
Forge Mod Loader      | 12.48|  0.00|  0.00|  0.00|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2     |  0.90|  0.01|  8.50|  0.85|  0.00|  1.12|  0.00|  0.00;
Ender IO              |  1.70|  0.01|  3.71|  0.46|  2.52|  0.16|  0.00|  0.00;
Astral Sorcery        |  0.31|  0.01|  4.26|  1.60|  0.00|  0.96|  0.00|  0.00;
Animania              |  0.35|  0.00|  2.48|  0.11|  0.00|  4.11|  0.00|  0.00;
Dynamic Surroundings  |  0.19|  0.00|  0.22|  0.11|  0.00|  0.05|  4.58|  0.00
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
  4.08: mezz.jei.plugins.vanilla.VanillaPlugin;
  4.00: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.27: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  3.19: li.cil.oc.integration.jei.ModPluginOpenComputers;
  2.29: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.09: jeresources.jei.JEIConfig;
  1.45: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.26: com.buuz135.industrial.jei.JEICustomPlugin;
  1.18: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.96: ic2.jeiIntegration.SubModule;
  0.81: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.59: mctmods.smelteryio.library.util.jei.JEI;
  0.58: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.39: nc.integration.jei.NCJEI;
  0.20: ninjabrain.gendustryjei.GendustryJEIPlugin;
  3.49: Other 114 Plugins
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