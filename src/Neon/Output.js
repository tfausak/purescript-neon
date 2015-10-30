'use strict';

// module Neon.Output

module.exports = {
  print: function (x) {
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
  }
};
