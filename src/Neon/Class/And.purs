module Neon.Class.And (class And, and) where

foreign import nativeAnd :: forall a. a -> a -> a

class And a where
  and :: a -> a -> a

instance andBoolean :: And Boolean where
  and = nativeAnd
