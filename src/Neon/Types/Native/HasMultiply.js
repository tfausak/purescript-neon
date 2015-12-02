'use strict';

// module Neon.Types.HasMultiply

var multiplyGeneric = function (x) {
  return function (y) {
    return x * y;
  };
};

module.exports = {
  nativeMultiplyInt: multiplyGeneric,

  nativeMultiplyNumber: multiplyGeneric
};
