'use strict';

// module Neon.Types.Apply

module.exports = {
  nativeFlattenArray: function (x) {
    return x.reduce(function (a, e) {
      return a.concat(e);
    }, []);
  }
};
