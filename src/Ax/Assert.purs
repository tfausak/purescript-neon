module Ax.Assert
  ( ASSERT()
  , assert
  ) where

import Ax.Effect (Effect())
import Ax.Unit (Unit())

foreign import data ASSERT :: !
foreign import assert :: forall e. Boolean -> Effect (assert :: ASSERT | e) Unit
