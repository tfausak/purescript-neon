module Neon.Class.HasCompare (class HasCompare, compare) where

import Neon.Class.HasEqual as HasEqual
import Neon.Class.HasFromArray as HasFromArray
import Neon.Class.HasGreater as HasGreater
import Neon.Class.HasLess as HasLess
import Neon.Data as Data

-- | Represents type that have a [total order](https://en.wikipedia.org/wiki/Total_order).
-- |
-- | ``` purescript
-- | 2 :compare 1 -- GT
-- | 2 :compare 2 -- EQ
-- | 2 :compare 3 -- LT
-- | ```
class (HasEqual.HasEqual a, HasGreater.HasGreater a, HasLess.HasLess a) <= HasCompare a where
  compare :: a -> a -> Data.Ordering

instance arrayHasCompare :: (HasCompare a) => HasCompare (Array a) where
  compare y x =
    let toList = HasFromArray.fromArray :: Array a -> Data.List a
    in  compare (toList y) (toList x)

instance booleanHasCompare :: HasCompare Boolean where
  compare y x = defaultCompare y x

instance charHasCompare :: HasCompare Char where
  compare y x = defaultCompare y x

instance intHasCompare :: HasCompare Int where
  compare y x = defaultCompare y x

instance listHasCompare :: (HasCompare a) => HasCompare (Data.List a) where
  compare ys xs = case { xs: xs, ys: ys } of
    { xs: Data.Nil, ys: Data.Nil } -> Data.EQ
    { xs: Data.Nil, ys: Data.Cons _ _ } -> Data.LT
    { xs: Data.Cons _ _, ys: Data.Nil } -> Data.GT
    { xs: Data.Cons xh xt, ys: Data.Cons yh yt } -> case compare yh xh of
      Data.EQ -> compare yt xt
      Data.GT -> Data.GT
      Data.LT -> Data.LT

instance numberHasCompare :: HasCompare Number where
  compare y x = defaultCompare y x

instance orderingHasCompare :: HasCompare Data.Ordering where
  compare y x = defaultCompare y x

instance stringHasCompare :: HasCompare String where
  compare y x = defaultCompare y x

defaultCompare :: forall a. HasGreater.HasGreater a => HasLess.HasLess a => a -> a -> Data.Ordering
defaultCompare y x =
  if HasGreater.greater y x
    then Data.GT
    else if HasLess.less y x
      then Data.LT
      else Data.EQ
