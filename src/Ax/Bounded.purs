module Ax.Bounded
  ( Bounded
  , bottom
  , top
  ) where

foreign import jsBottomChar :: Char
foreign import jsTopChar :: Char

class Bounded a where
  bottom :: a
  top :: a

instance boundedBoolean :: Bounded Boolean where
  bottom = false
  top = true

instance boundedChar :: Bounded Char where
  bottom = jsBottomChar
  top = jsTopChar

instance boundedInt :: Bounded Int where
  bottom = -2147483648
  top = 2147483647

instance boundedFunction :: (Bounded b) => Bounded (a -> b) where
  bottom = \ _ -> bottom
  top = \ _ -> top
