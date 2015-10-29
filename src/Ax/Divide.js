'use strict';

// module Ax.Divide

module.exports = {
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
  }
};
