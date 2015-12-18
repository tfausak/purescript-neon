module Neon.Class.Or (class Or, or) where

foreign import nativeOr :: forall a. a -> a -> a

class Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or = nativeOr
