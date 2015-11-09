'use strict';

// module Neon.Effects.Console

module.exports = {
  info: function (x) {
    return function () {
      console.info(x);
      return {};
    };
  },

  log: function (x) {
    return function () {
      console.log(x);
      return {};
    };
  },

  warn: function (x) {
    return function () {
      console.warn(x);
      return {};
    };
  },

  error: function (x) {
    return function () {
      console.error(x);
      return {};
    };
  }
};
