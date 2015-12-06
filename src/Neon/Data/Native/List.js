'use strict';

// module Neon.Data.List

module.exports = {
  nativeFromArray: function (Nil) {
    return function (Cons) {
      return function (xs) {
        var result = Nil;
        for (var i = xs.length - 1; i >= 0; --i) {
          var x = xs[i];
          result = Cons(x)(result);
        }
        return result;
      };
    };
  },

  nativeToArray: function (Nil) {
    return function (x) {
      var result = [];
      while (x !== Nil) {
        result.push(x.value0);
        x = x.value1;
      }
      return result;
    };
  }
};
