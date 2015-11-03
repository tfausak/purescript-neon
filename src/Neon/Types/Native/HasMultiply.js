'use strict';

// module Neon.Types.HasMultiply

var multiplyGeneric = function (x) {
  return function (y) {
    return x * y;
  };
};

module.exports = {
  nativeMultiplyBoolean: function (x) {
    return function (y) {
      if (x) {
        return y;
      } else {
        return x;
      }
    };
  },

  nativeMultiplyInt: multiplyGeneric,

  nativeMultiplyNumber: multiplyGeneric
};
