'use strict';

// module Neon.Effects.Effect

module.exports = {
  nativeApply: function (f) {
    return function (x) {
      return function () {
        return f()(x());
      };
    };
  },

  nativeBind: function (x) {
    return function (f) {
      return function () {
        return f(x())();
      };
    };
  },

  nativeMap: function (f) {
    return function (x) {
      return function () {
        return f(x());
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
