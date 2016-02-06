module Neon.Class.Wrap where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

-- | Represents types that allow wrapping values into a container.
-- |
-- | ``` purescript
-- | wrap 1 :: Maybe Int -- Just 1
-- | wrap 1 :: Array Int -- [1]
-- | ```
-- |
-- | Laws:
-- | - `apply (wrap id) v = v`
-- | - `apply (apply (apply (wrap <<) f) g) h = apply f (apply g h)`
-- | - `apply (wrap f) (wrap x) = wrap (f x)`
-- | - `apply u (wrap y) = apply (wrap \ f -> f y) u`
class Wrap a where
  wrap :: forall b. b -> a b

instance wrapArray :: Wrap Array where
  wrap x = [x]

instance wrapEff :: Wrap (Effect.Eff a) where
  wrap x = Prelude.pure x

instance wrapList :: Wrap Data.List where
  wrap x = Data.Cons x Data.Nil

instance wrapMaybe :: Wrap Data.Maybe where
  wrap x = Data.Just x
