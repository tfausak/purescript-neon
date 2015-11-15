'use strict';

// module Neon.Types.HasTraverse

module.exports = {
  nativeTraverseArray: function (HasPure) {
    return function (f) {
      return function (x) {
        // traverse :: (a -> m b) -> t a -> m (t b)
        // apply :: m (a -> b) -> m a -> m b
        // pure :: a -> m a

        if (x.length === 0) {
          return HasPure.pure([]);
        } else {
          console.log(f); // TODO
          return undefined;
        }
      };
    };
  }
};
