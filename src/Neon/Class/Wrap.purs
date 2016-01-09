module Neon.Class.Wrap (Wrap, wrap) where

import Neon.Data (List(Nil, Cons))

class Wrap a where
  wrap :: forall b. b -> a b

instance wrapArray :: Wrap Array where
  wrap x = [x]

instance wrapList :: Wrap List where
  wrap x = Cons x Nil
