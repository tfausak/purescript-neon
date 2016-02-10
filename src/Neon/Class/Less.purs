module Neon.Class.Less where

import Neon.Class.Equal as Equal
import Neon.Class.FromArray as FromArray
import Neon.Data as Data
import Prelude as Prelude

class Less a where
  less :: a -> a -> Boolean

instance lessArray :: (Equal.Equal a, Less a) => Less (Array a) where
  less ys xs =
    let toList = FromArray.fromArray :: Array a -> Data.List a
    in  less (toList ys) (toList xs)

instance lessBoolean :: Less Boolean where
  less y x = x Prelude.< y

instance lessChar :: Less Char where
  less y x = x Prelude.< y

instance lessInt :: Less Int where
  less y x = x Prelude.< y

instance lessList :: (Equal.Equal a, Less a) => Less (Data.List a) where
  less ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Nil, ys: Data.Cons _ _ } -> true
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> if Equal.equal yh xh
      then less yt xt
      else less yh xh
    _ -> false

instance lessNumber :: Less Number where
  less y x = x Prelude.< y

instance lessString :: Less String where
  less y x = x Prelude.< y
