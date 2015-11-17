'use strict';

// module Neon.Values.Regex

module.exports = {
  nativeEqual: function (x) {
    return function (y) {
      return x.toString() === y.toString();
    };
  },

  nativeRegex: function (string) {
    return function (flags) {
      return new RegExp(string,
        (flags.ignoreCase && 'i' || '') +
        (flags.global && 'g' || '') +
        (flags.multiline && 'm' || ''));
    };
  },

  nativeShow: function (x) {
    return 'regex ' +
      JSON.stringify(x.source) +
      ' { ignoreCase: ' +
      x.ignoreCase +
      ', global: ' +
      x.global +
      ', multiline: ' +
      x.multiline +
      ' }';
  },

  nativeTest: function (string) {
    return function (pattern) {
      return pattern.test(string);
    };
  }
};
