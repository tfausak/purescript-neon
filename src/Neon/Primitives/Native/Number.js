'use strict';

// module Neon.Primitives.Number

module.exports = {
  isFinite: function (x) {
    return isFinite(x);
  },

  isInfinite: function (x) {
    return !isFinite(x);
  },

  infinity: Number.POSITIVE_INFINITY,

  isNaN: function (x) {
    return isNaN(x);
  },

  nan: NaN,

  round: function (x) {
    return Math.round(x);
  },

  ceiling: function (x) {
    return Math.ceil(x);
  },

  floor: function (x) {
    return Math.floor(x);
  },

  truncate: function (x) {
    if (x > 0) {
      return Math.floor(x);
    } else {
      return Math.ceil(x);
    }
  }
};
