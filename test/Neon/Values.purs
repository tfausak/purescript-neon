module Test.Neon.Values where

import Neon
import Test.Core (Test())
import qualified Test.Neon.Values.Constant as Constant
import qualified Test.Neon.Values.Dictionary as Dictionary
import qualified Test.Neon.Values.Either as Either
import qualified Test.Neon.Values.Identity as Identity
import qualified Test.Neon.Values.Maybe as Maybe
import qualified Test.Neon.Values.Ordering as Ordering
import qualified Test.Neon.Values.Pair as Pair
import qualified Test.Neon.Values.These as These
import qualified Test.Neon.Values.Unit as Unit

main :: Test
main = do
  info "Neon.Values"
  Constant.main
  Dictionary.main
  Either.main
  Identity.main
  Maybe.main
  Ordering.main
  Pair.main
  These.main
  Unit.main
