module Neon.Class.HasFromArray where

import Data.Array as Array
import Data.List as List
import Data.String as String
import Neon.Data as Data

-- | Represents types that can be converted from an array.
-- |
-- | ``` purescript
-- | fromArray [1] :: List Int -- Cons 1 Nil
-- | fromArray [1] :: Maybe Int -- Just 1
-- | fromArray ['a', 'b'] :: String -- "ab"
-- | ```
class HasFromArray a b where
  fromArray :: Array a -> b

instance arrayHasFromArray :: HasFromArray a (Array a) where
  fromArray xs = xs

instance listHasFromArray :: HasFromArray a (Data.List a) where
  fromArray xs = List.fromFoldable xs

instance maybeHasFromArray :: HasFromArray a (Data.Maybe a) where
  fromArray xs = Array.head xs

instance stringHasFromArray :: HasFromArray Char String where
  fromArray xs = String.fromCharArray xs
