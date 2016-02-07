module Test.Neon.Class.RemainderTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))
import Unsafe.Coerce as Coerce

suite :: Suite
suite = test "Remainder" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.remainder y x === Prelude.mod x y
  test "Number" do
    let toInt = Coerce.unsafeCoerce :: Number -> Int
        toNumber = Coerce.unsafeCoerce :: Int -> Number
    quickCheck \ (x :: Number) y ->
      Neon.remainder y x === toNumber (Prelude.mod (toInt x) (toInt y))
