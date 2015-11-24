module Neon.Values.Proxy
  ( Proxy(Proxy)
  ) where

import Neon.Types.HasEqual (HasEqual)
import Neon.Types.HasShow (HasShow)

-- | A value that represents a type.
data Proxy a = Proxy

instance proxyHasEqual :: HasEqual (Proxy a) where
  equal _ _ = true

instance proxyHasShow :: HasShow (Proxy a) where
  show _ = "Proxy"
