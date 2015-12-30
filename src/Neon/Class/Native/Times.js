'use strict';

// module Neon.Class.Times

module.exports = {
  nativeTimes: function (x) {
    return function (y) {
      return y * x;
    };
  }
};
