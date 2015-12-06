'use strict';

// module Neon.Class.Divide

module.exports = {
  nativeDivide: function (x) {
    return function (y) {
      return x / y;
    };
  }
};
