'use strict';

// module Neon.Types.HasDivide

module.exports = {
  nativeDivideInt: function (x) {
    return function (y) {
      return (x / y) | 0;
    };
  },

  nativeDivideNumber: function (x) {
    return function (y) {
      return x / y;
    };
  },

  nativeModuloInt: function (x) {
    return function (y) {
      return x % y;
    };
  }
};