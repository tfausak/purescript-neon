'ues strict';

// module Neon.Values.Dictionary

module.exports = {
  nativeAddDictioanry: function (x) {
    return function (y) {
      var z = {};
      var p;
      for (p in x) {
        if (x.hasOwnProperty(p)) {
          z[p] = x[p];
        }
      }
      for (p in y) {
        if (y.hasOwnProperty(p)) {
          z[p] = y[p];
        }
      }
      return z;
    };
  },

  nativeEqualDictionary: function (HasEqual) {
    return function (x) {
      return function (y) {
        var p;
        for (p in x) {
          if (x.hasOwnProperty(p)) {
            if (y.hasOwnProperty(p)) {
              if (!HasEqual.equal(x)(y)) {
                return false;
              }
            } else {
              return false;
            }
          }
        }
        for (p in y) {
          if (y.hasOwnProperty(p)) {
            if (!x.hasOwnProperty(p)) {
              return false;
            }
          }
        }
        return true;
      };
    };
  },

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
  },

  nativeZeroDictionary: {}
};
