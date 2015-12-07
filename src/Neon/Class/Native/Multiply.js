'use strict';

// module Neon.Class.Multiply

module.exports = {
  nativeMultiply: function (x) {
    return function (y) {
      return x * y;
    };
  }
};
