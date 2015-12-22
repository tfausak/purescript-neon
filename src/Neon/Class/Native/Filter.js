'use strict';

// module Neon.Class.Filter

module.exports = {
  nativeFilterArray: function (f) {
    return function (xs) {
      return xs.filter(f);
    };
  }
};
