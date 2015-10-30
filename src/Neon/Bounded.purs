module Neon.Bounded
  ( Bounded
  , bottom
  , top
  ) where

foreign import nativeBottomChar :: Char
foreign import nativeBottomInt :: Int
foreign import nativeTopChar :: Char
foreign import nativeTopInt :: Int

-- TODO: Lawless!
class Bounded a where
  bottom :: a
  top :: a

instance boundedBoolean :: Bounded Boolean where
  bottom = false
  top = true

instance boundedChar :: Bounded Char where
  bottom = nativeBottomChar
  top = nativeTopChar

instance boundedInt :: Bounded Int where
  bottom = nativeBottomInt
  top = nativeTopInt

instance boundedFunction :: (Bounded b) => Bounded (a -> b) where
  bottom = \ _ -> bottom
  top = \ _ -> top
