module Test.Neon.Values.Identity where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Identity"
  Identity 1 + Identity 2 ==> Identity 3
  Identity true && Identity true ==> Identity true
  apply (Identity (+ 1)) (Identity 2) ==> Identity 3
  bind (Identity 1) ((+ 1) >> pure) ==> Identity 2
  bottom ==> Identity false
  Identity 1 < Identity 2 ==> true
  Identity 5 / Identity 2 ==> Identity 2
  Identity 5 % Identity 2 ==> Identity 1
  Identity 2 == Identity 2 ==> true
  foldl (+) "a" (Identity "b") ==> "ab"
  foldr (+) "a" (Identity "b") ==> "ba"
  map (+ 1) (Identity 1) ==> Identity 2
  Identity 2 * Identity 3 ==> Identity 6
  not (Identity false) ==> Identity true
  one ==> Identity 1
  Identity false || Identity true ==> Identity true
  pure unit ==> Identity unit
  show (Identity unit) ==> "Identity (unit)"
  Identity 3 - Identity 2 ==> Identity 1
  top ==> Identity true
  zero ==> Identity 0
  fromEnum (Identity false) ==> 0
  toEnum 0 ==> Just (Identity false)
  succ (Identity false) ==> Just (Identity true)
  pred (Identity true) ==> Just (Identity false)
