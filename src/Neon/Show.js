'use strict';

// module Neon.Show

module.exports = {
  jsShowArray: function (_) {
    return function (show) {
      return function (xs) {
        var s = xs.map(function (x) {
          return show(x);
        }).join(', ');
        return '[' + s + ']';
      };
    };
  },

  jsShowChar: function (x) {
    if (x === '\'') {
      return '\\\'';
    } else {
      return '\'' + x + '\'';
    }
  },

  jsShowInt: function (x) {
    return x.toString();
  },

  jsShowNumber: function (x) {
    if (x === (x | 0)) {
      return x.toString() + '.0';
    } else {
      return x.toString();
    }
  },

  jsShowString: function (x) {
    // TODO: PureScript doesn't support JSON escape codes.
    return JSON.stringify(x);
  }
};
