'use strict';

// module Neon.Effect.Effect

module.exports = {
  nativeBind: function (x) {
    return function (f) {
      return function () {
        return f(x())();
      };
    };
  },

  nativePure: function (x) {
    return function () {
      return x;
    };
  },

  nativeRunEffect: function (x) {
    return x();
  }
};
