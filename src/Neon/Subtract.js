'use strict';

// module Neon.Subtract

var subtractGeneric = function (x) {
  return function (y) {
    return x - y;
  };
};

module.exports = {
  nativeSubtractInt: subtractGeneric,

  nativeSubtractNumber: subtractGeneric
};
