module Test.Neon.Primitive.CharTest where

import Neon as Neon
import Data.Char as Char
import Data.String as String
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "Char" do
  test "toLower" do
    quickCheck \ x ->
      Neon.toLower x === Char.toLower x
  test "toString" do
    quickCheck \ x ->
      Neon.toString x === String.singleton x
  test "toUpper" do
    quickCheck \ x ->
      Neon.toUpper x === Char.toUpper x
