'use strict';

// module Neon.Class.Apply

module.exports = {
  nativeApplyArray: function (fs) {
    return function (xs) {
      var result = [];
      xs.map(function (x) {
        fs.map(function (f) {
          result.push(f(x));
        });
      });
      return result;
    };
  }
};
