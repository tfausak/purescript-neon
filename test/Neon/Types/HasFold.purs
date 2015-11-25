module Test.Neon.Types.HasFold where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasFold"
  foldl (+) "a" ["b", "c"] ==> "abc"
  foldr (+) "a" ["b", "c"] ==> "bca"
  fold ["a", "b"] ==> "ab"
  foldMap (+ "!") ["a", "b"] ==> "a!b!"
  length [1, 2] ==> 2
  isPresent ([] :: Array Unit) ==> false
  isPresent [unit] ==> true
  isBlank ([] :: Array Unit) ==> true
  isBlank [unit] ==> false
  contains 1 [1, 2] ==> true
  contains 0 [1, 2] ==> false
  sum [1, 2] ==> 3
  product [1, 2] ==> 2
