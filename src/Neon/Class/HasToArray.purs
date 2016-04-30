module Neon.Class.HasToArray where

import Data.List as List
import Data.String as String
import Neon.Data as Data

-- | Represents types that can be converted to an array.
-- |
-- | ``` purescript
-- | toArray (Cons 1 Nil) :: Array Int -- [1]
-- | toArray (Just 1) :: Array Int -- [1]
-- | toArray "ab" :: String -- ['a', 'b']
-- | ```
class HasToArray a b where
  toArray :: a -> Array b

instance arrayHasToArray :: HasToArray (Array a) a where
  toArray xs = xs

instance listHasToArray :: HasToArray (Data.List a) a where
  toArray xs = List.toUnfoldable xs

instance maybeHasToArray :: HasToArray (Data.Maybe a) a where
  toArray mx = case mx of
    Data.Nothing -> []
    Data.Just x -> [x]

instance stringHasToArray :: HasToArray String Char where
  toArray x = String.toCharArray x
