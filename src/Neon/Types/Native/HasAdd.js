'use strict';

// module Neon.Types.HasAdd

var addGeneric = function (x) {
  return function (y) {
    return x + y;
  };
};

module.exports = {
  nativeAddArray: function (x) {
    return function (y) {
      return x.concat(y);
    };
  },

  nativeAddBoolean: function (x) {
    return function (y) {
      if (x) {
        return x;
      } else {
        return y;
      }
    };
  },

  nativeAddInt: addGeneric,

  nativeAddNumber: addGeneric,

  nativeAddString: addGeneric
};
