'use strict';

// module Neon.Class.Add

module.exports = {
  nativeAdd: function (x) {
    return function (y) {
      return x + y;
    };
  },

  nativeAddArray: function (x) {
    return function (y) {
      return x.concat(y);
    };
  }
};
