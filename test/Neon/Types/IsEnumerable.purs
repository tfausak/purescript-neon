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
  fromEnum 'A' ==> 65
  toEnum 65 ==> Just 'A'
  toEnum 999999999 ==> Nothing :: Maybe Char
  succ 'A' ==> Just 'B'
  pred 'B' ==> Just 'A'
