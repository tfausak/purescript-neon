module Neon.Primitives.Boolean
  ( boolean
  , otherwise
  ) where

-- | An alias for `true`. This is useful in guard clauses.
-- |
-- | ``` purescript
-- | max x y
-- |   | y > x = y
-- |   | otherwise = x
-- | ```
otherwise :: Boolean
otherwise = true

-- | A functional alternative to the `if _ then _ else _` syntax. This is
-- | useful in higher-order functions.
-- |
-- | ``` purescript
-- | map (boolean 1 2) [false, true]
-- | -- [2, 1]
-- | ```
boolean :: forall a. a -> a -> Boolean -> a
boolean x y p = if p then x else y
