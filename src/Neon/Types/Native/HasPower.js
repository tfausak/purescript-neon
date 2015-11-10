'use strict';

// module Neon.Types.HasPower

module.exports = {
  nativePowerInt: function (x) {
    return function (y) {
      return Math.pow(x, y) | 0;
    };
  },

  nativePowerNumber: function (x) {
    return function (y) {
      return Math.pow(x, y);
    };
  }
};
