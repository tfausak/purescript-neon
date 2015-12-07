'use strict';

// module Neon.Class.Or

module.exports = {
  nativeOr: function (x) {
    return function (y) {
      return x || y;
    };
  }
};
