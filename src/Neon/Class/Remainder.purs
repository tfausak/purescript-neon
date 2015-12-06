module Neon.Class.Remainder (Remainder, remainder) where

foreign import nativeRemainder :: forall a. a -> a -> a

class Remainder a where
  remainder :: a -> a -> a

instance remainderInt :: Remainder Int where
  remainder = nativeRemainder
