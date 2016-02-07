module Test.Neon.Primitive.CharTest where

import Data.Char as Char
import Neon as Neon
import Test.Core (Tests, bind, quickCheck, test, (===))

tests :: Tests
tests = test "Char" do
  test "toLower" do
    quickCheck \ x ->
      Neon.toLower x === Char.toLower x
  test "toString" do
    quickCheck \ x ->
      Neon.toString x === Char.toString x
  test "toUpper" do
    quickCheck \ x ->
      Neon.toUpper x === Char.toUpper x
