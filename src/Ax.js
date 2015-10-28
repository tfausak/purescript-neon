'use strict';

// module Ax

module.exports = {
  jsAddInt: function (x) {
    return function (y) {
      return x + y;
    };
  },
  jsAddNumber: function (x) {
    return function (y) {
      return x + y;
    };
  },
  jsMultiplyInt: function (x) {
    return function (y) {
      return x * y;
    };
  },
  jsMultiplyNumber: function (x) {
    return function (y) {
      return x * y;
    };
  },
  jsSubtractInt: function (x) {
    return function (y) {
      return x - y;
    };
  },
  jsSubtractNumber: function (x) {
    return function (y) {
      return x - y;
    };
  }
};
