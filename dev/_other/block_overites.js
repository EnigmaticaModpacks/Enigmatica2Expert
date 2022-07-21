/*

This script lookup entries in config/tool_progression/block_overwrites.cfg
to find if they can use wildcard

Example:

    S:"biomesoplenty:gem_block:0"=pickaxe=4
    S:"biomesoplenty:gem_block:1"=pickaxe=4
    S:"biomesoplenty:gem_block:2"=pickaxe=4
    S:"biomesoplenty:gem_block:3"=pickaxe=4
    S:"biomesoplenty:gem_block:4"=pickaxe=4
    S:"biomesoplenty:gem_block:5"=pickaxe=4
    S:"biomesoplenty:gem_block:6"=pickaxe=4
    S:"biomesoplenty:gem_block:7"=pickaxe=4

Becomes:

    S:"biomesoplenty:gem_block:*"=pickaxe=4

*/

const fs = require('fs')

const { escapeRegex } = require('../lib/utils.js')

const cfgPath = 'config/tool_progression/block_overwrites.cfg'
const cfg_full = fs.readFileSync(cfgPath, 'utf8')

const fullRgx = /(.*block {\n)(.*)(\n}.*)/ms
let cfg = cfg_full.match(fullRgx)[2].split('\n')
// console.log('cfg :>> ', cfg)
//    S:"appliedenergistics2:sky_stone_brick_stairs:0"=pickaxe=5

for (let i = 0; i < cfg.length; i++) {
  if (i >= cfg.length) continue
  const matcher = /^(?<pre>\s*S:"[^:]+:[^:]+)(?<meta>:?[^"]*)(?<post>"=.*)$/
  // console.log('cfg[i] :>> ', cfg[i]);
  const g = cfg[i].match(matcher)?.groups
  if (g?.meta !== ':0') continue

  const sameItem = cfg.filter((l) =>
    l.match(new RegExp(escapeRegex(g.pre) + ':\\d+.*'))
  )
  if (sameItem.length <= 1) continue // If there only one entry with such meta
  if (sameItem.some((l) => l.match(matcher).groups.post !== g.post)) continue // If there not all metas have same level

  cfg = cfg.filter((l) => {
    const m = l.match(matcher)?.groups
    // console.log('m, i :>> ', m, i, l);
    if (!m) return true
    return !(m.pre === g.pre && m.post === g.post && m.meta !== ':0')
  })

  cfg[i] = g.pre + ':*' + g.post
}

const newText = cfg_full.replace(fullRgx, '$1' + cfg.join('\n') + '$3')

fs.writeFileSync(cfgPath, newText)
