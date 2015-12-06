'use strict';

// module Neon.Primitive.Number

module.exports = {
  nativeCeiling: function (x) {
    return Math.ceil(x) | 0;
  },

  nativeFloor: function (x) {
    return Math.floor(x) | 0;
  },

  nativeInfinity: Number.POSITIVE_INFINITY,

  nativeNan: Number.NaN,

  nativeRound: function (x) {
    return Math.round(x) | 0;
  },

  nativeTruncate: function (x) {
    return x | 0;
  }
};
