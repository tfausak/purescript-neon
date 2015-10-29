module Ax.Apply
  ( Apply
  , apply
  ) where

import Ax.Map (Map, map)

foreign import jsFlattenArray :: forall a. Array (Array a) -> Array a

class (Map f) <= Apply f where
  apply :: forall a b. f (a -> b) -> f a -> f b

instance applyArray :: Apply Array where
  apply fs xs = jsFlattenArray (map (\ f -> map (\ x -> f x) xs) fs)

instance applyFunction :: Apply (Function a) where
  apply f g = \ x -> f x (g x)
