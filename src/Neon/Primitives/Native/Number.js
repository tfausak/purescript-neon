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

  nan: NaN
};
