'use strict';

// module Neon.Types.Bind

module.exports = {
  nativeFlattenArray: function (x) {
    return x.reduce(function (a, e) {
      return a.concat(e);
    }, []);
  }
};
