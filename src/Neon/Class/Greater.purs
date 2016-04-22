module Neon.Class.Greater where

import Neon.Class.HasEqual as HasEqual
import Neon.Class.HasFromArray as HasFromArray
import Neon.Data as Data
import Prelude as Prelude

class Greater a where
  greater :: a -> a -> Boolean

instance greaterArray :: (HasEqual.HasEqual a, Greater a) => Greater (Array a) where
  greater ys xs =
    let toList = HasFromArray.fromArray :: Array a -> Data.List a
    in  greater (toList ys) (toList xs)

instance greaterBoolean :: Greater Boolean where
  greater y x = x Prelude.> y

instance greaterChar :: Greater Char where
  greater y x = x Prelude.> y

instance greaterInt :: Greater Int where
  greater y x = x Prelude.> y

instance greaterList :: (HasEqual.HasEqual a, Greater a) => Greater (Data.List a) where
  greater ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Cons _ _, ys: Data.Nil } -> true
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> if HasEqual.equal yh xh
      then greater yt xt
      else greater yh xh
    _ -> false

instance greaterNumber :: Greater Number where
  greater y x = x Prelude.> y

instance greaterString :: Greater String where
  greater y x = x Prelude.> y
