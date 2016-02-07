module Test.Neon.Class.FromIntTest where

import Neon as Neon
import Data.Enum as Enum
import Data.Maybe as Maybe
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "FromInt" do
  test "Boolean" do
    quickCheck \ x ->
      let y = Neon.clamp (Neon.negate 1) 10 x
      in  Neon.fromInt y :: Maybe.Maybe Boolean === Enum.toEnum y
  test "Char" do
    quickCheck \ x ->
      Neon.fromInt x :: Maybe.Maybe Char === Enum.toEnum x
  test "Int" do
    quickCheck \ x ->
      Neon.fromInt x :: Maybe.Maybe Int === Maybe.Just x
