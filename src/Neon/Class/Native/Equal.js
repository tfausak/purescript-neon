'use strict';

// module Neon.Class.Equal

module.exports = {
  nativeEqual: function (x) {
    return function (y) {
      return x === y;
    };
  },

  nativeEqualArray: function (Equal) {
    return function (x) {
      return function (y) {
        var xl = x.length;
        var yl = y.length;
        if (xl !== yl) {
          return false;
        }
        for (var i = 0; i < xl; ++i) {
          if (!Equal.equal(x[i])(y[i])) {
            return false;
          }
        }
        return true;
      };
    };
  }
};
