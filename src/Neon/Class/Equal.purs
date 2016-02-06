module Neon.Class.Equal where

import Neon.Class.FromArray as FromArray
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be equal to each other.
-- |
-- | ``` purescript
-- | equal 1 2 -- false
-- | equal 3 3 -- true
-- | ```
-- |
-- | Laws:
-- | - `x == x = true`
-- | - `x == y = y == x`
-- | - `if x == y && y == z then x == z`
class Equal a where
  equal :: a -> a -> Boolean

instance equalArray :: (Equal a) => Equal (Array a) where
  equal y x =
    let toList :: Array a -> Data.List a
        toList xs = FromArray.fromArray xs
    in  equal (toList y) (toList x)

instance equalBoolean :: Equal Boolean where
  equal y x = Prelude.eq x y

instance equalChar :: Equal Char where
  equal y x = Prelude.eq x y

instance equalInt :: Equal Int where
  equal y x = Prelude.eq x y

instance equalList :: (Equal a) => Equal (Data.List a) where
  equal y x = case { x: x, y: y } of
    { x: Data.Nil, y: Data.Nil } -> true
    { x: Data.Cons xh xt, y: Data.Cons yh yt } -> if equal yh xh
      then equal yt xt
      else false
    _ -> false

instance equalMaybe :: (Equal a) => Equal (Data.Maybe a) where
  equal y x = case { x: x, y: y } of
    { x: Data.Nothing, y: Data.Nothing } -> true
    { x: Data.Just xj, y: Data.Just yj } -> equal yj xj
    _ -> false

instance equalNumber :: Equal Number where
  equal y x = Prelude.eq x y

instance equalString :: Equal String where
  equal y x = Prelude.eq x y

instance equalUnit :: Equal Data.Unit where
  equal _ _ = true
