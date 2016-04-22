module Neon.Class.Less where

import Neon.Class.HasEqual as HasEqual
import Neon.Class.HasFromArray as HasFromArray
import Neon.Data as Data
import Prelude as Prelude

class Less a where
  less :: a -> a -> Boolean

instance lessArray :: (HasEqual.HasEqual a, Less a) => Less (Array a) where
  less ys xs =
    let toList = HasFromArray.fromArray :: Array a -> Data.List a
    in  less (toList ys) (toList xs)

instance lessBoolean :: Less Boolean where
  less y x = x Prelude.< y

instance lessChar :: Less Char where
  less y x = x Prelude.< y

instance lessInt :: Less Int where
  less y x = x Prelude.< y

instance lessList :: (HasEqual.HasEqual a, Less a) => Less (Data.List a) where
  less ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Nil, ys: Data.Cons _ _ } -> true
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> if HasEqual.equal yh xh
      then less yt xt
      else less yh xh
    _ -> false

instance lessNumber :: Less Number where
  less y x = x Prelude.< y

instance lessString :: Less String where
  less y x = x Prelude.< y
