'use strict';

// module Neon.Class.DividedBy

module.exports = {
  nativeDividedBy: function (x) {
    return function (y) {
      return y / x;
    };
  },

  nativeDividedByInt: function (x) {
    return function (y) {
      return (y / x) | 0;
    };
  }
};
