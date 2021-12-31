const path = require("path");
const fs = require("fs-extra");
const command = process.argv[2];

let isCoreBundle = process.env.RN_BUILD_TYPE === "core", cache;
const mapFile = path.resolve(process.cwd(), "./node_modules/.rn-cache/map.js");

if (isCoreBundle) {
  cache = fs.createWriteStream(mapFile);
  cache.write(`var __map = {}; \n`, 'utf-8');
}

// 基础文件id 映射
require(mapFile);
const core = global.__map || {}; const files = Object.keys(core);

const processModuleFilter = function (m) {
  if (isCoreBundle) {
    return true;
  }

  const f = path.relative(process.cwd(), m.path);
  return !files.includes(f);
};

const createModuleIdFactory = function () {
  let id = isCoreBundle ? 1 : 10000;
  return (file) => {
    const name = path.relative(process.cwd(), file);

    if (map.has(name)) {
      return !isCoreBundle ? name : map.get(name);
    }

    map.set(name, ++id);
    if (isCoreBundle) {
      cache.write(`__map["${name}"] = ${id};\n`, 'utf-8');
    }

    return id;
  };
};

const transformer = {
  getTransformOptions: async () => ({
    transform: {
      experimentalImportSupport: true,
      inlineRequires: true,
    },
  }),
};

const serializer = {
  createModuleIdFactory,
  processModuleFilter,
  getModulesRunBeforeMainModule() {
    return [
      './node_modules/.rn-cache/map.js'
    ]
  },
  getRunModuleStatement: (moduleId) => {
    return isCoreBundle ? `__nr(${moduleId})` : `__r(__idFromMap(${JSON.stringify(moduleId)}))`
  }
};


const config = {
  reporter: {
    update: console.log
  },
  transformer,
  serializer
};

module.exports = config;
