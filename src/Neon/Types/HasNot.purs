module Neon.Types.HasNot
  ( HasNot
  , not
  ) where

import Neon.Types.IsBounded (IsBounded)

-- | Laws:
-- | - `not top = bottom`
-- | - `not bottom = top`
class (IsBounded a) <= HasNot a where
  not :: a -> a

instance booleanHasNot :: HasNot Boolean where
  not x = if x then false else true

instance functionHasNot :: (HasNot b) => HasNot (a -> b) where
  not f = \ x -> not (f x)
