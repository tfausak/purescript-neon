'use strict';

// module Neon.Data.Exception

module.exports = {
  nativeException: function (x) {
    return new Error(x);
  }
};
