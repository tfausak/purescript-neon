module Neon.Class.HasRemainder where

import Prelude as Prelude
import Unsafe.Coerce as Coerce

-- | Represents types that are divisible.
-- |
-- | ``` purescript
-- | 7 :remainder 2 -- 1
-- | 7.0 :remainder 2.0 -- 1.0
-- | ```
class HasRemainder a where
  remainder :: a -> a -> a

instance intHasRemainder :: HasRemainder Int where
  remainder y x = Prelude.mod x y

instance numberHasRemainder :: HasRemainder Number where
  remainder y x =
    let toInt = Coerce.unsafeCoerce :: Number -> Int
        toNumber = Coerce.unsafeCoerce :: Int -> Number
    in  toNumber (Prelude.mod (toInt x) (toInt y))
