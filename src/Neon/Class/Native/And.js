'use strict';

// module Neon.Class.And

module.exports = {
  nativeAnd: function (x) {
    return function (y) {
      return x && y;
    };
  }
};
