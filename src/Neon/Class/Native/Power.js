'use strict';

// module Neon.Class.Power

module.exports = {
  nativePower: function (x) {
    return function (y) {
      return Math.pow(x, y);
    };
  }
};
