module Test.Neon.Values.Constant where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Constant"
  Constant "a" + Constant "b" ==> Constant "ab"
  alternative (Constant "a") (Constant "b") ==> Constant "ab"
  Constant true && Constant false ==> Constant false
  Constant "a" <*> Constant "b" ==> Constant "ab"
  Constant true >>= not ==> Constant true
  bottom ==> Constant false
  Constant true > Constant false ==> true
  Constant 5 / Constant 2 ==> Constant 2
  Constant 5 % Constant 2 ==> Constant 1
  empty ==> Constant 0
  Constant unit == Constant unit ==> true
  foldl (+) 1 (Constant 2) ==> 1
  foldr (+) 1 (Constant 2) ==> 1
  (+ 1) <$> Constant 1 ==> Constant 1
  Constant 2 * Constant 3 ==> Constant 6
  not (Constant true) ==> Constant false
  one ==> Constant 1
  Constant false || Constant true ==> Constant true
  Constant 2 ^ Constant 3 ==> Constant 8
  pure unit ==> Constant 0
  show (Constant unit) ==> "Constant (unit)"
  Constant 3 - Constant 2 ==> Constant 1
  top ==> Constant true
  zero ==> Constant 0
  fromEnum (Constant true) ==> 1
  toEnum 1 ==> Just (Constant true)
  succ (Constant false) ==> Just (Constant true)
  pred (Constant true) ==> Just (Constant false)
  runConstant (Constant unit) ==> unit
