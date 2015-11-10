'use strict';

// module Neon.Types.HasShow

module.exports = {
  nativeShowArray: function (_types) {
    return function (show) {
      return function (xs) {
        var s = xs.map(function (x) {
          return show(x);
        }).join(', ');
        return '[' + s + ']';
      };
    };
  },

  nativeShowChar: function (x) {
    if (x === '\'') {
      return '\\\'';
    } else if (x.match(/[ -~]/)) {
      return '\'' + x + '\'';
    } else {
      return '\'\\' + x.charCodeAt(0) + '\'';
    }
  },

  nativeShowInt: function (x) {
    return x.toString();
  },

  nativeShowNumber: function (x) {
    if (isNaN(x)) {
      return 'nan';
    } else if (isFinite(x)) {
      if (x === (x | 0)) {
        return x.toString() + '.0';
      } else {
        return x.toString();
      }
    } else if (x > 0) {
      return 'infinity';
    } else {
      return '0.0 - infinity'; // NOTE: purescript/purescript#1591
    }
  },

  nativeShowString: function (x) {
    return x
      .replace(/^|$/g, '"')
      .replace(/[^ -~]/g, function (c) {
        return '\\' + c.charCodeAt(0);
      });
  }
};
