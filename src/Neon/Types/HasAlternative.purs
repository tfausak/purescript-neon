module Neon.Types.HasAlternative
  ( HasAlternative
  , alternative
  , (<|>)
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasMap (HasMap)

-- | Laws:
-- | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
-- | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
class (HasMap f) <= HasAlternative f where
  alternative :: forall a. f a -> f a -> f a

instance alternativeArray :: HasAlternative Array where
  alternative xs ys = xs + ys

-- | Alias for `alternative`.
(<|>) :: forall f a. (HasAlternative f) => f a -> f a -> f a
(<|>) x y = alternative x y
infixl 3 <|>
