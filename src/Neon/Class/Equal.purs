module Neon.Class.Equal (Equal, isEqual) where

import Neon.Class.FromArray (fromArray)
import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just), Unit())
import Prelude as Prelude

class Equal a where
  isEqual :: a -> a -> Boolean

instance equalArray :: (Equal a) => Equal (Array a) where
  isEqual y x =
    let toList :: Array a -> List a
        toList xs = fromArray xs
    in  isEqual (toList y) (toList x)

instance equalBoolean :: Equal Boolean where
  isEqual y x = Prelude.eq x y

instance equalChar :: Equal Char where
  isEqual y x = Prelude.eq x y

instance equalInt :: Equal Int where
  isEqual y x = Prelude.eq x y

instance equalList :: (Equal a) => Equal (List a) where
  isEqual y x = case { x: x, y: y } of
    { x: Nil, y: Nil } -> true
    { x: Cons xh xt, y: Cons yh yt } -> if isEqual yh xh
      then isEqual yt xt
      else false
    _ -> false

instance equalMaybe :: (Equal a) => Equal (Maybe a) where
  isEqual y x = case { x: x, y: y } of
    { x: Nothing, y: Nothing } -> true
    { x: Just xj, y: Just yj } -> isEqual yj xj
    _ -> false

instance equalNumber :: Equal Number where
  isEqual y x = Prelude.eq x y

instance equalString :: Equal String where
  isEqual y x = Prelude.eq x y

instance equalUnit :: Equal Unit where
  isEqual _ _ = true
