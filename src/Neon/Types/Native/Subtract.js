'use strict';

// module Neon.Types.Subtract

var subtractGeneric = function (x) {
  return function (y) {
    return x - y;
  };
};

module.exports = {
  nativeSubtractInt: subtractGeneric,

  nativeSubtractNumber: subtractGeneric
};
