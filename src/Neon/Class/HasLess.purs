module Neon.Class.HasLess where

import Neon.Class.HasEqual as HasEqual
import Neon.Class.HasFromArray as HasFromArray
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types where one value can be less than another.
-- |
-- | ``` purescript
-- | 1 :less 2 -- true
-- | 2 :less 1 -- false
-- | ```
class HasLess a where
  less :: a -> a -> Boolean

instance arrayHasLess :: (HasEqual.HasEqual a, HasLess a) => HasLess (Array a) where
  less ys xs =
    let toList = HasFromArray.fromArray :: Array a -> Data.List a
    in  less (toList ys) (toList xs)

instance booleanHasLess :: HasLess Boolean where
  less y x = x Prelude.< y

instance charHasLess :: HasLess Char where
  less y x = x Prelude.< y

instance intHasLess :: HasLess Int where
  less y x = x Prelude.< y

instance listHasLess :: (HasEqual.HasEqual a, HasLess a) => HasLess (Data.List a) where
  less ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Nil, ys: Data.Cons _ _ } -> true
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> if HasEqual.equal yh xh
      then less yt xt
      else less yh xh
    _ -> false

instance numberHasLess :: HasLess Number where
  less y x = x Prelude.< y

instance orderingHasLess :: HasLess Data.Ordering where
  less y x = x Prelude.< y

instance stringHasLess :: HasLess String where
  less y x = x Prelude.< y
