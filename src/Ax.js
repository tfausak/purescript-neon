'use strict';

// module Ax

module.exports = {
  jsAddArray: function (x) {
    return function (y) {
      return x.concat(y);
    };
  },
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
  jsAddString: function (x) {
    return function (y) {
      return x + y;
    };
  },
  jsDivideInt: function (x) {
    return function (y) {
      return (x / y) | 0;
    };
  },
  jsDivideNumber: function (x) {
    return function (y) {
      return x / y;
    };
  },
  jsModuloInt: function (x) {
    return function (y) {
      return x % y;
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
