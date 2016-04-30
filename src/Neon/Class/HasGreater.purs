module Neon.Class.HasGreater where

import Neon.Class.HasEqual as HasEqual
import Neon.Class.HasFromArray as HasFromArray
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types where one value can be greater than another.
-- |
-- | ``` purescript
-- | 2 :greater 1 -- true
-- | 1 :greater 2 -- false
-- | ```
class HasGreater a where
  greater :: a -> a -> Boolean

instance arrayHasGreater :: (HasEqual.HasEqual a, HasGreater a) => HasGreater (Array a) where
  greater ys xs =
    let toList = HasFromArray.fromArray :: Array a -> Data.List a
    in  greater (toList ys) (toList xs)

instance booleanHasGreater :: HasGreater Boolean where
  greater y x = x Prelude.> y

instance charHasGreater :: HasGreater Char where
  greater y x = x Prelude.> y

instance intHasGreater :: HasGreater Int where
  greater y x = x Prelude.> y

instance listHasGreater :: (HasEqual.HasEqual a, HasGreater a) => HasGreater (Data.List a) where
  greater ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Cons _ _, ys: Data.Nil } -> true
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> if HasEqual.equal yh xh
      then greater yt xt
      else greater yh xh
    _ -> false

instance numberHasGreater :: HasGreater Number where
  greater y x = x Prelude.> y

instance orderingHasGreater :: HasGreater Data.Ordering where
  greater y x = x Prelude.> y

instance stringHasGreater :: HasGreater String where
  greater y x = x Prelude.> y
