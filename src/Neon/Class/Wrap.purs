module Neon.Class.Wrap (Wrap, wrap) where

import Neon.Data (List(Nil, Cons), Maybe(Just))
import Neon.Effect (Eff())
import Prelude as Prelude

class Wrap a where
  wrap :: forall b. b -> a b

instance wrapArray :: Wrap Array where
  wrap x = [x]

instance wrapEff :: Wrap (Eff a) where
  wrap x = Prelude.pure x

instance wrapList :: Wrap List where
  wrap x = Cons x Nil

instance wrapMaybe :: Wrap Maybe where
  wrap x = Just x
