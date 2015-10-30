module Neon.Bounded
  ( Bounded
  , bottom
  , top
  ) where

foreign import jsBottomChar :: Char
foreign import jsBottomInt :: Int
foreign import jsTopChar :: Char
foreign import jsTopInt :: Int

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
  bottom = jsBottomInt
  top = jsTopInt

instance boundedFunction :: (Bounded b) => Bounded (a -> b) where
  bottom = \ _ -> bottom
  top = \ _ -> top
