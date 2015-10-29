'use strict';

// module Ax.Add

module.exports = {
  jsAddArray: function (x) {
    return function (y) {
      return x.concat(y);
    };
  },

  jsAddInt: function (x) {
    return function (y) {
      return x + y;
    };
  },

  jsAddNumber: function (x) {
    return function (y) {
      return x + y;
    };
  },

  jsAddString: function (x) {
    return function (y) {
      return x + y;
    };
  }
};
