module Test.Neon.Class.HasFromIntTest where

import Neon as Neon
import Data.Enum as Enum
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasFromInt" do
  test "Boolean" do
    quickCheck \ x ->
      let y = Neon.clamp (Neon.negate 1) 10 x
      in  (Neon.fromInt y :: Neon.Maybe Boolean) === Enum.toEnum y
  test "Char" do
    quickCheck \ x ->
      (Neon.fromInt x :: Neon.Maybe Char) === Enum.toEnum x
  test "Int" do
    quickCheck \ x ->
      (Neon.fromInt x :: Neon.Maybe Int) === Neon.Just x
  -- test "Ordering"
