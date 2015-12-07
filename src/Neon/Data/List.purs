module Neon.Data.List (List(Nil, Cons)) where

import Neon.Class.And (and)
import Neon.Class.Add (add)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.FromArray (FromArray)
import Neon.Class.Map (Map, map)
import Neon.Class.Reduce (Reduce, reduce)
import Neon.Class.Show (Show, show)
import Neon.Class.ToArray (ToArray)

foreign import nativeFromArray :: forall a. List a -> (a -> List a -> List a) -> Array a -> List a
foreign import nativeToArray :: forall a. List a -> List a -> Array a

data List a
  = Nil
  | Cons a (List a)

instance equalList :: (Equal a) => Equal (List a) where
  equal x y = case { x: x, y: y } of
    { x: Nil, y: Nil } -> true
    { x: Cons xh xt, y: Cons yh yt } -> and (equal xh yh) (equal xt yt)
    _ -> false

instance fromArrayList :: FromArray a (List a) where
  fromArray = nativeFromArray Nil Cons

instance mapList :: Map List where
  map f x = case x of
    Nil -> Nil
    Cons h t -> Cons (f h) (map f t)

instance reduceList :: Reduce List where
  reduce f y x = case x of
    Nil -> y
    Cons h t -> reduce f (f y h) t

instance showList :: (Show a) => Show (List a) where
  show x = case x of
    Nil -> "Nil"
    Cons h t -> reduce add "" ["Cons (", show h, ") (", show t, ")"]

instance toArrayList :: ToArray (List a) a where
  toArray = nativeToArray Nil
