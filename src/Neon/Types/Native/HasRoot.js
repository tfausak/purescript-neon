'use strict';

// module Neon.Types.HasRoot

module.exports = {
  nativeRootInt: function (n) {
    return function (x) {
      return Math.pow(x, 1 / n) | 0;
    };
  },

  nativeRootNumber: function (n) {
    return function (x) {
      return Math.pow(x, 1 / n);
    };
  }
};
