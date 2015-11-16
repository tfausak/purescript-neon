module Test.Neon.Types.HasTraverse where

import Neon
import Neon.Values
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasTraverse"
  traverse pure [] ==> Just ([] :: Array Unit)
  -- TODO
  traverse pure (Just 1) ==> [Just 1]
