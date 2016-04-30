-- | Functions that operate on primitve data types. Note that not all data
-- | types are represented. That's either because there's no actions you can
-- | take on them in general (like `Object`s) or because the actions are in
-- | type classes instead (for `Array`s).
module Neon.Primitive
  ( module Neon.Primitive.Char
  , module Neon.Primitive.Function
  , module Neon.Primitive.Int
  , module Neon.Primitive.Number
  ) where

-- Array
-- Boolean
import Neon.Primitive.Char as Neon.Primitive.Char
import Neon.Primitive.Function as Neon.Primitive.Function
import Neon.Primitive.Int as Neon.Primitive.Int
import Neon.Primitive.Number as Neon.Primitive.Number
-- Object
-- String
