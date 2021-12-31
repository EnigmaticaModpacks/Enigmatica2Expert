import { loadText } from "../lib/utils.js"
import _ from 'lodash'

const result = _(
  loadText('logs/debug.log')
  .split('\n')
  .map(s=>s.match(/^\[[^\]]+\](.*)/)?.[1])
  .filter(s=>s)
)
.countBy()
.forEach((n, line) => {
  if(n>50) console.log(n, line.substring(0, 180));
});

