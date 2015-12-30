'use strict';

// module Neon.Class.Minus

module.exports = {
  nativeMinus: function (x) {
    return function (y) {
      return y - x;
    };
  },

  nativeMinusArray: function (Equal) {
    return function (xs) {
      return function (ys) {
        return ys.filter(function (y) {
          return !xs.some(function (x) {
            return Equal.equal(x)(y);
          });
        });
      };
    };
  }
};
