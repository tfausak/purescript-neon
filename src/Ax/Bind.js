'use strict';

// module Ax.Bind

module.exports = {
  jsFlattenArray: function (x) {
    return x.reduce(function (a, e) {
      return a.concat(e);
    }, []);
  }
};
