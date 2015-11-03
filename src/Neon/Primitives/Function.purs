module Neon.Primitives.Function
  ( constant
  , flip
  , (|>)
  , (<|)
  ) where

constant :: forall a b. a -> (b -> a)
constant x = \ _ -> x

flip :: forall a b c. (a -> b -> c) -> (b -> a -> c)
flip f = \ x y -> f y x

(|>) :: forall a b. a -> (a -> b) -> b
(|>) x f = f x
infixl 0 |>

(<|) :: forall a b. (a -> b) -> a -> b
(<|) f x = f x
infixr 0 <|
