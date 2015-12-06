module Neon.Class.And (And, and) where

foreign import nativeAnd :: forall a. a -> a -> a

class And a where
  and :: a -> a -> a

instance andBoolean :: And Boolean where
  and = nativeAnd

instance andFunction :: (And b) => And (a -> b) where
  and f g = \ x -> and (f x) (g x)
