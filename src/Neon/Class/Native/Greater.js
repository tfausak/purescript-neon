'use strict';

// module Neon.Class.Greater

module.exports = {
  nativeGreater: function (x) {
    return function (y) {
      return y > x;
    };
  },

  nativeGreaterArray: function (Equal) {
    return function (Greater) {
      return function (x) {
        return function (y) {
          var xl = x.length;
          var yl = y.length;
          for (var i = 0; i < xl && i < yl; ++i) {
            var xi = x[i];
            var yi = y[i];
            if (Greater.greater(yi)(xi)) {
              return true;
            } else if (!Equal.equal(yi)(xi)) {
              return false;
            }
          }
          return yl > xl;
        };
      };
    };
  }
};
