'use strict';

//module Neon.Data.Dictionary

module.exports = {
  nativeAdd: function (xs) {
    return function (ys) {
      var result = {};
      var p;
      for (p in xs) {
        if (xs.hasOwnProperty(p)) {
          result[p] = xs[p];
        }
      }
      for (p in ys) {
        if (ys.hasOwnProperty(p)) {
          result[p] = ys[p];
        }
      }
      return result;
    };
  },

  nativeFromArray: function (xs) {
    var result = {};
    xs.map(function (x) {
      result[x.first] = x.second;
    });
    return result;
  },

  nativeMap: function (f) {
    return function (xs) {
      var result = {};
      for (var p in xs) {
        if (xs.hasOwnProperty(p)) {
          result[p] = f(xs[p]);
        }
      }
      return result;
    };
  },

  nativeReduce: function (f) {
    return function (y) {
      return function (xs) {
        for (var p in xs) {
          if (xs.hasOwnProperty(p)) {
            y = f(y)(xs[p]);
          }
        }
        return y;
      };
    };
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
