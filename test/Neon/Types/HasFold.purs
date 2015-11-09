module Test.Neon.Types.HasFold where

import Neon
import Test.Core (Test(), (==>))

testHasFold :: Test
testHasFold = do
  foldl (+) "a" ["b", "c"] ==> "abc"
  foldr (+) "a" ["b", "c"] ==> "bca"
