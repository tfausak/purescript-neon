module Neon.Primitive.Function
  ( always
  , compose
  , flip
  , identity
  ) where

-- | Always returns the first argument. This is the [constant
-- | function](https://en.wikipedia.org/wiki/Constant_function).
-- |
-- | Examples:
-- | ``` purescript
-- | always 1 "anything" -- 1
-- | ```
always :: forall a b. a -> b -> a
always x = \ _ -> x

-- | Returns a new function that calls the first function with the result of
-- | the second. This is [function composition](https://en.wikipedia.org/wiki/Function_composition_(computer_science)).
-- |
-- | Examples:
-- | ``` purescript
-- | compose (* 2) (+ 2) 3 -- 10
-- | ```
compose :: forall a b c. (b -> c) -> (a -> b) -> (a -> c)
compose g f = \ x -> g (f x)

-- | Flips the first two arguments of a function.
-- |
-- | Examples:
-- | ``` purescript
-- | add "a" "b" -- "ba"
-- | flip add "a" "b" -- "ab"
-- | ```
flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

-- | Returns the argument. This is the [identity
-- | function](https://en.wikipedia.org/wiki/Identity_function).
-- |
-- | Examples:
-- | ``` purescript
-- | identity 1 -- 1
-- | ```
identity :: forall a. a -> a
identity x = x
