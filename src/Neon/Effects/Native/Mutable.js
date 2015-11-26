'use strict';

// module Neon.Effects.Mutable

module.exports = {
  getMutableReference: function (r) {
    return function () {
      return r.value;
    };
  },

  newMutableReference: function (x) {
    return function () {
      return { value: x };
    };
  },

  runMutable: function (f) {
    return f;
  },

  setMutableReference: function (r) {
    return function (x) {
      return function () {
        return r.value = x;
      };
    };
  }
};
