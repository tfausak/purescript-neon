'use strict';

// module Ax.Equal

var equalGeneric = function (x) {
  return function (y) {
    return x === y
  };
};

module.exports = {
  jsEqualArray: function (_) {
    return function (x) {
      return function (y) {
        var i;
        var xl = x.length;
        var yl = y.length;
        if (xl === yl) {
          for (i = 0; i < xl; ++i) {
            if (x[i] !== y[i]) {
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

  jsEqualBoolean: equalGeneric,

  jsEqualChar: equalGeneric,

  jsEqualInt: equalGeneric,

  jsEqualNumber: equalGeneric,

  jsEqualObject: equalGeneric,

  jsEqualString: equalGeneric
};
