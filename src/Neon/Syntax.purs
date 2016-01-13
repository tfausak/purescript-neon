module Neon.Syntax
  ( module Neon.Helper
  , bind
  ) where

import Neon.Class.Chain (class Chain, chain)
import Neon.Helper (negate)

bind :: forall a b c. (Chain a) => a b -> (b -> a c) -> a c
bind x f = chain f x
