/* eslint-env node */

'use strict';

var assert = require('assert');
var fs = require('fs');
var join = require('path').join;
var ohm = require('ohm-js');

var contents = fs.readFileSync(join(__dirname, 'main.ohm'));
var g = ohm.grammar(contents);

var semantics = g.createSemantics().addOperation('value', {
  csv: function(r, _, rs, eol) {
    return [r.value()].concat(rs.value());
  },
  row: function(c, _, cs) {
    return [c.value()].concat(cs.value());
  },
  col: function(_) {
    return this.sourceString;
  }
});

var someInput =
    'foo,bar,baz\n' +
    'foo,bar\n' +
    '\n' +
    'foo,,baz\n' +
    ',bar,baz\n' +
    'foo';

function parse(input) {
  var match = g.match(input);
  assert(match.succeeded());
  return semantics(match).value();
}

var parsed = parse(someInput);

console.log(parsed);