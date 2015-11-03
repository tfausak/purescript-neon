module Neon.Types.HasNot
  ( HasNot
  , not
  ) where

import Neon.Types.Bounded (Bounded)

-- | Laws:
-- | - `not top = bottom`
-- | - `not bottom = top`
class (Bounded a) <= HasNot a where
  not :: a -> a

instance notBoolean :: HasNot Boolean where
  not x = if x then false else true

instance notFunction :: (HasNot b) => HasNot (a -> b) where
  not f = \ x -> not (f x)
