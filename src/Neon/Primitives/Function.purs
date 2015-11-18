module Neon.Primitives.Function
  ( always
  , flip
  , on
  , (<|)
  , (|>)
  ) where

-- | The constant function. Always returns the first argument.
-- |
-- | ``` purescript
-- | always 1 2
-- | -- 1
-- | ```
always :: forall a b. a -> (b -> a)
always x = \ _ -> x

-- | Flips the order of the first two arguments.
-- |
-- | ``` purescript
-- | flip always 1 2
-- | -- 2
-- | ```
flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

-- | Flips the order of the first two arguments.
-- |
-- | ``` purescript
-- | ((*) `on` (+ 1)) 2 3
-- | -- 12
-- | ```
on :: forall a b c. (b -> b -> c) -> (a -> b) -> (a -> a -> c)
on g f = \ x y -> g (f x) (f y)

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
