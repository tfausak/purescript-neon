'use strict';

// module Neon.Data.Exception

module.exports = {
  nativeEqual: function (x) {
    return function (y) {
      return x === y;
    };
  },

  nativeFromException: function (x) {
    return x.message;
  },

  nativeToException: function (x) {
    return new Error(x);
  }
};
