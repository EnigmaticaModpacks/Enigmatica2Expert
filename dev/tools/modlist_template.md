# Mod List

- [Mod List](#mod-list)
  - [🔵 `Enigmatica 2: Expert` Mods](#-enigmatica-2-expert-mods)
  - [🟢 `Extended` Mods](#-extended-mods)
  - [🔴 Removed from `E2E` Mods](#-removed-from-e2e-mods)
  - [🟡 Updated Mods](#-updated-mods)

Note: Non-CF mods not listed here.

{{#*inline "list"}}
{{length}} mods in this section.

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
{{#if both}}
## 🔵 `Enigmatica 2: Expert` Mods

Mods that exists both in `E2E` __and__ `E2E-Extended`

{{> list both}}
{{/if}}
{{#if added}}
## 🟢 `Extended` Mods

Mods that present only in `Extended` version:

{{> list added}}
{{/if}}
{{#if removed}}

## 🔴 Removed from `E2E` Mods

Mods that exists in `E2E` but __was removed__ in `E2E-Extended`

Note: most of those mods was replaced by their fork versions

{{> list removed}}
{{/if}}
{{#if updated}}
## 🟡 Updated Mods

Mods that exist on `E2E` but have another version on `E2E-E`

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
{{/if}}
