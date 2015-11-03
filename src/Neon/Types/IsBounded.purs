module Neon.Types.IsBounded
  ( IsBounded
  , bottom
  , top
  ) where

import Neon.Primitives.Function (constant)

foreign import nativeBottomChar :: Char
foreign import nativeBottomInt :: Int
foreign import nativeTopChar :: Char
foreign import nativeTopInt :: Int

-- This class is lawless. It could have laws if it implied `HasCompare`, but it
-- doesn't.
class IsBounded a where
  bottom :: a
  top :: a

instance booleanIsBounded :: IsBounded Boolean where
  bottom = false
  top = true

instance charIsBounded :: IsBounded Char where
  bottom = nativeBottomChar
  top = nativeTopChar

instance intIsBounded :: IsBounded Int where
  bottom = nativeBottomInt
  top = nativeTopInt

instance functionIsBounded :: (IsBounded b) => IsBounded (a -> b) where
  bottom = constant bottom
  top = constant top
