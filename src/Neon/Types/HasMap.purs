module Neon.Types.HasMap
  ( HasMap
  , map
  , (<$>)
  , ($>)
  , (<$)
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasCompose ((>>))
import Neon.Values.Unit (Unit(), unit)

foreign import nativeMapArray :: forall a b. (a -> b) -> Array a -> Array b

-- | Laws:
-- | - Identity: `map identity = identity`
-- | - Composition: `map (f >> g) = map f >> map g`
class HasMap f where
  map :: forall a b. (a -> b) -> f a -> f b

instance arrayHasMap :: HasMap Array where
  map f x = nativeMapArray f x

instance functionHasMap :: HasMap (Function a) where
  map f g = g >> f

-- | Alias for `map`.
(<$>) :: forall f a b. (HasMap f) => (a -> b) -> f a -> f b
(<$>) f x = map f x
infixl 4 <$>

($>) :: forall f a b. (HasMap f) => f a -> b -> f b
($>) f x = constant x <$> f
infixl 4 $>

(<$) :: forall f a b. (HasMap f) => a -> f b -> f a
(<$) x f = constant x <$> f
infixl 4 <$