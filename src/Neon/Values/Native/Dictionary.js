'ues strict';

// module Neon.Values.Dictionary

module.exports = {
  nativeAddDictionary: function (x) {
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

  nativeApplyDictionary: function (f) {
    return function (x) {
      var y = {};
      var p;
      for (p in f) {
        if (f.hasOwnProperty(p)) {
          if (x.hasOwnProperty(p)) {
            y[p] = f[p](x[p]);
          }
        }
      }
      return y;
    };
  },

  nativeEqualDictionary: function (HasEqual) {
    return function (x) {
      return function (y) {
        var p;
        for (p in x) {
          if (x.hasOwnProperty(p)) {
            if (y.hasOwnProperty(p)) {
              if (!HasEqual.equal(x[p])(y[p])) {
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

  nativeFoldlDictionary: function (f) {
    return function (y) {
      return function (x) {
        for (var p in x) {
          if (x.hasOwnProperty(p)) {
            y = f(y)(x[p]);
          }
        }
        return y;
      };
    };
  },

  nativeFoldrDictionary: function (f) {
    return function (y) {
      return function (x) {
        var vs = [];
        for (var p in x) {
          if (x.hasOwnProperty(p)) {
            vs.push(x[p]);
          }
        }
        for (var i = vs.length - 1; i >= 0; --i) {
          y = f(vs[i])(y);
        }
        return y;
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

  nativeShowDictionary: function (HasShow) {
    return function (x) {
      var xs = [];
      for (var p in x) {
        if (x.hasOwnProperty(p)) {
          xs.push('pair (' + JSON.stringify(p) + ') (' + HasShow.show(x[p]) + ')');
        }
      }

      return 'fromArray ([' + xs.join(', ') + '])';
    };
  },

  nativeZeroDictionary: {},

  nativeFromArray: function (x) {
    var y = {};
    for (var i = 0; i < x.length; ++i) {
      y[x[i].first] = x[i].second;
    }
    return y;
  }
};
