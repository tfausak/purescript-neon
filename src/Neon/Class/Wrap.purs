module Neon.Class.Wrap (class Wrap, wrap) where

import Neon.Data (List(Nil, Cons), Maybe(Just))
import Neon.Effect (Eff())
import Prelude (..) as Prelude

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

instance wrapEff :: Wrap (Eff a) where
  wrap x = Prelude.pure x

instance wrapList :: Wrap List where
  wrap x = Cons x Nil

instance wrapMaybe :: Wrap Maybe where
  wrap x = Just x
