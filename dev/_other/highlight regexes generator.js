
//@ts-check

import _ from "lodash"
import { getItemsTree } from "../lib/tellme.js"
import ColorHash from 'color-hash'

// @ts-ignore
const colorHash = new (ColorHash.default)(/* {lightness: [0.2625, 0.375, 0.4875]} */);

const block = [...(new Set(Object.keys(getItemsTree()).map(k=>k.match(/^([^:]+?):.*/)[1])))].map(k=>
  `        ${(`"(<${k}:[^>]+?>)"`).padEnd(35)}: { "decorations": [{"border": "1px inset ${colorHash.hex(k)}", "border-radius": "3px"}]},`
)

console.log(block.join('\n'))