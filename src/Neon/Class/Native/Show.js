'use strict';

// module Neon.Class.Show

module.exports = {
  nativeShowString: function (x) {
    return x
      .replace(/"/g, '\\"')
      .replace(/^/, '"')
      .replace(/$/, '"');
  }
};
