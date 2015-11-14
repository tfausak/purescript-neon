module Neon.Primitives.Function
  ( constant
  , flip
  , (|>)
  , (<|)
  ) where

-- | The constant function. Always returns the first argument.
-- |
-- | ``` purescript
-- | constant 1 2
-- | -- 1
-- | ```
constant :: forall a b. a -> (b -> a)
constant x = \ _ -> x

-- | Flips the order of the first two arguments.
-- |
-- | ``` purescript
-- | flip constant 1 2
-- | -- 2
-- | ```
flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

-- | Applies an argument to a function. This is useful to avoid parentheses.
-- |
-- | ``` purescript
-- | 'A' |> toLower
-- | -- 'a'
-- | ```
(|>) :: forall a b. a -> (a -> b) -> b
(|>) x f = f x
infixl 0 |>

-- | Applies a function to an argument. This is useful to avoid parentheses.
-- |
-- | ``` purescript
-- | toLower <| 'A'
-- | -- 'a'
-- | ```
(<|) :: forall a b. (a -> b) -> a -> b
(<|) f x = f x
infixr 0 <|
