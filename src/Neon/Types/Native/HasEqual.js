'use strict';

// module Neon.Types.HasEqual

var equalGeneric = function (x) {
  return function (y) {
    return x === y;
  };
};

module.exports = {
  nativeEqualArray: function (types) {
    return function (x) {
      return function (y) {
        var i;
        var xl = x.length;
        var yl = y.length;
        if (xl === yl) {
          for (i = 0; i < xl; ++i) {
            if (!types.equal(x[i])(y[i])) {
              return false;
            }
          }
          return true;
        } else {
          return false;
        }
      };
    };
  },

  nativeEqualBoolean: equalGeneric,

  nativeEqualChar: equalGeneric,

  nativeEqualFunction: equalGeneric,

  nativeEqualInt: equalGeneric,

  nativeEqualNumber: equalGeneric,

  nativeEqualObject: equalGeneric,

  nativeEqualString: equalGeneric
};
