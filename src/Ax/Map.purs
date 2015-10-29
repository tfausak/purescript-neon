module Ax.Map
  ( Map
  , map
  , void
  , (<$)
  , (<$>)
  , ($>)
  ) where

import Ax.Compose ((>>))
import Ax.Unit (Unit(), unit)

foreign import jsMapArray :: forall a b. (a -> b) -> Array a -> Array b

class Map f where
  map :: forall a b. (a -> b) -> f a -> f b

instance mapArray :: Map Array where
  map f x = jsMapArray f x

instance mapFunction :: Map (Function a) where
  map f g = g >> f

void :: forall f a. (Map f) => f a -> f Unit
void f = map (\ _ -> unit) f

(<$) :: forall f a b. (Map f) => a -> f b -> f a
(<$) x f = map (\ _ -> x) f
infixl 4 <$

(<$>) :: forall f a b. (Map f) => (a -> b) -> f a -> f b
(<$>) f x = map f x
infixl 4 <$>

($>) :: forall f a b. (Map f) => f b -> a -> f a
($>) f x = map (\ _ -> x) f
infixl 4 $>
