'use strict';

// module Neon.Types.HasCompare

var compareGeneric = function (lessThan) {
  return function (equalTo) {
    return function (greaterThan) {
      return function (x) {
        return function (y) {
          if (x < y) {
            return lessThan;
          } else if (x > y) {
            return greaterThan;
          } else {
            return equalTo;
          }
        };
      };
    };
  };
};

module.exports = {
  nativeCompareArray: function (HasCompare) {
    return function (lessThan) {
      return function (equalTo) {
        return function (greaterThan) {
          return function (x) {
            return function (y) {
              var i;
              var xl = x.length;
              var yl = y.length;
              for (i = 0; i < xl && i < yl; ++i) {
                switch (HasCompare.compare(x[i])(y[i])) {
                case lessThan: return lessThan;
                case greaterThan: return greaterThan;
                }
              }
              return compareGeneric(lessThan)(equalTo)(greaterThan)(xl)(yl);
            };
          };
        };
      };
    };
  },

  nativeCompareChar: compareGeneric,

  nativeCompareFunction: compareGeneric,

  nativeCompareInt: compareGeneric,

  nativeCompareNumber: compareGeneric,

  nativeCompareString: compareGeneric
};
