module Neon.Types.HasToArray
  ( HasToArray
  , toArray
  ) where

foreign import nativeToArrayString :: String -> Array Char

class HasToArray a b where
  toArray :: a -> Array b

instance stringHasToArray :: HasToArray String Char where
  toArray x = nativeToArrayString x
