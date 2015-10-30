'use strict';

// module Neon.Add

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

  nativeAddInt: addGeneric,

  nativeAddNumber: addGeneric,

  nativeAddString: addGeneric
};
