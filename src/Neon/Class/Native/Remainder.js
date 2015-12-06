'use strict';

// module Neon.Class.Remainder

module.exports = {
  nativeRemainder: function (x) {
    return function (y) {
      return x % y;
    };
  }
};
