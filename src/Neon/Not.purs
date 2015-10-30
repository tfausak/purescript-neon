module Neon.Not
  ( Not
  , not
  ) where

import Neon.Bounded (Bounded)

class (Bounded a) <= Not a where
  not :: a -> a

instance notBoolean :: Not Boolean where
  not x = if x then false else true

instance notFunction :: (Not b) => Not (a -> b) where
  not f = \ x -> not (f x)
