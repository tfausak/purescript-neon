module Neon.Class.Not (Not, not) where

foreign import nativeNot :: forall a. a -> a

class Not a where
  not :: a -> a

instance notBoolean :: Not Boolean where
  not = nativeNot
