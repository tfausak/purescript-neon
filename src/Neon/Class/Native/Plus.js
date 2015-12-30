'use strict';

// module Neon.Class.Plus

module.exports = {
  nativePlus: function (x) {
    return function (y) {
      return y + x;
    };
  },

  nativePlusArray: function (x) {
    return function (y) {
      return y.concat(x);
    };
  }
};
