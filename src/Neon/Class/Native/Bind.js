'use strict';

// module Neon.Class.Bind

module.exports = {
  nativeBindArray: function (xs) {
    return function (f) {
      var result = [];
      xs.map(function (x) {
        result = result.concat(f(x));
      });
      return result;
    };
  }
};
