module Neon.Pure
  ( Pure
  , pure
  ) where

import Neon.Apply (Apply)

class (Apply f) <= Pure f where
  pure :: forall a. a -> f a

instance pureArray :: Pure Array where
  pure x = [x]

instance pureFunction :: Pure (Function a) where
  pure x = \ _ -> x
