'use strict';

// module Ax.Effect

module.exports = {
  jsApplyEffect: function (f) {
    return function (x) {
      return function () {
        return f()(x());
      };
    };
  },

  jsBindEffect: function (x) {
    return function (f) {
      return function () {
        return f(x())();
      };
    };
  },

  jsMapEffect: function (f) {
    return function (x) {
      return function () {
        return f(x());
      };
    };
  },

  jsPureEffect: function (x) {
    return function () {
      return x;
    };
  },

  jsRunPure: function (x) {
    return x();
  }
};
