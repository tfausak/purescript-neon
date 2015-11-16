module Neon.Types.HasExtend
  ( HasExtend
  , duplicate
  , extend
  , (<<=)
  , (=<=)
  , (=>=)
  , (=>>)
  ) where

import Neon.Types.HasIdentity (identity)
import Neon.Types.HasMap (HasMap)

-- | TODO
-- |
-- | Laws:
-- | - Associativity: `extend f << extend g = extend (f << extend g)`
class (HasMap w) <= HasExtend w where
  -- | TODO
  -- |
  -- | ``` purescript
  -- | TODO
  -- | -- TODO
  -- | ```
  extend :: forall a b. (w a -> b) -> w a -> w b

-- | Alias for `extend`.
-- |
-- | ``` purescript
-- | TODO
-- | -- TODO
-- | ```
(=>>) :: forall w a b. (HasExtend w) => w a -> (w a -> b) -> w b
(=>>) x f = extend f x
infixl 1 =>>

-- | `(=>>)` with the arguments flipped.
-- |
-- | ``` purescript
-- | TODO
-- | -- TODO
-- | ```
(<<=) :: forall w a b. (HasExtend w) => (w a -> b) -> w a -> w b
(<<=) f x = extend f x
infixr 1 <<=

-- | Composes actions together from left to right.
-- |
-- | ``` purescript
-- | TODO
-- | -- TODO
-- | ```
(=>=) :: forall w a b c. (HasExtend w) => (w a -> b) -> (w b -> c) -> (w a -> c)
(=>=) f g = \ x -> g (x =>> f)
infixl 1 =>=

-- | `(=>=)` with the arguments flipped.
-- |
-- | ``` purescript
-- | TODO
-- | -- TODO
-- | ```
(=<=) :: forall w b a c. (HasExtend w) => (w b -> c) -> (w a -> b) -> (w a -> c)
(=<=) f g = \ x -> f (x =>> g)
infixr 1 =<=

-- | TODO
-- |
-- | ``` purescript
-- | TODO
-- | -- TODO
-- | ```
duplicate :: forall w a. (HasExtend w) => w a -> w (w a)
duplicate x = extend identity x
