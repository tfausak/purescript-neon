module Neon.Class.Negate (class Negate, negate) where

foreign import nativeNegate :: forall a. a -> a

class Negate a where
  negate :: a -> a

instance negateBoolean :: Negate Boolean where
  negate x = if x then false else true

instance negateFunction :: (Negate b) => Negate (a -> b) where
  negate f = \ x -> negate (f x)

instance negateInt :: Negate Int where
  negate = nativeNegate

instance negateNumber :: Negate Number where
  negate = nativeNegate
