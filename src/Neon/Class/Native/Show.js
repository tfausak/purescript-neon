'use strict';

// module Neon.Class.Show

module.exports = {
  nativeShow: function (x) {
    return x.toString();
  },

  nativeShowArray: function (Show) {
    return function (x) {
      return x
        .map(Show.show)
        .join(', ')
        .replace(/^/, '[')
        .replace(/$/, ']');
    };
  },

  nativeShowChar: function (x) {
    if ((x < ' ') || (x > '~')) {
      return '\'\\' + x.charCodeAt(0) + '\'';
    } else if (x == '\'') {
      return '\'\\' + x + '\'';
    } else {
      return '\'' + x + '\'';
    }
  },

  nativeShowNumber: function (x) {
    if (x === (x | 0)) {
      return x.toFixed(1);
    } else {
      return x.toString();
    }
  },

  nativeShowString: function (x) {
    return x
      .replace(/"/g, '\\"')
      .replace(/[^ -~]/g, function (c) {
        return '\\' + c.charCodeAt(0);
      })
      .replace(/^/, '"')
      .replace(/$/, '"');
  }
};
