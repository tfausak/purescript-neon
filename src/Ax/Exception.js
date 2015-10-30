'use strict';

// module Ax.Exception

module.exports = {
  catch: function (x) {
    return function (f) {
      return function () {
        try {
          return x();
        } catch (e) {
          if (!(e instanceof Error)) {
            e = new Error(e.toString());
          }
          return f(e)();
        }
      };
    };
  },

  exception: function (x) {
    return new Error(x);
  },

  jsShowException: function (x) {
    return x.toString();
  },

  throw: function (x) {
    return function () {
      throw x;
    };
  }
};
