'use strict';

// module Neon.Class.Subtract

module.exports = {
  nativeSubtract: function (x) {
    return function (y) {
      return x - y;
    };
  }
};
