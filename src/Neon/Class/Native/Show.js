'use strict';

// module Neon.Class.Show

module.exports = {
  nativeShow: function (x) {
    return x.toString();
  },

  nativeShowString: function (x) {
    return x
      .replace(/"/g, '\\"')
      .replace(/^/, '"')
      .replace(/$/, '"');
  }
};
