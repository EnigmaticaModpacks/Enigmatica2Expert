## Minecraft load time benchmark
### Enigmatica 2: Expert - Extended

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
<!--TOTAL_LOAD_TIME-->
626.06 sec
<!---->
<br>
<sup><sub>(
<!--TOTAL_LOAD_TIME_MINUTES-->
10.43 min
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
        422.49
      /**/]},
      {label: 'FML stuff:',data: [/*TOTAL_STUF_TIME*/
        203.57
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
3C639D  16.89s Just Enough Items;
36598D  30.70s Just Enough Items (Plugins);
36598D  27.83s Just Enough Items (Ingredient Filter);
9D5E3C  33.13s CraftTweaker2;
8D5536   7.75s CraftTweaker2 (Script Loading);
9D3C66   3.66s Tinkers' Construct;
8D365C  28.51s Tinkers' Construct (Oredict Melting);
733C9D  14.94s Immersive Engineering;
979D3C  14.51s Minecraft Forge;
3C9D59  12.56s Ender IO;
9D3C8F  12.35s IndustrialCraft 2;
3C5F9D  12.00s Sampling Performance Profiler;
599D3C   9.16s OpenComputers;
3C9A9D   7.86s Animania;
3C9D86   7.70s Astral Sorcery;
4F9D3C   5.76s Dynamic Surroundings;
9D3C3C   5.13s Forestry;
3C759D   4.55s Applied Energistics 2;
923C9D   4.35s Integrated Dynamics;
4C9D3C   4.10s Recurrent Complex;
3C9D3C   3.99s Extra Utilities 2;
3C4D9D   3.76s Block Drops;
3C939D   3.51s Quark;
9D6B3C   3.49s Cyclic;
444444  83.18s 44 Other mods;
333333  54.26s 152 'Fast' mods (load 1.0s - 0.1s);
222222   6.88s 205 'Instant' mods (load %3C 0.1s)
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
CraftTweaker2                 |  0.59|  0.00|  3.16|  0.01|  0.00| 10.19| 26.94|  0.00;
Tinkers' Construct            |  1.22|  0.01|  0.17|  0.05|  0.00| 30.73|  0.00|  0.00;
Immersive Engineering         |  0.99|  0.01|  1.19|  0.87|  0.00| 11.88|  0.00|  0.00;
Minecraft Forge               |  0.04|  0.00|  0.40|  0.00|  0.00|  0.00|  0.01| 14.06;
Ender IO                      |  2.01|  0.01|  4.44|  0.54|  4.09|  0.16|  0.00|  1.32;
IndustrialCraft 2             |  0.84|  0.01|  9.55|  0.87|  0.00|  1.08|  0.00|  0.00;
Sampling Performance Profiler | 11.95|  0.00|  0.05|  0.00|  0.00|  0.00|  0.00|  0.00;
OpenComputers                 |  0.22|  0.01|  5.73|  2.99|  0.21|  0.00|  0.00|  0.00;
Animania                      |  0.38|  0.00|  3.70|  0.12|  0.00|  3.65|  0.00|  0.00;
Astral Sorcery                |  0.28|  0.01|  4.98|  1.51|  0.00|  0.93|  0.00|  0.00
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
  3.95: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  3.37: li.cil.oc.integration.jei.ModPluginOpenComputers;
  3.37: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  2.64: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  2.57: mezz.jei.plugins.vanilla.VanillaPlugin;
  2.31: jeresources.jei.JEIConfig;
  1.68: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  1.40: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.10: com.buuz135.industrial.jei.JEICustomPlugin;
  1.05: ic2.jeiIntegration.SubModule;
  0.86: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.66: nc.integration.jei.NCJEI;
  0.60: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.53: mctmods.smelteryio.library.util.jei.JEI;
  0.27: zmaster587.advancedRocketry.integration.jei.ARPlugin;
  4.35: Other 117 Plugins
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