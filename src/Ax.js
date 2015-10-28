'use strict';

// module Ax

module.exports = {
  addInt: function (x) {
    return function (y) {
      return x + y;
    };
  },
  addNumber: function (x) {
    return function (y) {
      return x + y;
    };
  },
  multiplyInt: function (x) {
    return function (y) {
      return x * y;
    };
  },
  multiplyNumber: function (x) {
    return function (y) {
      return x * y;
    };
  },
  subtractInt: function (x) {
    return function (y) {
      return x - y;
    };
  },
  subtractNumber: function (x) {
    return function (y) {
      return x - y;
    };
  }
};
