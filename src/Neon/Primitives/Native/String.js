'use strict';

// module Neon.Primitives.String

module.exports = {
  fromCharArray: function (x) {
    return x.join('');
  },

  toCharArray: function (x) {
    return x.split('');
  }
};
