module Neon.Types.HasRoot
  ( HasRoot
  , root
  ) where

import Neon.Types.HasDivide (HasDivide)
import Neon.Types.HasPower (HasPower)

foreign import nativeRootInt :: Int -> Int -> Int
foreign import nativeRootNumber :: Number -> Number -> Number

class (HasDivide a, HasPower a) <= HasRoot a where
  root :: a -> a -> a

instance intHasRoot :: HasRoot Int where
  root n x = nativeRootInt n x

instance numberHasRoot :: HasRoot Number where
  root n x = nativeRootNumber n x
