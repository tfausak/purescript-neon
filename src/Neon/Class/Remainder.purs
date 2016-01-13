module Neon.Class.Remainder (Remainder, remainder) where

import Prelude as Prelude
import Unsafe.Coerce as Coerce

-- | Represents types that are divisible.
-- |
-- | ``` purescript
-- | remainder 2 7 -- 1
-- | remainder 2.0 7.0 -- 1.0
-- | ```
-- |
-- | Laws:
-- | - `(x / y) * y + (x % y) = x`
class Remainder a where
  remainder :: a -> a -> a

instance remainderInt :: Remainder Int where
  remainder y x = Prelude.mod x y

instance remainderNumber :: Remainder Number where
  remainder y x =
    let toInt = Coerce.unsafeCoerce :: Number -> Int
        toNumber = Coerce.unsafeCoerce :: Int -> Number
    in  toNumber (Prelude.mod (toInt x) (toInt y))
