'use strict';

// module Neon.Values.Nullable

module.exports = {
  fromNullable: function (HasEmpty) {
    return function (HasPure) {
      return function (x) {
        if (x === null) {
          return HasEmpty.empty();
        } else {
          return HasPure.pure(x);
        }
      };
    };
  },

  notNull: function (x) {
    return x;
  },

  null: null
};
