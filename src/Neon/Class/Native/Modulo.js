'use strict';

// module Neon.Class.Modulo

module.exports = {
  nativeModulo: function (x) {
    return function (y) {
      return y % x;
    };
  }
};
