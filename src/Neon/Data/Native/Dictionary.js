'use strict';

//module Neon.Data.Dictionary

module.exports = {
  nativeFromArray: function (xs) {
    var result = {};
    xs.map(function (x) {
      result[x.first] = x.second;
    });
    return result;
  },

  nativeToArray: function (xs) {
    var result = [];
    for (var p in xs) {
      if (xs.hasOwnProperty(p)) {
        result.push({ first: p, second: xs[p] });
      }
    }
    return result;
  }
};
