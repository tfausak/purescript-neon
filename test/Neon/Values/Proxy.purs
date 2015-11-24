module Test.Neon.Values.Proxy where

import Neon
import Neon.Values
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Proxy"
  Proxy :: Proxy Unit ==> Proxy :: Proxy Unit
  show (Proxy :: Proxy Unit) ==> "Proxy"
