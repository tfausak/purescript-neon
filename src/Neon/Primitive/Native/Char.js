'use strict';

// module Neon.Primitive.Char

module.exports = {
  nativeToLower: function (x) {
    return x.toLocaleLowerCase();
  },

  nativeToString: function (x) {
    return x;
  },

  nativeToUpper: function (x) {
    return x.toLocaleUpperCase();
  }
};
