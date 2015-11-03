'use strict';

// module Neon.Types.HasFold

module.exports = {
  nativeFoldlArray: function (f) {
    return function (y) {
      return function (xs) {
        return xs.reduce(function (a, x) {
          return f(a)(x);
        }, y);
      };
    };
  },

  nativeFoldrArray: function (f) {
    return function (y) {
      return function (xs) {
        return xs.reverse().reduce(function (a, x) {
          return f(x)(a);
        }, y);
      };
    };
  }
};
