'use strict';

// module Neon.Values.Text

module.exports = {
  nativeCoerce: function (x) {
    return x;
  },

  nativeMap: function (f) {
    return function (x) {
      var y = '';
      var i;
      for (i = 0; i < x.length; ++i) {
        y += f(x[i]);
      }
      return y;
    };
  }
};
