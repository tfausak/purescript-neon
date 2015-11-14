module Neon.Types.HasApply
  ( HasApply
  , apply
  , (<*>)
  , (*>)
  , (<*)
  ) where

import Neon.Primitives.Function (always, flip, (|>))
import Neon.Types.HasIdentity (identity)
import Neon.Types.HasMap (HasMap, map, (<$>))

foreign import nativeFlattenArray :: forall a. Array (Array a) -> Array a

-- | Laws:
-- | - Associative composition: `(<<) <$> f <*> g <*> h = f <*> (g <*> h)`
class (HasMap f) <= HasApply f where
  apply :: forall a b. f (a -> b) -> f a -> f b

instance arrayHasApply :: HasApply Array where
  apply fs xs = fs |> map (flip map xs) |> nativeFlattenArray

instance functionHasApply :: HasApply (Function a) where
  apply f g = \ x -> f x (g x)

-- | Alias for `apply`.
(<*>) :: forall f a b. (HasApply f) => f (a -> b) -> f a -> f b
(<*>) f x = apply f x
infixl 4 <*>

(*>) :: forall f a b. (HasApply f) => f a -> f b -> f b
(*>) x y = (always identity <$> x) <*> y
infixl 4 *>

(<*) :: forall f a b. (HasApply f) => f a -> f b -> f a
(<*) x y = (always <$> x) <*> y
infixl 4 <*
