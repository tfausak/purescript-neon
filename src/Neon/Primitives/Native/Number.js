'use strict';

// module Neon.Primitives.Number

module.exports = {
  ceiling: function (x) {
    return Math.ceil(x);
  },

  floor: function (x) {
    return Math.floor(x);
  },

  infinity: Number.POSITIVE_INFINITY,

  isFinite: function (x) {
    return isFinite(x);
  },

  isNaN: function (x) {
    return isNaN(x);
  },

  nan: NaN,

  round: function (x) {
    return Math.round(x);
  },

  truncate: function (x) {
    if (x > 0) {
      return this.floor(x);
    } else {
      return this.ceiling(x);
    }
  }
};
