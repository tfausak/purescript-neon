module Test.Neon.HelperTest where

import Data.Foldable as Foldable
import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "Helper" do
  -- test "absoluteValue" do
  -- test "all" do
  -- test "any" do
  -- test "asTypeOf" do
  -- test "bind" do
  test "clamp" do
    quickCheck \ (x :: Int) b t ->
      Neon.clamp b t x ===
        if Neon.greater t b
        then Neon.max t (Neon.min b x)
        else Neon.max b (Neon.min t x)
  -- test "contains" do
  -- test "curry" do
  -- test "decrement" do
  -- test "divisibleBy" do
  -- test "downTo" do
  -- test "empty" do
  -- test "even" do
  -- test "flatten" do
  test "greaterOrEqual" do
    quickCheck \ (x :: Int) y ->
      Neon.greaterOrEqual y x === x Prelude.>= y
  -- test "increment" do
  -- test "infinite" do
  test "lessOrEqual" do
    quickCheck \ (x :: Int) y ->
      Neon.lessOrEqual y x === x Prelude.<= y
  test "max" do
    quickCheck \ (x :: Int) y ->
      Neon.max y x === if Neon.greater y x then x else y
  -- test "maximum" do
  test "min" do
    quickCheck \ (x :: Int) y ->
      Neon.min y x === if Neon.less y x then x else y
  -- test "minimum" do
  test "negate" do
    quickCheck \ (x :: Int) ->
      Neon.negate x === Prelude.negate x
  -- test "notANumber" do
  test "notEqual" do
    quickCheck \ (x :: Int) y ->
      Neon.notEqual y x === x Prelude./= y
  -- test "odd" do
  -- test "print" do
  -- test "product" do
  -- test "reciprocal" do
  -- test "sequence" do
  -- test "sign" do
  -- test "size" do
  test "sum" do
    quickCheck \ (x :: Array Int) ->
      Neon.sum x === Foldable.sum x
  -- test "swap" do
  -- test "todo" do
  -- test "truncate" do
  -- test "uncurry" do
  -- test "unsafeCoerce" do
  -- test "unsafeLog" do
  -- test "upTo" do
  -- test "void" do
  -- test "when" do
  -- test "while" do
  -- test "withDefault" do
