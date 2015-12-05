'use strict';

// module Neon.Class.Equal

module.exports = {
  nativeEqual: function (x) {
    return function (y) {
      return x === y;
    };
  }
};
