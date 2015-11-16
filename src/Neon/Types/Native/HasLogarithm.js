'use strict';

// module Neon.Types.HasLogarithm

module.exports = {
  nativeLogarithmInt: function (b) {
    return function (x) {
      return (Math.log(x) / Math.log(b)) | 0;
    };
  },

  nativeLogarithmNumber: function (b) {
    return function (x) {
      return Math.log(x) / Math.log(b);
    };
  }
};
