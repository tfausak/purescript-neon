module Test.Neon.Transformers where

import Neon
import Test.Core (Test())
import qualified Test.Neon.Transformers.MaybeT as MaybeT
import qualified Test.Neon.Transformers.StateT as StateT

main :: Test
main = do
  info "Neon.Transformers"
  MaybeT.main
  StateT.main
