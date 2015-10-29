'use strict';

// module Ax.Multiply

module.exports = {
  jsMultiplyInt: function (x) {
    return function (y) {
      return x * y;
    };
  },

  jsMultiplyNumber: function (x) {
    return function (y) {
      return x * y;
    };
  }
};
