'use strict';

// module Neon.Map

module.exports = {
  jsMapArray: function (f) {
    return function (x) {
      return x.map(f);
    };
  }
};
