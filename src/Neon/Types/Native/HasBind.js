'use strict';

// module Neon.Types.HasBind

module.exports = {
  nativeFlattenArray: function (x) {
    return x.reduce(function (a, e) {
      return a.concat(e);
    }, []);
  }
};
