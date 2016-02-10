module Neon.Class.Remainder where

import Prelude as Prelude
import Unsafe.Coerce as Coerce

class Remainder a where
  remainder :: a -> a -> a

instance remainderInt :: Remainder Int where
  remainder y x = Prelude.mod x y

instance remainderNumber :: Remainder Number where
  remainder y x =
    let toInt = Coerce.unsafeCoerce :: Number -> Int
    in  Coerce.unsafeCoerce (Prelude.mod (toInt x) (toInt y))
