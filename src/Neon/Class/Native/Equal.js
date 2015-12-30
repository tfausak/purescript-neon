'use strict';

// module Neon.Class.Equal

module.exports = {
  nativeEqual: function (x) {
    return function (y) {
      return y === x;
    };
  },

  nativeEqualArray: function (Equal) {
    return function (x) {
      return function (y) {
        var xl = x.length;
        if (xl !== y.length) {
          return false;
        }
        for (var i = 0; i < xl; i += 1) {
          if (!Equal.equal(x[i])(y[i])) {
            return false;
          }
        }
        return true;
      };
    };
  }
};
