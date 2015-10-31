'use strict';

// module Neon.Effects.Exception

module.exports = {
  catch: function (x) {
    return function (f) {
      return function () {
        try {
          return x();
        } catch (e) {
          if (e instanceof Error) {
            return f(x)();
          } else {
            return f(new Error(e.toString()))();
          }
        }
      };
    };
  },

  exception: function (x) {
    return new Error(x);
  },

  nativeShowException: function (x) {
    return x.toString();
  },

  throw: function (x) {
    return function () {
      throw x;
    };
  }
};