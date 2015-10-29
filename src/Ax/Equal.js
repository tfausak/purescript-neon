'use strict';

// module Ax.Equal

module.exports = {
  jsEqualArray: function (x) {
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
  },

  jsEqualBoolean: function (x) {
    return function (y) {
      return x === y;
    };
  },

  jsEqualChar: function (x) {
    return function (y) {
      return x === y;
    };
  },

  jsEqualInt: function (x) {
    return function (y) {
      return x === y;
    };
  },

  jsEqualNumber: function (x) {
    return function (y) {
      return x === y;
    };
  },

  jsEqualObject: function (x) {
    return function (y) {
      return x === y;
    };
  },

  jsEqualString: function (x) {
    return function (y) {
      return x === y;
    };
  }
};
