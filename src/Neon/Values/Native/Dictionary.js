'ues strict';

// module Neon.Values.Dictionary

module.exports = {
  nativeAddDictionary: function (xs) {
    return function (ys) {
      var result = {};
      for (var property in xs) {
        if (xs.hasOwnProperty(property)) {
          result[property] = xs[property];
        }
      }
      for (property in ys) {
        if (ys.hasOwnProperty(property)) {
          result[property] = ys[property];
        }
      }
      return result;
    };
  },

  nativeApplyDictionary: function (fs) {
    return function (xs) {
      var result = {};
      for (var property in fs) {
        if (fs.hasOwnProperty(property)) {
          if (xs.hasOwnProperty(property)) {
            result[property] = fs[property](xs[property]);
          }
        }
      }
      return result;
    };
  },

  nativeEqualDictionary: function (HasEqual) {
    return function (xs) {
      return function (ys) {
        for (var property in xs) {
          if (xs.hasOwnProperty(property)) {
            if (ys.hasOwnProperty(property)) {
              if (!HasEqual.equal(xs[property])(ys[property])) {
                return false;
              }
            } else {
              return false;
            }
          }
        }
        for (property in ys) {
          if (ys.hasOwnProperty(property)) {
            if (!xs.hasOwnProperty(property)) {
              return false;
            }
          }
        }
        return true;
      };
    };
  },

  nativeFoldlDictionary: function (f) {
    return function (result) {
      return function (xs) {
        for (var property in xs) {
          if (xs.hasOwnProperty(property)) {
            result = f(result)(xs[property]);
          }
        }
        return result;
      };
    };
  },

  nativeFoldrDictionary: function (f) {
    return function (result) {
      return function (xs) {
        var values = [];
        for (var property in xs) {
          if (xs.hasOwnProperty(property)) {
            values.push(xs[property]);
          }
        }
        for (var i = values.length - 1; i >= 0; --i) {
          result = f(values[i])(result);
        }
        return result;
      };
    };
  },

  nativeMapDictionary: function (f) {
    return function (xs) {
      var result = {};
      for (var property in xs) {
        if (xs.hasOwnProperty(property)) {
          result[property] = f(xs[property]);
        }
      }
      return result;
    };
  },

  nativeShowDictionary: function (HasShow) {
    return function (xs) {
      var strings = [];
      for (var property in xs) {
        if (xs.hasOwnProperty(property)) {
          var first = JSON.stringify(property);
          var second = HasShow.show(xs[property]);
          strings.push('pair (' + first + ') (' + second + ')');
        }
      }
      return 'fromArray ([' + strings.join(', ') + '])';
    };
  },

  nativeZeroDictionary: {},

  nativeFromArray: function (pairs) {
    var result = {};
    for (var i = 0; i < pairs.length; ++i) {
      var pair = pairs[i];
      result[pair.first] = pair.second;
    }
    return result;
  }
};
