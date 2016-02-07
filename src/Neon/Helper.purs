module Neon.Helper where

import Neon.Primitive as Primitive

-- | A type-restricted version of `always`.
-- |
-- | ``` purescript
-- | asTypeOf [1] [] -- [] :: Array Int
-- | ```
asTypeOf :: forall a. a -> a -> a
asTypeOf y x = Primitive.always y x
