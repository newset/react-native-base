const path = require("path");
// const { mergeConfig, getDefaultConfig } = require("metro-config");

const command = process.argv[2];

let shouldFilter = process.env.RN_BUILD_TYPE === "base";
let isStartCommand = command === "start";

const isBultin = (file) =>
  file.indexOf("__prelude__") >= 0 ||
  file.indexOf("/node_modules/react-native/Libraries/polyfills") >= 0 ||
  file.indexOf("/node_modules/metro/src/lib/polyfills/") >= 0;

const processModuleFilter = function (m) {
  // 构建 base包时允许包括 node_module以及 builtin模块
  // if (shouldFilter && !isStartCommand)
  //   return true
  const file = m.path;
  if (isBultin(file)) {
    return false;
  }

  return true;
};

const createModuleIdFactory = function () {
  return (file) => {
    const id = path.relative(process.cwd(), file);
    return id;
  };
};

const transformer = {
  getTransformOptions: async () => ({
    transform: {
      experimentalImportSupport: false,
      inlineRequires: false,
    },
  }),
};

const serializer = {
  createModuleIdFactory,
  processModuleFilter,
};

const config = {
  transformer,
  // serializer
};

module.exports = config;
