'use strict';

// module Neon.Map

module.exports = {
  nativeMapArray: function (f) {
    return function (x) {
      return x.map(f);
    };
  }
};
