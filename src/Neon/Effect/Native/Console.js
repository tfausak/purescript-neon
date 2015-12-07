'use strict';

// module Neon.Effect.Console

module.exports = {
  nativeInfo: function (x) {
    return function () {
      console.info(x);
      return {};
    };
  },

  nativeLog: function (x) {
    return function () {
      console.log(x);
      return {};
    };
  },

  nativeWarn: function (x) {
    return function () {
      console.warn(x);
      return {};
    };
  },

  nativeError: function (x) {
    return function () {
      console.error(x);
      return {};
    };
  }
};
