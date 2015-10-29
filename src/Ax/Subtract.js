'use strict';

// module Ax.Subtract

var subtractGeneric = function (x) {
  return function (y) {
    return x - y;
  };
};

module.exports = {
  jsSubtractInt: subtractGeneric,

  jsSubtractNumber: subtractGeneric
};
