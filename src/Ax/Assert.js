'use strict';

// module Ax.Assert

module.exports = {
  assert: function (x) {
    return function () {
      if (x) {
        return {};
      } else {
        throw new Error('assertion failed');
      }
    };
  }
};
