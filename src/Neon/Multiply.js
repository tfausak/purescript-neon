'use strict';

// module Neon.Multiply

var multiplyGeneric = function (x) {
  return function (y) {
    return x * y;
  };
};

module.exports = {
  nativeMultiplyInt: multiplyGeneric,

  nativeMultiplyNumber: multiplyGeneric
};
