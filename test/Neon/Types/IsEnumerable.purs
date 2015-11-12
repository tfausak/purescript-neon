module Test.Neon.Types.IsEnumerable where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testIsEnumerable :: Test
testIsEnumerable = do
  info "Neon.Types.IsEnumerable"
  fromEnum false ==> 0
  toEnum 1 ==> Just true
  succ false ==> Just true
  pred false ==> Nothing
  fromEnum unit ==> 0
  toEnum 0 ==> Just unit
  succ unit ==> Nothing
  pred unit ==> Nothing
