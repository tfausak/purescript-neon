'use strict';

// module Neon.Types.Map

module.exports = {
  nativeMapArray: function (f) {
    return function (x) {
      return x.map(f);
    };
  }
};
