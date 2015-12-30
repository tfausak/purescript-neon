'use strict';

// module Neon.Class.Less

module.exports = {
  nativeLess: function (x) {
    return function (y) {
      return y < x;
    };
  },

  nativeLessArray: function (Equal) {
    return function (Less) {
      return function (x) {
        return function (y) {
          var xl = x.length;
          var yl = y.length;
          for (var i = 0; i < xl && i < yl; ++i) {
            var xi = x[i];
            var yi = y[i];
            if (Less.less(yi)(xi)) {
              return true;
            } else if (!Equal.equal(yi)(xi)) {
              return false;
            }
          }
          return yl < xl;
        };
      };
    };
  }
};
