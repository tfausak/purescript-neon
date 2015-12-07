'use strict';

// module Neon.Class.Reduce

module.exports = {
  nativeReduceArray: function (f) {
    return function (y) {
      return function (xs) {
        return xs.reduce(function (a, x) {
          return f(a)(x);
        }, y);
      };
    };
  }
};
