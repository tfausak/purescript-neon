module Test.Neon.Values.Pair where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Pair"
  pair 1 2 + pair 3 4 ==> pair 4 6
  pair false true && pair true true ==> pair false true
  apply (pair 1 (+ 3)) (pair 3 4) ==> pair 4 7
  bind (pair 1 2) (\ x -> pair x x) ==> pair 3 2
  bottom ==> pair false false
  pair 1 2 < pair 1 3 ==> true
  pair 1 2 >> pair 3 4 ==> pair 1 4
  pair 9 8 / pair 4 2 ==> pair 2 4
  pair 9 8 % pair 4 2 ==> pair 1 0
  pair 1 2 == pair 1 2 ==> true
  foldl (+) 1 (pair 2 3) ==> 4
  foldr (+) 1 (pair 2 3) ==> 4
  map (+ 1) (pair 1 2) ==> pair 1 3
  pair 2 3 * pair 4 5 ==> pair 8 15
  not (pair false true) ==> pair true false
  one ==> pair 1 1
  pair false false || pair false true ==> pair false true
  pure 3 ==> pair 0 3
  show (pair 1 2) ==> "Pair { first: 1, second: 2 }"
  pair 9 8 - pair 2 3 ==> pair 7 5
  top ==> pair true true
  zero ==> pair 0 0
  pair 1 2 ==> Pair { first: 1, second: 2 }
  curry (\ (Pair x) -> x.first + x.second) 2 3 ==> 5
  uncurry (\ x y -> x + y) (pair 2 3) ==> 5
  swap (pair 1 2) ==> pair 2 1
