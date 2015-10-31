'use strict';

// module Neon.Effects.Effect

module.exports = {
  nativeApplyEffect: function (f) {
    return function (x) {
      return function () {
        return f()(x());
      };
    };
  },

  nativeBindEffect: function (x) {
    return function (f) {
      return function () {
        return f(x())();
      };
    };
  },

  nativeMapEffect: function (f) {
    return function (x) {
      return function () {
        return f(x());
      };
    };
  },

  nativePureEffect: function (x) {
    return function () {
      return x;
    };
  },

  nativeRunPure: function (x) {
    return x();
  }
};
