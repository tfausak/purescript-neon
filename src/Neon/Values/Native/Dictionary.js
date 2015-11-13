'ues strict';

// module Neon.Values.Dictionary

module.exports = {
  nativeAlternativeDictioanry: function (x) {
    return function (y) {
      var z = {};
      var p;
      for (p in x) {
        if (x.hasOwnProperty(p)) {
          z[p] = x[p];
        }
      }
      for (p in y) {
        if (x.hasOwnProperty(p)) {
          z[p] = y[p];
        }
      }
      return z;
    };
  },

  nativeEmptyDictionary: {},

  nativeMapDictionary: function (f) {
    return function (x) {
      var y = {};
      var p;
      for (p in x) {
        if (x.hasOwnProperty(p)) {
          y[p] = f(x[p]);
        }
      }
      return y;
    };
  }
};
