module Neon.Primitives.Boolean
  ( otherwise
  , boolean
  ) where

otherwise :: Boolean
otherwise = true

boolean :: forall a. a -> a -> Boolean -> a
boolean x y p = if p then x else y
