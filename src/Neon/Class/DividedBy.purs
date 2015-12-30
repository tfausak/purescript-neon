module Neon.Class.DividedBy (class DividedBy, dividedBy) where

foreign import nativeDividedBy :: forall a. a -> a -> a
foreign import nativeDividedByInt :: Int -> Int -> Int

class DividedBy a where
  dividedBy :: a -> a -> a

instance dividedByInt :: DividedBy Int where
  dividedBy = nativeDividedByInt

instance dividedByNumber :: DividedBy Number where
  dividedBy = nativeDividedBy
