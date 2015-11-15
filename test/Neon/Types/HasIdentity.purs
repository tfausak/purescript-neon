module Test.Neon.Types.HasIdentity where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasIdentity"
  identity unit ==> unit
