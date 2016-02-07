module Test.Neon.Primitive.CharTest where

import Neon as Neon
import Data.Char as Char
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Char" do
  test "toLower" do
    quickCheck \ x ->
      Neon.toLower x === Char.toLower x
  test "toString" do
    quickCheck \ x ->
      Neon.toString x === Char.toString x
  test "toUpper" do
    quickCheck \ x ->
      Neon.toUpper x === Char.toUpper x
