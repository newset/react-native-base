const fs = require('fs-extra');
const path = require('path');
const uglifyjs = require("uglify-es");

const map = fs.readFileSync(path.join(process.cwd(), 'node_modules', '.rn-cache', 'map.js'), 'utf8');

const bundleFile = path.join(process.cwd(), 'JSBundle/base.ios.bundle');
const bundle = fs.readFileSync(bundleFile, 'utf8').split('\n');
const minified = uglifyjs.minify(map).code;
const code = `!function(global){${minified}}('undefined'!=typeof globalThis?globalThis:'undefined'!=typeof global?global:'undefined'!=typeof window?window:this);`;

bundle.splice(2, 0, code);
const patched = bundle.join("\n");

fs.outputFileSync(bundleFile, patched, 'utf8');