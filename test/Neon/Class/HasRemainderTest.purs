module Test.Neon.Class.HasRemainderTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))
import Unsafe.Coerce as Coerce

tests :: Suite
tests = suite "HasRemainder" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.remainder y x === Prelude.mod x y
  test "Number" do
    let toInt = Coerce.unsafeCoerce :: Number -> Int
        toNumber = Coerce.unsafeCoerce :: Int -> Number
    quickCheck \ (x :: Number) y ->
      Neon.remainder y x === toNumber (Prelude.mod (toInt x) (toInt y))
