{{~#if added}}
## Mods changes
{{else}}{{#if removed}}
## Mods changes
{{else}}{{#if updated}}
## Mods changes
{{else}}{{/if}}{{/if}}{{/if}}

{{~#*inline "list"}}
Icon | Summary
----:|:-------
{{#each this}}
<img src="
  {{~{padEnd (replace cf2Addon.logo.thumbnailUrl "256/256" "30/30") 95 post='"'}~}}
> | 
  {{~{padStart cf2Addon.name 42 pre='[**'}~}}
**]({{{padEnd cf2Addon.links.websiteUrl 75 post=')'}~}}
<sup><sub>
  {{~padEnd latestFile.fileName 49~}}
</sub></sup><br>
  {{~cf2Addon.summary}}
{{/each}}
-----------

{{/inline}}

{{~#if added}}
### 🟢 Added Mods

{{> list added}}
{{~/if}}
{{#if removed}}

### 🔴 Removed Mods

{{> list removed}}
{{~/if}}
{{#if updated}}
### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
{{#each updated}}
<img src="
  {{~{padEnd (replace now.cf2Addon.logo.thumbnailUrl "256/256" "30/30") 95 post='"'}~}}
> | 
  {{~{padStart now.cf2Addon.name 42 pre='[**'}~}}
**]({{padEnd now.cf2Addon.links.websiteUrl 74 post=')'~}}
 | <nobr>{{replace was.latestFile.fileName '.jar' ''}}</nobr><br><nobr>{{replace now.latestFile.fileName '.jar' ''}}</nobr>
{{/each}}
-----------

{{~/if}}