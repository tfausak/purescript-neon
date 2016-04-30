module Neon.Primitive.Function where

-- | Always returns the first argument.
-- |
-- | ``` purescript
-- | "anything" :always 1 -- 1
-- | ```
-- |
-- | This is the [constant function](https://en.wikipedia.org/wiki/Constant_function).
always :: forall a b. a -> b -> a
always x = \ _ -> x

-- | Returns a new function that calls the first function with the result of
-- | calling the second.
-- |
-- | ``` purescript
-- | let addTwo x = x + 2
-- | let double x = x * 2
-- | let addTwoThenDouble x = addTwo :compose double
-- | addTwoThenDouble 3 -- 10
-- | ```
-- |
-- | This is [function composition](https://en.wikipedia.org/wiki/Function_composition_(computer_science)).
compose :: forall a b c. (b -> c) -> (a -> b) -> (a -> c)
compose g f = \ x -> g (f x)

-- | Flips the first two arguments of a function.
-- |
-- | ``` purescript
-- | "a" :add "b" -- "ab"
-- | "a" :flip add "b" -- "ba"
-- | ```
flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

-- | Returns the value it was given.
-- |
-- | ``` purescript
-- | identity 1 -- 1
-- | ```
-- | This is the [identity function](https://en.wikipedia.org/wiki/Identity_function).
identity :: forall a. a -> a
identity x = x
