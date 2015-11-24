module Neon.Types.HasFromArray
  ( HasFromArray
  , fromArray
  ) where

foreign import nativeFromArrayString :: Array Char -> String

class HasFromArray a b where
  fromArray :: Array a -> b

instance stringHasFromArray :: HasFromArray Char String where
  fromArray cs = nativeFromArrayString cs
