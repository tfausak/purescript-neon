'use strict';

// module Neon.Types.HasMap

module.exports = {
  nativeMapArray: function (f) {
    return function (x) {
      return x.map(f);
    };
  }
};
