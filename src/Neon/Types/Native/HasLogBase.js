'use strict';

// module Neon.Types.HasLogBase

module.exports = {
  nativeLogBaseInt: function (b) {
    return function (x) {
      return (Math.log(x) / Math.log(b)) | 0;
    };
  },

  nativeLogBaseNumber: function (b) {
    return function (x) {
      return Math.log(x) / Math.log(b);
    };
  }
};
