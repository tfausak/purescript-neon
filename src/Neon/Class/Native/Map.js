'use strict';

// module Neon.Class.Map

module.exports = {
  nativeMapArray: function (f) {
    return function (x) {
      return x.map(f);
    };
  }
};
