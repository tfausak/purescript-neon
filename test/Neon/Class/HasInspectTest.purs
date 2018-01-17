module Test.Neon.Class.HasInspectTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper
  (Suite, discard, assert, quickCheck, suite, test, testSkip, success, (===))

tests :: Suite
tests = suite "HasInspect" do
  test "List" do
    quickCheck \ (x :: Array Int) ->
      Neon.inspect x === Prelude.show x
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.inspect x === Prelude.show x
  test "Char" do
    quickCheck \ (x :: Char) ->
      Neon.inspect x === Prelude.show x
  testSkip "Error" do
    success
  test "Int" do
    quickCheck \ (x :: Int) ->
      Neon.inspect x === Prelude.show x
  test "List" do
    quickCheck \ (x :: Neon.List Int) ->
      Neon.inspect x === Prelude.show x
  test "Number" do
    quickCheck \ (x :: Number) ->
      Neon.inspect x === Prelude.show x
  test "Ordering" do
    quickCheck \ (x :: Neon.Ordering) ->
      Neon.inspect x === Prelude.show x
  test "Proxy" do
    assert "is \"Proxy\""
      (Neon.equal (Neon.inspect (Neon.Proxy :: Neon.Proxy Int)) "Proxy")
  test "String" do
    quickCheck \ (x :: String) ->
      Neon.inspect x === Prelude.show x
  test "Unit" do
    quickCheck \ (x :: Neon.Unit) ->
      Neon.inspect x === Prelude.show x
