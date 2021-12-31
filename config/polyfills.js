var __oldDefine = global.__d;
var __oldRequire = global.__r;
var __map = global.__map = {};

var keys = Object.keys(__map);

if (!global.__rn_patched) {
  const importAll = ({ id }) => __oldRequire.importAll(id);
  const importDefault = ({ id }) => __oldRequire.importDefault(id);

  global.__r = function ({ name, id }) {
    return __oldRequire(id);
  }

  global.__r.importAll = importAll;
  global.__r.importDefault = importDefault;

  global.__d = function (fac, { id }, deps) {
    const factory = function (g, r, _i, a, m, e, d) {
      const _r = global.__r;
      fac(g, _r, importDefault, importAll, m, e, d);
    }
    return __oldDefine(factory, id, deps);
  }

  global.__rn_patched = true;
}

