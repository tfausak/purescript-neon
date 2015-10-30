module Neon.Alternative
  ( Alternative
  , alternative
  , (<|>)
  ) where

import Neon.Add ((+))
import Neon.Map (Map)

-- | Laws:
-- | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
-- | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
class (Map f) <= Alternative f where
  alternative :: forall a. f a -> f a -> f a

instance alternativeArray :: Alternative Array where
  alternative xs ys = xs + ys

-- | Alias for `alternative`.
(<|>) :: forall f a. (Alternative f) => f a -> f a -> f a
(<|>) x y = alternative x y
infixl 3 <|>
