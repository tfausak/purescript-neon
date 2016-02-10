module Neon.Class.Greater where

import Neon.Class.Equal as Equal
import Neon.Class.FromArray as FromArray
import Neon.Data as Data
import Prelude as Prelude

class Greater a where
  greater :: a -> a -> Boolean

instance greaterArray :: (Equal.Equal a, Greater a) => Greater (Array a) where
  greater ys xs =
    let toList = FromArray.fromArray :: Array a -> Data.List a
    in  greater (toList ys) (toList xs)

instance greaterBoolean :: Greater Boolean where
  greater y x = x Prelude.> y

instance greaterChar :: Greater Char where
  greater y x = x Prelude.> y

instance greaterInt :: Greater Int where
  greater y x = x Prelude.> y

instance greaterList :: (Equal.Equal a, Greater a) => Greater (Data.List a) where
  greater ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Cons _ _, ys: Data.Nil } -> true
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> if Equal.equal yh xh
      then greater yt xt
      else greater yh xh
    _ -> false

instance greaterNumber :: Greater Number where
  greater y x = x Prelude.> y

instance greaterString :: Greater String where
  greater y x = x Prelude.> y
