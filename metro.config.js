const path = require('path');
const processModuleFilter = function (m) {
  if (process.env.RN_BUILD_TYPE === 'base')
    return true
  const file = m.path;

  const isBultin =
    file.indexOf('__prelude__') >= 0 ||
    file.indexOf('/node_modules/react-native/Libraries/polyfills') >= 0 ||
    file.indexOf('/node_modules/metro/src/lib/polyfills/') >= 0;

  if (isBultin || file.indexOf('/node_modules/') >= 0) {
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

module.exports = {
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: false,
      },
    }),
  },
  serializer: {
    createModuleIdFactory,
    processModuleFilter
  },
  server: {
    enhanceMiddleware() {

    }
  }
}