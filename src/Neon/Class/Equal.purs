module Neon.Class.Equal (Equal, equal) where

import Neon.Class.FromArray (fromArray)
import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just), Unit())
import Prelude as Prelude

class Equal a where
  equal :: a -> a -> Boolean

instance equalArray :: (Equal a) => Equal (Array a) where
  equal y x =
    let toList :: Array a -> List a
        toList xs = fromArray xs
    in  equal (toList y) (toList x)

instance equalBoolean :: Equal Boolean where
  equal y x = Prelude.eq x y

instance equalChar :: Equal Char where
  equal y x = Prelude.eq x y

instance equalInt :: Equal Int where
  equal y x = Prelude.eq x y

instance equalList :: (Equal a) => Equal (List a) where
  equal y x = case { x: x, y: y } of
    { x: Nil, y: Nil } -> true
    { x: Cons xh xt, y: Cons yh yt } -> if equal yh xh
      then equal yt xt
      else false
    _ -> false

instance equalMaybe :: (Equal a) => Equal (Maybe a) where
  equal y x = case { x: x, y: y } of
    { x: Nothing, y: Nothing } -> true
    { x: Just xj, y: Just yj } -> equal yj xj
    _ -> false

instance equalNumber :: Equal Number where
  equal y x = Prelude.eq x y

instance equalString :: Equal String where
  equal y x = Prelude.eq x y

instance equalUnit :: Equal Unit where
  equal _ _ = true
