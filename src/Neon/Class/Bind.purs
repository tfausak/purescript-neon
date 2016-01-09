module Neon.Class.Bind (Bind, bind) where

import Neon.Data (List())
import Prelude as Prelude

class Bind a where
  -- TODO: I want the "container" to be the last argument, but PureScript's
  --   syntax requires this order.
  bind :: forall b c. a b -> (b -> a c) -> a c

instance bindArray :: Bind Array where
  bind xs f = Prelude.bind xs f

instance bindList :: Bind List where
  bind xs f = Prelude.bind xs f
