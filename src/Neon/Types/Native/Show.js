'use strict';

// module Neon.Types.Show

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
    } else {
      return '\'' + x + '\'';
    }
  },

  nativeShowInt: function (x) {
    return x.toString();
  },

  nativeShowNumber: function (x) {
    if (x === (x | 0)) {
      return x.toString() + '.0';
    } else {
      return x.toString();
    }
  },

  nativeShowString: function (x) {
    // TODO: PureScript doesn't support JSON escape codes.
    return JSON.stringify(x);
  }
};
