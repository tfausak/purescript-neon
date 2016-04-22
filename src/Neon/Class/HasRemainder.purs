module Neon.Class.HasRemainder where

import Prelude as Prelude
import Unsafe.Coerce as Coerce

class HasRemainder a where
  remainder :: a -> a -> a

instance intHasRemainder :: HasRemainder Int where
  remainder y x = Prelude.mod x y

instance numberHasRemainder :: HasRemainder Number where
  remainder y x =
    let toInt = Coerce.unsafeCoerce :: Number -> Int
    in  Coerce.unsafeCoerce (Prelude.mod (toInt x) (toInt y))
