module Neon.Primitive.Function where

-- | Always returns the first argument. This is the [constant function](https://en.wikipedia.org/wiki/Constant_function).
-- |
-- | ``` purescript
-- | always "anything" 1 -- 1
-- | ```
always :: forall a b. b -> a -> a
always _ = \ x -> x

-- | Returns a new function that calls the first function with the result of the second. This is [function composition](https://en.wikipedia.org/wiki/Function_composition_(computer_science)).
-- |
-- | ``` purescript
-- | compose (* 2) (+ 2) 3 -- 10
-- | ```
compose :: forall a b c. (b -> c) -> (a -> b) -> (a -> c)
compose g f = \ x -> g (f x)

-- | Flips the first two arguments of a function.
-- |
-- | ``` purescript
-- | flip compose (* 2) (+ 2) 3 -- 8
-- | ```
flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

-- | Returns the argument. This is the [identity function](https://en.wikipedia.org/wiki/Identity_function).
-- |
-- | ``` purescript
-- | identity 1 -- 1
-- | ```
identity :: forall a. a -> a
identity x = x
