'use strict';

// module Neon.Effect.Exception

module.exports = {
  nativeCatch: function (x) {
    return function (f) {
      return function () {
        try {
          return x();
        } catch (e) {
          if (e instanceof Error) {
            return f(e)();
          } else {
            return f(new Error(e.toString()))();
          }
        }
      };
    };
  },

  nativeThrow: function (x) {
    return function () {
      throw x;
    };
  }
};
