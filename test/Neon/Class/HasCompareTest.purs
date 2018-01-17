module Test.Neon.Class.HasCompareTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, class Arbitrary, Test, discard, quickCheck, suite, test, (===), RANDOM)

tests :: Suite
tests = suite "HasCompare" do
  let
    qc :: forall a t. Arbitrary a => Neon.HasCompare a => Prelude.Ord a => Neon.Proxy a -> Test (random :: RANDOM | t)
    qc _ = quickCheck \ (x :: a) y ->
      Neon.compare y x === Prelude.compare x y

  test "Array" do
    qc (Neon.Proxy :: Neon.Proxy (Array Int))
  test "Boolean" do
    qc (Neon.Proxy :: Neon.Proxy Boolean)
  test "Char" do
    qc (Neon.Proxy :: Neon.Proxy Char)
  test "Int" do
    qc (Neon.Proxy :: Neon.Proxy Int)
  test "List" do
    qc (Neon.Proxy :: Neon.Proxy (Neon.List Int))
  test "Number" do
    qc (Neon.Proxy :: Neon.Proxy Number)
  test "Ordering" do
    qc (Neon.Proxy :: Neon.Proxy Neon.Ordering)
  test "String" do
    qc (Neon.Proxy :: Neon.Proxy String)
