module Neon.Primitive.Function
  ( always
  , compose
  , flip
  , identity
  ) where

always :: forall a b. a -> b -> a
always x = \ _ -> x

compose :: forall a b c. (b -> c) -> (a -> b) -> (a -> c)
compose g f = \ x -> g (f x)

flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

identity :: forall a. a -> a
identity x = x
