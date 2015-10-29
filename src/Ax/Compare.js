'use strict';

// module Ax.Compare

var compare = function (lessThan) {
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
  jsCompareArray: function (_) {
    return function (lessThan) {
      return function (equalTo) {
        return function (greaterThan) {
          return function (compare) {
            return function (x) {
              return function (y) {
                var i;
                var xl = x.length;
                var yl = y.length;
                for (i = 0; i < xl && i < yl; ++i) {
                  switch (compare(x[i])(y[i])) {
                  case lessThan: return lessThan;
                  case greaterThan: return greaterThan;
                  }
                }
                compare(lessThan)(equalTo)(greaterThan)(xl)(yl);
              };
            };
          };
        };
      };
    };
  },

  jsCompareChar: compare,

  jsCompareInt: compare,

  jsCompareNumber: compare,

  jsCompareString: compare
};