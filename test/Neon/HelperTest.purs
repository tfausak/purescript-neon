module Test.Neon.HelperTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Helper" do
  test "clamp" do
    quickCheck \ (x :: Int) b t ->
      Neon.clamp b t x ===
        if Neon.greater t b
        then Neon.max t (Neon.min b x)
        else Neon.max b (Neon.min t x)
  test "greaterOrEqual" do
    quickCheck \ (x :: Int) y ->
      Neon.greaterOrEqual y x === x Prelude.>= y
  test "lessOrEqual" do
    quickCheck \ (x :: Int) y ->
      Neon.lessOrEqual y x === x Prelude.<= y
  test "max" do
    quickCheck \ (x :: Int) y ->
      Neon.max y x === if Neon.greater y x then x else y
  test "min" do
    quickCheck \ (x :: Int) y ->
      Neon.min y x === if Neon.less y x then x else y
  test "negate" do
    quickCheck \ (x :: Int) ->
      Neon.negate x === Prelude.negate x
  test "notEqual" do
    quickCheck \ (x :: Int) y ->
      Neon.notEqual y x === x Prelude./= y
