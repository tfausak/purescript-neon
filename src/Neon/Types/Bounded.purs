module Neon.Types.Bounded
  ( Bounded
  , bottom
  , top
  ) where

import Neon.Primitives.Function (constant)

foreign import nativeBottomChar :: Char
foreign import nativeBottomInt :: Int
foreign import nativeTopChar :: Char
foreign import nativeTopInt :: Int

-- This class is lawless. It could have laws if it implied `Compare`, but it
-- doesn't.
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
  bottom = constant bottom
  top = constant top
