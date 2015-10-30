'use strict';

// module Neon.Subtract

var subtractGeneric = function (x) {
  return function (y) {
    return x - y;
  };
};

module.exports = {
  jsSubtractInt: subtractGeneric,

  jsSubtractNumber: subtractGeneric
};
