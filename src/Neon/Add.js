'use strict';

// module Neon.Add

var addGeneric = function (x) {
  return function (y) {
    return x + y;
  };
};

module.exports = {
  jsAddArray: function (x) {
    return function (y) {
      return x.concat(y);
    };
  },

  jsAddInt: addGeneric,

  jsAddNumber: addGeneric,

  jsAddString: addGeneric
};
