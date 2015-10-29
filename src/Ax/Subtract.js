'use strict';

// module Ax.Subtract

module.exports = {
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
