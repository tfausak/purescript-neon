module Neon.Types.HasAlternative
  ( HasAlternative
  , alternative
  , (<|>)
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasMap (HasMap)

-- | Represents types that can express alternatives. This is like `HasAdd` but
-- | for types of kind `* -> *` instead of `*`.
-- |
-- | Laws:
-- | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
-- | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
class (HasMap f) <= HasAlternative f where
  -- | Returns the alternatives between two values. This is like `add` but for
  -- | higher-kinded types.
  -- |
  -- | ``` purescript
  -- | alternative [1, 2] [3, 4]
  -- | -- [1, 2, 3, 4]
  -- | ```
  alternative :: forall a. f a -> f a -> f a

instance arrayHasAlternative :: HasAlternative Array where
  alternative xs ys = xs + ys

-- | Alias for `alternative`.
-- |
-- | ``` purescript
-- | [1, 2] <|> [3, 4]
-- | -- [1, 2, 3, 4]
-- | ```
(<|>) :: forall f a. (HasAlternative f) => f a -> f a -> f a
(<|>) x y = alternative x y
infixl 3 <|>
