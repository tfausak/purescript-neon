'use strict';

// module Neon.Types.IsEnumerable

module.exports = {
  nativeFromEnumChar: function (x) {
    return x.charCodeAt(0);
  },

  nativeToEnumChar: function (x) {
    return String.fromCharCode(x);
  }
};
