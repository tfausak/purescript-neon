module Neon.Class.Or (Or, or) where

foreign import nativeOr :: forall a. a -> a -> a

class Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or = nativeOr

instance orFunction :: (Or b) => Or (a -> b) where
  or f g = \ x -> or (f x) (g x)
