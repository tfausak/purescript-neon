'use strict';

// module Neon.Types.HasApply

module.exports = {
  nativeFlattenArray: function (x) {
    return x.reduce(function (a, e) {
      return a.concat(e);
    }, []);
  }
};
